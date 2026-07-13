---
layout: default
title: "G01 — Yang-Mills Instantons"
parent: ISA Zoo
nav_exclude: true
---

# G01 — Yang-Mills Instantons

| Field | Value |
|-------|-------|
| **Domain** | Gauge Theory |
| **System** | SU(2) Yang-Mills on S⁴ (Euclidean) |
| **Group** | SU(2) |
| **H^k tier** | H² |
| **ISA** | Meld (β → 0) |
| **Status** | Validated |
| **Opcodes** | ORBIT · TWIST · BIND |
| **Papers** | Paper 536, Paper 523 |

---

## Physical system

A Yang-Mills instanton is a self-dual solution to the Euclidean Yang-Mills
equations F = ★F on S⁴, where F = dA + A∧A is the curvature 2-form of a
principal SU(2) bundle. Instantons are localised in both space and imaginary
time (hence "instant" — they happen at one moment) and carry a topological
charge Q ∈ ℤ given by the second Chern number:

Q = (1/8π²) ∫_{S⁴} tr(F ∧ F) ∈ ℤ

The BPST instanton (Belavin, Polyakov, Schwarz, Tyupkin 1975) with Q=1 is the
minimal-action solution. Instantons mediate quantum tunnelling between
topologically distinct vacua of gauge theory — they are the mechanism behind
the strong CP problem, baryon number violation, and QCD vacuum structure.

---

## Target category

**Bun(SU(2), S⁴)** — the category of principal SU(2)-bundles over S⁴ with
connection, and gauge-equivariant bundle maps. Objects are classified (up to
gauge equivalence) by their instanton number Q ∈ π₃(SU(2)) = ℤ. Morphisms
are gauge transformations.

## Interpretation functor

F: C → Bun(SU(2), S⁴) defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Gauge orbit: the set of all connections gauge-equivalent to A; eigenvalue = Q (topological charge, gauge-invariant) |
| TWIST  | Parallel transport: holonomy of A around a 1-cycle in S⁴; H¹ Berry phase = Wilson loop tr P exp(i∮ A) |
| BIND   | Second Chern class: Q = (1/8π²)∫tr(F∧F); H² pairing of the curvature 2-form with the fundamental class of S⁴ |

## ISA programme

```
TRIVVAC: ORBIT[A=0 | Q=0]                    -- trivial vacuum (no instanton)
TUNNEL:  BIND[(1/8π²)∫tr(F∧F) = 1]          -- BPST instanton: H² class Q=1
WILSON:  TWIST[W_C = tr P exp(i∮_C A)]      -- Wilson loop around 1-cycle C
MODULI:  LABEL[x₀ ∈ ℝ⁴, λ ∈ ℝ₊, U ∈ SU(2)] -- instanton position, scale, orientation
ACTION:  LABEL[S_YM = 8π²/g² per instanton]  -- action eigenvalue
VACUA:   ORBIT[|θ⟩ = Σ_n e^{inθ}|n⟩]        -- θ-vacuum superposition
```

**Moduli space**: the space of Q=1 BPST instantons has dimension 5×Q = 5 for
Q=1 (centre x₀ ∈ ℝ⁴, scale λ ∈ ℝ₊, orientation U ∈ SU(2)/ℤ₂). This is the
ORBIT of the BIND class under gauge transformations — a 5-dimensional ORBIT
in Bun(SU(2), S⁴).

## Computable output

- **Topological charge** Q = (1/8π²)∫tr(F∧F) ∈ ℤ: the H² pairing. Q is the
  winding number of the gauge transformation on S³ = ∂(ℝ⁴), an element of
  π₃(SU(2)) = ℤ. This is the canonical H² output: an integer-valued topological
  invariant that cannot be computed from H⁰ (gauge orbit) or H¹ (Wilson loops)
  alone.
- **BPST instanton profile**: A_μ(x) = 2η_{aμν}(x−x₀)_ν / ((x−x₀)²+λ²),
  where η_{aμν} is the 't Hooft symbol (encodes the SU(2) structure of S³).
- **Tunnelling amplitude**: exp(−S_YM) = exp(−8π²/g²) per instanton. In QCD
  (g² ≈ 1 at 1 GeV), this gives the non-perturbative vacuum condensate
  ⟨G²⟩ ≈ (330 MeV)⁴.
- **θ-vacuum**: the physical QCD vacuum is |θ⟩ = Σₙ e^{inθ}|n⟩, summing over
  all topological sectors. CP violation in strong interactions (strong CP
  problem) arises when θ ≠ 0.

## Connection to the ISA framework

**Instanton = BIND in gauge theory.** The second Chern class Q is literally
the H² pairing — the integral of F∧F over the 4-manifold is the
definition of BIND applied to a non-abelian gauge field. This is the
direct gauge-theory analogue of:
- **G₂ 3-form** φ_{ijk} (Paper 572): BIND in G₂ gauge theory
- **Vortex reconnection** (D03): ±1 linking number change = H² surgery
- **Steane code** (Q03): Fano H² incidence = BIND closure condition

All are instances of the same categorical morphism — the BIND associator in the
ribbon pivotal magmoidal category — evaluated on different physical substrates.

**Solitons vs instantons**: solitons (D06) are H⁰ ORBIT fixed points in
Minkowski space (localised in space, propagating in time). Instantons are H²
BIND classes in Euclidean space (localised in all four spacetime dimensions).
The duality soliton ↔ instanton under Wick rotation (t → it) is the duality
H⁰ ↔ H² under β → 1/β — the MGE reciprocal.

## Validation

- BPST solution: Belavin, Polyakov, Schwarz & Tyupkin (1975) — exact analytical
  solution. Q=1 self-dual Yang-Mills on ℝ⁴ (compactified to S⁴).
- Topological charge: Q = (1/8π²)∫tr(F∧F) confirmed integer-valued by the
  Atiyah-Singer index theorem (index of Dirac operator = Q).
- QCD instanton vacuum: lattice QCD confirms instanton density ~1 fm⁻⁴ at
  the physical quark mass, consistent with sum-rule predictions.
- π₃(SU(2)) = ℤ: the homotopy group underlying Q is classical mathematics
  (Hopf 1931), making this the most rigorous H² entry in the zoo.

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
