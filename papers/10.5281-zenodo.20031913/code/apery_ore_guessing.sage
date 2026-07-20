"""
ASA Core Mathematics: The Ore Algebra Guesser
Objective: Bypass broken creative_telescoping by reconstructing the
minimal G2 recurrence operator directly from the integer sequence states.

Uses ore_algebra.guess on exact integer q_n (not transcendental I_n)
to recover the Apéry Picard-Fuchs operator and confirm 34,51,27,5.

Run with: conda run -n sage_env sage apery_ore_guessing.sage
"""

from ore_algebra import OreAlgebra, guess
from sage.all import PolynomialRing, QQ, binomial
import time

print("=" * 65)
print(" ASA ANALYTICAL ENGINE: ORE ALGEBRA RECURRENCE GUESSING")
print("=" * 65)

t0 = time.time()

# 1. Generate exact integer Apéry denominator sequence
print("\n-> 1. Generating exact integer sequence q_n...")
print("   q_n = sum_{k=0}^{n} C(n,k)^2 * C(n+k,k)^2")

N_TERMS = 30
seq = [sum(binomial(n,k)**2 * binomial(n+k,k)**2 for k in range(n+1))
       for n in range(N_TERMS)]

print(f"   Generated {N_TERMS} exact integer terms.")
print(f"   q_0..q_4 = {seq[:5]}")
print(f"   q_29     = {seq[29]}")

# 2. Define Ore algebra: polynomial ring in n, shift operator Sn
print("\n-> 2. Initializing Ore Shift Algebra...")
PolRing = PolynomialRing(QQ, 'n')
n = PolRing.gen()
ShiftAlg = OreAlgebra(PolRing, ('Sn', {n: n+1}, {}))
print(f"   Algebra: {ShiftAlg}")

# 3. Run the guesser
print("\n-> 3. Executing guess() on exact integer sequence...")
try:
    op = guess(seq, ShiftAlg, order=2)
    print(f"\n   Elapsed: {time.time()-t0:.2f}s")

    if op:
        print("\n" + "=" * 65)
        print(" GUESSING SUCCESSFUL")
        print("=" * 65)
        print(f"\n Minimal recurrence operator:\n   {op}")

        # Verify against the known Apéry operator
        n = PolRing.gen()
        expected_coeffs = [n**3, -(34*n**3 + 51*n**2 + 27*n + 5), (n+1)**3]
        print("\n Expected (Apéry): n^3 - (34n^3+51n^2+27n+5)*Sn + (n+1)^3*Sn^2")

        # Extract coefficients of the guessed operator
        op_list = op.list()
        print(f" Guessed coefficients: {op_list}")

        # Normalise by leading coefficient and check
        if len(op_list) == 3:
            lc = op_list[2]
            normed = [PolRing(c / lc) for c in op_list]
            a0 = PolRing(normed[0])
            a1 = PolRing(normed[1])
            print(f"\n Normalised (divide by leading coeff):")
            print(f"   a0 (const term) : {a0}")
            print(f"   a1 (Sn coeff)   : {a1}")
            print(f"   a2 (Sn^2 coeff) : 1")

            # Check a0 == n^3 / (n+1)^3 * (n+1)^3 = n^3
            expected_a0 = PolRing(n**3) / PolRing((n+1)**3)
            match_a1 = (PolRing(-1) * a1 * lc == PolRing(34*n**3 + 51*n**2 + 27*n + 5) * lc or
                        PolRing(a1) == PolRing(-(34*n**3 + 51*n**2 + 27*n + 5)) / PolRing((n+1)**3))

            print(f"\n Coefficient -a1 matches 34n^3+51n^2+27n+5 (up to normalisation): "
                  f"{'checking...' }")

            # Direct check: multiply through by (n+1)^3 and compare
            lhs_a1 = PolRing(a1) * PolRing((n+1)**3)
            rhs_a1 = PolRing(-(34*n**3 + 51*n**2 + 27*n + 5))
            print(f"   (n+1)^3 * a1         = {lhs_a1}")
            print(f"   -(34n^3+51n^2+27n+5) = {rhs_a1}")
            print(f"   Match: {lhs_a1 == rhs_a1}")
    else:
        print("\n[-] guess() returned None — try more terms or higher order.")

except Exception as e:
    print(f"\n[-] guess() failed: {e}")
    import traceback
    traceback.print_exc()

print(f"\nTotal elapsed: {time.time()-t0:.2f}s")
print("=" * 65)
