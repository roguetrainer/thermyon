---
layout: default
title: Pillars
nav_order: 2
description: "The five load-bearing ideas of the Thermyon / Origami ISA framework."
---

{% include isa-nav.html %}

# The Five Pillars
{: .no_toc }

*Everything else in the framework is an application of these five ideas.*
{: .fs-5 .fw-300 }

---

## 1. β is a coordinate

Classical logic, statistical mechanics, and quantum mechanics are not three separate theories. They are the same theory evaluated at different values of a single parameter β — the inverse temperature.

| β | Arithmetic | Physics |
|---|------------|---------|
| β → ∞ | (max,+) tropical | Classical logic, discrete optimisation |
| 0 < β < ∞ | Gibbs / ℝ | Statistical mechanics, annealing |
| β = it/ℏ | Unitary / ℂ | Quantum interference, Feynman path integral |
| β = complex | Fibred | Full β-plane; p-adic places at each prime |

The **Maslov–Gibbs Einsum (MGE)** is the operation that makes β a differentiable coordinate: discrete combinatorial models become smooth functions of β, and the snap at β\* is a genuine phase transition — not a metaphor. Planck's constant, viscosity, volatility, softmax temperature, and the quantum-group deformation parameter q = e^{iπβ} are all the same object seen from different fields.

*Key papers: 201 (MGE), 443 (Planck in disguise), 454 (Meld / β=it), 543 (β-plane), 597 (soft thresholds)*

---

## 2. The H^k stratification

Every computation has a cohomological address. The three tiers are not a taxonomy — they are a theorem: the Pentagon identity d² = 0 forces exactly this structure.

| Tier | Cohomology | Opcodes | Character |
|------|------------|---------|-----------|
| H⁰ | Classical / bilateral | LABEL, ORBIT, FLIP | Symmetry sectors, discrete orbits |
| H¹ | Gauge / triangular | + TWIST | Phase accumulation, convexity, stabiliser QC |
| H² | Systemic / entangled | + BIND | Entanglement, correlation, fault-tolerant QC |

The **Pentagon identity** (d² = 0) is simultaneously: the HJM no-arbitrage condition · the Biedenharn–Elliott identity · the MIP\* verifier constraint · the H² = 0 financial stability condition. One equation, four theorems.

Quantum speedup has a cohomological address: problems that admit exponential speedup require H² resources (genuine magic / BIND). Problems solvable with H¹ resources (stabiliser / TWIST) are classically simulable by Gottesman–Knill.

*Key papers: 420 (H^k complexity ladder), 421, 469 (ISA completeness), 470 (hot logic), 472 (Shor lifting), 595 (Weyl chamber homology)*

---

## 3. The five opcodes are universal

Every computation — at any β, in any domain — decomposes into five operations. This is not a design choice; it follows from the structure of Čech cohomology on a sheaf.

| Opcode | Symbol | Cohomological role |
|--------|--------|--------------------|
| LABEL 🏷️ | ⊢ | δ⁻¹: assign a symmetry sector |
| ORBIT 🔄 | 𝒪 | H⁰: enumerate group orbits |
| FLIP 👁️ | ⌁ | Sheaf dualisation / time-reversal |
| TWIST 🌀 | ∮ | H¹: gauge transformation / phase |
| BIND 💎 | ⋈ | H²: Pachner surgery / entanglement |

The same five opcodes describe a ribosome, Shor's algorithm, a yield curve, and an enzyme — at twenty orders of magnitude in physical scale. This is not analogy: the 6j symbol is H¹ of the representation sheaf in every case.

*Key papers: 258, 370, 455 (eight derivations), 631 (Origami open ISA manifesto)*

---

## 4. The Fano crystal is the universal phase detector

Whether an orbit is **closed** (H² = 0, stable) or **open** (H² ≠ 0, unstable) is the single binary that governs:

- Photosynthetic efficiency (FMO: closed orbit = η = 0.1828 Carnot bound)
- Financial contagion (systemic risk: open H² orbit = cascade)
- Quark confinement (QCD: open orbit = confined)
- Quantum error correction (closed orbit = code space preserved)
- Enzyme catalysis (G-step: orbit closure = reaction proceeds)

The Fano plane (7 points, 7 lines, the smallest projective plane) is the minimal structure that realises H² non-trivially. The **β\* snap** — the phase transition at the critical inverse temperature — is the moment an orbit closes. It appears at the same Grassmannian angle θ_G ≈ 20° across all four domains.

*Key papers: 317, 325, 357 (MIP\* = RE), 563, 570, 595, 596, 602*

---

## 5. Four-body interactions are irreducible

Every colour you have ever seen — the blue of the sky, the green of a leaf, the orange of a flame, the entire visible spectrum of every star — is ultimately governed by spectroscopy. And spectroscopy has been understood since the 1930s to rest on a single irreducible mathematical object: the **6j symbol**, the recoupling coefficient for three angular momenta combining into a fourth. Wigner, Racah, and Weyl worked this out before the Second World War. The 6j is not a 2-body interaction dressed up in notation. It is genuinely, irreducibly a 4-body object — four particle lines meeting at a vertex — and no combination of pairwise forces can reproduce it.

This surprises most people. We are trained to think that nature is pairwise at heart: Newton's gravity, Coulomb's law, the bilateral loan, the two-qubit gate. But the 6j symbol has been sitting in the spectroscopy textbooks for ninety years, quietly ruling out that picture for any system with non-Abelian symmetry.

**BIND is that object.** In the Origami ISA, BIND is the opcode that encodes the non-trivial associator — the F-matrix of a fusion category, the octonion associator, the 6j recoupling coefficient. It appears identically in:

| System | BIND incarnation | Known since |
|--------|-----------------|-------------|
| Atomic / molecular spectroscopy | Racah 6j symbol; every spectral line | Racah 1942 |
| Nuclear physics | Tensor force $S_{12}$; mandatory in every nucleus from the deuteron up | Wigner 1933 |
| Topological quantum computing | Non-Abelian anyon F-matrix; fault-tolerant braiding | Kitaev 2003 |
| Systemic financial risk | H² snap event; 2008 global financial crisis | — |
| Nitrogen fixation (FeMoco) | 4-Majorana coupling in the iron-sulfur cluster | — |
| Non-Abelian anyons | Pentagon equation for fusion categories | Moore–Seiberg 1989 |

BIND cannot be built from TWIST or FLIP applied twice. It is not a 2-body interaction in disguise. The reason DFT fails for strongly-correlated molecules, the reason Clifford circuits cannot achieve universal quantum computation, and the reason the 2008 crisis could not be unwound bilaterally are all the same theorem: you hit the H¹→H² boundary and BIND is on the other side.

The irreducibility of 4-body interactions is not a new discovery. It is a ninety-year-old fact from spectroscopy that has not yet been fully absorbed by the rest of science. Thermyon names it, and makes it computable across every domain where it appears.

*Key papers: 258, 357, 447, 455, 571, 572 (ISA chain complex and G₂ spider)*

---

{% include isa-nav.html %}
