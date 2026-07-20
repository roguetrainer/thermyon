"""
ASA Portfolio B: Paper 211 / 266 Integration
The G2-Apéry p-Adic Valuation Audit

Objective:
Verify the conjecture that Apéry's denominator-cancellation is tighter than a
generic cubic recurrence of the same growth rate — consistent with the
hypothesis that G2 symmetry forces the integrality.

Mechanism:
1. Run the Apéry recurrence (G2-structured coefficients: 34, 5 from g2 geometry).
2. Run a CONTROL recurrence with nearby non-G2 coefficients (34->33, 5->6).
3. For both, compute exact p-adic valuations of the rational denominators.
4. Compare both against the theoretical G2 bound: 3 * floor(log_p n).
5. A positive result: Apéry stays within the bound; control exceeds it.

Key fixes vs. original sketch:
- Uses fractions.Fraction throughout for exact rational arithmetic (no mpmath float).
- Control sequence added for falsification.
- Trivial-positive problem resolved: we measure *how far below* the bound each
  sequence sits, not just whether it satisfies the bound.
"""

import math
from fractions import Fraction


def p_adic_valuation(n: int, p: int) -> int:
    """Largest k such that p^k divides n. n must be a positive integer."""
    if n == 0:
        return 10**9  # infinity sentinel
    n = abs(n)
    count = 0
    while n % p == 0:
        count += 1
        n //= p
    return count


def lcm_valuation(n: int, p: int) -> int:
    """v_p(lcm(1..n)) = floor(log_p(n)), i.e. largest k with p^k <= n."""
    if n < p:
        return 0
    return int(math.floor(math.log(n, p) + 1e-12))


def build_apery_q(n_max: int) -> list:
    """
    q_n = sum_{k=0}^{n} C(n,k)^2 * C(n+k,k)^2  (exact integer, via recurrence).
    Seeds: q_0=1, q_1=5.
    """
    q = [1, 5]
    for n in range(1, n_max):
        an = 34 * n**3 + 51 * n**2 + 27 * n + 5
        val = an * q[-1] - n**3 * q[-2]
        assert val % (n + 1)**3 == 0, f"q recurrence non-integer at n={n}"
        q.append(val // (n + 1)**3)
    return q


def build_p_sequence(n_max: int, a_coeff: int, c_coeff: int) -> list:
    """
    Rational approximant sequence for a general cubic recurrence:
      (n+1)^3 p_{n+1} = (a*n^3 + b*n^2 + d*n + c) * p_n - n^3 * p_{n-1}
    where b = 51, d = 27 are fixed (only a and c vary between Apéry and control).
    Seeds: p_0 = 0, p_1 = 6.
    Uses exact Fraction arithmetic.
    """
    p = [Fraction(0), Fraction(6)]
    for n in range(1, n_max):
        an = a_coeff * n**3 + 51 * n**2 + 27 * n + c_coeff
        numer = an * p[-1] - n**3 * p[-2]
        p.append(numer / Fraction((n + 1)**3))
    return p


def audit_sequence(label: str, p_seq: list, test_primes: list, n_max: int):
    """
    For each n and each prime p, compute:
      actual  = v_p(denominator of p_n)
      bound   = 3 * floor(log_p n)   [the G2 / lcm^3 bound]
      slack   = bound - actual        (positive = within bound, negative = violation)
    Returns summary statistics.
    """
    print(f"\n{'='*70}")
    print(f"  {label}")
    print(f"{'='*70}")
    print(f"{'n':>4}  {'p':>2}  {'v_p(den)':>9}  {'G2 bound':>9}  {'slack':>6}  status")
    print("-" * 50)

    total_checks = 0
    violations = 0
    total_slack = 0
    min_slack = 10**9

    for n in range(2, n_max + 1):
        frac = p_seq[n]
        den = frac.denominator  # exact denominator in lowest terms

        for prime in test_primes:
            actual = p_adic_valuation(den, prime)
            bound = 3 * lcm_valuation(n, prime)
            slack = bound - actual
            total_slack += slack
            if slack < min_slack:
                min_slack = slack

            ok = slack >= 0
            if not ok:
                violations += 1

            total_checks += 1

            if n % 25 == 0 or not ok:
                status = "LOCKED" if ok else "*** VIOLATION ***"
                print(f"{n:>4}  {prime:>2}  {actual:>9}  {bound:>9}  {slack:>6}  {status}")

    print(f"\n  Total checks : {total_checks}")
    print(f"  Violations   : {violations}")
    print(f"  Mean slack   : {total_slack / total_checks:.3f}")
    print(f"  Min slack    : {min_slack}")
    integrity = 100.0 * (total_checks - violations) / total_checks
    print(f"  Integrity    : {integrity:.4f}%")
    return {"violations": violations, "mean_slack": total_slack / total_checks,
            "min_slack": min_slack, "integrity": integrity}


def main():
    N_MAX = 150
    TEST_PRIMES = [2, 3, 5, 7, 11, 13]

    print("=" * 70)
    print("  ASA TRACK B: G2-APÉRY p-ADIC VALUATION AUDIT")
    print(f"  N_MAX={N_MAX}  primes={TEST_PRIMES}")
    print("=" * 70)

    # Build both p-sequences with exact arithmetic
    print("\n-> Building Apéry p_n (exact Fraction arithmetic)...")
    apery_p = build_p_sequence(N_MAX, a_coeff=34, c_coeff=5)

    print("-> Building control p_n (a=33, c=6 — non-G2 coefficients)...")
    control_p = build_p_sequence(N_MAX, a_coeff=33, c_coeff=6)

    # Audit both
    apery_stats = audit_sequence(
        "APÉRY (G2-structured: a=34, c=5)",
        apery_p, TEST_PRIMES, N_MAX
    )
    control_stats = audit_sequence(
        "CONTROL (generic cubic: a=33, c=6)",
        control_p, TEST_PRIMES, N_MAX
    )

    # Verdict
    print("\n" + "=" * 70)
    print("  COMPARATIVE VERDICT")
    print("=" * 70)
    print(f"  Apéry   violations={apery_stats['violations']:>4}  "
          f"mean_slack={apery_stats['mean_slack']:>7.3f}  "
          f"min_slack={apery_stats['min_slack']}")
    print(f"  Control violations={control_stats['violations']:>4}  "
          f"mean_slack={control_stats['mean_slack']:>7.3f}  "
          f"min_slack={control_stats['min_slack']}")
    print()

    apery_clean = apery_stats["violations"] == 0
    control_worse = (control_stats["violations"] > 0 or
                     control_stats["mean_slack"] < apery_stats["mean_slack"])

    if apery_clean and control_worse:
        print("  [+] POSITIVE RESULT")
        print("  Apéry satisfies the G2 bound perfectly; control is worse.")
        print("  Consistent with G2 geometry forcing denominator cancellation.")
    elif apery_clean and not control_worse:
        print("  [~] NEUTRAL RESULT")
        print("  Both sequences satisfy the bound. The bound may be trivially true")
        print("  for all cubic recurrences — G2 specificity not demonstrated.")
    else:
        print("  [-] NEGATIVE RESULT")
        print("  Apéry itself violates the G2 bound. Conjecture falsified.")

    print("=" * 70)


if __name__ == "__main__":
    main()
