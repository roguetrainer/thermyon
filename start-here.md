---
layout: default
title: Start Here
nav_order: 3
description: "What Thermyon is, why it matters, and the shortest path to the core ideas — by reader type."
---

{% include isa-nav.html %}

# Start Here
{: .no_toc }

*Every interaction — quantum, chemical, biological, economic — is running the same five-opcode programme on different physical hardware.*
{: .fs-5 .fw-300 }

---

## The one-paragraph version

Experts in quantum computing, spectroscopy, financial risk, and molecular biology have independently discovered the same three-tier structure — fixed points, local phase corrections, global topological obstructions — and given it different names in each field. **Thermyon** makes the common pattern explicit, computable, and transferable. The five opcodes (LABEL / ORBIT / TWIST / BIND / FLIP) are not analogies — they are the same categorical morphisms running on different physical substrates. The temperature parameter β is the single dial that interpolates between classical (β→∞), statistical (0<β<∞), and quantum (β=it/ℏ) regimes.

The [Pillars](pillars.md) page gives the four load-bearing ideas. The [Origami ISA manifesto](https://doi.org/10.5281/zenodo.21428853) (Paper 631) gives the full technical case.

---

## By reader type

### No specialist background

**[In Praise of Soft Thresholds](https://doi.org/10.5281/zenodo.21373469)** (Paper 597) — the most accessible entry point. Five examples (p-value, credit rating, MCMC, quantum chemistry, climate tipping) showing that every hard threshold is the zero-temperature limit of a soft one. No prerequisites.

**[Planck's Constant in Disguise](https://doi.org/10.5281/zenodo.20752384)** (Paper 443) — six famous equations from six fields are all the same equation, controlled by β. The ML engineer's softmax temperature, the physicist's Planck's constant, and the quant's volatility are the same object.

---

### Quantum computing

1. **[Origami: An Open ISA for Quantum-Classical Systems](https://doi.org/10.5281/zenodo.21428853)** (Paper 631) — the manifesto. Why gate-and-circuit abstraction obscures where quantum advantage actually lives; Shor's algorithm as a case study.
2. **[The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526)** (Paper 420) — H⁰ = classical, H¹ = stabiliser/Clifford, H² = universal QC. A graded alternative to the P=NP question.
3. **[The Meld ISA](https://doi.org/10.5281/zenodo.20773563)** (Paper 454) — quantum branch of the framework. QFT as a TWIST cascade; BIND as the non-Abelian obstruction; why LWE is quantum-resistant.
4. **[Eight Derivations of a Universal Instruction Set](https://doi.org/10.5281/zenodo.20774076)** (Paper 455) — eight independent routes all forced to the same five opcodes. Explains *why* this gate set is universal at a deeper level than Solovay-Kitaev.

---

### Chemistry and physics

1. **[A Universal Theory of Chemical Bonding](https://doi.org/10.5281/zenodo.21277821)** (Paper 570) — three ISA descriptors (θ_G, NOON bond order, Galerkin coupling H₀₁) unify Lewis, MO, and VB theories. Validated across nine molecules; benzene resonance energy 54.5 vs 57.4 mEh experimental.
2. **[G-Step CO₂ Fixation](https://doi.org/10.5281/zenodo.21373477)** (Paper 603) — the G-step definition; RuBisCO baseline; three control handles (spin topology, E-field, B-field); Carbonase concept.
3. **[Weyl–DFT Accelerator](https://doi.org/10.5281/zenodo.21373469)** (Paper 596) — Weyl c₂ as a DFT failure detector (r=0.990); MGE soft router replaces hard CASSCF threshold.

---

### Biology

1. **[Protein Folding ISA](https://doi.org/10.5281/zenodo.21345099)** (Paper 515) — SSM (spontaneous symmetry making) as the H¹→H² step that creates G_fold; chaperones as H² QEC; AUC=0.981.
2. **[Kinetic Proofreading as QEC](https://doi.org/10.5281/zenodo.21345099)** (Paper 510) — proofreading IS quantum error correction; H⁰×H¹×H² gives 10⁹/10⁶/10⁴ fidelity for Pol III/RNAP/ribosome.
3. **[The Topological Heat Engine (FMO)](https://doi.org/10.5281/zenodo.20400638)** (Paper 325) — broken-Fano topology is the unique 7-node graph with positive Carnot efficiency; η=0.1825 from crystal structure alone.

---

### Finance and economics

1. **[The Topology of Risk: A Primer](https://doi.org/10.5281/zenodo.20642983)** (Paper 398) — H⁰/H¹/H² from scratch using the 2008 crisis. No prerequisites beyond knowing what a credit exposure is.
2. **[Systemic Risk as H²](https://doi.org/10.5281/zenodo.20642908)** (Paper 397) — the 2008 crisis as a topological event; H¹ cycles become globally inconsistent at the H² snap.
3. **[H^k Pricing](https://doi.org/10.5281/zenodo.21158959)** (Paper 478) — H⁰=spot, H¹=options/yield curves, H²=CDO²/correlation; post-2008 regulation as H¹-complete/H²-incomplete.

---

### Mathematics

1. **[Eight Derivations](https://doi.org/10.5281/zenodo.20774076)** (Paper 455) — eight routes to the same five generators. Closes an 80-year fragmentation between spectroscopy (Racah 1942), categorical QM (Abramsky-Coecke 2004), and quantum computing (Boykin 1999).
2. **[ISA Khovanov Complex](https://doi.org/10.5281/zenodo.21278536)** (Paper 571) — C^k = ⊕ A^{⊗c(v)}, ∂²=0 from the Frobenius axiom, ISA homology recovers Khovanov's categorification of the Jones polynomial.
3. **[Hecke–Weyl Routing](https://doi.org/10.5281/zenodo.21372929)** (Paper 602) — Kazhdan-Lusztig polynomials as MGE routing weights; Weak Lifting Theorem = KL positivity; Fano = G₂ Schubert calculus at 7th root of unity.

---

[All papers →](papers.md) · [Zenodo community →](https://zenodo.org/communities/thermyon/)

{% include isa-nav.html %}
