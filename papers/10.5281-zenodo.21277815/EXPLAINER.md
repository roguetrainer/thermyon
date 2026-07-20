---
layout: default
title: "The quantum chemistry amplituhedron"
parent: Explainers
nav_exclude: true
tags: [grassmannian, casscf, schmidt-decomposition, amplituhedron, hubbard-model, mott-transition, correlation-energy, h-k-ladder, trs-framework, quantum-chemistry, condensed-matter]
portfolio: A
---

## The quantum chemistry amplituhedron

*Plain-language explainer for [doi:10.5281/zenodo.21277815](https://doi.org/10.5281/zenodo.21277815) (#563)*

---

## Background: the amplituhedron

In 2013, Arkani-Hamed and Trnka showed that scattering amplitudes in a certain quantum field theory could be computed as the volume of a geometric object — the **amplituhedron** — living in the positive Grassmannian. Feynman diagrams, with their loops and virtual particles, disappeared. The amplitude was just a volume.

This paper asks: is there an analogous geometric object for the many-body problem of quantum chemistry and condensed matter?

The answer is yes. The **condensed-matter amplituhedron** is the convex hull of the Schmidt vectors of the correlated wavefunction, weighted by the squared singular values. Its "volume" is the correlation energy.

---

## The Schmidt decomposition of the wavefunction

A correlated many-electron wavefunction can be written as a matrix C, where rows index one set of electron configurations and columns index another. Applying SVD to C gives the Schmidt decomposition:

$$
|\Psi\rangle = \sigma_0\,|\alpha_0\rangle|\beta_0\rangle + \sigma_1\,|\alpha_1\rangle|\beta_1\rangle + \cdots
$$

with σ₀ ≥ σ₁ ≥ ... The first term is the Hartree-Fock reference. Subsequent terms are correlation corrections.

Each Schmidt pair is a **point on the Grassmannian** Gr(n_e, n_orb). The wavefunction as a whole is a weighted sum of Grassmannian points — a quantum superposition of orbital configurations.

---

## The Grassmannian angle θ_G

The angle from the Hartree-Fock reference to the true ground state on the Grassmannian is:

$$\theta_G = \arccos(\sigma_0)$$

At θ_G = 0: the wavefunction is entirely single-reference (σ₀ = 1). At θ_G = 45°: the system is a perfect biradical (σ₀ = σ₁ = 1/√2, two equally weighted structures).

**θ_G is a basis-independent, geometry-dependent complexity metric.** It replaces heuristic rules like "use CASSCF when?" with a precise threshold: **θ_G ≈ 20°**.

---

## Three experiments, one universal threshold

### Experiment x563a/b: molecular bond breaking (H₂, H₂O, N₂)

As each molecule is stretched past its equilibrium bond length, θ_G increases. The critical point where single-reference methods fail — where CCSD(T) diverges and multi-reference treatment becomes mandatory — is at θ_G ≈ 20° across all three molecules:

| Molecule | θ_G = 20° crossing | Bond length |
|----------|-------------------|-------------|
| H₂ | onset of biradical | R ≈ 1.5 Å |
| H₂O | O–H bond breaking | R ≈ 1.4 Å |
| N₂ | triple bond weakening | R ≈ 1.35 Å |

The threshold is **universal** — the same angle, regardless of molecular identity, orbital count, or chemical bonding type.

### Experiment x563c: the Hubbard model Mott transition

The 1D Hubbard model at half-filling has a Mott metal-insulator transition at interaction strength U/t (ratio of Coulomb repulsion to hopping). At U/t ≈ 1.8, θ_G crosses 20°.

This is the **condensed-matter side of the same snap**: the point where single-particle (mean-field) descriptions fail and dynamical correlations become essential is the same θ_G threshold seen in molecules. The mechanism is the same — the leading Schmidt singular value σ₀² drops below the 88–90% threshold — whether it's caused by chemical bond stretching or lattice electron correlations.

---

## The tropical amplituhedron

The Hartree-Fock energy is the **tropical amplituhedron**: it is the minimum energy determinant, the ground-floor energy in the space of configurations.

$$E_{\rm HF} = \min_k E_k$$

where E_k are the energies of individual determinant configurations. This is a tropical minimum — it selects the single dominant term, ignoring all others.

The correlation energy is the "volume above the tropical floor": the contribution from all the subdominant Schmidt terms. In amplituhedron language, the correlation energy is the volume of the convex hull formed by the weighted Schmidt vectors, lifted above the HF floor.

This is the condensed-matter analogue of the positive Grassmannian volume formula for scattering amplitudes. The role played by momentum twistors in high-energy physics is played by Schmidt orbital pairs in quantum chemistry.

---

## The H^k Schmidt ladder

The Schmidt singular spectrum {σ₀², σ₁², σ₂², ...} gives the ISA tier structure:

| Schmidt term | ISA tier | Physical content |
|-------------|----------|-----------------|
| σ₀² (dominant determinant) | H⁰ | Tropical fixed point, HF reference |
| σ₁² (first correction) | H¹ | TWIST — first orbital pair correlation |
| σ₂² + ... (residual) | H² | BIND — strongly correlated remainder |

The tier transitions are:
- **H⁰ → H¹** at θ_G ≈ 10°: the first correlation correction becomes significant (mild multi-reference)
- **H¹ → H²** at θ_G ≈ 20°: the strongly correlated residual dominates; single-reference fails

---

## Implications for condensed matter

The Grassmannian angle provides a single metric that spans:

- **Mott transition** (Hubbard model): θ_G snap at U/t ≈ 1.8
- **Fractional quantum Hall effect**: the Laughlin state has θ_G determined by the filling fraction ν; strongly correlated states have large θ_G
- **Weyl semimetals**: the Fermi arc surface states are geodesics on the Brillouin-zone Grassmannian
- **FeMoco (nitrogen fixation)**: the 7-iron cluster has θ_G in the H² regime; this is why its electronic structure has resisted single-reference DFT for decades

---

## The Fano connection

The paper proposes the **Fano plane** F₂^7 = Gr(3, 7) over the field with two elements as the *minimal discrete amplituhedron*. This is the smallest Grassmannian whose structure is rich enough to encode strong correlation: the 7 points of the Fano plane correspond to the 7 active orbitals of the FeMoco active site, and the 7 lines correspond to the 7 three-electron bonding interactions.

The ISA Fano register ([#419](https://doi.org/10.5281/zenodo.20773514)) is the discretisation of Gr(3, 7) to the two-element field — the skeleton on which the continuum Grassmannian hangs.

---

## What this paper does not claim

The θ_G threshold of 20° is calibrated on a small set of molecules and one lattice model. It will need systematic validation across larger chemical spaces and different model Hamiltonians before becoming a routine diagnostic. The amplituhedron analogy (Schmidt convex hull = amplitude volume) is a structural parallel, not a mathematical equivalence: the positive Grassmannian of Arkani-Hamed/Trnka and the Grassmannian used here are different objects with different positivity structures.

---

*See also:*

- [Universal Chemical Bonding](https://doi.org/10.5281/zenodo.21277821) (#570) — the three ISA bonding descriptors that emerge from the same Schmidt decomposition
- [Schrödinger on the Grassmannian](https://doi.org/10.5281/zenodo.21277819) (#568) — the action principle generating geodesics in Gr(k,n)
- [The Grassmannian as Parent of Bonding and Scattering](https://doi.org/10.5281/zenodo.21279006) (#574) — the connection to the high-energy amplituhedron programme
- [Galois Chemistry = Tropical DFT](https://doi.org/10.5281/zenodo.21224113) (#491) — the tropical (H⁰) degeneration of the same picture

*For the full technical treatment, see [doi:10.5281/zenodo.21277815](https://doi.org/10.5281/zenodo.21277815)*
