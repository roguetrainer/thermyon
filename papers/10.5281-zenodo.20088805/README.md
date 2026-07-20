---
title: "Fano Resonance Networks (Fano-RNs): The Associator Correction Tensor, Malcev Gradients, and a Convergence Theorem for Non-Associative Backpropagation"
paper_number: "212"
doi: "10.5281/zenodo.20088805"
zenodo_url: "https://zenodo.org/records/20088805"
portfolio: "C (AI)"
portfolio_desc: "AI & Deep Learning"
tags:
  - asa
  - portfolio-c-ai
  - paper-212
layout: default
parent: Papers
nav_order: 212
has_code: false
status: published
upload_date: "2026-05-08"
---

**Paper:** 212 | **Portfolio C (AI)** — AI & Deep Learning

**DOI:** [10.5281/zenodo.20088805](https://zenodo.org/records/20088805)

## Abstract

Standard backpropagation rests on the associativity of the chain rule: composing two layers requires $(\delta \cdot W)\cdot x = \delta \cdot (W \cdot x)$, which fails over the non-associative Octonions $\mathbb{O}$. We derive the exact correction to the chain rule for octonionic linear layers and prove a convergence theorem for the resulting Associator-Corrected gradient descent.

Three contributions: **(1) The Associator Correction Tensor.** For a two-layer network with weights $W_1, W_2 \in \mathbb{O}$, the true gradient of the loss w.r.t. $W_1$ differs from standard backpropagation by $T(\delta_2, W_2, x) = (R_x \circ L_{W_2} - L_{W_2} \circ R_x)^*(\delta_2)$ — the linear map measuring the chiral shear induced by non-associative composition. **(2) Convergence in the sub-Fano regime.** Under an $L$-smooth loss and Associator Penalty $\kappa < 1$, Associator-Corrected gradient descent converges to a stationary point at rate $O(1/\sqrt{T})$ (Theorem 4.2). **(3) The Fano-coupled conjecture.** For fully $G_2$-coupled activations where $\kappa \to 2$ (the Fano bound), convergence of standard gradient descent fails; an MGE-weighted corrected update is conjectured to converge with a $\kappa$-dependent rate.

## Key Results

- **Single-layer exactness** (Proposition 2.2): $\nabla_W \mathcal{L} = \delta \cdot \bar{x}$ is exact over $\mathbb{O}$ — the Moufang alternative identity absorbs the associator. The chain-rule breakdown is a multi-layer effect, first appearing at depth 2.
- **Associator Correction Tensor** (Theorem 3.1): the exact additive correction is $T = (R_x \circ L_{W_2} - L_{W_2} \circ R_x)^*(\delta_2)$, bounded by $\|T\| \leq 2\|\delta_2\|\|W_2\|\|x\|$.
- **$T = 0$ criterion** (Remark 3.3): $T$ vanishes whenever $\{W_2, \delta_2, x\}$ lie in a common quaternionic subalgebra — the Fano-RN reduces to a standard OVNN for non-$G_2$-coupled activations.
- **Convergence theorem** (Theorem 4.2): $\min_{0 \leq t \leq T-1} \|\hat{g}^{(t)}\|^2 \leq \frac{2L(\mathcal{L}^{(0)} - \mathcal{L}^*)}{(1-\kappa^2)T}$

## Distinction from OVNNs and URN

| Feature | OVNN / Hypercomplex | URN (Paper 203) | Fano-RN (this paper) |
| --- | --- | --- | --- |
| Algebra role | Parametrisation | Immune filter | Activation geometry |
| Associator | Zero (real rep) | Non-zero, projected out | Non-zero, corrected |
| Problem addressed | Data compression | Continual learning | Initial training |
| Chain rule | Standard | Standard | Associator-Corrected |

## Zenodo

[View on Zenodo](https://zenodo.org/records/20088805)

## Related Papers

- [Paper 203 — The Unitary Resonance Network (URN)](../10.5281-zenodo.20086747/) (fine-tuning complement to Fano-RNs)
- [Paper 211 — Non-Associative Calculus](../10.5281-zenodo.20025385/) (provides the Fano bound $\kappa \leq 2$)
- [Paper 221 — Fano-Fisher Decomposition Theorem](../10.5281-zenodo.20076499/) (geometry of the $G_2$ activation space)
- [Paper 201 — The Maslov-Gibbs Einsum (MGE)](../10.5281-zenodo.17981394/) (MGE-weighted update for the Fano-coupled conjecture)
