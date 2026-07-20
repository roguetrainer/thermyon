---
title: "Non-Associative Quantum Error Correction (NA-QEC): The Exceptional Jordan-KL Condition and Rank-1 Idempotents in G₂ Topologies"
paper_number: "257"
doi: "10.5281/zenodo.20088536"
zenodo_url: "https://zenodo.org/records/20088536"
portfolio: "C"
portfolio_desc: "Quantum Hardware"
tags:
  - asa
  - portfolio-c
  - paper-257
layout: default
parent: Papers
nav_order: 257
has_code: false
status: published
upload_date: "2026-05-08"
---

**Paper:** 257 | **Portfolio C** — Quantum Hardware

**DOI:** [10.5281/zenodo.20088536](https://zenodo.org/records/20088536)

## Abstract

Standard quantum error correction is formulated over matrix algebras, where the Knill-Laflamme (KL) conditions reduce to orthogonality of error syndromes. We lift the code space from stabiliser codes over $\mathbb{F}_2$ to the exceptional Jordan algebra $J_3(\mathbb{O})$ — the unique 27-dimensional formally real Jordan algebra that is not a matrix algebra — and ask whether the KL conditions can be satisfied by algebraic structure alone, independent of code distance.

The central result is **Theorem 3.2 (Exceptional Jordan–KL Condition)**: for the Furey projector $P = \mathrm{diag}(1,0,0) \in J_3(\mathbb{O})$ and any error operators $\{E_a\}$ supported on the Peirce-1$(P)$ subspace, the Jordan triple product satisfies $\{P, E_a^\dagger \circ E_b, P\} = c_{ab} \cdot P$, where $c_{ab} \in \mathbb{R}$ is a scalar. This collapses the KL conditions to a scalar constraint, giving exact error correction by algebraic structure. We also propose **Conjecture 4.1 (Eastin-Knill Evasion)**: because $J_3(\mathbb{O})$ is not a matrix algebra, the Eastin-Knill no-go theorem may not apply, potentially permitting transversal universal gates.

## Key Results

- **Theorem 3.2 (Exceptional Jordan–KL Condition)**: $\{P, E_a^\dagger \circ E_b, P\} = c_{ab} \cdot P$ for errors supported on Peirce-1$(P)$. Proved via: (1) Hermitian reality of the Jordan triple product; (2) U-operator $U_P(X) = 2P \circ (P \circ X) - P^2 \circ X$ acts as a Peirce-1 projector; (3) $U_P$ has 1-dimensional range on Peirce-1; (4) scalar value $c_{ab} = \langle P, E_a^\dagger \circ E_b \rangle$.
- **Conjecture 4.1 (Eastin-Knill Evasion)**: Transversal universal gates may exist in $J_3(\mathbb{O})$ because the non-matrix-algebra structure invalidates the standard proof.

## Relation to Portfolio

| | Stabiliser QEC | FTC (Paper 206) | NA-QEC (this paper) |
| --- | --- | --- | --- |
| Code space | $\mathbb{F}_2^n$ | $G_2$ fibre bundle | $J_3(\mathbb{O})$ |
| KL mechanism | Syndrome orthogonality | Holonomy distance | Jordan triple product |
| Eastin-Knill | Blocked | Partially evaded | Conjectured evaded |

## Zenodo

[View on Zenodo](https://zenodo.org/records/20088536)

## Related Papers

- [Paper 206 — Fibrational Tensor Codes (FTCs)](../10.5281-zenodo.19821693/) (G₂ fibre bundle QEC; related code architecture)
- [Paper 205 — The Resonance Processing Unit (RPU)](../10.5281-zenodo.19743801/) (hardware target for NA-QEC)
- [Paper 217 — Fibrational Lattice Surgery LS2.0](../10.5281-zenodo.19922442/) (fault-tolerant logical gates on fibre bundle codes)
- [Paper 211 — Non-Associative Calculus](../10.5281-zenodo.20025385/) (octonionic foundation for $J_3(\mathbb{O})$)
