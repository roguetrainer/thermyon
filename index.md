---
layout: home
title: Home
nav_order: 1
---

{% include isa-nav.html %}

<div style="text-align:center; margin-bottom: 1.5rem;">
  <img src="/assets/images/asa-logo.png" alt="Thermyon logo" width="220">
</div>

**Author:** Ian R. C. Buckley — [ORCID 0009-0004-9287-2902](https://orcid.org/0009-0004-9287-2902)

One instruction set. Twenty orders of magnitude. From nuclear spectroscopy to quantum chemistry to systemic financial risk.

[Browse all papers on Zenodo](https://zenodo.org/communities/thermyon/records){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[ISA reference →](opcodes.md){: .btn .btn-outline .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/roguetrainer/thermyon){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## What is Thermyon?

**Thermyon** is a unified computational framework built around a five-opcode instruction set — the **Origami ISA** — whose operations correspond exactly to the primitives of Čech cohomology on a sheaf.

The computation works because Lie groups are the natural tape for a generalised Turing machine: the Chladni resonance patterns on the group manifold encode the computational state, and the topology of those nodal lines — their H⁰/H¹/H² structure — is the skeleton of the calculation. The **Maslov–Gibbs Einsum (MGE)** makes that skeleton differentiable: discrete combinatorial models become smooth functions of a single temperature parameter β.

---

## The five opcodes

| Opcode | Symbol | Role | H^k tier |
|--------|--------|------|-----------|
| `LABEL` 🏷️ | ⊢ | Assign a symmetry sector / orbit label | H⁰ |
| `ORBIT` 🔄 | 𝒪 | Enumerate orbits under a group action | H⁰ |
| `FLIP` 👁️ | ⌁ | Sheaf dualisation / time-reversal | H⁰ |
| `TWIST` 🌀 | ∮ | Gauge transformation / phase accumulation | H¹ |
| `BIND` 💎 | ⋈ | Entanglement / correlation / Pachner surgery | H² |

The **Pentagon identity** (`d² = 0`) is simultaneously: the HJM no-arbitrage condition · the Biedenharn–Elliott identity for angular momentum recoupling · the MIP\* verifier constraint · the H² = 0 stability condition for financial cascades. One equation, four theorems.

[Full opcode reference →](opcodes.md)

---

## The β-deformation

The same five opcodes execute at every value of the inverse temperature β, producing specialised ISAs for each regime:

| ISA | β regime | Arithmetic | Character |
|-----|----------|------------|-----------|
| Tropical limit | β → ∞ | (max,+) | Classical logic, argmax, discrete optimisation |
| **Forge** | 0 < β < ∞ (real) | Gibbs / ℝ | Statistical mechanics, soft thresholds, annealing |
| **Meld** | β = it/ℏ | Unitary / ℂ | Quantum mechanics, interference, Feynman path integral |
| Raven | β ≈ β\* | Near-critical | Biological computation, kinetic proofreading, H² QEC |
| Hum | β = it/ℏ (QFT) | (ℂ, EMIT) | Quantum field theory, amplituhedron |
| **Origami** | all β | Fibred family | Five-opcode open standard; umbrella for all regimes |

Lowering β is quantisation; raising β is the classical limit. Planck's constant, viscosity, volatility, softmax temperature, and the quantum-group deformation parameter q = e^{iπβ} are all the same object seen from different fields.

[β-plane geometry and named ISAs →](forge-meld.md)

---

## Universality table

The same five opcodes appear across twenty orders of magnitude in scale:

| System | H⁰ | H¹ | Pentagon = H² |
|--------|----|----|---------------|
| Nuclear spectroscopy | Selection rules | Racah 6j symbol | Biedenharn–Elliott |
| FMO light harvesting | Site energies | Transfer efficiency η = 0.1828 | Carnot bound |
| Quantum computing | Pauli syndromes | Magic valence | MIP\* = RE |
| Three-body orbits | Kepler solutions | Choreographic solutions | KZ equations |
| Interest rates | Bilateral prices | Convexity (HJM drift) | HJM no-arbitrage |
| Systemic risk | Bilateral stress | Triangular contagion | H² = 0 stability |
| Molecular chemistry | Ground-state NOON | Correlation (Weyl c₂) | G-step reaction |

This is not analogy. It is the same theorem — the 6j symbol is H¹ of the relevant representation sheaf — instantiated for different sheaves over different interaction diagrams.

---

## Portfolio map

| Portfolio | Theme | Representative papers |
|-----------|-------|-----------------------|
| **A** — Core Engine | MGE, Origami framework, β-deformation | 201, 202, 443, 454, 543, 631 |
| **B** — Foundations | Algebra, simplicial topology, category theory | 200, 207, 258, 263, 393, 595 |
| **C** — Hardware & AI | OPU, RPU, trapped-ion, quantum registers | 199, 205, 598, 604, 606 |
| **D** — Protocols | QEC, shadow tomography, kinetic proofreading | 488, 490, 510, 515, 555, 607 |
| **E** — Grand Challenges | Riemann, number theory, molecular design | 240, 265, 487, 553, 554 |
| **F** — Quantum Foundations | Magic, contextuality, Weyl, homology | 361, 366, 469, 595, 596, 602 |
| **G** — Finance & Economics | Risk cohomology, XVA, ergodicity | 291, 299, 397, 478, 542, 549 |

[Full paper index →](papers.md)

---

## Start here

- **New to the framework?** → [An Adelic Invitation](papers/10.5281-zenodo.19977475/) (Paper 000) or the [Origami ISA manifesto](papers/10.5281-zenodo.21428853/EXPLAINER.md) (Paper 631)
- **Quantum computing?** → [Schubert halt theorem](papers/10.5281-zenodo.21373481/EXPLAINER.md) (Paper 606) or [Trapped-ion OPU](papers/604_trapped_ion_opu/) (Paper 604)
- **Chemistry?** → [G-walk CO₂ fixation](papers/10.5281-zenodo.21373477/EXPLAINER.md) (Paper 603) or [Valence as orbit occupancy](papers/487_valence_orbit_occupancy/) (Paper 487)
- **Finance?** → [Systemic risk as H²](papers/10.5281-zenodo.20642908/) (Paper 397) or [H^k pricing](papers/478_hk_pricing/) (Paper 478)
- **Biology?** → [Kinetic proofreading as QEC](papers/510_kinetic_proofreading_qec/) (Paper 510) or [Protein folding ISA](papers/515_protein_folding_isa/) (Paper 515)

---

{% include isa-nav.html %}
