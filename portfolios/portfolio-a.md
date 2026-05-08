---
layout: default
title: "Portfolio A — Core Engine"
parent: Portfolios
nav_order: 1
---

# Portfolio A — Core Engine

**Primary audience:** AI engineers, ML researchers, optimisation theorists

---

## ASA for AI Engineers & ML Researchers

If you work on optimisation, distributed training, or the theory of why gradient descent works at all, this portfolio is your entry point.

The central question Portfolio A answers is: *why does gradient descent find good solutions, and can we replace the heuristic intuition behind it with a geometric law?* The ASA's answer is that the parameter space of a neural network is not a featureless Euclidean plain — it is a non-associative manifold whose local curvature is governed by the Fano geometry of the octonions. When a gradient update is topologically coherent with the local $G_2$ vacuum, it flows freely; when it contradicts the Fano structure, it is thermodynamically suppressed. This is not a heuristic: it follows from the rank-4 Fano-Fisher Decomposition Theorem (Paper 221, Portfolio C-AI).

**The Maslov-Gibbs Einsum (MGE)** is the core computational primitive. It is a thermodynamic generalisation of softmax:

$$\pi_k = \frac{\exp(-\beta\, E_k)}{\sum_j \exp(-\beta\, E_j)}$$

where the energies $E_k$ are derived from the Fano-Fisher metric on $G_2$, not from Euclidean distances. At low $\beta$ it is uniform averaging; at high $\beta$ it collapses to the tropical (max,+) semiring — winner-take-all crystallisation. The BOIL→SNAP phase transition between these regimes is the ASA's analogue of simulated annealing, but driven entirely by geometry. No schedule is required: the $G_2$ curvature self-organises the transition.

**Topological Resonance Synthesis (TRS)** is the full engine built on the MGE. It combines holomorphic relaxation in the bulk (complex-analytic gradient flow that preserves Cauchy-Riemann structure) with Fano-Fisher weighting at the boundary and adelic crystallisation (real flow → $p$-adic lock-in). TRS does not descend a loss surface in the Euclidean sense: it flows along the non-associative manifold toward the nearest topologically consistent state — the information-geometric analogue of parallel transport on $G_2$.

**Non-Associative Calculus** (Paper 211) provides the rigorous mathematical foundation: the first complete calculus for octonion-valued functions, with Cauchy-Fueter regularity replacing holomorphicity, and the $G_2$ monopole field as the fundamental solution.

**The Fano-SYK Model** (Paper 267) connects the computational framework to quantum gravity via the Sachdev-Ye-Kitaev model: the same non-associative coupling structure that governs gradient routing also appears in the holographic scrambling of information in black holes.

---

## Papers

| # | Paper |
|---|-------|
| [201](../papers/10.5281-zenodo.17981393/) | The Maslov-Gibbs Einsum (MGE): Tropical Crystallization and the Thermodynamic Bridge Between Continuous Optimization and Discrete Logic |
| [202](../papers/10.5281-zenodo.19858021/) | Topological Resonance Synthesis (TRS): Information Geometry, Holomorphic Relaxation, and the Thermodynamic Engine of the Topological Processor |
| [211](../papers/10.5281-zenodo.20025384/) | Non-Associative Calculus: Octonionic Path Integrals, Cauchy-Fueter Regularity, and the Fundamental $G_2$ Monopole Field |
| [267](../papers/10.5281-zenodo.20057808/) | The Fano-SYK Model: Bruhat-Tits Buildings, Non-Associative Fermionic Couplings, and the Geometric Impedance of Pre-Thermal Scrambling |

---

## Key Glossary Terms

[MGE](../glossary/#maslov-gibbs-einsum-mge) · [TRS](../glossary/#topological-resonance-synthesis-trs) · [Auto-Annealing](../glossary/#auto-annealing) · [Tropical Limit](../glossary/#tropical-limit--crystallisation) · [Adelic](../glossary/#adelic) · [Fano-Fisher Metric](../glossary/#fano-fisher-metric)
