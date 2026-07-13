---
layout: default
title: "D02 — G₂ 7-Body Choreography in ℝ⁷"
parent: ISA Zoo
nav_exclude: true
---

# D02 — G₂ 7-Body Choreography in ℝ⁷

| Field | Value |
|-------|-------|
| **Domain** | Dynamical Systems |
| **System** | Equal-mass 7-body gravitational problem in ℝ⁷ |
| **Group** | G₂ ⊂ SO(7) |
| **H^k tier** | H² |
| **ISA** | Forge (β ≈ β*) |
| **Status** | Conjectured |
| **Opcodes** | ORBIT · TWIST · BIND |
| **Paper** | Paper 552 |

---

## Physical system

A conjectured choreography of 7 equal masses in ℝ⁷ whose symmetry group is the
exceptional Lie group G₂ — the automorphism group of the octonions and the
stabiliser of the Fano plane. The 7 bodies would occupy the 7 vertices of the
Fano plane in the initial configuration, with the G₂ 3-form φ_{ijk} encoding
which triples avoid collision.

This is the H² apex of the choreography ISA ladder: figure-eight (H⁰, ℝ²) →
Lagrange triangle (H¹, ℝ³) → G₂ choreography (H², ℝ⁷).

---

## Target category

**Symp(G₂)** — the category of G₂-structured symplectic manifolds. The relevant
phase space is the G₂-invariant submanifold of T*(ℝ⁷)⁷ cut out by the
associative 3-form φ.

## Interpretation functor

F: C → Symp(G₂) defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Closed 7-body trajectory with G₂ winding number; period T_G₂ |
| TWIST  | Berry phase accumulated around each body's sub-orbit in ℝ⁷ |
| BIND   | G₂ 3-form φ_{ijk}: encodes which triples (i,j,k) are Fano lines — collision-avoidance constraint |

## ISA programme

```
INIT:    LABEL[q₁…q₇ | Fano vertex IC]       -- 7 bodies at Fano vertices
FANO:    BIND[φ_{ijk} | (i,j,k) ∈ Fano lines]-- G₂ 3-form collision constraint
FLOW:    ORBIT[Φ_t : T*ℝ⁷^7 → T*ℝ⁷^7]       -- Hamiltonian flow
TWIST:   TWIST[Berry phase per sub-orbit]     -- accumulate H¹ holonomy
CLOSE:   ORBIT[q(T) = σ(q(0))]               -- close up to G₂ permutation σ
PERIOD:  LABEL[T_G₂]                         -- period eigenvalue (unknown)
```

## Computable output

- **Conjectured period** T_G₂: unknown — the primary output of experiment x552d.
- **G₂ winding structure**: 7 sub-orbits related by the 7-fold symmetry of the
  Fano plane. Each body traverses the same curve; consecutive bodies are offset
  by T_G₂/7.
- **BIND closure**: the G₂ 3-form φ_{ijk} evaluated on each Fano triple must
  equal the associator of the octonion units e_i, e_j, e_k. This is the
  collision-avoidance condition — bodies on the same Fano line repel by the
  non-associativity of ℝ⁷.
- **H² necessity**: G₂ is the minimal exceptional group. Its 3-form φ is a
  non-trivial H² class in H²(G₂/SO(4)) — there is no way to encode the
  7-body Fano constraint using only ORBIT (H⁰) or TWIST (H¹). BIND is required.

## Why this matters

The figure-eight (D01) requires no group theory — any 3 equal masses in ℝ² find
it. The G₂ choreography would be the first *exceptional* choreography: one that
exists only because ℝ⁷ admits an exceptional geometry (the G₂ structure) not
present in any other dimension. It would prove that the H² tier of the ISA is
physically realised in classical mechanics, not just quantum computing.

## Validation status

- **x552d** (SHA c50f328): first numerical search for a 7-body G₂ choreography
  in ℝ⁷. Convergence behaviour documented; existence not yet confirmed.
- **x552e**: 4-body sanity check (proposed) — verify that a known 4-body
  choreography in ℝ⁴ is recovered before extending to 7-body ℝ⁷.
- Existence would follow from a G₂-equivariant version of the Chenciner-Montgomery
  variational argument — an open problem in symplectic geometry.

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
