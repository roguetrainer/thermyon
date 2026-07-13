---
layout: default
title: "P01 — Orbit Processing Unit (OPU)"
parent: ISA Zoo
nav_exclude: true
---

# P01 — Orbit Processing Unit (OPU)

| Field | Value |
|-------|-------|
| **Domain** | Computing Architectures |
| **System** | RPU with tape = Gr(k,n) |
| **Group** | U(n) acting on Gr(k,n) |
| **H^k tier** | H⁰ / H¹ / H² |
| **ISA** | Forge (β ≈ β*) |
| **Status** | Validated |
| **Opcodes** | ORBIT · TWIST · BIND · SPLIT · SPLAT · LABEL |
| **Papers** | Paper 598, Paper 205, Paper 489 |

---

## Physical system

The Orbit Processing Unit (OPU) is a Resonance Processing Unit (RPU, Paper 205)
whose computational tape is the Grassmannian Gr(k,n) = U(n)/(U(k)×U(n−k)) —
the space of k-dimensional subspaces of ℂⁿ. The head state is a k-plane
V ∈ Gr(k,n); the alphabet is the Schubert cell decomposition of Gr(k,n) (C(n,k)
cells); the memory register is the NOON spectrum {σ₁²,…,σₖ²} (singular values
of the head's coordinate matrix); the halting condition is Schubert variety
crossing — the β* snap event where σ₁² crosses a critical threshold.

The OPU is not an abstraction: **FeMoco, the ribosome, and photosynthetic FMO
are all physical OPUs**, running the Forge ISA on biological Grassmannians at
300 K.

---

## Target category

**Symp(Gr)** — the category of Grassmannian-fibred symplectic manifolds, with
the U(n) action, the Fubini-Study metric, and the Schubert stratification.
Morphisms are U(n)-equivariant symplectic maps (geodesics on Gr(k,n)).

## Interpretation functor

F: C → Symp(Gr) defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Geodesic step on Gr(k,n): V → exp(tX)·V for X ∈ u(n); winding number = Schubert cell index traversed |
| TWIST  | Berry phase accumulation: φ = i∮⟨V\|dV⟩ around a closed loop in Gr(k,n); H¹ holonomy |
| BIND   | H² holonomy: non-abelian parallel transport around a 2-cycle in Gr(k,n); requires quantum hardware |
| SPLIT  | Schmidt decomposition: V → U Σ W† (SVD); outputs NOON spectrum {σₖ²} |
| SPLAT  | Reverse Schmidt: reconstruct V from NOON spectrum (CI coefficient update) |
| LABEL  | Schubert cell index: read current cell from σ₁²; halt flag if σ₁² > 0.88 |

## ISA programme

```
INIT:    LABEL[V₀ | HF reference, σ₁²=1]     -- start at Hartree-Fock Schubert cell
SPLIT:   SPLIT[V₀ → U₀ Σ₀ W₀†]              -- read initial NOON spectrum
STEP:    ORBIT[V → exp(tX)·V | X = orbital gradient]  -- geodesic step (CASSCF iteration)
PHASE:   TWIST[φ += i⟨V|dV⟩]                -- accumulate Berry phase
HALT?:   LABEL[σ₁² < 0.88?]                  -- Schubert variety crossing = β* snap
BIND:    BIND[holonomy | H² pairs only]       -- non-abelian correction (quantum hardware)
READ:    SPLAT[{σₖ²}, {φₖ}]                  -- output NOON spectrum + Berry phases
```

## Computable output

- **NOON spectrum** {σₖ²}: the C/T skeleton classification (C-boxes: σₖ² ≈ 0
  or 2; T-arrows: σₖ² ∈ (0,2)). Directly interpretable as the alchemi output.
- **Halt condition**: σ₁² crosses the Schubert variety boundary at σ₁² ≈ 0.88
  — the β* snap. Corresponds to the CASSCF convergence criterion in chemical
  calculations (verified in Paper 596, x596c).
- **Berry phases** {φₖ}: H¹ holonomy per T-arrow pair. Equal to the CASSCF
  orbital rotation angles at convergence.
- **Correlated energy**: E = ⟨Ψ|H|Ψ⟩ at the halted k-plane V*. The geodesic
  length d_FS(V₀, V*) is the geometric measure of correlation difficulty.

## The RPU family

| XPU | Tape manifold | Group | β regime |
|-----|--------------|-------|----------|
| QPU | CP^{2ⁿ⁻¹} (full Hilbert space) | U(2ⁿ) | β = it |
| **OPU** | **Gr(k,n)** | **U(n)** | **finite β** |
| PPU | Bruhat-Tits tree | PGL(2,ℚₚ) | p-adic β |
| Fano OPU | Gr(3,7), G₂ symmetry | G₂ | finite β |

## GPU boundary

| Tier | Opcode | GPU emulable? | Notes |
|------|--------|--------------|-------|
| H⁰ | ORBIT + SPLIT/SPLAT | Yes | batched SVD + GEMM (cuBLAS) |
| H¹ | TWIST | Yes | complex phase det(U†V) |
| H² | BIND | No | requires phase-coherent quantum hardware |

Existing CASSCF codes (PySCF, GAMESS, ORCA with GPU) are **implicit OPU
emulators** — they compute geodesics on Gr(k,n) without naming them as such.

## Natural OPU instances

| System | Gr(k,n) | Halt condition | Paper |
|--------|---------|---------------|-------|
| FeMoco (nitrogenase) | Gr(3,7) | N₂ → 2NH₃ committed | 488 |
| DNA Polymerase III | Gr(H⁰×H¹×H²) | Base-pair confirmed | 510 |
| FMO complex | Gr(1,7) | Exciton at RC | 325 |
| Ribosome | Gr(3,6) | Peptide bond formed | 510 |

## Validation

- CASSCF orbital gradient = covariant derivative on Gr(k,n): confirmed to 6
  decimal places (Paper 594).
- Schubert variety crossing = β* snap: confirmed numerically for N₂ and Fe²⁺
  (Paper 596, x596c, SHA d4a5d465).
- FeMoco as Fano OPU at 300 K: Papers 488/310, validated against EPR spectrum.

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
