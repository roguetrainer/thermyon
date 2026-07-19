---
layout: default
title: "The Origami ISA and the State Hidden Subgroup Problem"
parent: Explainers
nav_exclude: true
tags: [origami-isa, statehsp, splat, fourier-sampling, hidden-subgroup, quantum-foundations]
portfolio: F|C
---

## SPLAT is Fourier Sampling

*Plain-language explainer for [doi:10.5281/zenodo.20667167](https://doi.org/10.5281/zenodo.20667167) (#404)*

---

## The central idea in one sentence

The quantum algorithm for learning a hidden symmetry from copies of a quantum state is exactly the SPLAT opcode of the Origami ISA applied to the group algebra sheaf.

---

## The hidden subgroup problem (for states)

The classical hidden subgroup problem asks: given a function that is periodic with unknown period, find the period. Shor's algorithm solves this for integers (factoring) and for abelian groups (discrete logarithm). The key step is Fourier sampling: transform to the frequency domain and measure.

The **State** Hidden Subgroup Problem (StateHSP) is harder: given copies of a *quantum state* that is invariant under an unknown subgroup $H$ of a group $G$, identify $H$ using quantum measurements.

---

## The ISA connection

This paper shows that the abelian StateHSP algorithm of Hinsche, Eisert, and Carrasco (2024) is exactly the following Origami ISA circuit:

1. **SPLIT**: prepare $n$ copies of the unknown state
2. **SPLAT**: apply the character POVM (a measurement in the Fourier basis of $G$)
3. **FLOP**: read out the group element (the hidden subgroup generator)

The SPLAT opcode *is* the character POVM. The hidden subgroup *is* the $H^0$ of the symmetry sheaf — the globally consistent section that the SPLAT opcode extracts.

The sample complexity $O(\log|G|/\varepsilon)$ follows from $H^1 = 0$ (anticoncentration of the Fourier transform), which is the condition that SPLAT composed with SPLIT returns the trivial representation.

---

## Why this matters

It means that any quantum algorithm for learning symmetries from quantum states is a special case of the Origami ISA. The ISA gives a unified language for quantum state learning, quantum error correction, and spectroscopy — they are all SPLIT→SPLAT pipelines on different gauge groups.

---

## What to read next

- [Non-Associative Hardware is Necessary](https://doi.org/10.5281/zenodo.20667170) (#405) — what happens when the group is non-abelian
- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — the full three-level resource picture

*For the full technical treatment, see [doi:10.5281/zenodo.20667167](https://doi.org/10.5281/zenodo.20667167)*
