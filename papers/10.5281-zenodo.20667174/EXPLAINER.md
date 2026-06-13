---
layout: default
title: "Associamancy: A Resource Theory of Non-Associative Quantum Magic"
parent: Explainers
nav_exclude: false
tags: [associamancy, schur-boundary, frobenius-schur, g2, triality, magic-states, resource-theory, quantum-foundations]
portfolio: F|B
---

## The Third Level of Quantum Power

*Plain-language explainer for [doi:10.5281/zenodo.20667174](https://doi.org/10.5281/zenodo.20667174) (#407)*

---

## The central idea in one sentence

There are three levels of quantum computational power — stabiliser states, magic states, and *associamancy* — and standard quantum computing theory has been missing the third.

---

## The three levels

**Level 0 — Stabiliser states.** These are quantum states that can be efficiently simulated on a classical computer (Gottesman-Knill theorem). They are "too quantum to be classical" in one sense, but classically simulable. No advantage over classical computing.

**Level 1 — Magic states.** Add a T gate (or inject a magic state) and you escape classical simulation. The T gate has a phase $e^{i\pi/4}$ — an 8th root of unity. This is the resource that makes quantum computers powerful. Magic is measured by Wigner function negativity.

**Level 2 — Associamancy.** This paper identifies a strictly higher level. A state has associamancy if its hidden symmetry group contains a genuinely complex irreducible representation — one with Frobenius-Schur indicator $\nu_2 = 0$. These are representations that cannot be realised over the real numbers or the quaternions: they require the full complex numbers in an essentially non-associative way.

The minimum group exhibiting associamancy is PSL(2,7), the symmetry group of the Fano plane. The criterion: $\mathrm{PSL}(2,q)$ has associamancy if and only if $q \equiv 3 \pmod{4}$.

---

## The Schur boundary

The boundary between Level 1 and Level 2 is the **Schur boundary**: the set of representations where $\nu_2$ changes from $\pm 1$ to $0$. Crossing this boundary requires the SPIN opcode of the 731 ISA — the generator of $G_2$ triality.

In the typed ISA framework (Paper 412), applying the SPIN opcode to a Level-1 wire raises a `TypeError` at circuit construction time. The Schur boundary is a compile-time check.

---

## The Freudenthal ladder

Associamancy sits at the $G_2$ rung of the Freudenthal magic square:
$$G_2 \subset F_4 \subset E_6 \subset E_7 \subset E_8$$
Each rung adds a further layer of exceptional algebraic structure. $G_2$ is the minimum: the smallest exceptional Lie group, the automorphism group of the octonions, the fixed-point subgroup of triality in $\mathrm{Spin}(8)$.

---

## What to read next

- [Non-Associative Hardware is Necessary](https://doi.org/10.5281/zenodo.20667170) (#405) — the proof that associamancy requires different hardware
- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — the practitioner primer

*For the full technical treatment, see [doi:10.5281/zenodo.20667174](https://doi.org/10.5281/zenodo.20667174)*
