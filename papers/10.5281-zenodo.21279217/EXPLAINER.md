---
layout: default
title: "Nuclear Bonding as H²"
parent: Explainers
nav_exclude: true
tags: [nuclear-physics, deuteron, tensor-force, strong-force, bind, h2, grassmannian, obe-potential, alpha-particle, hoyle-state, h-k-ladder, trs-framework]
portfolio: A
---

## Why nuclear bonds are always harder than chemical bonds

*Plain-language explainer for [doi:10.5281/zenodo.21279217](https://doi.org/10.5281/zenodo.21279217) (#575)*

---

## The one-sentence version

Chemical bonding spans all three ISA tiers (H⁰ for simple σ-bonds, H¹ for aromatic resonance, H² for strongly-correlated metals); nuclear bonding is permanently and unavoidably H² — even for the simplest nucleus — because the strong force is non-Abelian and the tensor force is intrinsically a BIND operation.

---

## A tale of two bonds

Consider hydrogen molecules and hydrogen nuclei side by side:

**H₂ molecule** (two electrons sharing two protons): the bond is primarily H⁰ near equilibrium — one dominant orbital configuration, σ₀² ≈ 0.95, DFT works fine. Only when you stretch the bond past ~1.8 Å does it become H² (Paper 596).

**Deuteron** (one proton + one neutron, the simplest nucleus): the bond is H² from the start — even at the ground state, even at "equilibrium." You cannot describe the deuteron without a BIND opcode.

This is not a quantitative difference. It is a qualitative one, and it has a deep reason.

---

## Why the strong force forces H²

In chemistry, the electromagnetic force between electrons is **Abelian** (U(1) symmetry — electrons just have charge ±1). This means you can often approximate many-body electronic states by single-particle orbitals (Hartree-Fock), which is H⁰. The correlation (H¹ and H²) is a correction.

The strong nuclear force has **SU(3) colour symmetry** — non-Abelian. Quarks come in three colours {r, g, b}, and only colour-singlet combinations (baryons, mesons) can exist as free particles. Forming a colour singlet from three quarks requires closing a ORBIT on the Fano plane (Paper 545): the three colours must combine to "white" via a trivalent vertex — which is a BIND operation.

A proton (uud) and neutron (udd) are each colour singlets — individually H⁰ objects. But when they interact via the **residual** strong force (pion exchange), the interaction between these two closed ORBITs is *entirely* in the BIND sector. There is no H¹ "resonance" between proton and neutron the way there is between two Kekulé structures of benzene. The inter-nucleon bond is pure H².

---

## The tensor force: where the BIND comes from concretely

The nucleon-nucleon potential has two main parts:

1. **Central force**: depends only on inter-nucleon distance r. Generates spherically symmetric bonds. This part is H⁰/H¹.

2. **Tensor force** S₁₂: the non-central part. It couples the spin-0 (L=0, ³S₁) and spin-2 (L=2, ³D₁) components of the deuteron wavefunction:

$$S_{12} = 3(\boldsymbol{\sigma}_1 \cdot \hat{r})(\boldsymbol{\sigma}_2 \cdot \hat{r}) - \boldsymbol{\sigma}_1 \cdot \boldsymbol{\sigma}_2$$

This operator involves the **product** of two spin operators in a way that cannot be factored into independent one-body terms. It genuinely couples three degrees of freedom (spin of nucleon 1, spin of nucleon 2, inter-nucleon direction r̂) at a trivalent vertex. In ISA language: this is a BIND opcode.

The tensor force contributes roughly 50% of the deuteron's binding energy in realistic NN potentials. You cannot remove it and still have a bound deuteron. The BIND is mandatory.

---

## The deuteron's ISA descriptors

Paper 570 defined three bonding descriptors for chemical systems: θ_G (Grassmannian angle), n_bond (bond order), H₀₁ (resonance coupling). They apply equally to nuclear bonds:

| Descriptor | Chemical H₂ | Deuteron |
|-----------|-------------|---------|
| θ_G | ≈ 6.5° (equilibrium) | ≈ 13° |
| n_bond | 1 (single σ bond) | 1 (one NN bond) |
| H₀₁ | ≈ −1.93 eV (benzene) | ≈ −25 MeV (AV18 potential) |
| ISA tier | H⁰ (near equilibrium) | H² (always) |

The θ_G values are similar — both bonds are "weakly correlated" in the angle sense. But H₂ can be approximated at H⁰; the deuteron cannot. The difference is the mandatory tensor-force BIND, which has no electronic analogue at the same bond angle.

The nuclear "resonance energy" H₀₁ ≈ −25 MeV is about 13,000× larger than the chemical analogue in benzene (≈ −1.93 eV). The structure is identical; the energy scale reflects the difference between strong-force and electromagnetic energy scales.

---

## The OBE potential in ISA language

The one-boson-exchange (OBE) NN potential describes the nuclear force via meson exchange. Each meson type maps to an ISA opcode:

| Meson | Quantum numbers | Range | ISA opcode | Physical role |
|-------|----------------|-------|-----------|---------------|
| π (pion) | 0⁻⁺ | long | TWIST | Pseudoscalar; dominant at long range |
| σ (sigma) | 0⁺⁺ | medium | ORBIT | Scalar; central attraction |
| ρ (rho) | 1⁻⁻ | short | FLIP | Vector; spin-orbit coupling |
| ω (omega) | 1⁻⁻ | short | FLIP | Vector; short-range repulsion |

The tensor force arises from **pion exchange at second order**: two TWIST operations combining at a trivalent vertex give a BIND:

$$({\rm TWIST} \otimes {\rm TWIST})\big|_{\rm rank\text{-}2} = {\rm BIND}$$

This is the ISA derivation of H² from first principles: the tensor force is the second-order contribution of the lightest (longest-range) meson exchange, which is H¹ (TWIST) at first order but becomes H² (BIND) when two such exchanges combine non-centrally. The analogy in chemistry is London dispersion forces: (H¹ dipole)² = effective H² correlation.

---

## The alpha particle and the Hoyle state

The alpha particle (⁴He = 2 protons + 2 neutrons) is the paradigmatic strongly-bound nucleus — the "helium" of nuclear physics, with the highest binding energy per nucleon of any small nucleus.

But unlike helium the atom (a noble gas, H⁰ by electronic structure), the alpha particle is deeply H²:
- All six nucleon-nucleon pairs are bound by tensor-force BIND vertices
- The four-body wavefunction requires Racah recoupling of all pairwise BINDs — a 6j symbol

The **Hoyle state** of ¹²C (at 7.65 MeV excitation energy) is a dilute condensate of three alpha particles. It has a remarkable two-level ISA structure:

- At the **alpha-cluster scale**: three alphas in a loosely bound geometric arrangement — an ORBIT (H⁰) of three H² objects
- At the **nucleon scale**: each alpha is built from mandatory BIND operations

This explains why the Hoyle state is exceptional: it has H⁰ geometric character at the cluster level (dilute, near-threshold, symmetric three-body arrangement) while being constructed entirely from H² objects. No nuclear state is more H² at the nucleon scale and yet more H⁰ at the cluster scale simultaneously.

---

## Why nuclear simulation is harder than chemistry

The permanent H² character of nuclear bonding has a concrete consequence for simulation complexity:

| System | Particles | Minimum BIND opcodes | ISA tier |
|--------|-----------|---------------------|----------|
| H₂O | 10 electrons | 0 (DFT works) | H⁰/H¹ |
| FeMoco | ~54 electrons | ~10 | H² (strongly correlated) |
| ¹⁰B (boron nucleus) | 10 nucleons | ≥ 45 | H² (always) |
| ⁵⁶Fe (iron nucleus) | 56 nucleons | ≥ 1540 | H² (always) |

FeMoco — the hardest molecule known for quantum chemistry — needs roughly 10 BIND opcodes. The iron nucleus, with the same number of particles, needs at least 1540. Nuclear simulation is ~150× harder in BIND-resource terms than the hardest chemistry at the same particle number.

The ISA statement: for chemical systems, H² is an exception requiring careful treatment. For nuclear systems, H² is the entire budget — there is no H⁰ shortcut.

---

## The same Grassmannian geometry

The deuteron's S/D mixing (³S₁ + ³D₁) maps directly onto the Grassmannian picture from Paper 570:

- The pure ³S₁ state is a single point on Gr(n_e, n_orb) — the H⁰ "Hartree-Fock" of nuclear physics
- The tensor force drives the system away from this point toward a superposition with ³D₁ — a geodesic on the Grassmannian
- The Grassmannian angle θ_G ≈ 13° measures how far the true deuteron ground state is from the pure S-wave reference
- The bond is H² because this geodesic cannot be captured by CASSCF-like methods that assume a fixed active space — the tensor force genuinely entangles the S and D channels in a way that requires BIND

This makes nuclear bonding a test case for the OPU (Paper 598): can an Orbit Processing Unit on Gr(k,n) compute nuclear bound-state properties? For the deuteron (a small Grassmannian), yes in principle. For ⁵⁶Fe, the BIND depth would be astronomical.

---

## The broader picture

Nuclear and chemical bonding are now unified under the same ISA framework:

| Scale | Force | Non-Abelian? | ISA tier of bonds | Key example |
|-------|-------|-------------|-------------------|-------------|
| Nuclear (fm) | SU(3) colour (QCD) | Yes — always | H² always | Deuteron, α-particle |
| Chemical (Å) | U(1) electromagnetism | No | H⁰/H¹/H² depending | H₂, benzene, FeMoco |
| Condensed matter (nm) | U(1) / SU(2) spin | Partially | H⁰/H¹/H² | Mott insulators, cuprates |

The non-Abelian character of the underlying force determines the minimum ISA tier of the bonds it produces. Abelian forces can make H⁰ bonds; non-Abelian forces cannot drop below H².

---

*See also:*

- [Universal Chemical Bonding](https://doi.org/10.5281/zenodo.21277821) (#570) — the three ISA bonding descriptors; chemistry arc
- [Grassmannian Amplituhedron Bonding](https://doi.org/10.5281/zenodo.21279006) (#574) — Gr(k,n) as the common parent of bonding and scattering
- [Proton Stability and the Fano Plane](https://doi.org/10.5281/zenodo.21261825) (#545) — colour singlet = closed ORBIT; Fano plane as quark colour algebra
- [Spiders for Nuclei](https://doi.org/10.5281/zenodo.20752352) (#348) — diagrammatic calculus for nuclear spectroscopy in ISA language

*For the full technical treatment, see [doi:10.5281/zenodo.21279217](https://doi.org/10.5281/zenodo.21279217)*
