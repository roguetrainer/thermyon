---
title: "The 731 Instruction Set Architecture (Origami ISA): Machine Code, Pachner Opcodes, Geometric Constraint Satisfaction, and Simplicial Paging"
paper_number: "258"
doi: "10.5281/zenodo.19916429"
zenodo_url: "https://zenodo.org/records/19916429"
portfolio: "C"
portfolio_desc: "Quantum Hardware"
tags:
  - asa
  - portfolio-c
  - paper-258
layout: default
parent: Papers
nav_order: 258
has_code: false
status: published
---

# The 731 Instruction Set Architecture (Origami ISA): Machine Code, Pachner Opcodes, Geometric Constraint Satisfaction, and Simplicial Paging

**Paper:** 258 | **Portfolio C** — Quantum Hardware

**DOI:** [10.5281/zenodo.19916429](https://zenodo.org/records/19916429)

## Abstract

Specifies the Origami ISA: a machine-code level instruction set for the 731-RPU (Resonance Processing Unit) using Pachner moves as opcodes and simplicial paging for memory management.

**v2.0** adds the Peirce Register Architecture: the full 27-dimensional state space $\mathfrak{J}_3(\mathbb{O}) = \mathcal{J}_1(P) \oplus \mathcal{J}_{1/2}(P) \oplus \mathcal{J}_0(P)$ is identified as three distinct registers — the 16-dimensional Peirce-½ exceptional core as the quantum working register, the 1-dimensional $\mathcal{J}_1$ as the output register, and the 10-dimensional $\mathcal{J}_0$ as the classical ancilla. Algebraic noise protection (from Paper 235 Theorem 3.2) is distinguished from thermodynamic error suppression.

## Key Results

- **4 base opcodes**: ■ Split ($1\to 4$ Pachner), ◇ Splat ($4\to 1$), ▲ Flip ($2\to 3$), ▷ Flop ($3\to 2$)
- **Peirce register architecture** (v2.0): $\mathcal{J}_{1/2}(P)$ as quantum working register; Fano-Slots ($e_1\ldots e_7$) are its generators
- **Simplicial Paging**: saturated Fano-crystals compressed to 0-skeleton pointers; constant VRAM overhead
- **Error suppression**: Associator Penalty thermodynamically disfavours non-$PSL(2,7)$ states; reinforced by algebraic protection of $\mathcal{J}_{1/2}(P)$

## Opcode Symbol Table

The ISA uses a Unicode visual alphabet. Each symbol encodes its semantics: **filled shapes (■ ▲) are creation operators ($\alpha^\dagger$, add geometric mass); hollow shapes (◇ ▷) are annihilation operators ($\alpha$, erase geometric mass)**. The outer shape encodes the Pachner type: **4-sided (diamond/square) = 1↔4 stellar move, 3-sided (triangle) = 2↔3 bistellar flip**.

| Symbol | Unicode | Verb | Move | Academic home |
| :----: | :------ | :--- | :--- | :------------ |
| ■ | U+25A0 | **Split** | $1 \to 4$ | mesh refinement, subdivision surfaces |
| ◇ | U+25C7 | **Splat** | $4 \to 1$ | 3D Gaussian splatting, volume rendering |
| ▲ | U+25B2 | **Flip** | $2 \to 3$ | PL topology, Delaunay, Mori MMP |
| ▷ | U+25B7 | **Flop** | $3 \to 2$ | Mori minimal model programme |
| ↻ | U+21BB | **Twist** | BOIL/SNAP | thermodynamic scheduling |

**Mnemonic:** filled shapes (■ ▲) have a flat horizontal base — they sit and build. Hollow shapes (◇ ▷) have a rightward point — they lean and release. Split/Splat rhyme (stellar pair); Flip/Flop rhyme (bistellar pair).

The self-duality of $G_2$ is encoded directly in the symbols: the coroot isomorphism $\sigma$ acts as "hollow out and tip rightward", sending ■ $\mapsto$ ◇ and ▲ $\mapsto$ ▷. The Pachner unitarity identities are:

$$◇ \circ ■ = \mathrm{id}, \qquad ▷ \circ ▲ = \mathrm{id}$$

See [Paper 271](../10.5281-zenodo.20101635/) for the full algebraic development.

## Zenodo

[View on Zenodo](https://zenodo.org/records/19916429)

## Related Papers

- [Paper 207 — 731-Calculus](../10.5281-zenodo.19713351/) (magmoidal string diagrams; diagrammatic calculus for the ISA)
- [Paper 205 — RPU](../10.5281-zenodo.19743801/) (hardware target; 1531-Anvil triorthogonal codes)
- [Paper 206 — FTCs](../10.5281-zenodo.19821693/) (error correction codes running on the 731-RPU)
- [Paper 235 — Fano-Token](../10.5281-zenodo.20100532/) (Map Collapse theorem grounding the $\mathcal{J}_{1/2}$ noise protection)
- [Paper 257 — NA-QEC](../10.5281-zenodo.20088537/) (Peirce decomposition machinery; U-operator)

