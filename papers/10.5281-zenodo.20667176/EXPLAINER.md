---
layout: default
title: "The Fano Plane is the Right Way to Think About Qubits"
parent: Explainers
nav_exclude: false
tags: [fano, origami-isa, associamancy, magic-states, qec, stabiliser, sevenq, primer]
portfolio: F|C
---

## A Map of What Quantum Computers Can Do

*Plain-language explainer for [doi:10.5281/zenodo.20667176](https://doi.org/10.5281/zenodo.20667176) (#408)*

---

## The central idea in one sentence

The Fano plane — 7 points, 7 lines — is the correct geometric framework for understanding qubits, and it reveals a three-level hierarchy of quantum computational power that the standard textbook picture misses entirely.

---

## What the Fano plane has to do with qubits

The 3-qubit Pauli group (the group of all tensor products of Pauli matrices $I$, $X$, $Y$, $Z$) has 63 non-identity elements. These fall into 7 groups of 9, one for each point of the Fano plane. The 7 Fano lines correspond to the 7 stabiliser generators of the GHZ state — and by the result of Paper 363, these generators produce the Steane quantum error-correcting code.

The Fano plane is not just a mnemonic. It is the actual geometry that governs which multi-qubit Pauli operators commute, which anti-commute, and which are "magic" (not in the stabiliser group).

---

## The three-level hierarchy

The Fano plane reveals three distinct levels of quantum resource:

| Level | Name | What you need | Protected by |
|---|---|---|---|
| 0 | Stabiliser | Clifford gates only | Nothing (classically simulable) |
| 1 | Standard magic | T gate ($e^{i\pi/4}$) | Wigner negativity |
| 2 | Associamancy | SPIN opcode ($i\sqrt{7}/2$) | Topological (Weyl group $D_6$) |

Level 0 is the "free" resource. Level 1 is what makes standard quantum computers powerful. Level 2 — associamancy — is new to this paper: it requires hardware with $G_2$ symmetry (the SevenQ register or a native $G_2$-symmetric Hamiltonian) and provides topological protection unavailable at Levels 0 and 1.

The jump from Level 1 to Level 2 is the Schur boundary: the set of quantum states whose hidden symmetry group contains a genuinely complex irreducible representation (Frobenius-Schur indicator $\nu_2 = 0$).

---

## The Origami ISA in one paragraph

The Origami ISA is the five-opcode instruction set (SPLIT, SPLAT, TWIST, FLIP, FLOP) that covers Levels 0 and 1. The 731 ISA extends it with SPIN and BIND to reach Level 2. The SevenQ — a 7-qubit register with the 7 qubits corresponding to the 7 Fano points — is the minimal hardware for Level 2.

This paper is the entry point designed to introduce all of this to a quantum computing researcher who knows stabiliser states and T gates but has never heard of the Origami ISA.

---

## What to read next

- [Associamancy](https://doi.org/10.5281/zenodo.20667174) (#407) — the full resource theory
- [Fano QEC](https://doi.org/10.5281/zenodo.20541595) (#363) — the QEC connection in detail
- [Origami ISA Pulse Sequences](https://doi.org/10.5281/zenodo.20680609) (#411) — the hardware side

*For the full technical treatment, see [doi:10.5281/zenodo.20667176](https://doi.org/10.5281/zenodo.20667176)*
