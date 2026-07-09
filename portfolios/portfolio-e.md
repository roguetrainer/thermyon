---
layout: default
title: "Portfolio E — Chemistry & Physics"
parent: Portfolios
nav_order: 5
---

**Primary audience:** Chemists, physicists, nuclear physicists, spectroscopists, materials scientists

---

## ASA for Chemists and Physicists

Portfolio E applies the ISA chain complex and Grassmannian geometry to molecular bonding, nuclear structure, scattering amplitudes, and spectroscopy. The central claim: the same three-tier H⁰/H¹/H² structure that classifies quantum circuits also classifies every bonding interaction, from van der Waals (H⁰) to covalent resonance (H¹) to nuclear tensor force (H²). Three computable quantities replace Lewis theory, MO bond orders, and VB resonance integrals simultaneously — and the same geometric object, the Grassmannian Gr(n_e, n_orb), appears at the chemistry, amplituhedron, and nuclear scales.

---

### The Grassmannian and universal bonding theory

**[A Universal Theory of Chemical Bonding from the Grassmannian](https://doi.org/10.5281/zenodo.21277821)** (Paper 570) is the entry point. Three ISA descriptors characterise any bond:

| Descriptor | ISA opcode | Classical analogue |
|-----------|------------|--------------------|
| θ_G = arccos σ₀ | ORBIT (H⁰) | Bond polarity / ionicity |
| n_bond = ½(Σ_{nᵢ>1} nᵢ − Σ_{nᵢ<1} nᵢ) | TWIST (H¹) | MO bond order |
| H₀₁ = ⟨α₀β₀\|H\|α₁β₁⟩ | BIND (H²) | VB resonance integral |

Validated across nine systems. For benzene: ΔE_res = ½(E₁−E₀)(1−S) = 54.5 mEh vs experimental 57.4 mEh (5% error). Lewis, MO, and VB theories are the H⁰, H¹, and H² approximations to a single geometric object.

**[Schrödinger's Equation on the Grassmannian](https://doi.org/10.5281/zenodo.21277819)** (Paper 568) derives the correct variational action principle for correlated wavefunctions on Gr(n_e, n_orb). The Galerkin inter-channel coupling H₀₁ is the basis-independent quantity that VB theory approximates with the Hückel β integral. The β* snap at θ_G ≈ 20° is a bifurcation of the Grassmannian geodesic flow — the geometric explanation of why DFT fails for strongly correlated systems.

**[The Condensed Matter Amplituhedron](https://doi.org/10.5281/zenodo.21277815)** (Paper 563) demonstrates the geodesic mechanism in practice: CASSCF wavefunctions trace geodesics on Gr(n_e, n_orb); θ_G is extracted directly from Schmidt singular values; the universal β* snap at θ_G ≈ 20° is confirmed across H₂, H₂O, and N₂.

---

### The amplituhedron connection: chemistry meets particle physics

**[The Grassmannian as the Common Parent of Bonding and Scattering](https://doi.org/10.5281/zenodo.21279006)** (Paper 574) shows that the Grassmannian parametrising CASSCF wavefunctions is the same space that parametrises scattering amplitudes in N=4 SYM. The ISA bonding descriptors have exact amplitude counterparts:

| ISA descriptor | Chemistry | Amplituhedron |
|---------------|-----------|---------------|
| θ_G | Grassmannian geodesic length | Momentum twistor coordinate |
| n_bond | NOON bond order | Leading singularity |
| H₀₁ | Galerkin resonance coupling | Factorisation channel residue |
| β* snap | Bond-breaking at θ_G ≈ 20° | Spurious-pole degeneration |

The tropical limit (β→∞) identifies the Hartree-Fock reference with the leading Parke-Taylor factor. The G₂ structure of BIND appears at H² in both contexts. This is not an analogy: it is the same chain complex at different energy scales.

---

### Nuclear bonding: the H² tier is mandatory

**[Nuclear Bonding as H²](https://doi.org/10.5281/zenodo.21279217)** (Paper 575) shows that nuclear bonds are always H² (BIND-mandatory) because SU(3) colour is permanently non-Abelian. The tensor force S₁₂ is a trivalent BIND vertex; (TWIST)² = BIND from pion exchange at second order. The OBE opcode table:

| Meson | Opcode | Force |
|-------|--------|-------|
| π | TWIST | Spin-isospin |
| σ | ORBIT | Central attraction |
| ρ, ω | FLIP | Short-range repulsion |

The deuteron: θ_G ≈ 13°, n_bond = 1, H₀₁ ≈ −25 MeV — structurally identical to the benzene Kekulé coupling at ×13,000 energy. The Hoyle state of ¹²C is an ORBIT of three BIND objects (alpha clustering). The same three ISA descriptors span 13 orders of magnitude in energy.

---

### The G₂ spider and BIND calculus

**[The Kuperberg G₂ Spider is the BIND Calculus](https://doi.org/10.5281/zenodo.21278538)** (Paper 572) proves that Kuperberg's G₂ spider (CMP 1996) is the complete diagrammatic axiomatisation of the BIND opcode. BIND(eᵢ,eⱼ,eₖ) = φᵢⱼₖ (Fano incidence function). Relations R1–R3 verified at exact numerical precision:

- R1: φᵢⱼₖφⁱʲᵏ = 42
- R2: φⁱʲᵏφᵢⱼₗ = 6δᵏₗ
- R3: square = 1·antisym − (1/3)·(*φ), residual = 0

The BIND theorem (non-Abelian holonomy ↔ BIND present) now has its complete proof via Kuperberg's Theorem 6.1.

---

### The chain complex: from opcodes to knot invariants

**[The ISA Chain Complex](https://doi.org/10.5281/zenodo.21278536)** (Paper 571) proves that the H^k tiers form a genuine chain complex. The boundary map ∂: C^k → C^{k+1}, assembled from SPLIT and SPLAT with Koszul signs, satisfies ∂² = 0 as a consequence of the Frobenius algebra axiom. The ISA homology groups recover Khovanov's categorification of the Jones polynomial at the H¹ level; BIND extends it to G₂ at H². The Euler characteristic of the complex is the ORBIT count; the full Poincaré polynomial is a strictly stronger knot invariant. This supplies the missing mathematical foundation: H^k is not merely a grading, it is a computable cohomology theory.

---

### Spectroscopy and molecular machines

**[Spiders for Spectra](https://doi.org/10.5281/zenodo.20458996)** (Paper 347) and **[Spiders for Nuclei](https://doi.org/10.5281/zenodo.20490046)** (Paper 348) apply the ISA diagrammatic calculus to atomic and nuclear spectroscopy. Every spectroscopic transition is an Origami ISA circuit; the Pandya transform (connecting particle and hole spectroscopy) is the FLIP opcode. **[Spectroscopic Circuits Are Small](https://doi.org/10.5281/zenodo.20584560)** (Paper 374) shows that 3–21 qubits suffice to simulate all known spectra from H through Cf.

**[Molecular Machines as Origami ISA Programmes](https://doi.org/10.5281/zenodo.20682101)** (Paper 413) covers the FMO photosynthetic complex (η = 0.1825 from crystal structure alone), the ribosomal decoding engine (6/7 Fano-line coverage), and the FeMoco nitrogen fixation centre (G₂ triality mechanism). **[Galois Chemistry](https://doi.org/10.5281/zenodo.21219720)** (Paper 488) gives the full orbit-theory treatment of transition metal chemistry: N₂ fixation as a 14-opcode Fano programme, spin-crossover compounds as TWIST gates, FeMoco as a 7-qubit Galois computer. **[Tropical DFT](https://doi.org/10.5281/zenodo.21219706)** (Paper 491) shows that level-crossing singularities in DFT are tropical varieties; the derivative discontinuity is a tropical singularity; MGE = DFT→Galois deformation.

---

### Speculative grand challenges

The following papers are more speculative — they identify structural correspondences and propose conjectures rather than reporting validated calculations.

**Nuclear Magic Numbers** (Paper 245) conjectures that the strong nuclear force geometry is non-associative at short range and the magic numbers 2, 8, 20, 28, 50, 82, 126 are a fingerprint of octonion symmetry.

**Electron Shell Anomalies** (Paper 246) argues the lanthanide contraction and anomalous filling orders (Cr, Cu, Mo, Pd, Ag, Au) are accounted for by a G₂ rigidity constraint on the f-orbitals.

**The ζ(21) Apéry Generalisation** (Paper 265) and **Geometric Shadows in Apéry's Polynomial** (Paper 266) conjecture a 4-term recurrence for ζ(21) motivated by the G₂ Weyl group; the Apéry polynomial has a Fano factorisation structure at Fano-prime values.

---

## Papers

| # | Paper | Status |
|---|-------|--------|
| [347](../papers/10.5281-zenodo.20458996/) | Spiders for Spectra | Published |
| [348](../papers/10.5281-zenodo.20490046/) | Spiders for Nuclei | Published |
| [374](../papers/10.5281-zenodo.20584560/) | Spectroscopic Circuits Are Small | Published |
| [413](../papers/10.5281-zenodo.20682101/) | Molecular Machines as Origami ISA Programmes | Published |
| [488](../papers/10.5281-zenodo.21219720/) | Galois Chemistry | Published |
| [491](../papers/10.5281-zenodo.21219706/) | Tropical DFT | Published |
| [563](../papers/10.5281-zenodo.21277815/) | The Condensed Matter Amplituhedron | Draft |
| [568](../papers/10.5281-zenodo.21277819/) | Schrödinger's Equation on the Grassmannian | Draft |
| [570](../papers/10.5281-zenodo.21277821/) | A Universal Theory of Chemical Bonding | Draft |
| [571](../papers/10.5281-zenodo.21278536/) | The ISA Chain Complex | Draft |
| [572](../papers/10.5281-zenodo.21278538/) | The Kuperberg G₂ Spider is the BIND Calculus | Draft |
| [574](../papers/10.5281-zenodo.21279006/) | The Grassmannian as Common Parent of Bonding and Scattering | Draft |
| [575](../papers/10.5281-zenodo.21279217/) | Nuclear Bonding as H² | Draft |
| [245](../papers/10.5281-zenodo.19960385/) | Nuclear Magic Numbers and Exceptional Lie Algebras | Speculative |
| [246](../papers/10.5281-zenodo.19964651/) | Electron Shell Structure and Exceptional Lie Algebras | Speculative |
| [265](../papers/10.5281-zenodo.20029647/) | The ζ(21) Apéry Generalisation | Speculative |
| [266](../papers/10.5281-zenodo.20031913/) | Geometric Shadows in Apéry's Polynomial | Speculative |

---

## Key Glossary Terms

[Fano Plane](../glossary/#fano-plane) · [Associator](../glossary/#associator) · [$G_2$](../glossary/#g_2) · [BIND](../glossary/#bind) · [Grassmannian](../glossary/#grassmannian) · [β* Snap](../glossary/#snap-event)
