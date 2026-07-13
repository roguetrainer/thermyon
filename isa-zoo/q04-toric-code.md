---
layout: default
title: "Q04 — Toric Code"
parent: ISA Zoo
nav_exclude: true
---

# Q04 — Toric Code

| Field | Value |
|-------|-------|
| **Domain** | Quantum Computing |
| **System** | 2D surface code on an L×L torus |
| **Group** | ℤ₂ × ℤ₂ |
| **H^k tier** | H¹ |
| **ISA** | Origami (β → ∞) |
| **Status** | Validated |
| **Opcodes** | ORBIT · TWIST |
| **Paper** | Paper 446 |

---

## Physical system

Kitaev's toric code places one qubit on each edge of an L×L square lattice
with periodic boundary conditions. Vertex operators A_v = ⊗ X and plaquette
operators B_p = ⊗ Z generate the stabiliser group. The code encodes 2 logical
qubits (one per non-contractible cycle on the torus) with distance d = L.

---

## Target category

**QCirc** — stabiliser sector of quantum circuits over ℂ².

## Interpretation functor

F: C → QCirc defined by:

| Opcode | F(opcode) in QCirc |
|--------|-------------------|
| ORBIT  | Stabiliser measurement: vertex (A_v) or plaquette (B_p) eigenvalue ±1 |
| TWIST  | Logical operator: non-contractible string of X or Z along a cycle of the torus |

## ISA programme

```
INIT:    LABEL[|+⟩^⊗edges]         -- initialise all edge qubits in |+⟩
STAB:    ORBIT[A_v] × ORBIT[B_p]   -- measure all vertex and plaquette stabilisers
SYNDR:   LABEL[∂e | violated]      -- identify error chain endpoints (anyons)
MATCH:   ORBIT[min-weight matching] -- pair anyons by shortest path (MWPM decoder)
CORRECT: TWIST[string operator]    -- apply X or Z string connecting matched pairs
LOGICAL: TWIST[γ_x or γ_z]        -- logical X/Z = non-contractible cycle operator
```

## Computable output

- **Syndrome**: set of violated stabilisers = anyon positions on the lattice.
- **Logical error rate** p_L ≈ exp(−αL) for p below threshold p_th ≈ 10.3%.
- **H¹ structure**: the two logical qubits correspond exactly to the two
  generators of H¹(T², ℤ₂) — the non-contractible cycles of the torus. The
  TWIST opcode is literally a 1-cocycle. Error correction = finding the
  homologically trivial completion of an error chain. This is why the toric
  code is the canonical H¹ QEC example in Paper 446.
- **No H² needed**: anyons are abelian (ℤ₂ × ℤ₂ fusion); non-abelian anyons
  (Fibonacci, Ising) require H² BIND. The toric code sits squarely in H¹.

## Validation

- Threshold p_th ≈ 10.3% confirmed by mapping to 2D random-bond Ising model
  (Nishimori point).
- H¹(T², ℤ₂) = ℤ₂ ⊕ ℤ₂: exactly 2 logical qubits on the torus (0 on the
  sphere, confirming H¹ = homology of the surface).
- BKT connection: Paper 446 identifies the toric code threshold as the
  β = 1/2 snap event in the XXZ β-ladder.

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
