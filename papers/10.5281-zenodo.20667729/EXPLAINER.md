---
layout: default
title: "Origami MBQC: The Origami ISA as a Measurement-Based Instruction Set"
parent: Explainers
nav_exclude: false
tags: [origami-isa, mbqc, measurement-based, fano, cluster-state, hardware]
portfolio: C|F
---

## Quantum Computing Without Gates

*Plain-language explainer for [doi:10.5281/zenodo.20667729](https://doi.org/10.5281/zenodo.20667729) (#406)*

---

## The central idea in one sentence

Every Origami ISA opcode can be implemented by measuring a pre-prepared "cluster state" rather than by applying gates — and the Fano cluster state is the minimal resource for implementing the SPIN opcode (Level 2 / associamancy).

---

## Two models of quantum computation

**Gate model:** apply a sequence of unitary gates to qubits. This is the standard picture (IBM, Google, IonQ hardware).

**Measurement-based quantum computation (MBQC):** prepare a large entangled "cluster state" first, then compute by measuring individual qubits in chosen bases. The measurements consume the cluster state and produce the output. No gates are applied after the initial preparation.

MBQC is not just a curiosity — it is computationally equivalent to the gate model and has some practical advantages: the entangling operations happen offline (the cluster state preparation), and the computation itself is just single-qubit measurements.

---

## The Origami ISA in MBQC language

This paper shows that each Origami ISA opcode corresponds to a specific measurement pattern on a cluster state:

- **SPLIT / SPLAT**: measurements on a 4-qubit cluster (the tetrahedron)
- **TWIST**: adaptive single-qubit measurement (the feed-forward)
- **FLIP / FLOP**: time-reversed measurement patterns

The key new result: the **Fano cluster state** — a 7-qubit cluster with Fano-plane entanglement structure — is the minimal resource for implementing the SPIN opcode (the $G_2$ triality generator). Without the Fano cluster state, SPIN can only be approximated using exponentially many measurements.

---

## Why this matters for hardware

The Fano cluster state can be prepared once (offline) using standard entangling gates, then the SPIN opcode becomes a sequence of 7 adaptive single-qubit measurements. This is dramatically cheaper than trying to implement SPIN directly as a unitary gate — which requires a native $G_2$-symmetric Hamiltonian.

For photonic quantum computers (where measurement-based computation is natural), this gives a concrete route to Level-2 (associamancy) quantum computation without exotic hardware.

---

## What to read next

- [Origami ISA Pulse Sequences](https://doi.org/10.5281/zenodo.20680609) (#411) — the gate-model alternative for SPIN
- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — why Level 2 is worth reaching

*For the full technical treatment, see [doi:10.5281/zenodo.20667729](https://doi.org/10.5281/zenodo.20667729)*
