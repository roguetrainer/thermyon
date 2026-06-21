---
layout: home
title: Home
nav_order: 1
---

<div style="text-align:center; margin-bottom: 1.5rem;">
  <img src="/adelic-simplicial-architecture/assets/images/asa-logo.png" alt="ASA logo" width="220">
</div>

**Author:** Ian R. C. Buckley — [ORCID 0009-0004-9287-2902](https://orcid.org/0009-0004-9287-2902)

One instruction set. Twenty orders of magnitude. From nuclear spectroscopy to GPU matrix multiplication.

[Browse all papers on Zenodo](https://zenodo.org/communities/asa-research/records){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Paradigm Comparison](paradigm-comparison.html){: .btn .btn-outline .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/roguetrainer/adelic-simplicial-architecture){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## What is the ASA?

The **Adelic Simplicial Architecture** is a unified computational framework built around a five-opcode instruction set — the **Origami ISA** — whose operations correspond exactly to the primitives of Čech cohomology on a sheaf.

The computation works because Lie groups are the natural tape for a generalised Turing machine: the Chladni resonance patterns on the group manifold encode the computational state, and the topology of those nodal lines — their H⁰/H¹/H² structure — is the skeleton of the calculation. What the MGE (Maslov-Gibbs Einsum) does is make that skeleton differentiable: discrete combinatorial models — order statistics, Nash equilibria, circuit measurements, optimal transport plans — become smooth functions of a single temperature parameter β. This is what *Topological Resonance Synthesis* means.

The same five opcodes appear across twenty orders of magnitude in physical scale:

| System | H⁰ (bilateral) | H¹ (triangular) | Pentagon = |
|--------|----------------|-----------------|------------|
| Nuclear spectroscopy | Selection rules | Racah 6j symbol | Biedenharn–Elliott |
| FMO light harvesting | Site energies | Transfer efficiency η | Carnot bound |
| Quantum computing | Pauli syndromes | Magic valence | Pentagon identity |
| Three-body orbits | Kepler solutions | Choreographic solutions | KZ equations |
| Interest rates | Bilateral prices | Convexity (HJM) | No-arbitrage |
| Systemic risk | Bilateral stress | Triangular risk | H² = 0 stability |
| GPU matrix multiply | Tile results | H¹ error certificate | d² = 0 |

This is not analogy. It is the same theorem — the 6j symbol is H¹ of the relevant sheaf — instantiated for different sheaves over different interaction diagrams.

---

## The five opcodes

| Opcode | Move | Role | Instance |
|--------|------|------|----------|
| `SPLIT` | 1→4 Pachner | δ⁰ coboundary: local → triangular | Bilateral spread → CVA; qubit → 4 amplitudes |
| `SPLAT` | 4→1 Pachner | ∫_fibre: triangular → price | XVA; spectroscopic intensity; conditional expectation |
| `TWIST` | — | Gauge transformation | Numeraire change; phase gate; measure change |
| `FLIP` | 1→3 | Sheaf dualisation | Time reversal; asset → liability |
| `FLOP` | 3→1 | Trace / Born rule | Discounting; probability; expectation |

The **Pentagon identity** — SPLAT ∘ SPLIT = 0, i.e. d² = 0 — is simultaneously the HJM no-arbitrage condition, the Biedenharn–Elliott identity for angular momentum recoupling, the MIP\* verifier constraint, and the H² = 0 stability condition for financial cascades. One equation, four theorems.

---

## The four S-words

The **S** in ASA stands for four things at once:

- **Simplicial** — every computation is a Čech complex. Tiles, triangles, tetrahedra. H⁰/H¹/H² classify bilateral, triangular, and systemic structure.
- **Symplectic** — the Maslov–Gibbs Einsum is a symplectic integrator. Gibbs annealing is parallel transport on an e-geodesic. KAM theory = stabiliser theory.
- **Spider** — the opcodes are ZX-calculus spiders: SPLIT is Frobenius comultiplication, SPLAT is the counit. Spiders for nuclei, quarkonium, molecules, finance.
- **Spectral** — the 6j symbol is H¹ of the representation sheaf. Spectroscopic circuits are small (3–21 qubits). The sheaf Laplacian governs both nuclear line intensities and XVA pricing.

---

## The temperature dial

The same five opcodes run at three temperatures:

| Regime | ISA | β | Arithmetic | Complexity |
|--------|-----|---|------------|------------|
| Classical | Origami ISA | β → ∞ | Tropical (min, +) | H⁰ |
| Statistical | Forge ISA | 0 < β < ∞ | Real (Gibbs) | H¹ |
| Quantum | Meld ISA | β = it | Complex (amplitudes) | H² |

The bridge between them is the **⊕_β softmin** — the operation $a \oplus_\beta b = -\frac{1}{\beta}\ln(e^{-\beta a}+e^{-\beta b})$ — which interpolates continuously between standard addition (β → 0) and the tropical minimum (β → ∞). Lowering β is quantisation; raising β is the classical limit. Planck's constant, viscosity, volatility, softmax temperature, and the quantum group deformation parameter q = e^{iπβ} are all the same object seen from different fields ([Paper 443](https://doi.org/10.5281/zenodo.20752384)).

Gibbs annealing is parallel transport on the Fisher manifold. The snap event at β* = (3/8)ln(1/(1−ρ)) is the phase transition between exploratory and committed regimes. Shor's algorithm is a three-layer Origami/Meld/Origami programme. The T-gate is the Fano associator obstruction.

The non-associative frontier (G₂, octonions, the F₄ conjecture) remains active — but it is the boundary of the framework, not its centre.

---

## Paper Index

Papers are grouped by portfolio. The full index is in [README.md](README.md).

**Foundations (A–B)**

| # | Title | DOI |
|---|-------|-----|
| 000 | [An Adelic Invitation](papers/10.5281-zenodo.19977475/) | [19977475](https://zenodo.org/records/19977475) |
| 201 | [The Maslov-Gibbs Einsum (MGE)](papers/10.5281-zenodo.17981393/) | [17981393](https://zenodo.org/records/17981393) |
| 202 | [Topological Resonance Synthesis (TRS)](papers/10.5281-zenodo.19858021/) | [19858021](https://zenodo.org/records/19858021) |
| 258 | [The Origami ISA](papers/10.5281-zenodo.19916429/) | [19916429](https://zenodo.org/records/19916429) |
| 370 | [The Origami ISA as Nature's Universal Computer](papers/10.5281-zenodo.20543454/) | [20543454](https://zenodo.org/records/20543454) |
| 393 | [Projective Geometry as the Mother Tongue of QM](papers/10.5281-zenodo.20634729/) | [20634729](https://zenodo.org/records/20634729) |
| 419 | [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) | [20694527](https://zenodo.org/records/20694527) |
| 420 | [The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526) | [20773526](https://zenodo.org/records/20773526) |
| 443 | [Planck's Constant in Disguise](papers/10.5281-zenodo.20752384/) | [20752384](https://zenodo.org/records/20752384) |
| 454 | [The Meld ISA](https://doi.org/10.5281/zenodo.20773563) | [20773563](https://zenodo.org/records/20773563) |
| 455 | [Eight Derivations of a Universal Instruction Set](https://doi.org/10.5281/zenodo.20774076) | [20774076](https://zenodo.org/records/20774076) |

**Quantum Hardware & AI (C)**

| # | Title | DOI |
|---|-------|-----|
| 199 | [The Quaternionic Virtual Machine (Q-VM)](papers/10.5281-zenodo.20060303/) | [20060303](https://zenodo.org/records/20060303) |
| 205 | [The Resonance Processing Unit (RPU)](papers/10.5281-zenodo.19743800/) | [19743800](https://zenodo.org/records/19743800) |
| 213 | [Volume of Thought (VoT)](papers/10.5281-zenodo.20059019/) | [20059019](https://zenodo.org/records/20059019) |
| 303 | [Pacioli Combinator Library (PCL)](https://zenodo.org/records/20262070) | [20262070](https://zenodo.org/records/20262070) |
| 385 | [SQU TriQ and SevenQ: Standard Registers](papers/10.5281-zenodo.20581486/) | [20581486](https://zenodo.org/records/20581486) |

**Quantum Foundations (F)**

| # | Title | DOI |
|---|-------|-----|
| 268 | [The Spacelike Associator Paradox](papers/10.5281-zenodo.20058013/) | [20058013](https://zenodo.org/records/20058013) |
| 361 | [Fano Orbit Decomposition of Magic](papers/10.5281-zenodo.20541583/) | [20541583](https://zenodo.org/records/20541583) |
| 366 | [A Valence Theory of Quantum Magic](https://zenodo.org/records/20541665) | [20541665](https://zenodo.org/records/20541665) |
| 393 | [Projective Geometry as Mother Tongue of QM](papers/10.5281-zenodo.20634729/) | [20634729](https://zenodo.org/records/20634729) |

**Spectroscopy & Physics (B\|E)**

| # | Title | DOI |
|---|-------|-----|
| 324 | [The Decoding Engine (Ribosome A-site)](https://zenodo.org/records/20400652) | [20400652](https://zenodo.org/records/20400652) |
| 325 | [The Topological Heat Engine (FMO)](https://zenodo.org/records/20400638) | [20400638](https://zenodo.org/records/20400638) |
| 347 | [Spiders for Spectroscopy](https://zenodo.org/records/20490046) | [20490046](https://zenodo.org/records/20490046) |
| 370 | [The Origami ISA: 20 Orders of Magnitude](papers/10.5281-zenodo.20543454/) | [20543454](https://zenodo.org/records/20543454) |
| 374 | [Spectroscopic Circuits Are Small](https://zenodo.org/records/20584560) | [20584560](https://zenodo.org/records/20584560) |

**Finance & Economics (G)**

| # | Title | DOI |
|---|-------|-----|
| 291 | [Pacioli Homology](https://zenodo.org/records/20234853) | [20234853](https://zenodo.org/records/20234853) |
| 299 | [XVA as Gauge Curvature](https://zenodo.org/records/20257724) | [20257724](https://zenodo.org/records/20257724) |
| 396 | [The Unhedgeability Theorem](papers/10.5281-zenodo.20635479/) | [20635479](https://zenodo.org/records/20635479) |
| 397 | [Systemic Risk as H²](papers/10.5281-zenodo.20642908/) | [20642908](https://zenodo.org/records/20642908) |
| 398 | [The Topology of Risk: A Primer](papers/10.5281-zenodo.20642983/) | [20642983](https://zenodo.org/records/20642983) |
| 399 | [The Origami ISA as Financial Middleware](papers/10.5281-zenodo.20645695/) | [20645695](https://zenodo.org/records/20645695) |

**Grand Challenges (E)**

| # | Title | DOI |
|---|-------|-----|
| 240 | [Structural Observations on J³(𝕆)](papers/10.5281-zenodo.19824028/) | [19824028](https://zenodo.org/records/19824028) |
| 245 | [Nuclear Magic Numbers and Exceptional Lie Algebras](papers/10.5281-zenodo.19960385/) | [19960385](https://zenodo.org/records/19960385) |
| 265 | [The ζ(21) Apéry Generalisation](papers/10.5281-zenodo.20029647/) | [20029647](https://zenodo.org/records/20029647) |
