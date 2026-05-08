---
layout: home
title: Home
nav_order: 1
---

<div style="text-align:center; margin-bottom: 1.5rem;">
  <img src="/adelic-simplicial-architecture/assets/images/asa-logo.png" alt="ASA logo" width="220">
</div>

# Adelic Simplicial Architecture

**Author:** Ian R. C. Buckley — [ORCID 0009-0004-9287-2902](https://orcid.org/0009-0004-9287-2902)

Non-associative computing across the R-C-H-O division algebra ladder. Working papers, experiment code, and numerical results.

[Browse all papers on Zenodo](https://zenodo.org/communities/asa-research/records){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/roguetrainer/adelic-simplicial-architecture){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## What is the ASA?

The Adelic Simplicial Architecture is a research programme organised around a single observation: the four normed division algebras

$$\mathbb{R} \subset \mathbb{C} \subset \mathbb{H} \subset \mathbb{O}$$

form a natural computational hierarchy. Each step drops one algebraic property — commutativity at $\mathbb{H}$, then associativity at $\mathbb{O}$ — and each dropped property unlocks a new computational regime. The word **adelic** refers to the simultaneous use of real ($\mathbb{R}$) and $p$-adic number fields to describe the same object: the real component flows continuously (like a gradient), while the $p$-adic component crystallises discretely (like a logic gate). The word **simplicial** refers to the Fano plane $\mathrm{PG}(2,2)$ — a 7-point, 7-line combinatorial simplex — whose incidence geometry governs the multiplication table of the octonions $\mathbb{O}$.

The central object is the **octonion associator**

$$\mathcal{A}(x, y, z) = (xy)z - x(yz),$$

which vanishes on the seven Fano lines and equals $\pm 2$ elsewhere. This binary distinction — Fano / non-Fano — is the geometric engine behind entanglement monogamy, Hardy's paradox, fault-tolerant quantum gates, hallucination-free RAG retrieval, and stale-gradient routing in distributed AI.

The two core operators that make the architecture run are:

- **The Maslov-Gibbs Einsum (MGE)** — a thermodynamic routing operator $\pi_k \propto \exp(-\beta E_k)$ that weights candidates by their geometric energy $E_k$. As the inverse temperature $\beta$ rises, the system undergoes a phase transition analogous to simulated annealing, but with *topological guarantees*: the Boltzmann weights are derived from the Fano-Fisher metric on $G_2$, so only Fano-compatible states survive the freeze-out. This replaces heuristic learning-rate schedules with a parameter-free auto-annealer grounded in non-associative information geometry.

- **Topological Resonance Synthesis (TRS)** — the full computational engine built on the MGE. TRS treats the parameter space of a neural network as a non-associative manifold, uses holomorphic relaxation (complex-analytic gradient flow) to explore the bulk, and extracts discrete logical outputs via the Fano geometry at the boundary. The "resonance" is the phase-locking between the continuous bulk dynamics and the discrete Fano vacuum: when a trajectory aligns with a Fano line, energy vanishes and the system crystallises. TRS is the information-geometric analogue of parallel transport on $G_2$ — it does not descend a loss surface; it flows to the nearest topologically consistent state.

See the [Glossary](glossary/) for definitions of all key terms.

---

## Paper Index

---

## Paper Index

| # | Title | Portfolio |
|---|-------|-----------|
| [000](papers/10.5281-zenodo.19977475/) | An Adelic Invitation | Intro |
| [199](papers/10.5281-zenodo.20060303/) | The Quaternionic Virtual Machine (Q-VM) | C |
| [200](papers/10.5281-zenodo.19869263/) | The Fano-Foam Manifold and the Excluded Volume Principle | B |
| [201](papers/10.5281-zenodo.17981393/) | The Maslov-Gibbs Einsum (MGE) | A |
| [202](papers/10.5281-zenodo.19858021/) | Topological Resonance Synthesis (TRS) | A |
| [205](papers/10.5281-zenodo.19743800/) | The Resonance Processing Unit (RPU) | C |
| [206](papers/10.5281-zenodo.19821692/) | Fibrational Tensor Codes (FTCs) | C |
| [207](papers/10.5281-zenodo.19713350/) | The 731-Calculus | B |
| [208](papers/10.5281-zenodo.19826357/) | Sequence-Dependent Cryptography (Magmoidal Cipher) | D |
| [210](papers/10.5281-zenodo.19929360/) | Geometric Interpretation of Code Switching | C |
| [211](papers/10.5281-zenodo.20025384/) | Non-Associative Calculus | A |
| [203](papers/10.5281-zenodo.20086746/) | The Affine Holomorphic Resonance Network (A-HRN) | C (AI) |
| [218](papers/10.5281-zenodo.20077198/) | Thermodynamic Routing of Stale Gradients via NAIG | C (AI) |
| [221](papers/10.5281-zenodo.20076498/) | Non-Associative Information Geometry: Fano-Fisher Decomposition Theorem | C (AI) |
| [213](papers/10.5281-zenodo.20059019/) | Volume of Thought (VoT) | C |
| [214](papers/10.5281-zenodo.20060285/) | Non-Associative Knowledge Hypergraphs (Fano-RAG) | C |
| [217](papers/10.5281-zenodo.19922441/) | Fibrational Lattice Surgery (LS2.0) | C |
| [240](papers/10.5281-zenodo.19824028/) | Structural Observations on J³(𝕆) | E |
| [245](papers/10.5281-zenodo.19960385/) | Nuclear Magic Numbers and Exceptional Lie Algebras | E |
| [246](papers/10.5281-zenodo.19964651/) | Electron Shell Structure and Exceptional Lie Algebras | E |
| [258](papers/10.5281-zenodo.19916429/) | The 731 Instruction Set Architecture (Origami ISA) | C |
| [263](papers/10.5281-zenodo.19928880/) | The Architecture of Inevitability (Magic Square) | B |
| [265](papers/10.5281-zenodo.20029647/) | The ζ(21) Apéry Generalization | E |
| [266](papers/10.5281-zenodo.20031913/) | Geometric Shadows in Apéry's Polynomial | E |
| [267](papers/10.5281-zenodo.20057808/) | The Fano-SYK Model | A |
| [268](papers/10.5281-zenodo.20058013/) | The Spacelike Associator Paradox | F |
| [269](papers/10.5281-zenodo.20058083/) | Hardy's Paradox and the Fano Associator | F |
| [270](papers/10.5281-zenodo.20058092/) | The Fano Monogamy Paradox | F |
