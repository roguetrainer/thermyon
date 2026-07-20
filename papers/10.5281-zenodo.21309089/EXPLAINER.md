---
layout: default
title: "Grassmannian Compression"
parent: Papers
doi: "10.5281/zenodo.21309088"
paper_number: 594
---

# Grassmannian Compression

**Why active space methods work — and when they must fail**

---

## The one-sentence version

The correlated wavefunction is the holonomy of a Berry connection on the Grassmannian, and the NOON snap count (Maslov index) is the minimum number of BIND opcodes needed to represent it.

---

## The problem

A molecule with 50 basis functions has a Hilbert space of dimension ~10¹⁴. FCI is impossible. Active space methods (CASSCF, CASPT2, MRCI) shrink this to ~10⁶ by picking a small set of "active" orbitals. They work — but nobody has given a precise geometric explanation of *why*.

---

## The answer: Grassmannian compression

The active orbitals span a subspace of the one-particle Hilbert space. The set of all such subspaces is the **Grassmannian** Gr(n_active, n_AO) — a smooth manifold. The C/T pre-screening maps each molecular geometry to a *point* on this manifold.

Three levels of structure:

| Level | What it is | Chemistry | ISA |
|---|---|---|---|
| H⁰ | A fixed point on Gr(k,n) | Hartree-Fock | ORBIT |
| H¹ | A geodesic on Gr(k,n) | CASSCF orbital rotation | TWIST |
| H² | Topology of the path | Multi-reference correlation | BIND |

---

## Where the active space comes from: Jaynes

The active subspace is not chosen by chemical intuition — it is the output of **Jaynes' maximum-entropy principle** applied to the one-particle density matrix. The MaxEnt state consistent with the natural orbital occupancies (NOONs) is a free-fermion Gibbs state. The active space is the **unstable manifold** of the saddle point of its free energy. The MaxEnt Lagrange multipliers reproduce the FCI NOONs *exactly* (reconstruction error = 0.000000, confirmed numerically).

---

## CASSCF = parallel transport

Stretching a bond traces a curve on Gr(k,n). The CASSCF orbital-rotation gradient is the **Fubini-Study covariant derivative** along this curve. Running CASSCF with MO continuity (seeding each geometry from the previous) is a discrete **parallel-transport integrator**. The Berry phase of a closed molecular loop equals the solid angle swept on the Grassmannian — confirmed to 6 decimal places.

---

## NOON snaps = Schubert crossings

When a natural orbital occupancy crosses 0.02 or 1.98, the active subspace dimension changes. In Grassmannian language this is the curve hitting a **Schubert variety** — a special stratum of the manifold. Each crossing contributes ±1 to the **Maslov index** μ(γ).

The Maslov index and the Berry phase are **independent** H² invariants:

- Berry phase = continuous geometric holonomy (measures solid angle swept)
- Maslov index = discrete topological count (counts Schubert crossings)

A closed molecular loop can have Berry phase ≠ 0 with Maslov = 0, or vice versa. Proved numerically for H₂/STO-3G: dissociation-rotation-recombination loop with Δφ = 2π/3 gives μ = 0, γ = 1.019 rad.

---

## What it means for quantum chemistry

- **μ = 0**: correlation is purely geometric (H¹). CASSCF is sufficient.
- **μ > 0**: BIND insertions required (H²). Multi-reference methods needed. The Maslov index tells you *how many*.
- **DFT fails** precisely when μ > 0 along a reaction path. The Schubert crossing is the precise condition for "strongly correlated" — no more guesswork.

---

## The quantum computing analogue

T-count in a quantum circuit plays the role of n_active. T-gate injections are Schubert variety crossings. For Shor's algorithm: n_active ~ log(N), the Grassmannian compression is maximal, and the Maslov index along the algorithm's state trajectory measures the minimum T-count.

---

## Companion papers

- [Paper 588](../10.5281-zenodo.TBD/) — Weak Lifting Theorem: compression guarantee (r = −0.979)
- [Paper 568](../10.5281-zenodo.TBD/) — Schrödinger equation on the Grassmannian
- [Paper 477](../10.5281-zenodo.21158952/) — Maslov index in the MGE context
- [Paper 572](../10.5281-zenodo.TBD/) — BIND calculus for G₂
