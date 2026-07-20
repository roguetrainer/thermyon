---
title: "The Non-Associative No-Cloning Theorem and the Fano-Token"
paper_number: "235"
doi: "10.5281/zenodo.20100531"
zenodo_url: "https://zenodo.org/records/20100531"
portfolio: "D"
portfolio_desc: "Protocols"
tags:
  - asa
  - portfolio-d
  - paper-235
layout: default
parent: Papers
nav_order: 235
has_code: false
status: published
upload_date: "2026-05-09"
---

**Paper:** 235 | **Portfolio D** — Protocols

**DOI:** [10.5281/zenodo.20100531](https://zenodo.org/records/20100531)

## Abstract

Wiesner's quantum money protocol (c. 1970, published 1983) predates the No-Cloning Theorem (Wootters–Zurek 1982). Its security was argued operationally; No-Cloning later supplied the proof-theoretic foundation. This paper asks whether the Exceptional Jordan Algebra $\mathfrak{J}_3(\mathbb{O})$ admits a non-associative No-Cloning theorem strictly stronger than the standard one, and what it implies for quantum money.

The standard No-Cloning proof uses only linearity and the bilinear tensor structure; it does not use associativity, so a direct translation recovers only the standard result in new notation. The genuinely non-associative obstruction is of a different character: it concerns not the impossibility of a cloning *map* but the impossibility of a cloning *target*.

## Key Results

- **Theorem 3.1 (NA No-Cloning — Target Obstruction)**: There is no Jordan algebra $J$ containing two commuting copies of $\mathfrak{J}_3(\mathbb{O})$ satisfying rank-1 projector combination conditions. The combined element $\iota_1(P) + \iota_2(P)$ has rank 2 in any direct sum, violating the projector condition. The cloning target is algebraically forbidden.

- **Theorem 3.2 (NA No-Cloning — Map Collapse)**: Any Jordan algebra homomorphism $\Phi\colon \mathfrak{J}_3(\mathbb{O}) \to A_{\mathrm{sa}}$ into the self-adjoint part of any associative algebra satisfies $\Phi(\mathcal{A}(x,y,z)) = 0$ for all $x,y,z$. Since non-Fano associators span the **16-dimensional Peirce-$\frac{1}{2}$ subspace** $\mathcal{J}_{1/2}(P)$, the map collapses 16 of the 27 dimensions. No injective such homomorphism exists.

- **Corollary 4.1 (Associative Measurement Defect)**: The defect between a correct U-operator measurement and an associative-sandwich measurement equals the associator $\mathcal{A}(P,M,P)$, with norm 2 for non-Fano-compatible $M$.

- **Section 5 (Thermal phase transitions)**: The Fano-Token has a frozen phase ($G_2$-stable, $\beta \geq \beta^*$) and a liquid phase ($SO(7)\setminus G_2$, token thaws). The $\beta$-threshold condition $\beta^* = \frac{3}{8}\ln(1/\varepsilon - 1)$ quantifies operational security.

## The Peirce-½ Subspace

The 16-dimensional Peirce-$\frac{1}{2}$ subspace $\mathcal{J}_{1/2}(P)$ is the **exceptional core** of $\mathfrak{J}_3(\mathbb{O})$: the part that no associative device can reach. Theorem 3.2 is the precise statement of this inaccessibility. The Fano-Token encodes its secret in $\mathcal{J}_{1/2}(P)$; the NA No-Cloning theorem guarantees it cannot be extracted by any matrix-algebra measurement apparatus.

## Three Security Layers

| Layer | Mechanism | Strength |
| --- | --- | --- |
| S1: Standard No-Cloning | Wootters–Zurek linearity argument | Map obstruction |
| S2: Target Obstruction (Thm 3.1) | Rank-2 obstruction in any direct sum | Target obstruction |
| S3: Active Defect (Cor 4.1) | Associator norm 2 on forgery attempt | Instantaneous alarm |

## Symmetry Chain

$$PSL(2,7) \;\subset\; G_2 \;\subset\; SO(7) \;\subset\; F_4 = \mathrm{Aut}(\mathfrak{J}_3(\mathbb{O}))$$

Frozen phase ($G_2$-stable): associator $= 0$. Liquid phase ($SO(7)\setminus G_2$): associator $= 2$. Security holds only in the frozen phase ($\beta \geq \beta^*$).

## Zenodo

[View on Zenodo](https://zenodo.org/records/20100531)

## Related Papers

- [Paper 257 — NA-QEC](../10.5281-zenodo.20088537/) (Peirce decomposition machinery; U-operator; Exceptional Jordan-KL Condition)
- [Paper 258 — Origami ISA](../10.5281-zenodo.19916430/) (Peirce register architecture; $\mathcal{J}_{1/2}$ as quantum working register)
- [Paper 221 — Fano-Fisher](../10.5281-zenodo.20076499/) (Information Ridge at $E_k = 8/3$; $\beta$-threshold energy level)
- [Paper 205 — RPU](../10.5281-zenodo.19743801/) (731-RPU hardware target for physical token implementation)
- [Paper 208 — Magmoidal Cipher](../10.5281-zenodo.19826358/) (related non-associative cryptographic protocol)
