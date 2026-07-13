--
layout: default
title: Chemistry Roadmap
nav_order: 7
---

# Chemistry Roadmap

How the ISA framework approaches chemistry — from first principles to reaction mechanisms,
without fitting parameters.

---

## The problem with the standard picture

Computational chemistry hands you a menu: Hartree-Fock, DFT, CCSD, CASSCF, FCI.
Each method makes different approximations. Choosing the right one requires
specialist expertise, and for the hardest systems — transition-metal complexes,
bond-breaking, catalytic transition states, biological electron transfer — every
commonly used method either fails silently or is prohibitively expensive.

The ISA framework does not replace these methods. It tells you *which stratum
each electron pair belongs to* before you compute anything, so you use the right
method on the right pairs automatically.

---

## The four layers

### Layer 0 — Topology: the sCeleTon

**What it is.** Given a molecule (atoms and connectivity only), draw the C/T graph:

- A **C-box** for every frozen electron pair — ionic bonds, lone pairs, core electrons.
  These pairs are closed to correlation. DFT or Hartree-Fock is exact here.
- A **T-arrow** for every active correlated pair — covalent bonds with partial
  character, resonance, multi-reference systems.
  These pairs are open and must be treated with correlated methods.

**What it costs.** Nothing beyond the Lewis structure. No basis set, no SCF
convergence, no functional.

**What it tells you.** How many T-arrows = the minimum active space size for
CASSCF. All C-boxes = H⁰, DFT is fine. A few T-arrows = H¹, CCSD will handle
it. Many T-arrows, or T-arrows with G₂ structure = H², CASSCF essential.

**The tool.** [`alchemi`](https://github.com/roguetrainer/alchemi) — builds the
sCeleTon from a molecular geometry and recommends the active space.

**Papers.** [doi:10.5281/zenodo.21300667](https://doi.org/10.5281/zenodo.21300667)
(Topological Active Space, Paper 588).

---

### Layer 1 — Geometry: θ_G and the Weyl coordinate

**What it is.** Run a cheap MP2 calculation. From the Natural Orbital Occupation
Numbers (NOONs), compute two quantities for each T-arrow pair:

- **θ_G** — the Grassmannian angle. Measures how far the ground-state wavefunction
  has moved from the single-determinant (Hartree-Fock) reference on the manifold
  Gr(n_e, n_orb). Small θ_G = ionic / weakly correlated. Large θ_G = covalent /
  strongly correlated / multi-reference.

  θ_G = 2 arccos(√(n_g / 2))

  where n_g is the NOON of the bonding orbital in the pair.

- **Weyl c₂** — the second Weyl chamber coordinate. Predicts DFT error with
  correlation r = 0.990 across all tested systems. If c₂ < δ (threshold), DFT
  or CCSD is reliable. If c₂ ≥ δ, CASSCF is required.

**What θ_G replaces.** Pauling electronegativity is a fitted table with no
geometric foundation. θ_G is a coordinate on a Riemannian manifold (the
Fubini-Study metric on the Grassmannian), computable from first principles,
that recovers the polarity ordering — LiF more ionic than HF, H₂ more covalent
than LiF — without any fitting.

**The β* snap.** At θ_G ≈ 20°, the MGE routing switches from H¹ to H².
This is the ionic → covalent crossover geometry: the point at which
NaCl transitions from Na⁺Cl⁻ to Na·Cl under bond stretching, or where
an Fe spin-crossover complex switches spin state under temperature.
The snap position is predicted, not fitted.

**Papers.** [doi:10.5281/zenodo.21277821](https://doi.org/10.5281/zenodo.21277821)
(Universal Bonding Theory, Paper 570).

---

### Layer 2 — Energetics: automatic method routing

**The routing table.** Once Layer 1 is done, each electron pair has a
stratum assignment. The router sends it to the right method:

| Stratum | θ_G | Weyl c₂ | Method | Why |
|---------|-----|---------|--------|-----|
| H⁰ (C-box) | < 5° | — | Freeze / DFT | Single-determinant exact |
| H¹ | 5°–20° | < δ | CCSD | Single-reference correlation sufficient |
| H² | > 20° | ≥ δ | CASSCF | Derivative discontinuity; DFT fails |

**What this is not.** This is not "run CASSCF on everything" — that is
expensive and unnecessary for H⁰ and H¹ pairs. It is not "use DFT on
everything" — that silently fails for H² pairs. It is the right method
for each pair, with the minimum active space identified by `flats`.

**Why DFT fails at H².** The DFT derivative discontinuity — the kink
in the exact energy at integer orbital occupancy — is exactly the β* snap
of the MGE at the Weyl c₂ threshold. DFT approximates this kink with a
smooth functional, which is why it systematically errors on spin-state
assignments, bond-breaking, and transition-metal complexes. The ISA
framework avoids approximating the kink by working in the algebraic
(tropical) regime where it is exact.

**Papers.** [doi:10.5281/zenodo.21224113](https://doi.org/10.5281/zenodo.21224113)
(Galois Chemistry as Tropical DFT, Paper 491).

---

### The routing is soft, not a decision tree

The routing table above shows hard thresholds (H⁰/H¹/H²). That is the
*β → ∞ limit* — useful as a practical summary, but not the fundamental
mechanism. The actual router is the **Maslov-Gibbs Einsum (MGE)** at
finite inverse temperature β_eff:

β_eff = Δ_HL / (corr_scale · (2S+1))

where Δ_HL is the HOMO-LUMO gap and (2S+1) is the spin multiplicity.

At finite β_eff, the MGE assigns a *continuous Boltzmann weight* over
methods — mostly DFT with a small CASSCF correction for a borderline pair,
rather than a binary choice. The hard threshold table is recovered only
at β_eff → ∞ (large gap, singlet). This is maximum-entropy inference in
the sense of Jaynes: given the evidence (c₂, spin, gap), the MGE
posterior over methods is a Boltzmann distribution, not a decision tree.

**What this means practically.** A borderline pair with c₂ just above δ
does not need full CASSCF — it needs an MGE-blended energy with β_eff
chosen from the gap. This is systematically cheaper than hard-routing
everything above the threshold to CASSCF, and more accurate than ignoring
the correlation altogether. The optimal δ* = (π/4)√α, where α = β_eff · ε
(ε = correlation energy per pair), follows from the MGE cost-accuracy
tradeoff (experiment x596e).

The routing table is for orientation. The MGE at finite β_eff is the
engine.

---

### Layer 3 — Mechanisms: Grassmannian geodesics

**For reactions, not just static molecules.** A CASSCF wavefunction is a
point on the Grassmannian Gr(n_e, n_orb). The Fubini-Study metric defines
arc-lengths between points. For a reaction R → TS → P:

- G_R, G_TS, G_P are points on Gr(k,n)
- The **reaction coordinate** is the arc-length from G_R to G_P
- **Pauling's complementarity principle** — that an enzyme active site is
  complementary to the transition state, not the substrate — is a theorem:
  G_TS is the Fubini-Study geodesic midpoint between G_R and G_P

**Catalytic Carnot efficiency.**

η_cat = 1 − arc(G_R, G_TS) / arc(G_R, G_P)

At the geodesic midpoint, η_cat = 0.500 exactly. Computed for Diels-Alder
(butadiene + ethylene → cyclohexene): η_cat = 0.503, within 0.3% of the
midpoint. This is not a fitting result — it follows from the geometry.

**Synchronous mechanism diagnostic.** When arc(G_R, G_TS) ≈ arc(G_TS, G_P),
the mechanism is synchronous and concerted. When the arcs are asymmetric,
the mechanism is stepwise. This is the first computable, basis-independent
diagnostic for reaction mechanism type.

**Papers.** [doi:10.5281/zenodo.21279006](https://doi.org/10.5281/zenodo.21279006)
(Grassmannian Bonding and Scattering, Paper 574).

---

### Layer 4 — Spectra: Racah recoupling

**For spectroscopy, no DFT required.** Given the quantum numbers produced
by Layers 0–3 (spin state S, orbital angular momentum L, symmetry group G),
compute spectroscopic observables exactly using the Racah algebra:

- **Term symbols and selection rules** — from ORBIT labels in Rep(SU(2))
- **Transition energies** — from FLOP (Wigner 6j symbol) via the Wigner-Eckart theorem
- **EPR spectra, optical spectra** — from TWIST (ribbon element) and FLOP
- **The G₂ wall** — where SU(2) seniority labelling becomes incomplete;
  Rep(G₂) provides the missing label. Occurs at the atomic f-shell (j = 7/2)
  and the nuclear 1g₉/₂ shell (j = 9/2)

**The tool.** [`spectrafold`](https://github.com/roguetrainer/spectrafold) —
Racah coefficients, Pandya transform, G₂ wall diagnosis, exact sympy arithmetic.

**Papers.** [doi:10.5281/zenodo.21219702](https://doi.org/10.5281/zenodo.21219702)
(Valence as Orbit Occupancy, Paper 487);
[doi:10.5281/zenodo.21219722](https://doi.org/10.5281/zenodo.21219722)
(Galois Chemistry, Paper 488).

---

## The roadmap as a decision tree

```
Given a molecule:

  Step 1 — Build sCeleTon (Layer 0)
    All C-boxes? ──→ H⁰: use DFT, done.
    Has T-arrows?  ──→ continue

  Step 2 — Compute θ_G and Weyl c₂ from MP2 NOONs (Layer 1)
    c₂ < δ for all T-arrows? ──→ H¹: use CCSD on T-arrows, done.
    c₂ ≥ δ for any T-arrow?  ──→ H²: continue

  Step 3 — Run CASSCF on H² T-arrows only (Layer 2)
    Active space = H² T-arrows identified by alchemi
    CCSD on remaining H¹ T-arrows
    Freeze all C-boxes

  Step 4 — Predict spectrum from quantum numbers (Layer 4)
    Use spectrafold on ORBIT labels from Step 3

  For reactions: compute Grassmannian geodesic (Layer 3)
    Arc-length = reaction coordinate
    η_cat = catalytic efficiency
```

---

## Three reader paths

**Drug designer / biochemist.** Start with Layer 3 (Pauling theorem) — this
is why your enzyme works. Then Layer 0 (sCeleTon tells you which bonds are
active in catalysis). Papers: 574, 490 (protein design).

**Computational chemist.** Start with Layer 1 (θ_G and Weyl router) — this
is the DFT failure detector you have been missing. Then Layer 2 (automatic
active-space selection). Tools: `alchemi`. Papers: 596, 588, 491.

**Theoretical chemist / physicist.** Start with the ISA zoo entries C01–C05
and S01–S05 — validated ISA programmes across chemistry and spectroscopy.
Then the categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).

---

## ISA zoo entries for chemistry

See the [ISA Zoo](zoo.md) filtered to Chemistry and Spectroscopy for the full
list of validated entries. Key entries:

| ID | System | Layer | Result |
|----|--------|-------|--------|
| [C01](isa-zoo/c01-nitrogen-fixation.md) | FeMoco N₂ fixation | 0+2 | 14-opcode programme; spin ladder confirmed |
| C02 | Fe(II) spin crossover | 0+1 | SCO gate = β* snap; 20/20 benchmark |
| S01 | TM d-shell spectroscopy | 4 | Racah exact; Tanabe-Sugano from ORBIT |
| S04 | FMO exciton dynamics | 2+4 | BIND fires at 7-BChl Fano geometry |
