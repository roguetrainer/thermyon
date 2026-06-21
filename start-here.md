---
layout: default
title: Start Here
nav_order: 2
description: "Entry points into the ASA project by reader type — quantum computing, economics, mathematics, or general interest."
---

# Start Here
{: .no_toc }

The ASA project spans quantum computing, financial risk, spectroscopy, climate economics, and pure mathematics — all unified by the same five-opcode instruction set. This page maps the shortest path to the core ideas for each reader type.
{: .fs-5 .fw-300 }

---

## For everyone first

These two papers require no specialist background. Start with one of them regardless of your field.

**[In Praise of Tetrahedra](https://doi.org/10.5281/zenodo.20581484)** (Paper 386)
The simplest possible non-trivial simplex — four objects, six edges, four faces — encodes the Ponzano–Regge amplitude, the 6j symbol, the Wigner tetrahedron, and the fundamental unit of the Origami ISA. This is the geometric seed from which everything else grows.

**[An Adelic Invitation](https://doi.org/10.5281/zenodo.19977475)** (Paper 219)
The founding thesis: why the division algebra ladder **ℝ → ℂ → ℍ → 𝕆** is the right organisational principle for a unified theory of physics, computation, and economics. Accessible to anyone comfortable with complex numbers.

---

## For quantum computing researchers

*Prerequisite: stabiliser states, the Clifford group, T-gates.*

1. **[The Meld ISA: Complex-MGE, Quantum Algorithm Discovery, and the T-Gate as Octonion Obstruction](https://doi.org/10.5281/zenodo.20773563)** (Paper 454)
   The quantum branch of the ISA trilogy. Shor's algorithm as a three-layer Origami/Meld/Origami programme; QFT as a SPLIT-TWIST cascade; T-gate = BIND = Fano associator obstruction; why LWE noise kills the Fourier peak and makes ML-KEM quantum-resistant. The fastest entry point for anyone working on quantum algorithms or hardware simulation.

2. **[Eight Derivations of a Universal Instruction Set](https://doi.org/10.5281/zenodo.20774076)** (Paper 455)
   Eight independent routes — Pachner moves, Wigner-Racah spectroscopy, Mac Lane Pentagon, compact closed categories, Frobenius algebras, Fisher information geometry, Hodge decomposition, quantum gate sets — all landing on the same five opcodes. Explains *why* this gate set is universal at a deeper level than Solovay-Kitaev.

3. **[The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526)** (Paper 420)
   H⁰ = classical (PSPACE), H¹ = statistical (BPP), H² = quantum (BQP). A graded, computable alternative to the P=NP question. The β* snap threshold identifies where on the complexity dial any given algorithm sits.

**Then, for the ISA foundations:**

- [The Origami ISA](https://doi.org/10.5281/zenodo.19916429) (Paper 258) — the classical β→∞ ISA; FLIP/FLOP/SPLIT/SPLAT/TWIST/SWAP/LABEL; Wigner 6j symbol as H¹
- [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) (Paper 419) — the statistical 0<β<∞ ISA; snap event at β*; vorton architecture; thermodynamic computation
- [Projective Geometry as the Mother Tongue of QM](https://doi.org/10.5281/zenodo.20634729) (Paper 393) — the 3-qubit Pauli group is the Fano plane; Fano orbit decomposition of magic states
- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (Paper 408) — practitioner primer; stabiliser / standard magic / associamancy hierarchy

**For quantum error correction specifically:**

- [Fano Geometry as a Unifying Language for QEC](https://doi.org/10.5281/zenodo.20541595) (Paper 363) — GHZ generates Steane; orbit decomposition of magic; Fano self-test with C = 7/8
- [Non-Associative Hardware is Necessary for the Non-Abelian HSP](https://doi.org/10.5281/zenodo.20667170) (Paper 405) — PSL(2,7) solved; why associative hardware provably fails
- [Associamancy: A Resource Theory of Non-Associative Quantum Magic](https://doi.org/10.5281/zenodo.20667174) (Paper 407) — the Schur boundary; ν₂ = 0; Freudenthal ladder

---

## For economists and financial practitioners

*Prerequisite: familiarity with credit exposure, derivatives, or macroeconomic models.*

1. **[EconIAC: A Differentiable Economics Engine — Overview and Reading Guide](https://doi.org/10.5281/zenodo.20679006)** (Paper 409)
   What EconIAC is, why the mathematics matters, and where to start. Maps all 19 published economics papers with hyperlinked DOIs. Read this first.

2. **[The Topology of Risk: A Primer on Cohomology for Financial Practitioners](https://doi.org/10.5281/zenodo.20642983)** (Paper 398)
   Teaches H⁰/H¹/H² from scratch using the 2008 crisis as the running example. No mathematical prerequisites beyond knowing what a credit exposure is.

3. **[A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505)** (Paper 301)
   Why double-entry accounting is a gauge theory; why arbitrage is curvature; why the Pacioli identity is a conservation law. For economists and policy audiences.

**Then, for specific applications:**

- [Systemic Risk as H²](https://doi.org/10.5281/zenodo.20642908) (Paper 397) — the 2008 crisis as a topological event; stress-testing framework
- [Tipping Points Are Topological](https://doi.org/10.5281/zenodo.20653285) (Paper 403) — climate tipping cascades; H¹-corrected social cost of carbon
- [The Origami ISA as Financial Middleware](https://doi.org/10.5281/zenodo.20645695) (Paper 399) — SPLIT and SPLAT as Čech coboundary; model-free XVA

---

## For biologists and biochemists

*Prerequisite: familiarity with molecular biology, structural biochemistry, or biophysics. No quantum mechanics or representation theory required.*

The core claim: every molecular machine that processes angular momentum — a ribosome decoding a codon, the FMO photosynthetic complex funnelling energy, nitrogenase breaking the N≡N triple bond — is running an Origami ISA programme. The same five opcodes that describe quantum circuits describe these biological systems, at the same level of mathematical precision.

1. **[Molecular Machines as Origami ISA Programmes](https://doi.org/10.5281/zenodo.20682101)** (Paper 413)
   The biology entry point. Covers all three molecular machines — ribosome, FMO, nitrogenase — in one paper written for biologists with no quantum computing background. Includes the parameter-free prediction η = 0.1825 for FMO efficiency, the structural evidence for 6/7 Fano topology at the ribosomal A-site, and the G₂ triality mechanism for nitrogen fixation. Start here.

**Then, for each machine in depth:**

2. **[The Decoding Engine](https://doi.org/10.5281/zenodo.20400652)** (Paper 324)
   Full treatment of the ribosome as an Origami ISA programme. The 6j symbol is the codon–anticodon recognition step; 6/7 Fano-line coverage in the cognate state (PDB: 4V9D); connection to kinetic proofreading.

3. **[The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638)** (Paper 325)
   Full proof that the broken-Fano topology is the unique 7-node graph with positive Carnot efficiency. FMO efficiency η = 0.1825 derived from crystal structure alone. Testable predictions for Tyr16 mutation and DNA origami implementation.

4. **[Virtual Monopoles in the FeMo-Cofactor](https://doi.org/10.5281/zenodo.20346650)** (Paper 318)
   Nitrogenase and the [7Fe-9S-Mo] cluster as a 731 ISA register. G₂ triality and virtual monopoles. Predictions for time-resolved EXAFS and Mössbauer spectroscopy.

**Then, for spectroscopists:**

- [Spiders for Spectra](https://doi.org/10.5281/zenodo.20458996) (Paper 347) — atomic spectra as Origami ISA circuits; diagrammatic angular-momentum calculus for any atom
- [Spiders for Nuclei](https://doi.org/10.5281/zenodo.20490046) (Paper 348) — nuclear spectroscopy; the Pandya transform is the FLIP opcode; ISA programs for shell-model transitions
- [Spectroscopic Circuits Are Small](https://doi.org/10.5281/zenodo.20584560) (Paper 374) — 3–21 qubits suffice to simulate all known nuclear and atomic spectra; ISA circuit sizes for H through Cf

---

## For mathematicians

*Prerequisite: comfortable with representation theory or category theory.*

1. **[The Origami Calculus](https://doi.org/10.5281/zenodo.20474914)** (Paper 349)
   A diagrammatic framework for the representation theory of compact groups, grounded in the Ponzano–Regge tetrahedron. The mathematical foundation for all ISA opcodes.

2. **[In Praise of Qudits](https://doi.org/10.5281/zenodo.20269991)** (Paper 310)
   Why d > 2 quantum systems are natural: the TriQ (d=3) and SevenQ (d=7) registers as the minimal hardware for qudit stabiliser learning and PSL(2,7) Fourier sampling.

3. **[The Unhedgeability Theorem](https://doi.org/10.5281/zenodo.20635479)** (Paper 396)
   A financial risk is hedgeable with bilateral instruments iff its class is trivial in H¹ of the pricing sheaf over an interaction diagram. Convexity, basis risk, and XVA are all H¹ classes — proved directly from the Čech complex, no representation theory required.

**Then, for the frontier:**

- [Associamancy](https://doi.org/10.5281/zenodo.20667174) (Paper 407) — Frobenius-Schur indicators; q ≡ 3 (mod 4) criterion; Freudenthal magic square
- [Non-Abelian StateHSP](https://doi.org/10.5281/zenodo.20667170) (Paper 405) — proof that i√7/2 requires non-associative hardware; Gauss sum identity
- [The 731-Calculus Part 1](https://doi.org/10.5281/zenodo.19713350) (Paper 207) — the magmoidal category; frog vertex (BIND opcode); non-associative string diagrams; the diagrammatic language underlying associamancy
- [The 731 Frog Calculus Part 2](https://doi.org/10.5281/zenodo.20139448) (Paper 281) — G₂ spin foams; octonion diagram rewriting rules; the non-associative Pachner moves

**If you know complex analysis:** the Cauchy-Riemann conditions are the oldest instance of the H¹=0 pattern in the ASA programme.
The condition $\bar\partial f = 0$ is the Pentagon identity SPLAT∘SPLIT = 0 for the $\bar\partial$ operator.
The three-level ladder — $H^1(\mathbb{C},\mathcal{O})=0$ (Mittag-Leffler), $H^1(\mathbb{C}\setminus\{0\},\mathcal{O})=\mathbb{R}$ (residue theorem), $H^1(\text{genus-}g,\mathcal{O})=\mathbb{C}^g$ (Riemann-Roch) — is the clearest illustration of how $\dim H^1$ counts the number of FLOP corrections needed.
See the remark in §3.6 of [H¹=0 is the Performance Condition](https://doi.org/10.5281/zenodo.20684509) (Paper 415) for the full treatment, and [Hodge Theory is the Smooth Limit](https://doi.org/10.5281/zenodo.20684838) (Paper 417) for the connection to the $\bar\partial$-Neumann problem and Dolbeault cohomology.

---

## The complete paper index

All published papers are indexed in the
[Zenodo ASA Research community](https://zenodo.org/communities/asa-research/records)
and organised by portfolio on the [Portfolios](/adelic-simplicial-architecture/portfolios/) page.

| Portfolio | Theme |
|-----------|-------|
| [A — Core Engine](/adelic-simplicial-architecture/portfolios/portfolio-a) | MGE, TRS, non-associative calculus |
| [B — Foundations](/adelic-simplicial-architecture/portfolios/portfolio-b) | Algebra, topology, category theory |
| [C — Hardware & AI](/adelic-simplicial-architecture/portfolios/portfolio-c) | Origami ISA, registers, QEC |
| [F — Quantum Foundations](/adelic-simplicial-architecture/portfolios/portfolio-f) | Magic, self-tests, paradoxes |
| [G — Finance & Economics](/adelic-simplicial-architecture/portfolios/portfolio-g) | EconIAC, gauge theory, risk |
