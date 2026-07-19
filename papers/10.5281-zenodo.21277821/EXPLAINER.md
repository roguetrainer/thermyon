---
layout: default
title: "One calculation, three theories of bonding"
parent: Explainers
nav_exclude: true
tags: [chemical-bonding, grassmannian, schmidt-decomposition, casscf, lewis-theory, mo-theory, vb-theory, resonance, benzene, h-k-ladder, trs-framework, quantum-chemistry]
portfolio: A
---

## One calculation, three theories of bonding

*Plain-language explainer for [doi:10.5281/zenodo.21277821](https://doi.org/10.5281/zenodo.21277821) (#570)*

---

## The problem: three theories that never agree

Every chemistry student learns three ways to think about a chemical bond:

- **Lewis theory** (1916): bonds are electron pairs. H₂ has one pair → one bond.
- **Molecular orbital (MO) theory**: electrons delocalise over the whole molecule in bonding and antibonding orbitals. Bond order = (bonding − antibonding)/2.
- **Valence bond (VB) theory**: the wavefunction is a superposition of localised electron structures. For benzene: two Kekulé structures, stabilised by resonance.

Each theory answers a different question. Lewis gives you connectivity. MO gives you bond order and orbital energies. VB gives you resonance stabilisation. But none of them tells you when the others apply, and when they disagree there's no referee.

This paper provides the referee: the **Schmidt decomposition of the configuration-interaction matrix** on the Grassmannian.

---

## The Grassmannian as the common home

The quantum state of a molecule's electrons can be written as a matrix C whose rows label one set of electron configurations and whose columns label another. Singular-value decomposition (SVD) of C gives:

$$
|\Psi\rangle = \sigma_0\,|\alpha_0\rangle|\beta_0\rangle + \sigma_1\,|\alpha_1\rangle|\beta_1\rangle + \cdots
$$

This is the **Schmidt decomposition**. The singular values σ₀ ≥ σ₁ ≥ ... tell you how much each pair of orbital configurations contributes. The space of all possible configurations — all possible k-dimensional subspaces of orbital space — is the Grassmannian Gr(k, n).

Three numbers come out of this single decomposition, and they are independent of each other:

---

## The three ISA bonding descriptors

### 1. θ_G — bond polarity and multi-reference character

$$\theta_G = \arccos(\sigma_0)$$

This is the geodesic distance from the Hartree-Fock reference point to the true ground state on the Grassmannian. At θ_G = 0, one configuration dominates completely (single-reference, Lewis-like). As θ_G grows, correlation becomes important.

**ISA tier assignment:**

| θ_G range | σ₀² | Tier | Regime |
|-----------|------|------|--------|
| < 10° | > 0.97 | H⁰ | Lewis/ionic, single-reference |
| 10°–20° | 0.88–0.97 | H¹ | Covalent, mild correlation |
| > 20° | < 0.88 | H² | Strongly correlated, bond breaking |

θ_G correctly orders bond polarity for all nine test systems in the paper: LiF (4.8°, most ionic) < H₂ (6.2°) < CO (11.8°) < N₂ (13.8°) < benzene π-bond (18.4°) < stretched H₂ at R=4Å (45°, biradical). This matches the Pauling electronegativity sequence but is derived from the full correlated wavefunction, not an empirical table.

### 2. n_bond — bond order from natural orbital occupancies (NOONs)

The one-particle density matrix γ has eigenvalues {nᵢ} — the natural orbital occupation numbers (NOONs). In a bonding/antibonding basis: bonding NOONs satisfy nᵢ > 1, antibonding NOONs satisfy nᵢ < 1.

$$n_{\rm bond} = \tfrac{1}{2}\!\left(\sum_{n_i>1} n_i - \sum_{n_i<1} n_i\right)$$

At the Hartree-Fock level all NOONs are 0 or 2, and this reduces exactly to the standard MO bond order formula. With correlation, NOONs shift away from integers — the NOON formula accounts for this automatically.

Agreement with experiment across nine systems: within 0.15 of a bond order unit, including the challenging cases (benzene π: 1.46 vs. 1.5 exp.; biradical H₂: 0.00 vs. 0.0 exp.; triple bonds N₂: 2.87 vs. 3.0 exp.).

### 3. H₀₁ — resonance stabilisation energy

When two Schmidt pairs contribute significantly (r = 2), the wavefunction is a superposition of two VB-like structures. The Galerkin coupling between them is:

$$
H_{01} = \langle\alpha_0|\langle\beta_0|\hat{H}|\alpha_1\rangle|\beta_1\rangle
$$

This is the **Löwdin-orthogonalised** VB resonance integral. It connects to the experimental resonance energy via the **bridge formula**:

$$\Delta E_{\rm res} = \tfrac{1}{2}(E_1 - E_0)(1-S)$$

where E₁ − E₀ is the SA-CASSCF energy gap between symmetric and antisymmetric roots, and S ≈ 0.23 is the Pauling-Wheland overlap between Kekulé structures. The factor (1 − S)⁻¹ = 1.30 is not fitted — it is the exact Löwdin orthogonalisation correction.

---

## Benzene: the test case

SA-CASSCF with a π-only CAS(6e,6o) active space gives:

- E₁ − E₀ = 141.5 mEh (the Kekulé distortion energy)
- coupling matrix element H₀₁ = 70.75 mEh
- Bridge formula with S = 0.23: ΔE_res = 54.5 mEh = 34.2 kcal/mol
- **Experiment: 57.4 mEh = 36.0 kcal/mol — error 5%**

The Hückel β parameter falls out as a prediction: β = ΔE_res/2 = 17.1 kcal/mol, within the empirical range 16–18 kcal/mol. No fitting.

The energy hierarchy is also predicted: adiabatic resonance energy (57 mEh) < BLW vertical (74 mEh) < VBSCF (∼135 mEh). This ordering follows from the Schmidt framework — adiabatic uses the relaxed delocalised geometry, BLW freezes Kekulé orbital sets, VBSCF maximises the energy of one localised structure.

---

## The unification table

| Theory | ISA tier | Schmidt rank | What it captures | Fails when |
|--------|----------|-------------|-----------------|------------|
| Lewis | H⁰ | r = 1, σ₀² ≈ 1 | Electron pairs, connectivity | θ_G > 10°, resonance |
| MO (HF) | H⁰/H¹ | r = 1, delocalised | Bond order | θ_G > 20°, bond breaking |
| VB | H¹/H² | r = 2 | Resonance energy | Many structures, large active spaces |
| CASSCF | H⁰–H² | r = r_eff | All three | Active space truncation only |

Lewis, MO, and VB are not competing theories — they are rank-1 and rank-2 approximations to the same Schmidt decomposition. The ISA provides the criterion for when each applies: the θ_G angle tells you which tier you're in, and therefore which theories are adequate.

---

## Connection to earlier papers

The three descriptors connect directly to the ISA opcode hierarchy:

- **θ_G** (ORBIT) — how far the fixed point is from single-reference; the tropical floor
- **n_bond** (TWIST) — the phase accumulated around the bonding loop; Berry phase of the bond
- **H₀₁** (BIND) — the non-Abelian coupling between Schmidt channels; the resonance holonomy

The same Grassmannian geometry governs QEC ([#577](https://doi.org/10.5281/zenodo.21284199)), nuclear bonding ([#575](https://doi.org/10.5281/zenodo.21279217)), and scattering amplitudes ([#574](https://doi.org/10.5281/zenodo.21279006)) — the Fubini-Study metric and the β* snap at θ_G ≈ 20° are universal.

---

## What this paper does not claim

The θ_G thresholds (10°/20°) are calibrated on small molecules at the CASSCF/cc-pVDZ level. They will shift somewhat for larger active spaces, different basis sets, and different chemical classes. The bridge formula with S = 0.23 uses a literature value for the Kekulé overlap — an independent computation of S from first principles is an open experiment.

---

*See also:*

- [Schrödinger on the Grassmannian](https://doi.org/10.5281/zenodo.21277819) (#568) — the action principle that generates geodesics
- [QEC as Grassmannian parallel transport](https://doi.org/10.5281/zenodo.21284199) (#577) — the same geometry in quantum computing
- [Valence as Orbit Occupancy](https://doi.org/10.5281/zenodo.21219722) (#487) — the NOON bond order in the context of the periodic table
- [The Forge ISA](https://doi.org/10.5281/zenodo.20773514) (#419) — the ORBIT/TWIST/BIND opcodes

*For the full technical treatment, see [doi:10.5281/zenodo.21277821](https://doi.org/10.5281/zenodo.21277821)*
