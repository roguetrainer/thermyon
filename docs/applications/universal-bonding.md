---
layout: default
title: "The bond is a point on the Grassmannian"
parent: Applications
nav_order: 8
nav_exclude: true
description: "Lewis, MO, and VB bonding theories are three approximations to the same geometric object — the Schmidt decomposition of the CI matrix on the Grassmannian. Three computable ISA quantities replace the classical heuristics, and the same framework extends to nuclear bonding and scattering amplitudes."
tags: [chemistry, bonding, grassmannian, schmidt, casscf, amplituhedron, nuclear, isa, vb, mo, lewis]
portfolio: E
---

# The bond is a point on the Grassmannian
{: .no_toc }

*Lewis electron pairs, MO bond orders, and VB resonance energies are not three
different theories of bonding. They are rank-1 and rank-2 approximations to the
same geometric object — the singular value decomposition of the correlated
wavefunction on the Grassmannian. Three computable quantities replace all three
classical heuristics, and the same mathematics governs nuclear bonds and
scattering amplitudes.*
{: .fs-5 .fw-300 }

---

## The claim

**Chemical bonding has three classical theories — Lewis, molecular orbital (MO),
and valence bond (VB) — that give different answers and have no common parent.
The Grassmannian provides that parent.**

The ground-state wavefunction $|\Psi\rangle$ expressed through the singular value
decomposition of its configuration-interaction coefficient matrix $C$ gives:

$$|\Psi\rangle = \sum_k \sigma_k\,|\alpha_k\rangle|\beta_k\rangle, \qquad
\sigma_0 \geq \sigma_1 \geq \cdots \geq 0$$

where $|\alpha_k\rangle$ and $|\beta_k\rangle$ are Schmidt orbital pairs on the
Grassmannian $\mathrm{Gr}(n_e, n_{\mathrm{orb}})$.
This decomposition is exact, basis-independent, and computable from a standard
CASSCF calculation.

Three independent quantities emerge:

| ISA quantity | Formula | Replaces |
|---|---|---|
| $\theta_G = \arccos\,\sigma_0$ | Geodesic distance from HF reference | Pauling electronegativity (polarity) |
| $n_{\mathrm{bond}}$ (NOON count) | $\tfrac{1}{2}(\sum_{n_i>1} n_i - \sum_{n_i<1} n_i)$ | MO bond order (multiplicity) |
| $H_{01}$ (Galerkin coupling) | $\langle\alpha_0|\langle\beta_0|\hat{H}|\alpha_1\rangle|\beta_1\rangle$ | Hückel $\beta$ integral (resonance) |

None of these can be derived from the others. Together they subsume all three
classical theories:
- **Lewis theory** = rank-1 Schmidt approximation with $\sigma_0^2 \approx 1$ (H⁰ tier, $\theta_G < 10°$)
- **MO theory** = rank-1 approximation in canonical orbitals; bond order = NOON count at integer occupancy
- **VB theory** = rank-2 approximation with approximate $H_{01}$; the ISA computes it exactly

---

## The bridge formula

For a resonance-stabilised molecule with two dominant Schmidt structures
(bond polarity H⁰¹, overlap $S$ between the two VB structures):

$$\Delta E_{\mathrm{res}} = \tfrac{1}{2}(E_1 - E_0)(1 - S)$$

where $E_1 - E_0$ is the SA-CASSCF gap between symmetric and antisymmetric
eigenstates, and $S$ is the Pauling--Wheland overlap between the two resonance
structures. The factor $(1-S)^{-1}$ is the exact Löwdin orthogonalisation
correction — not a fit parameter.

**For benzene** (CAS(6e,6o)/aug-cc-pVDZ, SA-CASSCF over 2 roots):
- Gap $E_1 - E_0 = 141.5$~mE$_h$ (Kekulé distortion = vertical resonance energy)
- $|H_{01}^{\mathrm{Sch}}| = 70.75$~mE$_h$ (Löwdin-inflated coupling)
- $\Delta E_{\mathrm{res}} = 70.75 \times (1 - 0.23) = 54.5$~mE$_h$
- Experimental thermochemical resonance energy: $57.4$~mE$_h$ (error: 5%)
- Hückel $\beta$ recovered from first principles: $27.3$~mE$_h = 17.1$~kcal/mol

The block-localised wavefunction (BLW) vertical resonance energy ($73.7$~mE$_h$)
falls between the adiabatic ($57.4$) and VBSCF ($\sim\!135$) values, confirming
the ordering:

$$\Delta E_{\mathrm{res}}^{\mathrm{adiab}} < \Delta E_{\mathrm{res}}^{\mathrm{BLW}} < \Delta E_{\mathrm{res}}^{\mathrm{VBSCF}}$$

---

## The evidence

| Paper | What it shows |
|---|---|
| [Paper 563](https://doi.org/10.5281/zenodo.21277815) | CASSCF wavefunctions trace geodesics on $\mathrm{Gr}(n_e, n_{\mathrm{orb}})$; $\theta_G$ from Schmidt SVD; universal β* snap at $\theta_G \approx 20°$ across H₂, H₂O, N₂ |
| [Paper 568](https://doi.org/10.5281/zenodo.21277819) | Schrödinger's equation as a variational principle on the Grassmannian; Dirac–Frenkel action; Galerkin inter-channel coupling $H_{01}$ |
| [Paper 570](https://doi.org/10.5281/zenodo.21277821) | Three ISA descriptors validated for 9 systems; bridge formula; benzene RE within 5%; Lewis/MO/VB unified as Schmidt approximations |

**Key results:**
- NOON bond order within 0.15 of experiment across 9 systems (H₂, HF, LiF, CO, C₂H₄, N₂, C₂H₂, benzene, stretched H₂)
- $\theta_G$ correctly orders bond polarity: LiF ($4.8°$) < HF ($6.2°$) < CO ($11.8°$) < N₂ ($13.8°$), consistent with Pauling electronegativity sequence
- Benzene sits at the H¹/H² boundary ($18.4°$) — exactly the regime where resonance effects are largest
- All equilibrium bonds with bond order ≥ 1 sit in H⁰ or H¹; the H² tier activates only at stretched geometries or in strongly-correlated systems

---

## The H^k tier of a bond

The ISA tier is determined by $\theta_G$:

| Tier | $\theta_G$ | $\sigma_0^2$ | Character | Examples |
|---|---|---|---|---|
| H⁰ | $< 10°$ | $> 97\%$ | Ionic / single-reference | LiF, H₂ (eq.), HF |
| H¹ | $10°$–$20°$ | $88$–$97\%$ | Covalent, weakly correlated | N₂, CO, benzene |
| H² | $> 20°$ | $< 88\%$ | Multi-reference, bond-breaking | Stretched H₂, transition-metal clusters |

The β* snap at $\theta_G \approx 20°$ is the computational threshold: below it,
single-reference methods (HF, DFT) are sufficient; above it, multi-reference
CASSCF is mandatory. This is the ISA derivation of why DFT fails for strongly
correlated systems — it is not a numerical deficiency but a topological one:
the wavefunction has crossed the H¹/H² boundary.

---

## Extension to nuclear bonding

The same framework extends beyond chemistry. The nucleon–nucleon bond in the
deuteron has $^3S_1 + ^3D_1$ mixing from the tensor force, giving
$\theta_G \approx 14°$ (weakly H²). But unlike electronic bonds, nuclear bonds
are **intrinsically H²**: the tensor force $S_{12}$ is a trivalent BIND vertex
coupling three angular momenta (the strong force is non-Abelian), so BIND is
mandatory even for the simplest nuclear bond. There is no nuclear analogue of
the H⁰ Lewis bond — SU(3) colour forces every nucleon–nucleon interaction into
the H² sector.

The three ISA bonding descriptors have nuclear counterparts:
- $\theta_G \approx 14°$ (deuteron, from D-state probability $P_D \approx 5.8\%$)
- $n_{\mathrm{bond}} = 1$ (one NN bond)
- $H_{01}^{\mathrm{nuclear}} = \langle ^3D_1|V_T|^3S_1\rangle \approx -25$~MeV (tensor force matrix element, $\sim\!13000\times$ the chemical scale)

See Paper 575 (in preparation) for a detailed treatment.

---

## Extension to scattering amplitudes

The Grassmannian $\mathrm{Gr}(k,n)$ that parametrises CASSCF wavefunctions is
the same family of spaces used in the amplituhedron programme of Arkani-Hamed
and Trnka. The ISA bonding descriptors have exact amplitude counterparts:

| ISA bonding | Scattering amplitude | Common structure |
|---|---|---|
| $\theta_G$ | Momentum twistor coordinate | Geodesic distance on $\mathrm{Gr}(k,n)$ |
| $n_{\mathrm{bond}}$ (NOON) | Leading singularity | ORBIT count on $\mathrm{Gr}(k,n)$ |
| $H_{01}$ (Galerkin) | Residue at factorisation channel | Galerkin projection on $\mathrm{Gr}(k,n)$ |
| β* snap ($\theta_G \approx 20°$) | Spurious-pole degeneration | Tropical singularity of the volume form |

The tropical limit ($\beta \to \infty$) of the positive Grassmannian gives the
leading-singularity approximation to amplitudes — exactly as the HF reference
(tropical fixed point) gives the leading-determinant approximation to wavefunctions.

This connection — which we are actively developing — suggests that quantum chemistry
and particle physics are running the same ISA programme on different physical
hardware, at energy scales separated by 13 orders of magnitude. See Paper 574 (in preparation) for the detailed dictionary.

---

## What would falsify it

- **A bond whose NOON order disagrees with experiment by more than 0.3** (at CASSCF
  level with appropriate active space) while the G-orbit assignment is qualitatively
  correct. This would indicate the three-descriptor framework misses a bonding
  contribution.

- **The bridge formula failing for a non-benzenoid aromatic** (azulene, pyrene,
  coronene) by more than 15%. The formula is derived for a two-structure VB model;
  polyaromatic systems have more resonance structures and the rank-2 approximation
  may not hold.

- **The ionic/covalent crossover in NaCl not appearing at $\theta_G \approx 20°$**
  during dissociation. This is the key prediction of the β* snap identification
  (experiment x570c, in progress).

- **The nuclear bridge formula failing for the deuteron** — i.e., the tensor force
  matrix element not satisfying the analogue of $\Delta E_{\mathrm{res}} = \tfrac{1}{2}(E_1-E_0)(1-S)$ — would show that the nuclear extension is not a straightforward transplant of the chemical framework.

---

## Open questions

- **Three-centre, two-electron bonds:** H₃⁺ has its CI matrix on
  $\mathrm{Gr}(2,3) \cong \mathbb{R}P^2$. The FeMoco active site of nitrogenase
  may be a Fano-plane register $\mathrm{Gr}(3,7)_{\mathbb{F}_2}$ of seven 3c-2e bonds.

- **Metallic bonding:** as system size $N \to \infty$, $\theta_G \to 45°$ and
  $\sigma_0^2 \to 1/N$ — the metallic bond is deep H². The Zak phase of Schmidt
  orbitals around the Brillouin zone is a BIND opcode; topological metals should
  have non-zero BIND holonomy.

- **Machine learning force fields:** the three ISA bonding descriptors
  ($\theta_G$, NOON, $H_{01}$) are computable from CASSCF and could serve as
  physics-informed features for ML potentials, replacing the empirical many-body
  expansions currently used.

---

*See also:*
[Every molecule is running a programme](molecular-computation.md) ·
[The H^k stratification is not an analogy](stratification-principle.md) ·
[Paper 570 — Universal Bonding Theory](https://doi.org/10.5281/zenodo.21277821) ·
[Paper 568 — Grassmannian Action](https://doi.org/10.5281/zenodo.21277819)
