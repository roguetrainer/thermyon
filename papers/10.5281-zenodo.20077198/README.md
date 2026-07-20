---
title: "Thermodynamic Routing of Stale Gradients via Non-Associative Information Geometry: Bypassing the Ring All-Reduce Bottleneck via the G₂ Fano-Fisher Metric"
paper_number: "218"
doi: "10.5281/zenodo.20077198"
zenodo_url: "https://zenodo.org/records/20077198"
portfolio: "C (AI)"
portfolio_desc: "AI & Deep Learning"
tags:
  - asa
  - portfolio-c-ai
  - paper-218
layout: default
parent: Papers
nav_order: 218
has_code: false
status: published
---

# Thermodynamic Routing of Stale Gradients via Non-Associative Information Geometry

**Paper:** 218 | **Portfolio C (AI)** — AI & Deep Learning

**DOI:** [10.5281/zenodo.20077198](https://zenodo.org/records/20077198)

## Abstract

Introduces Non-Associative Information Geometry (NAIG) Routing for distributed LLM training. By mapping gradient drift into the 14-dimensional Lie algebra $\mathfrak{g}_2$, NAIG evaluates staleness not by Euclidean magnitude but by topological contradiction against a ground-truth reference, via the rank-4 Fano-Fisher metric. The MGE thermodynamically freezes out Fano-incompatible gradients while executing Topological Rescue on geometrically coherent stale updates. NAIG operates as a pure topological control layer over standard Euclidean SGD, requiring no modification to the optimizer or hardware. Demonstrated on GPT-2 (124M) with a 35,000× dimensional compression of the routing signal.

## Key Results

- **Experiment A (Gram-Schmidt Audit):** NAIG detects topology invisible to cosine similarity — workers with identical cosine distance are correctly separated by Fano compatibility.
- **Experiment B (GPT-2 cluster):** NAIG achieves −31% final loss vs. Hogwild! with an effective routing dimensionality of 4 (not 5M).
- **Auto-annealing:** No schedule required — G₂ geometry spontaneously freezes contradictions during exploration and thaws at convergence.

## Zenodo

[View on Zenodo](https://zenodo.org/records/20077198)

## Related Papers

- [Paper 221 — Non-Associative Information Geometry: Fano-Fisher Decomposition Theorem](../10.5281-zenodo.20076499/) (proves the rank-4 result used here)
- [Paper 201 — The Maslov-Gibbs Einsum (MGE)](../10.5281-zenodo.17981394/) (the thermodynamic routing operator)
- [Paper 202 — Topological Resonance Synthesis (TRS)](../10.5281-zenodo.19858022/)
