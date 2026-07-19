---
layout: default
title: "Non-Associative Hardware is Necessary for the Non-Abelian StateHSP"
parent: Explainers
nav_exclude: true
tags: [origami-isa, statehsp, psl27, sevenq, non-associative, g2, associamancy, quantum-foundations]
portfolio: F|C
---

## Why Some Quantum Problems Cannot Be Solved Without Exotic Hardware

*Plain-language explainer for [doi:10.5281/zenodo.20667170](https://doi.org/10.5281/zenodo.20667170) (#405)*

---

## The central idea in one sentence

For the group PSL(2,7) — the symmetry group of the Fano plane — no standard quantum computer can solve the State Hidden Subgroup Problem exactly, because the answer requires a phase ($i\sqrt{7}/2$) that is inaccessible to any gate set built from roots of unity.

---

## What PSL(2,7) is

PSL(2,7) is the automorphism group of the Fano plane — the group of all symmetries that map the 7-point projective plane to itself. It has order 168 (the smallest simple group after the cyclic groups of prime order). Its representation theory contains two 3-dimensional irreducible representations $\chi_3$ and $\bar\chi_3$ whose character values on the order-7 conjugacy classes are:

$$\phi = \frac{-1 + i\sqrt{7}}{2}, \qquad \bar\phi = \frac{-1 - i\sqrt{7}}{2}$$

The factor $i\sqrt{7}/2$ is the obstruction.

---

## Why $i\sqrt{7}/2$ matters

Standard quantum gate sets (Clifford gates, T gates, any gate set with cyclotomic integer entries) cannot produce $i\sqrt{7}/2$ exactly. $\sqrt{7}$ is irrational; $i\sqrt{7}/2$ is not a root of unity. To distinguish the conjugacy classes 7A and 7B of PSL(2,7) — which is what the StateHSP requires — the quantum measurement must produce this phase.

The Solovay-Kitaev theorem says standard gates can *approximate* it to precision $\varepsilon$ using $O(\log^c(1/\varepsilon))$ gates. But exact solution requires:
- A 7-qubit register with Fano-plane coupling topology (the SevenQ)
- The SPIN opcode of the 731 ISA — the generator of $G_2$ triality

This is the first *provably necessary* use of non-associative hardware in quantum computing.

---

## The proof structure

The paper proves necessity via the character obstruction: any associative measurement (one whose operator algebra is a matrix algebra over $\mathbb{C}$) can only produce algebraic numbers as measurement outcomes. Since $i\sqrt{7}/2$ is algebraic but not cyclotomic, it can be produced by some associative measurement — but only one that has access to the specific 3-dimensional $\chi_3$ representation of PSL(2,7), which requires the SPIN opcode.

---

## What to read next

- [Associamancy](https://doi.org/10.5281/zenodo.20667174) (#407) — the resource theory that explains why this happens
- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — the complete picture

*For the full technical treatment, see [doi:10.5281/zenodo.20667170](https://doi.org/10.5281/zenodo.20667170)*
