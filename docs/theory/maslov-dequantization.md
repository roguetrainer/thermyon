---
layout: default
title: "β: The Universal Temperature"
nav_order: 2
description: "The Maslov dequantization: a single inverse-temperature parameter β interpolates between two semirings — the tropical (max,+) at β→∞ and the probabilistic (+,×) at finite β. Every hard threshold in science is β→∞ in disguise."
tags: [maslov, dequantization, semiring, tropical, mge, beta, temperature, softmax, boltzmann, snap, gibbs]
portfolio: A
---

# β: The Universal Temperature
{: .no_toc }

*A single dial — the inverse temperature β — interpolates between two different arithmetics.
Every hard threshold, winner-takes-all decision, and classical logic gate is β → ∞.
Every soft, probabilistic, thermodynamic system is finite β.
The passage between them is the Maslov dequantization.*
{: .fs-5 .fw-300 }

---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## The central idea

There are two natural ways to add and multiply non-negative numbers:

| Semiring | Addition | Multiplication | Name |
|---------|----------|----------------|------|
| Probabilistic | a + b | a × b | Gibbs / Boltzmann |
| Tropical | max(a, b) | a + b | Tropical / (max,+) |

These look like different mathematical structures. The Maslov dequantization
says they are the same structure at different temperatures. Specifically:

$$a \oplus_\beta b \;=\; \frac{1}{\beta} \log\!\left(e^{\beta a} + e^{\beta b}\right)$$

- At **β → 0**: this approaches ½(a + b) — ordinary average (smooth Hodge limit)
- At **β = 1**: this is the log-sum-exp softmax — standard probabilistic arithmetic
- At **β → ∞**: this approaches max(a, b) — the tropical arithmetic

The tropical semiring is the **zero-temperature limit** of ordinary arithmetic.
The passage from finite β to β → ∞ is called the **Maslov dequantization** —
named for V. P. Maslov, who showed in the 1980s that tropical mathematics
arises systematically as the ℏ → 0 (or β → ∞) limit of quantum/statistical
mechanics.

**The single most important consequence:** every algorithm, model, or physical
system that uses a hard threshold — argmax, winner-takes-all, on/off logic,
phase transitions — is implicitly operating at β → ∞. Replacing that hard
threshold with finite β softens it, makes it differentiable, and connects it
to the probabilistic semiring. This is not an approximation. It is the
*correct* generalisation, of which the hard threshold is the zero-temperature
special case.

---

## Six famous equations — one formula

The same MGE expression at different β:

$$\pi_k(\beta) = \frac{e^{-\beta E_k}}{\sum_j e^{-\beta E_j}}$$

| Field | Equation | β meaning |
|-------|---------|-----------|
| Machine learning | Softmax(x/T) | T = 1/β; temperature of attention / sampling |
| Statistical mechanics | Boltzmann distribution | β = 1/k_BT; inverse thermal energy |
| Finance | Black-Scholes risk-neutral measure | β = 1/σ²; inverse variance |
| Quantum mechanics | Path integral e^{iS/ħ} | β = it/ħ; Wick-rotated |
| Optimisation | Simulated annealing schedule | β(t) increasing; cooling toward β→∞ |
| Information theory | Maximum entropy at fixed energy | β = Lagrange multiplier |

All six are the same formula. The ML engineer who tunes the softmax temperature,
the physicist computing a partition function, and the quant pricing options are
all turning the same dial.

**Paper:** [β in Disguise](https://doi.org/10.5281/zenodo.20752384) — six
equations, one formula, no prerequisites.

---

## The two semirings in detail

### The probabilistic semiring: finite β

At finite β, the MGE assigns a smooth probability to every outcome. The
arithmetic is the familiar (+, ×) of real numbers. Key properties:

- **Differentiable**: ∂π_k/∂E_k exists everywhere
- **All outcomes contribute**: no outcome has exactly zero weight
- **Entropy is positive**: H(π) = −Σπ_k log π_k > 0
- **Gradients flow**: backpropagation works; the system can be optimised

This is the regime of neural networks, Bayesian inference, statistical physics,
and chemical kinetics. It is the regime where learning happens.

### The tropical semiring: β → ∞

As β → ∞ the soft probability collapses to a hard indicator:

$$\lim_{\beta\to\infty} \pi_k(\beta) = \begin{cases} 1 & k = \arg\min_j E_j \\ 0 & \text{otherwise} \end{cases}$$

The arithmetic becomes (max, +): addition becomes max, multiplication becomes
addition. Key properties:

- **Non-differentiable**: the argmax has zero gradient almost everywhere
- **One outcome wins**: all weight concentrates on the minimum-energy state
- **Entropy is zero**: H(π) = 0 at β → ∞
- **No gradients**: classical algorithms, lookup tables, discrete logic

This is the regime of classical computers, database queries, shortest paths,
and discrete optimisation. It is the regime where answers are stored.

### The β* snap: the transition between them

Between the two semirings lies a **snap threshold β***, the point where the
system transitions from smooth probabilistic to sharply discrete behaviour.
This threshold is not arbitrary — it is determined by the topology of the
problem:

$$\beta^* = \frac{3}{8} \ln\frac{1}{1-\rho}$$

where ρ is the load factor of the constraint graph. Below β*: smooth, learning,
exploring. Above β*: crystallised, decided, locked in.

**Every hard threshold in science is β* in disguise:**

| Threshold | Domain | β* interpretation |
|-----------|--------|-------------------|
| p-value 0.05 | Statistics | β→∞ of a soft evidence threshold |
| Metropolis acceptance rate 0.234 | MCMC | Optimal β* for dimension-free sampling |
| DFT/CASSCF handoff (c₂ = 0.88) | Quantum chemistry | β*₀₁ for the H⁰↔H¹ tier boundary |
| PT phase transition (ε = ε_c) | Non-Hermitian physics | β*₁₂ for the H¹↔H² tier boundary |
| Softmax temperature in LLMs | ML | β* calibration; induction head snap |
| Kelly criterion | Finance | β* = 1/σ² separating ruin from growth |

These all look like domain-specific numbers. They are all the same saddle-point
equation evaluated in different units.

**Paper:** [In Praise of Soft Thresholds](https://doi.org/10.5281/zenodo.21373468) —
the unification of hard thresholds as T→0 limits; why finite-β is always the
correct generalisation.

---

## What changes as β varies

The Maslov dequantization is not just a mathematical curiosity — it changes
what kind of computation is possible:

| β regime | Semiring | What you can do | What you cannot |
|----------|---------|----------------|-----------------|
| β → 0 | Smooth (Hodge) | Global relaxation; Hodge decomposition; optimal transport | Local decisions |
| 0 < β < β* | Gibbs (exploratory) | Learn; backpropagate; explore; sample | Commit to an answer |
| β = β* | Snap threshold | Maximum information throughput | — |
| β* < β < ∞ | Gibbs (crystallising) | Refine; anneal; sharpen | Revise global structure |
| β → ∞ | Tropical (max,+) | Decide; retrieve; run discrete algorithms | Learn from errors |
| β = it | Complex (unitary) | Quantum interference; Berry phase | Dissipation |
| β ∈ ℂ | PT-symmetric | Gain-loss dynamics; exceptional points | Pure unitary evolution |

The key insight: **different computations require different β regimes.** A
neural network must operate at finite β to learn. A database query must
operate at β → ∞ to give a definite answer. A quantum computer operates at
β = it. A PT-symmetric sensor operates near β* ∈ ℂ. Mixing up the regimes
is the source of most failures in both AI and physics.

---

## The Maslov-Gibbs Einsum (MGE)

The MGE is the single operation that unifies the two semirings:

$$\text{MGE}(\mathbf{E}, \beta) = \frac{1}{\beta} \log \sum_k e^{-\beta E_k}$$

This is the free energy at inverse temperature β. Its β → ∞ limit is the
minimum energy (tropical argmin). Its β → 0 limit is the average energy
(arithmetic mean). At β = 1 it is the log-partition function of statistical
mechanics.

The MGE is **semiring-polymorphic**: it evaluates the same programme over
different arithmetic depending on β. This is why the same formula appears in
six different fields — they are all evaluating the same programme over the
semiring appropriate to their domain.

**The operational consequence for the ISA:** every opcode in the Origami ISA
has a β-parameterised version. At β → ∞ it runs over (max,+) — classical,
discrete. At finite β it runs over Gibbs — statistical, differentiable. The
same ISA programme, run at different β, gives different answers and uses
different computational resources. This is what we mean by a
*differentiable algorithm*: not that the algorithm has been approximated, but
that its natural parameter β has been set to a finite value rather than ∞.

**Papers:**
[The Maslov-Gibbs Einsum](https://doi.org/10.5281/zenodo.17981393) — the
foundational paper; tropical crystallisation and the thermodynamic bridge ·
[β in Disguise](https://doi.org/10.5281/zenodo.20752384)

---

## Why "Maslov dequantization"?

V. P. Maslov observed in the 1980s that tropical mathematics (the (max,+)
semiring) arises as the classical limit of quantum mechanics in precisely the
same way that classical mechanics arises from quantum mechanics as ħ → 0.

The Schrödinger equation at finite ħ becomes the Hamilton-Jacobi equation at
ħ → 0. The path integral Σ e^{iS/ħ} becomes the saddle-point e^{iS_cl/ħ} at
ħ → 0. The quantum partition function Tr[e^{-βH}] becomes the tropical
partition function max(-βE) at β → ∞.

In each case: a sum over all paths/states, weighted by a Boltzmann-like
factor, collapses to the single dominant contribution as the parameter goes to
its extreme value. The Maslov dequantization is the name for this limit, and
the **inverse** — going from the tropical/classical limit back to finite β —
is the **quantization** in the other direction.

**The HotLogiQ claim:** this dequantization/quantization pair is not specific
to quantum mechanics. It applies to:
- Every optimisation algorithm (gradient descent ↔ greedy argmax)
- Every probabilistic model (soft classifier ↔ hard decision boundary)
- Every physical system with a phase transition (paramagnetic ↔ ferromagnetic)
- Every neural network (learning ↔ inference)

β is the universal quantization parameter. The MGE is the universal
quantization map. The tropical semiring is what you get when you forget β
entirely.

---

## Where to go from here

This page describes the mathematical foundation. The applications branch
into three directions:

**For AI and machine learning:**
[AI & Machine Learning](/docs/theory/ai-ml) — softmax temperature = β;
transformers as ISA programmes; layerwise β profiling; differentiable Shapley
values; grokking as β* snap.

**For physics and non-Hermitian systems:**
[PT Symmetry & Exceptional Points](/docs/theory/pt-symmetry) — exceptional
points as β*₁₂ snaps; SNAP-count as the EP topological invariant; the
PT phase transition as the H¹↔H² tier boundary.

**For the full ISA picture:**
[The β-plane](/docs/theory/forge-meld) — how β extends into the complex plane
(β = it for quantum mechanics, β ∈ ℂ for PT-symmetric systems); the full ISA
family; the snap threshold in detail.

**Primary papers:**
- [The Maslov-Gibbs Einsum](https://doi.org/10.5281/zenodo.17981393) — start here for the mathematics
- [β in Disguise](https://doi.org/10.5281/zenodo.20752384) — start here if you want the intuition first
- [In Praise of Soft Thresholds](https://doi.org/10.5281/zenodo.21373468) — why every hard threshold is β→∞
- [The β-plane](https://doi.org/10.5281/zenodo.21245459) — the full complex β parameter space
