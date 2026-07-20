---
title: "Non-Associative Information Geometry: The Fano-Fisher Metric Decomposition Theorem on G₂"
paper_number: "221"
doi: "10.5281/zenodo.20076498"
zenodo_url: "https://zenodo.org/records/20076498"
portfolio: "C (AI)"
portfolio_desc: "AI & Deep Learning"
tags:
  - asa
  - portfolio-c-ai
  - paper-221
layout: default
parent: Papers
nav_order: 221
has_code: true
status: published
---

# Non-Associative Information Geometry: The Fano-Fisher Metric Decomposition Theorem on $G_2$

**Paper:** 221 | **Portfolio C (AI)** — AI & Deep Learning

**DOI:** [10.5281/zenodo.20076498](https://zenodo.org/records/20076498)

## Abstract

Develops the Fisher information geometry of the exceptional Lie group $G_2 = \mathrm{Aut}(\mathbb{O})$ from first principles. The central result is the Fano-Fisher Decomposition Theorem: the Hessian $\Psi(\theta_\mathrm{ref}) = 2V^\top V$ of the associator energy functional has rank exactly 4, with all four non-zero eigenvalues universally pinned at $8/3$ (derived from the $G_2$ Casimir), and global average $(32/49) \cdot I_{14}$ (derived from the Fano incidence count). The active 4-dimensional friction subspace rotates between configurations (the crystalline turnstile) while the eigenvalue remains constant — pure rotational anisotropy with no scale variation. All four claims proved to machine precision ($\lvert\varepsilon\rvert < 2 \times 10^{-16}$) via exact analytical Jacobian $\Psi = 2V^\top V$.

## Theorem (Fano-Fisher Decomposition)

The Hessian $\Psi(\theta_\mathrm{ref})$ satisfies:
1. $\mathrm{rank}(\Psi) = 4$ universally
2. All four nonzero eigenvalues equal $8/3$ exactly
3. Global average: $\frac{1}{49}\sum_{\theta, e_A} \Psi = \frac{32}{49} I_{14}$
4. The active 4D friction subspace rotates (crystalline turnstile)

## Zenodo

[View on Zenodo](https://zenodo.org/records/20076498)

## Code

[Code supplement](../../code/10.5281-zenodo.20076499/) — empirical proof via exact analytical Jacobian; verifies all four claims to machine precision.

## Related Papers

- [Paper 218 — Thermodynamic Routing via NAIG](../10.5281-zenodo.20077199/) (applies this theorem to distributed training)
- [Paper 201 — The Maslov-Gibbs Einsum (MGE)](../10.5281-zenodo.17981394/)
- [Paper 211 — Non-Associative Calculus](../10.5281-zenodo.20025385/)
