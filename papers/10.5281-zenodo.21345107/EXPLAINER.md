---
layout: default
title: "Weyl Chamber Homology"
parent: Explainers
nav_exclude: true
tags: [weyl-chamber, bredon-cohomology, two-qubit-gates, makhlin-invariants, cnot, iswap, grassmannian, steane-code, fano-plane, quantum-computing, h-k-ladder, trs-framework]
portfolio: A
---

## Chemistry and quantum computing are the same computation

*Plain-language explainer for [doi:10.5281/zenodo.21345106](https://doi.org/10.5281/zenodo.21345106) (#595)*

---

## The one-sentence version

The space of all 2-qubit gates is a tetrahedron; attaching the right homology theory to it (Bredon cohomology with isotropy coefficients) gives Euler characteristic 2 — a non-trivial topological invariant that distinguishes CNOT from iSWAP, and shows that the chemistry Grassmannian and the quantum-computing Weyl chamber are fibres of the same geometric object.

---

## The tetrahedron of two-qubit gates

Every 2-qubit unitary U is locally equivalent (up to single-qubit rotations on each qubit) to a gate of the form:

$$U_W(c_1, c_2, c_3) = \exp\!\bigl(i(c_1\, XX + c_2\, YY + c_3\, ZZ)\bigr)$$

The three parameters (c₁, c₂, c₃) with π/4 ≥ c₁ ≥ c₂ ≥ c₃ ≥ 0 form the **Weyl chamber** — one point per equivalence class of 2-qubit gates. The Weyl chamber is a tetrahedron with four distinguished vertices:

| Vertex | Weyl coords | Gate | Entanglement | H^k tier |
|--------|------------|------|-------------|----------|
| v₀ | (0, 0, 0) | Identity | none | H⁰ |
| v₁ | (π/4, 0, 0) | CNOT / CZ | maximal | H¹ |
| v₂ | (π/4, π/4, 0) | iSWAP | maximal | H¹ |
| v₃ | (π/4, π/4, π/4) | SWAP | none (!) | H⁰ |

The surprising fact: SWAP is at a vertex of the tetrahedron but produces **no entanglement** — it is a permutation gate. CNOT and iSWAP are both maximally entangling, but they sit on **different faces** of the tetrahedron and are not locally equivalent to each other.

---

## Why standard homology misses the structure

The Weyl chamber, as a topological space, is just a solid tetrahedron — a 3-ball. Its standard homology is trivial: H₀ = ℤ, H₁ = H₂ = H₃ = 0. This tells you nothing about the gate structure.

The problem: the tetrahedron's four vertices are not equivalent. The Identity vertex has a large centraliser (many rotations that commute with it — 6-dimensional in su(2)²). The iSWAP vertex has a small centraliser (1-dimensional). These symmetry differences are invisible to standard (constant-coefficient) homology.

The fix: **Bredon cohomology** with isotropy representation coefficients. Instead of attaching the same coefficient ring ℤ to every simplex, attach a coefficient L(v) = dim(centraliser of the gate at vertex v):

| Vertex | Gate | Centraliser dim L(v) |
|--------|------|---------------------|
| v₀ | Identity | 6 |
| v₁ | CNOT | 2 |
| v₂ | iSWAP | 1 |
| v₃ | SWAP | 3 |

The Bredon coboundary maps use these local coefficients. The result:

$$H^0_{\rm Bredon} = 1, \quad H^1_{\rm Bredon} = 0, \quad H^2_{\rm Bredon} = 1, \quad \chi_{\rm Bredon} = 2$$

The Euler characteristic jumps from 1 (standard) to **2** (Bredon). The H²_Bredon = 1 class is a genuine non-trivial topological invariant of the 2-qubit gate space — invisible to entanglement entropy alone.

---

## CNOT vs iSWAP: same entanglement, different topology

Both CNOT and iSWAP are maximally entangling gates. Both have entanglement power E ≈ 0.35 (they produce the same amount of entanglement from a product input). Yet they are not equivalent — you cannot continuously deform CNOT into iSWAP via single-qubit rotations.

The **Makhlin invariants** (g₁, g₂) distinguish them:

| Gate | g₁ | g₂ | Entanglement power |
|------|----|----|-------------------|
| Identity | +1 | +3 | 0 |
| CNOT | 0 | +1 | 0.358 |
| iSWAP | 0 | −1 | 0.351 |
| SWAP | −1 | −3 | 0 |

CNOT has g₂ = +1; iSWAP has g₂ = −1. The sign of g₂ distinguishes them — even though their entanglement power is essentially identical. Makhlin g₂ is **strictly finer** than entanglement power as a gate classifier.

In ISA language: both CNOT and iSWAP are 1-BIND gates (each requires exactly one BIND opcode). Their different Weyl chamber position means they sit on different faces of the tetrahedron — they are topologically distinct within the H² stratum, even though both are H².

---

## Three-qubit gates: the Bredon cascade

Extending to 3-qubit gates, the Weyl chamber becomes a 4-simplex (5 vertices). The Bredon Euler characteristic changes dramatically:

| System | Weyl dim | χ_Bredon |
|--------|----------|----------|
| 2-qubit | 3 | **2** |
| 3-qubit | 4 | **0** |

The jump from 2 to 0 as you add one qubit is a non-trivial equivariant signature. It means:

- **2-qubit gate space** has one non-trivial Bredon H² class — the topological distinction between CNOT-type and iSWAP-type gates
- **3-qubit gate space** is equivariantly contractible — the Toffoli gate (the 3-qubit BIND) does NOT generate a new topological class; it is connected to Identity via equivariant deformation

This matters architecturally: the new topology (H² Bredon class) only appears in the **2-qubit sub-sector**. The 3-to-7 qubit jump for quantum error correction is not arbitrary — it reflects this exact structure.

---

## The 3-to-7 qubit architecture jump

The 3-qubit Weyl chamber has 4 Cartan parameters {ZZI, ZIZ, IZZ, ZZZ}. The Fano plane has 7 points. Why does useful quantum error correction require 7 qubits (Steane [[7,1,3]] code) rather than 3?

The Bredon theory gives a precise answer:

- **Gate space** (3 qubits): 4-simplex, 4 Cartan parameters → classifies all 3-qubit gates
- **Stabiliser space** (7 qubits): Fano plane PG(2,2), 7 points → [[7,1,3]] Steane code

The centraliser dimensions predict which stabiliser measurements are fragile:
- High centraliser dim (e.g., Identity with dim=6): easy to measure, robust
- Low centraliser dim (e.g., iSWAP with dim=1): fragile, needs more QEC overhead

The Steane code needs 7 physical qubits because it takes 4 gate parameters (dim of 3-qubit Weyl chamber) plus 3 (code distance) to achieve error correction. The Bredon cohomology bridges gate space and stabiliser space.

---

## Chemistry and quantum computing: the same tetrahedron

The deepest result of this paper is that the **chemistry Grassmannian** (from Papers 570, 594) and the **quantum-computing Weyl chamber** are fibres of the same geometric object — the flag manifold Fl(1,2,...,n).

Side-by-side dictionary:

| Concept | Chemistry (Grassmannian) | Quantum computing (Weyl chamber) |
|---------|------------------------|----------------------------------|
| The space | Gr(k,n) — orbital subspaces | W ⊂ ℝ³ — gate equivalence classes |
| Invariant 1 | NOON n ∈ [0,2] | Makhlin g₂ ∈ {−3,−1,+1,+3,...} |
| Invariant 2 | Grassmannian angle θ_G | Entanglement power E |
| H⁰ tier | Frozen orbital (n ≈ 0 or 2) | Identity / SWAP (g₂ = ±3) |
| H¹ tier | Covalent bond (n ≈ 1) | CNOT / CZ (g₂ = +1) |
| H² tier | Correlated / aromatic | iSWAP / non-Clifford (g₂ = −1) |
| The snap | NOON hits 1 (Schubert crossing) | g₂ changes sign |
| Classical fails at | H¹/H² boundary (DFT) | H¹/H² boundary (Gottesman-Knill) |
| Algebraic layer H⁰ | Cl(n) spinors | Clifford algebra |
| Algebraic layer H¹ | SU(k,n)/U(k) twistors | Clifford + CNOT |
| Algebraic layer H² | G₂ / octonions | Magic states, T-gates |

**DFT fails at H¹/H²; Clifford simulation fails at H¹/H². They fail at the same boundary.**

This is not a coincidence — it is the same topological obstruction (the Bredon H² class, χ_Bredon = 2) appearing in two different physical contexts. The ISA is the language that makes this visible.

---

## The corrected NOON ↔ Weyl map

A key technical result: the correct map between natural orbital occupancies (NOONs) from chemistry and Weyl chamber coordinates from quantum computing is:

$$c_1 = \frac{\pi}{4}(1 - |n - 1|), \qquad c_2 = \frac{\pi}{4}\frac{\theta_G}{90°}$$

This map is **symmetric around n = 1** (reflecting the particle-hole symmetry: a bond with NOON n is equivalent to one with NOON 2−n). Previous maps in the literature were asymmetric — this correction was confirmed by 5/5 alignment between chemistry benchmarks and Weyl chamber positions.

---

*See also:*

- [Grassmannian Compression](https://doi.org/10.5281/zenodo.21309088) (#594) — the chemistry side: NOON snaps, Maslov index, Schubert crossings
- [Weyl DFT Accelerator](https://doi.org/10.5281/zenodo.21346033) (#596) — practical application: Weyl c₂ as DFT failure detector (r = 0.990)
- [Trapped-Ion OPU](https://doi.org/10.5281/zenodo.21360906) (#604) — KAK decomposition: Weyl chamber coordinates as BIND count
- [ISA Chain Complex / Khovanov Homology](https://doi.org/10.5281/zenodo.21278536) (#571) — the chain complex whose ∂² = 0 underlies Bredon cohomology here

*For the full technical treatment, see [doi:10.5281/zenodo.21345106](https://doi.org/10.5281/zenodo.21345106)*
