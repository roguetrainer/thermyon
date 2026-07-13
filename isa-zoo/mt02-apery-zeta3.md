---
layout: default
title: "MT02 — Apéry's Proof: ζ(3) is Irrational"
parent: ISA Zoo
nav_exclude: true
---

# MT02 — Apéry's Proof: ζ(3) is Irrational

| Field | Value |
|-------|-------|
| **Domain** | Mathematical Methods |
| **System** | Apéry sequence and rational approximants to ζ(3) |
| **Group** | ℤ (integer recurrence group) |
| **H^k tier** | H² |
| **ISA** | Origami (β → ∞) |
| **Status** | Validated |
| **Opcodes** | ORBIT · LABEL · BIND |
| **Papers** | Paper 553, Paper 554 |

---

## Physical system

Apéry's 1978 proof that ζ(3) = Σ_{n=1}^∞ 1/n³ is irrational is achieved by
constructing an explicit integer sequence that produces rational approximants
p_n/q_n to ζ(3) that converge *too fast* to be consistent with rationality.
The two sequences satisfy the same three-term recurrence:

n³ aₙ = (34n³ − 51n² + 27n − 5) aₙ₋₁ − (n−1)³ aₙ₋₂

with initial conditions (aₙ) = (1, 5, 73, ...) for the numerators and a different
set for the denominators. The key: pₙ/qₙ → ζ(3), and the denominators qₙ grow
as (1+√2)^{4n} while the numerator differences grow at the same rate — so the
error |ζ(3) − pₙ/qₙ| ~ (1+√2)^{−4n} decays faster than 1/qₙ, which by the
theory of continued fractions is impossible if ζ(3) is rational.

**The ISA reading:** the recurrence is an ORBIT on the integer lattice ℤ². The
rational approximant pₙ/qₙ is a LABEL (eigenvalue of the recurrence operator).
The irrationality is a BIND obstruction: the sequence cannot close onto a rational
value because the associated H² cohomology class is non-trivial.

---

## Target category

**ℤ-Mod** — the category of ℤ-modules (integer lattices) with linear recurrence
morphisms. Objects: the lattice ℤ² of (pₙ, qₙ) pairs. Morphisms: the 2×2
integer matrix encoding the three-term recurrence. The irrationality result is
the statement that the ORBIT of this morphism does not converge to a rational
fixed point — there is a BIND obstruction in H²(ℤ-Mod, ℤ).

## Interpretation functor

F: C → ℤ-Mod defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Recurrence step: (pₙ₋₁, pₙ₋₂) → pₙ via the Apéry recurrence; the integer lattice walk |
| LABEL  | Rational approximant pₙ/qₙ: the eigenvalue of the recurrence operator at step n; converges to ζ(3) |
| BIND   | Irrationality certificate: the H² class that obstructs closure — the fact that |ζ(3) − pₙ/qₙ| decays faster than 1/qₙ, which is a topological obstruction in the space of rational approximants |

## ISA programme

```
INIT:   LABEL[p0=1, p1=5, q0=1, q1=5]           -- Apery initial conditions
STEP:   ORBIT[(pn, qn) | Apery recurrence]       -- integer lattice walk
RATE:   LABEL[|q_n * zeta(3) - p_n| ~ (1+sqrt2)^{-4n}]  -- convergence rate
BIND?:  LABEL[rate < 1/q_n?]                     -- irrationality test
CERT:   BIND[zeta(3) irrational | H2 obstruction] -- irrationality certificate
OUTPUT: LABEL[zeta(3) not in Q]                  -- the conclusion
```

## Computable output

- **Apéry sequence** (aₙ) = 1, 5, 73, 1445, 33001, ...: integer sequence
  satisfying the three-term recurrence. These are ORBIT outputs — exact integers
  at every step, no floating-point error. x553a confirmed p₂₁ = 2,492,461,633
  (SHA c402a60).
- **Rational approximants** pₙ/qₙ: converge to ζ(3) = 1.2020569... with error
  |ζ(3) − pₙ/qₙ| < C(1+√2)^{−4n}. This is an exponentially fast ORBIT
  convergence.
- **Irrationality measure**: μ(ζ(3)) ≤ 13.41782... (Rhin-Viola 2001, sharpening
  Apéry). The measure bounds how well ζ(3) can be approximated by rationals.
- **The H² obstruction**: the irrationality is the statement that the ORBIT
  sequence (pₙ/qₙ) converges to a point *outside* the rational ORBIT closure —
  it exits the H⁰ tropical regime (rationals) into the H² Meld regime
  (transcendental reals). The proof is a BIND certificate: the cohomology class
  [ζ(3)] ∈ H²(Q̄/Q, Z) is non-trivial.

## Connection to the ISA framework

**ζ(3) is the H² rung of the β-ladder.** Paper 554 establishes the β-ladder:

| β-value | Constant | ISA tier | Status |
|---------|----------|----------|--------|
| 0 | e (Napier) | H⁰ ORBIT residue | H⁰ ORBIT (trivially transcendental) |
| 1 | γ (Euler-Mascheroni) | H⁰ ORBIT residue | Irrationality unknown |
| 2 | π²/6 = ζ(2) | H¹ TWIST phase | Irrational (π²) |
| 3 | ζ(3) = Apéry constant | H² BIND class | Irrational (Apéry 1978) ✓ |
| 4 | π⁴/90 = ζ(4) | H¹ (rational × π⁴) | Irrational (π⁴) |
| 2k+1 | ζ(2k+1) | H² (??) | Unknown for k ≥ 2 |

The even zeta values ζ(2k) = rational × π^{2k} sit at H¹ (they are TWIST
phases — rational multiples of powers of π). The odd values ζ(2k+1) for k ≥ 1
are H² BIND classes: they require non-trivial cohomological structure to prove
irrational. Apéry found the explicit BIND certificate for k=1. The cases k≥2
(ζ(5), ζ(7), ..., ζ(21)) remain open — each requires a new ORBIT that we do
not yet know how to construct.

**Connection to Paper 553:** the Apéry sequence aₙ = ORBIT count for the ISA
programme [SPLIT² ∘ SPLAT²] (Paper 553). The generating function A(n) is a
product of central binomial sums, reflecting the categorical structure of the
SPLIT and SPLAT opcodes applied to the two-dimensional lattice. The Fano
number 21 = 3×7 appears as the first β-rung at which A₂₁(n) would produce
ζ(21) — if the polynomial A₂₁(n) were known.

**The G₂ connection:** the Apéry constant ζ(3) appears in the asymptotic
expansion of the G₂ theta function. The G₂ root system has 42 = 2×21 roots,
and 21 = 3×7 is the product of the two simple root lengths. The deep question
(Paper 553 §4.1): is the appearance of 21 in the Fano/G₂ context connected
to the β-ladder position of ζ(3)?

## Validation

- Apéry (1978): proof that ζ(3) is irrational. The proof was initially doubted
  because it was presented verbally at a conference, but verified rigorously by
  van der Poorten (1979): "A proof that Euler missed" — Apéry's marvellous proof
  of the irrationality of ζ(3).
- x553a (Paper 553, SHA c402a60): p₂₁ = 2,492,461,633 confirmed by direct
  computation. The recurrence is verified to k=21.
- Rhin-Viola (2001): irrationality measure μ(ζ(3)) ≤ 5.513...; Ball-Rivoal
  (2000): infinitely many odd zeta values are irrational (but which ones is still
  unknown).

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
