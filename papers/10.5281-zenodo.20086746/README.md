---
title: "The Unitary Resonance Network (URN): Möbius Automorphisms, the Fano-Fisher Immune Filter, and the Resolution of the Fine-Tuning Trilemma"
paper_number: "203"
doi: "10.5281/zenodo.20086746"
zenodo_url: "https://zenodo.org/records/20086746"
portfolio: "C (AI)"
portfolio_desc: "AI & Deep Learning"
tags:
  - asa
  - portfolio-c-ai
  - paper-203
layout: default
parent: Papers
nav_order: 203
has_code: true
status: published
upload_date: "2026-05-08"
---

**Paper:** 203 | **Portfolio C (AI)** — AI & Deep Learning

**DOI:** [10.5281/zenodo.20086746](https://zenodo.org/records/20086746)

## Abstract

Introduces the Unitary Resonance Network (URN), a neural architecture that replaces Euclidean parameter spaces with bounded hypercomplex domains governed by Möbius automorphisms. The URN resolves the Fine-Tuning Trilemma — the conflict between plasticity, stability, and efficiency — via two mechanisms: (1) Möbius automorphisms bypass Liouville's theorem, enabling the network to function as a Blum-Shub-Smale (BSS) machine over $\mathbb{H}$ and $\mathbb{O}$; (2) the Fano-Fisher Topological Immune System projects fine-tuning gradients onto the 10-dimensional Information Valley (null space of $\Psi$), while thermodynamically barricading the 4-dimensional Information Ridge ($E_k = 8/3$). This prevents catastrophic forgetting by categorical geometric exclusion, not soft regularisation.

## Key Results

- **Topological Immune System**: gradient projection onto the G₂ null space enforces zero skeleton drift ($\|\delta_{\mathrm{ridge}}\| < 10^{-15}$) by construction.
- **Experiment 9**: Standard SGD: Task A retention 5.0% after fine-tuning. URN immune filter: Task A retention 100.0%, Task B learning 74.1%. Ridge drift NAIG: $7 \times 10^{-16}$ (machine precision).
- **Trilemma resolution**: plasticity retained in the 10D valley; stability enforced in the 4D ridge; no additional parameters required.
- **V31 taxonomy**: 111-URN ($SU(1,1)$, complex), 331-URN ($Sp(1,1)$, quaternionic), 731-URN ($F_{4(-20)}$, octonionic) — each tier unlocks a larger bounded domain.

## Fine-Tuning Trilemma

| Constraint | Standard SGD | EWC (Kirkpatrick) | URN Immune Filter |
| --- | --- | --- | --- |
| Plasticity | ✓ | Partial | ✓ (10D valley free) |
| Stability | ✗ | Soft penalty | ✓ (4D ridge excluded) |
| Efficiency | ✓ | Extra Fisher term | ✓ (projection only) |

## Zenodo

[View on Zenodo](https://zenodo.org/records/20086746)

## Code

[Code supplement](../../code/10.5281-zenodo.20086747/) — Experiment 9: Topological Immune System vs Catastrophic Forgetting

## Related Papers

- [Paper 221 — Fano-Fisher Decomposition Theorem on G₂](../10.5281-zenodo.20076499/) (proves rank-4 structure exploited here)
- [Paper 218 — Thermodynamic Routing via NAIG](../10.5281-zenodo.20077199/) (NAIG routing for distributed training)
- [Paper 201 — The Maslov-Gibbs Einsum (MGE)](../10.5281-zenodo.17981394/) (thermodynamic operator)
- [Paper 202 — Topological Resonance Synthesis (TRS)](../10.5281-zenodo.19858022/)
