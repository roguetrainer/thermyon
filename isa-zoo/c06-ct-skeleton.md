---
layout: default
title: "C06 — C/T Skeleton Active-Space Pre-screening"
parent: ISA Zoo
nav_exclude: true
---

# C06 — C/T Skeleton Active-Space Pre-screening

| Field | Value |
|-------|-------|
| **Domain** | Chemistry |
| **System** | Any molecule with MP2 natural orbitals |
| **Group** | U(n) × U(n) (orbital rotation group) |
| **H^k tier** | H⁰ / H¹ / H² |
| **ISA** | Forge (β ≈ β*) |
| **Status** | Validated |
| **Opcodes** | ORBIT · TWIST · BIND · LABEL |
| **Papers** | [doi:10.5281/zenodo.21300668](https://doi.org/10.5281/zenodo.21300668) (Paper 588), Paper 596 |

---

## Physical system

Given a molecule, run a cheap MP2 calculation to obtain natural orbital
occupation numbers (NOONs). Each bonding/antibonding pair (nᵢ, 2−nᵢ) is
classified into one of three strata by two ISA descriptors:

- **θ_G = 2·arccos(√(n/2))** — Grassmannian angle; measures departure from a
  frozen (ionic/covalent) pair
- **c₂ = min(n, 2−n, ñ, 2−ñ)** — Weyl chamber coordinate; measures
  entanglement between bonding and antibonding partners

This produces a **C/T skeleton** (sCeleTon): a bipartite graph over GF(2)
where C-boxes (frozen pairs, θ_G < δ*) are labelled 0 and T-arrows (active
pairs, θ_G ≥ δ*) are labelled 1. The T-arrow set is the recommended CASSCF
active space.

---

## Target category

**Vect(ℝ)** with graded H^k structure — the category of real vector spaces
stratified by cohomological degree:

- **H⁰**: C-box pairs (NOON near 0 or 2) — tropical fixed points, handled by DFT
- **H¹**: T-arrow pairs with c₂ < δ* — Clifford/CCSD regime
- **H²**: T-arrow pairs with c₂ ≥ δ* — magic/CASSCF regime

## Interpretation functor

F: C → Vect(ℝ) defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Eigenvalue of occupation number operator; output = NOON nᵢ ∈ [0,2] |
| TWIST  | Berry phase between bonding/antibonding pair; captured by θ_G |
| BIND   | Non-abelian holonomy of multi-pair entanglement; triggers CASSCF |
| LABEL  | Stratum assignment: H⁰ (C-box) / H¹ / H² (T-arrow) |

## ISA programme

```
NOON:    ORBIT[nᵢ for all pairs]        -- MP2 natural orbital occupations
ANGLE:   LABEL[θ_G = 2·arccos(√(n/2))] -- Grassmannian angle per pair
WEYL:    LABEL[c₂ = min(n,2-n,ñ,2-ñ)]  -- Weyl coordinate per pair
ROUTE:   LABEL[stratum | θ_G, c₂, δ*]  -- classify C-box vs T-arrow
BETA:    LABEL[β_eff = Δ_HL/(σ·(2S+1))]-- MGE inverse temperature
ACTIVE:  ORBIT[T-arrow indices]         -- recommended active space
METHOD:  TWIST or BIND                  -- route to CCSD (H¹) or CASSCF (H²)
```

**Routing threshold**: δ* = (π/4)√α where α = β_eff · ε (correlation energy per pair).
This is derived from the MGE cost-accuracy tradeoff, not fitted to data.

## Computable output

- **Active space** (n_elec, n_orb): list of T-arrow orbital indices and
  electron count for CASSCF input. Reduces to 7–36× smaller active space
  than full valence (Paper 588, x588g: r = −0.979 correlation with CASSCF NOONs).
- **Weyl c₂**: DFT failure predictor with r = 0.990 correlation to
  multi-reference correlation energy (Paper 596, x596a).
- **Speedup**: 7–36× wall-time reduction over manual active-space selection,
  with no loss in accuracy for the validated benchmark set.

## Validation

- **x588g** (SHA 45dbc10): Weak Lifting Theorem confirmed numerically —
  10/10 molecules, r = −0.979 between C/T stratum and CASSCF NOON deviation.
- **x596a–e** (Papers 596): Weyl c₂ predicts DFT error r = 0.990 across
  N₂, Fe²⁺, and 6-molecule benchmark; MGE soft router p continuous 0.024→0.911
  along N₂ dissociation curve.
- **alchemi** (PyPI): reference implementation at [github.com/roguetrainer/alchemi](https://github.com/roguetrainer/alchemi).

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
