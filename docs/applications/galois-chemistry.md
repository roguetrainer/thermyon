---
layout: default
title: "Every molecule runs a Galois programme"
parent: Applications
nav_order: 8
nav_exclude: true
description: "The spin state, valence, and catalytic barrier of any transition-metal complex are determined by G-orbit walks on its molecular G-set — computable in O(1), without DFT, at 300 K."
tags: [galois-chemistry, g-orbit, transition-metals, spin-crossover, catalysis, haber-bosch, fano, isa, dft]
portfolio: A
---

# Every molecule runs a Galois programme
{: .no_toc }

*The spin state, valence, and catalytic barrier of any transition-metal complex
are determined by G-orbit walks on its molecular G-set — computable in O(1),
without DFT, at room temperature.*
{: .fs-5 .fw-300 }

---

## The claim

**Molecules compute.** A transition-metal complex is not a passive arrangement
of atoms — it is a computing device that evaluates a programme determined by its
symmetry group G acting on its set of electron configurations. The output is the
spin state, the bond order, the reaction rate.

The programme is a **G-orbit walk**: a sequence of group-orbit closures on the
molecular G-set. Each step costs one ISA opcode. The total programme length is
the number of opcodes; the ground state is the orbit that closes first.

Three quantities are computable in O(1) from the orbit structure alone, without
solving the Schrödinger equation:

1. **Spin state** — which orbit in the d-electron manifold is closed determines
   whether the complex is high-spin or low-spin. This is the spin-crossover
   (SCO) threshold as a discrete orbit condition.

2. **Valence** — the number of open orbits in the bonding manifold equals the
   bond order. Aufbau, Hund's rules, and the Taube electron-transfer rules are
   theorems, not empirical generalisations.

3. **Catalytic barrier** — the barrier to a reaction at a transition-metal
   centre is the cost of the TWIST opcode at the spin-state crossing between
   reactant and product orbit configurations. The Brønsted-Evans-Polanyi (BEP)
   linear scaling relation is the ISA opcode cost scaling law.

---

## Why it matters

**DFT has failed for 50 years to deliver a better Haber-Bosch catalyst.** The
global ammonia synthesis process (N₂ + 3H₂ → 2NH₃) consumes ~1.5% of global
energy, feeds half the world's population, and has run on the same promoted-iron
catalyst since 1909. DFT (GGA-PBE) predicts the N₂ dissociation barrier with
an error of 0.3–0.5 eV — equivalent to a factor of 10⁵ in reaction rate at
500 K via the Arrhenius equation. This is why DFT alone has not found a better
catalyst despite enormous investment.

The ISA diagnosis: the N₂ dissociation step on Fe(111) is a spin-state crossing
— a TWIST opcode. DFT fails here for exactly the same reason it fails for
molecular spin-crossover complexes: the derivative discontinuity at the
spin-state transition point. The ISA identifies this crossing as a tropical
vertex and provides the barrier energy from orbit-stability theory, without
DFT+U parameter fitting.

**The commercial consequence:** a catalyst design rule that predicts, without
fitting, which Fe surface promoter loadings and which secondary metals optimise
the N₂ dissociation barrier would be immediately commercialisable. The global
ammonia market exceeds $70B/year. This is the target of Paper 562.

Beyond catalysis: Fe(II) spin-crossover complexes are candidates for molecular
memory and switching devices. The ISA's O(1) prediction of the SCO threshold
— validated at 90% accuracy on the Paper 488 benchmark — means rational design
of SCO materials without DFT ensemble runs.

---

## The evidence

| Paper | What it shows |
| --- | --- |
| [Paper 488](https://doi.org/10.5281/zenodo.21219720) | G-walk Chemistry: Fe(II) SCO as a TWIST gate; 90% accuracy on L0 benchmark without DFT |
| [Paper 489](https://doi.org/10.5281/zenodo.21219722) | Galois Computing: G-orbit walks as the 4th computing paradigm; 300 K / decoherence-immune |
| [Paper 490](https://doi.org/10.5281/zenodo.21219724) | Galois Protein Design: Aufbau/Hund/Taube as ISA theorems; RNR 5/5, PSII 2/4, Hb Hill n_H = 3.29 |
| [Paper 491](https://doi.org/10.5281/zenodo.21224113) | Galois Chemistry = Tropical DFT: Wigner vertex theorem; TS diagrams = tropical varieties; derivative discontinuity = tropical singularity; 20/20 on SCO benchmark |
| [Paper 492](https://doi.org/10.5281/zenodo.21224115) | Langlands for Galois Chemistry: G-local system on molecular graph; BEP slope = Whittaker function |
| Paper 562 | Haber-Bosch ISA: Fe B₅ site spin-state crossing = TWIST opcode; barrier = tropical vertex energy; promoter loading = β* condition |

**Key experiment:** x562a (running July 2026) — Fe₅ cluster model of the
Fe(111) B₅ active site. UHF→UMP2→CASSCF(ISA) at three geometries along the
N₂ dissociation path. The NOON spectrum is predicted to collapse from H¹
(clean surface, high-spin) to deep H² (transition state) — confirming the TWIST
opcode fires at the barrier.

---

## The Grassmannian connection

The ISA active space selection (x560c, Paper 560) is itself a Grassmannian
computation: the occupied-orbital manifold is a point in $\mathrm{Gr}(N_e,
N_\mathrm{orb})$, and the NOON stratification identifies the geodesic distance
from the Hartree-Fock reference. The TWIST opcode fires when this distance
crosses the β* threshold θ_G ≈ 20° — the same threshold that separates
single-reference from multi-reference in molecular bonding (Paper 570), Mott
transitions in lattice models (Paper 563), and QEC threshold failure (Paper 577).

The Haber-Bosch N₂ dissociation is the **heterogeneous catalysis member** of
this universal Grassmannian family. The β* snap at the B₅ site is the same
geometric event as the bond-breaking snap in H₂ at R ≈ 1.5 Å and the Mott
transition at U/t ≈ 1.8.

---

## What would falsify it

The G-orbit claim is falsified if:

- A transition-metal complex is found whose spin state cannot be determined from
  the orbit structure of its d-electron manifold — i.e., the spin state changes
  without any change in orbit occupancy.
- The Haber-Bosch CASSCF(ISA) barrier (x562a) is more than 0.2 eV from the
  experimental value, after the cluster model finite-size effects are accounted
  for — which would mean the TWIST opcode cost is not a reliable barrier predictor.
- DFT+U with a carefully fitted U parameter is shown to give systematically
  better barriers than CASSCF(ISA) across the SCO benchmark of Paper 491 —
  which would mean the O(1) ISA prediction adds nothing beyond empirical fitting.

---

## Open questions

- **Can the BEP slope be derived analytically from ISA opcode cost scaling?**
  The linear BEP relation (barrier ∝ adsorption energy) is empirical across all
  transition metals. If it follows from the TWIST opcode cost being a linear
  function of the orbit-occupancy change, that is a fundamental derivation of a
  century-old empirical law.
- **What is the optimal promoter loading for Fe-based HB catalysts?**
  The ISA prediction (Paper 562, x562b): the β* optimal K loading maximises
  the number of H² Fe 3d orbitals at the B₅ site. Can this be verified
  experimentally?
- **Does the G-orbit walk generalise to heterogeneous alloy surfaces?**
  Fe-Co, Fe-Ru, Fe-Re alloys have mixed coordination environments. The ISA
  opcode cost (TWIST cost at the B₅-equivalent site) should still predict the
  activity ordering — but the orbit structure of a multi-metal site is richer.

---

*See also:*
[Paper 491 (Galois Chemistry = Tropical DFT)](https://doi.org/10.5281/zenodo.21224113) ·
[Paper 488 (G-walk Chemistry)](https://doi.org/10.5281/zenodo.21219720) ·
[The Grassmannian is universal](grassmannian-universality.md)
