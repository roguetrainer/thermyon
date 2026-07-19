---
layout: default
title: "The Kitaev Menagerie in Origami"
parent: Explainers
nav_exclude: true
tags: [kitaev, toric-code, honeycomb, anyon, f-matrix, racah, 6j-symbol, origami-isa, 731-isa, frog-calculus, zx-calculus, topological-quantum-computation, ising-anyon, fibonacci-anyon, gibbs-isa, beta-scheduling, nishimori, h1-cohomology, error-correction, phase-transition, non-abelian]
portfolio: A
---

## Kitaev's Famous Phases, Explained with One Language

*Plain-language explainer for [doi:10.5281/zenodo.20752352](https://doi.org/10.5281/zenodo.20752352) (#445)*

---

## The central idea in one sentence

Kitaev's three topological phases of matter are three *temperature settings* of the Origami ISA, and the algebraic fingerprint of each phase (its F-matrix) is exactly the quantum group 6j symbol at the corresponding temperature.

---

## What is Kitaev's programme?

In 2003 and 2006, Alexei Kitaev described a family of quantum systems with remarkable properties: they can store quantum information without any active error correction, and in their most exotic phase they can perform quantum computation that is inherently immune to noise.

These systems have three distinct phases:

- **The toric code phase** — the simplest topological phase; quantum information is stored in the topology of the system, protected by a kind of "no local operation can disturb it" guarantee
- **The gapless Dirac phase** — a critical point with no protection
- **The non-Abelian phase** — the exotic phase; excitations (anyons) have a property called non-Abelian braiding statistics that can be used to perform quantum gates

The problem: understanding all three phases simultaneously currently requires expertise in six different fields (Majorana fermions, gauge theory, Chern numbers, anyon models, modular tensor categories, quantum error correction). No single community has all of this.

---

## The punchline: temperature controls the phase

The Origami ISA is a minimal instruction set for quantum computation built around the 6j symbol — the algebraic object that governs how angular momenta combine and recombine. It has a *temperature parameter* β. At β=∞ it is classical; at finite β, quantum group corrections kick in.

The discovery: the quantum group deformation parameter $q = e^{i\pi/(k+2)}$ is exactly the Gibbs ISA temperature in disguise: $q = e^{i\pi\beta}$.

This means the three Kitaev phases are three points on the temperature axis:

| Temperature β | Anyon type | Phase | Computational power |
|---|---|---|---|
| 1/4 | Ising | Toric code | Quantum memory |
| 1/5 | Fibonacci | Non-Abelian | Universal quantum computation |
| 0 | None | Classical | No protection |

To move between phases, you change the temperature schedule — exactly what the `THERMAL` compiler directive does.

---

## The two proved theorems

**Theorem 1 (Ising anyons).** At $\beta = 1/4$, the quantum group $SU(2)_2$ has quantum dimension $d = \sqrt{2}$. The F-matrix (the algebraic fingerprint of the anyon model) is then uniquely determined to be the Hadamard matrix:

$$F = \frac{1}{\sqrt{2}}\begin{pmatrix}1 & 1 \\ 1 & -1\end{pmatrix}$$

This matches the Ising anyon F-matrix exactly. Verified numerically.

**Theorem 2 (Fibonacci anyons).** At $\beta = 1/5$, the quantum group $SU(2)_3$ has quantum dimension $d = \phi$ (the golden ratio). The F-matrix is:

$$F = \begin{pmatrix}\phi^{-1} & \phi^{-1/2} \\ \phi^{-1/2} & -\phi^{-1}\end{pmatrix}$$

This matches the Fibonacci anyon F-matrix exactly. Fibonacci anyons are sufficient for *universal* topological quantum computation. Verified numerically.

The classical limit ($\beta \to 0$, $q \to 1$) gives a 60° rotation matrix — not any known anyon model, and with no topological protection. You need finite temperature to get topological order.

---

## The ISA hierarchy maps onto the anyon hierarchy

There is a strict containment of instruction sets:

$$\text{ZX-calculus} \subset \text{Origami ISA} \subset \text{731-ISA}$$

Each level can express exactly one tier of anyons:

- **ZX-calculus** (the standard quantum circuit language): handles the toric code (Abelian anyons, classical Clifford circuits) but cannot natively express the non-Abelian F-matrix
- **Origami ISA at β=1/4**: handles Ising anyons; the SPLIT/SPLAT opcodes at $j=1/2$ give the Hadamard F-matrix directly
- **731-ISA / Frog calculus at β=1/5**: handles Fibonacci anyons; the BIND opcode (octonion triality) is needed for the three-spin interaction that opens the non-Abelian gap

So the question "what is the 731-ISA for, computationally?" has a clean answer: it is the language for universal topological quantum computation.

---

## The toric code stores information in topology

The toric code's logical qubit is not a physical qubit — it is a topological feature of the system. Specifically, it is the generator of $H^1(T^2; \mathbb{Z}_2)$ — the first cohomology group of the torus with $\mathbb{Z}_2$ coefficients. There are two independent non-contractible loops on a torus, so $|H^1| = 4$: the ground state has fourfold degeneracy.

An error that destroys the logical qubit is an error chain that wraps around one of these non-contractible loops. Error correction means detecting whether such a chain has formed — an $H^1$ obstruction computation.

This is the same $H^1$ obstruction that appears in the [Deep Framework](https://doi.org/10.5281/zenodo.???) for financial networks: a funding loop that cannot be contracted, a holonomy around a non-trivial cycle. The toric code and systemic financial risk are measuring the same topological quantity.

---

## Why this matters

**Accessibility.** Kitaev's 2006 paper is one of the most cited and least-read papers in physics. The Origami ISA makes the entire programme readable by anyone who knows the ISA — without separately acquiring condensed-matter, MTC, and error-correction backgrounds.

**Unification across fields.** Five communities — condensed matter, quantum error correction, applied category theory (ZX-calculus), representation theory (6j symbols), and statistical physics (Nishimori correspondence) — are now speaking the same language about the same objects.

**A sixth "Planck's constant."** The quantum group deformation parameter $q$ is the sixth bridge variable in the *Planck's Constant in Disguise* programme ([Paper 443](/papers/443)): alongside viscosity (fluids), volatility (finance), regularisation (optimal transport), temperature (HMMs), and $\hbar$ itself, we now have $q$ (topological order). All six are the same algebraic deformation seen from different fields.

---

## What to read next

- [The Gibbs ISA](https://doi.org/10.5281/zenodo.???) (#419) — the β-scheduling framework and β* formula
- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) (#325) — the THERMAL compiler directive
- [MIP*=RE via the Pentagon Identity](https://doi.org/10.5281/zenodo.???) (#357) — the pentagon equation verified at all j; x357b is the precursor experiment
- [Planck's Constant in Disguise](https://doi.org/10.5281/zenodo.20752384) (#443) — the five (now six) semiring dual pairs
- [The Magmoidal Origami ISA](https://doi.org/10.5281/zenodo.???) (#258) — ZX ⊂ Origami ⊂ 731; the frog calculus

*For the full technical treatment, see [doi:10.5281/zenodo.20752352](https://doi.org/10.5281/zenodo.20752352)*
