---
layout: default
title: "Nature runs information-geometric Carnot cycles"
parent: Applications
nav_order: 10
nav_exclude: true
description: "Every biological fidelity machine and every enzyme catalytic cycle operates a four-leg information-geometric Carnot cycle between a high-surprise reservoir and a low-surprise reservoir, with the adiabatic leg enforced by parallel transport on the Grassmannian."
tags: [carnot-cycle, information-geometry, grassmannian, parallel-transport, proofreading, catalysis, biology, surprise, entropy, fisher-metric, beta-star, h1, h2, trs-framework]
portfolio: B|E
---

# Nature runs information-geometric Carnot cycles
{: .no_toc }

*Proofreading enzymes and catalytic enzymes are both heat engines — but the
working fluid is a probability distribution, not a gas. The hot reservoir is
high surprise (many possibilities); the cold reservoir is low surprise (one
outcome). The adiabatic leg — the step that costs nothing but moves the
system furthest — is parallel transport on the Grassmannian of orbital
subspaces. The β\* snap is the engine's operating point.*
{: .fs-5 .fw-300 }

---

## The claim

**Every biological molecular machine that achieves fidelity or catalytic
efficiency beyond thermodynamic equilibrium operates a four-leg
information-geometric Carnot cycle (IG CC) between a source and a sink of
surprise.**

The cycle is not a metaphor for thermodynamics — it *is* thermodynamics,
formulated on the statistical manifold of probability distributions rather
than on the ideal-gas state space. The two reservoirs are:

- **High-surprise reservoir** (hot): the prior distribution over possible
  substrates or orbital configurations, before any selection. Entropy is
  high; no particular outcome is likely. Inverse temperature β is small.
- **Low-surprise reservoir** (cold): the posterior distribution after
  selection and commitment. Entropy is low; one outcome dominates.
  Inverse temperature β is large.

The engine extracts work — discrimination (proofreading) or barrier reduction
(catalysis) — by running a four-leg cycle between these reservoirs:

| Leg | Thermodynamic type | Biological realisation | ISA opcode |
| --- | --- | --- | --- |
| 1 | Isothermal compression | Substrate binding / geometric selection | TWIST |
| 2 | Adiabatic expansion | Conformational change / parallel transport | ORBIT |
| 3 | Isothermal expansion | Proofreading checkpoint / product release | FLIP/SPLAT |
| 4 | Adiabatic compression | Commitment / enzyme reset | ORBIT |

The Carnot efficiency is:

    η = 1 − S_cold / S_hot = 1 − H(p_post) / H(p_prior)

where H is Shannon entropy. A perfect Carnot enzyme has η → 1: it converts
all the surprise difference into useful work (discrimination or catalysis)
with no dissipation.

---

## Why it matters

**It explains why β ≈ β\* is the universal operating point for biological
molecular machines.**

The β\* snap threshold is where the isothermal leg of the IG CC transitions
from the H⁰ (no discrimination, engine stalled) to the H¹ (active
discrimination, engine running) regime:

- At β < β\*: the engine cannot distinguish correct from incorrect substrates
  on leg 1. The isothermal leg produces no entropy decrease. The cycle
  produces no work. Proofreading fails; catalysis stalls.
- At β ≈ β\*: the engine operates at its Carnot point — maximum work per
  unit energy consumed.
- At β >> β\*: the engine wastes energy waiting for substrates that are
  already certain. Proofreading becomes energy-inefficient; the enzyme
  is too slow.

Natural selection drives β → β\* from both sides: organisms with β < β\*
make too many errors (lethal above some genome size); organisms with β >> β\*
waste too much ATP (metabolic cost too high). The observed operating points
of DNA polymerase, RNA polymerase, and the ribosome — all near β\* — are
the thermodynamic signature of Carnot-optimised engines.

**It identifies the adiabatic leg as the key enzymatic contribution.**

In solution (without enzyme), a chemical reaction follows a non-geodesic path
between reactant and product on the Grassmannian Gr(n_e, n_orb) — a path with
high entropy production and therefore high activation barrier. The enzyme
enforces the geodesic: its active site, shaped to be complementary to the
transition-state geometry (Pauling's principle), holds the orbital subspace on
the geodesic between G_R and G_P via parallel transport in the Fubini-Study
metric. The activation barrier ΔG‡ is precisely the cost of *not* taking the
geodesic — the difference between the actual path entropy and the parallel-transport
path entropy. A perfect enzyme reduces ΔG‡ to zero on leg 2 by enforcing
exact parallel transport.

---

## The evidence

### Proofreading machines (Paper 510)

The three biological replication machines implement the IG CC at different
levels of the H^k hierarchy:

| Machine | H^k tiers active | Efficiency per tier | Total fidelity |
| --- | --- | --- | --- |
| DNA polymerase III | H⁰ × H¹ × H² | ~10³ × ~10³ × ~10³ | ~10⁹ ✓ |
| RNA polymerase | H⁰ × H¹ | ~10³ × ~10³ | ~10⁶ ✓ |
| Ribosome | H⁰ (×3 geometric) × H¹ | ~10³ × ~10 | ~10⁴ ✓ |

The ribosome wobble position (β\*_pos3 < 0.5 vs β\*_pos1,2 ≈ 0.5) is the
biological implementation of the broken symmetry in the 6-731 topology of
Paper 325: the designed asymmetry that allows the Carnot engine to run. A
ribosome with three equally strong codon positions would have η = 0 —
consistent with the Paper 325 uniqueness theorem (symmetric topology → η = 0).

### The 6-731 topological heat engine (Paper 325)

The IG CC for the 6-731 broken-Fano graph has been worked out explicitly:

- β_hot = 0.5, β_cold = 4.0, J_weak/J_strong ≈ 0.10–0.18 (robustness plateau)
- Peak efficiency η = 0.1897 at J_weak/J_strong = 0.005
- Biological machines (FMO, ribosome, motor proteins) operate in the robustness
  plateau at η ≈ 0.18

The uniqueness theorem of Paper 325 proves that among all connected 7-node
graphs with fixed mean edge weight, the 6-731 topology is the *unique* one
with η > 0. All symmetric topologies (full Fano, K₇) have η = 0.

### Catalytic efficiency on the Grassmannian (Paper 574)

The IG CC for enzyme catalysis identifies the adiabatic leg with parallel
transport on Gr(n_e, n_orb):

- Reactant G_R and product G_P are points on the Grassmannian
- The transition state G_TS lies on the geodesic between them (Pauling
  complementarity = geodesic midpoint condition)
- The enzyme enforces leg 2 (adiabatic) as parallel transport in the
  Fubini-Study metric, reducing activation entropy to zero on that leg
- Catalytic efficiency η_cat = 1 − θ_G(G_R, G_TS) / θ_G(G_R, G_P)

The proposed experiment x574d (CASSCF on FeMoco at three geometries: free N₂,
transition-state complex, 2NH₃) would verify that η_cat ≈ η_thermo for
nitrogen fixation — a quantitative test of the Carnot-optimal enzyme claim.

---

## The geometric picture

The IG CC lives on the statistical manifold M of probability distributions
over substrate or orbital configurations, equipped with the Fisher information
metric g_ij = E[∂_i log p · ∂_j log p]. The four legs are:

- **Legs 1 and 3** (isothermal): curves of constant β on M. The distribution
  evolves along the steepest-descent direction of the KL divergence from the
  equilibrium distribution at that β. Entropy decreases (leg 1) or increases
  (leg 3).
- **Legs 2 and 4** (adiabatic): curves of constant entropy on M. The
  distribution is parallel-transported in the Fisher metric — its shape changes
  but its entropy does not. On the Grassmannian, this is the Levi-Civita
  connection of the Fubini-Study metric.

The area enclosed by the four legs in the (β, S) plane is the work extracted
per cycle. Maximising this area subject to the constraint of fixed S_hot and
S_cold gives the Carnot efficiency η = 1 − S_cold/S_hot — the same formula
as classical Carnot, but with entropy now measured in nats over the
statistical manifold.

---

## Connection to prior art

The general idea of a thermodynamic cycle on a statistical manifold is
moderately established (Crooks 2007, Ito 2017, Souriau 2024) — see §Literature
below. What is new here:

1. **The Grassmannian as the specific statistical manifold** for both
   proofreading and catalysis. Prior work uses generic exponential families
   or abstract Riemannian manifolds; we identify the specific manifold
   (orbital subspace space = Gr(n_e, n_orb)) and the specific metric
   (Fubini-Study = Fisher for Gaussian states on orbital space).

2. **The four-leg identification in biological machines.** Prior work on
   kinetic proofreading (Hopfield 1974) identifies the irreversible step but
   does not identify the four-leg thermodynamic structure or the adiabatic legs.

3. **Pauling complementarity = geodesic midpoint condition.** This appears
   to be new: the enzyme active site is complementary to the transition state
   because G_TS is the Fubini-Study midpoint of the geodesic from G_R to G_P,
   and "complementarity" is the condition that the enzyme's orbital subspace
   matches G_TS.

4. **The β\* snap as the engine's operating point.** Prior IG thermodynamics
   does not identify a universal β\* threshold; the ISA β\* snap provides this.

---

## What would falsify it

- **A high-fidelity proofreading machine that does not operate near β\*.** If
  DNA polymerase were shown to operate at β >> β\* with no metabolic cost
  penalty, the Carnot-optimal operating-point prediction is wrong.

- **An enzyme whose active site is not complementary to the transition state.**
  Pauling's principle is well-established experimentally, but if a catalytic
  enzyme were found whose active site is complementary to the substrate (not
  the TS), the geodesic midpoint identification fails.

- **The Fubini-Study metric giving a different geodesic than the actual
  reaction path.** x574d tests this for FeMoco. If η_cat and η_thermo disagree
  by more than measurement uncertainty, either the Grassmannian identification
  or the Carnot efficiency formula is wrong for this system.

---

## Open questions

- **Is there an IG CC operating point for artificial enzymes?** Directed
  evolution tunes kcat/KM; the IG CC predicts this is equivalent to tuning
  β toward β\*. Can we design enzymes by targeting the Carnot-optimal active-site
  geometry explicitly?

- **Does the IG CC extend to the immune system?** T-cell receptor discrimination
  between self and non-self achieves extraordinary specificity (~1 non-self
  among 10⁵ self peptides). This looks like a proofreading IG CC with H⁰ (MHC
  geometry) × H¹ (kinetic proofreading via CD3 phosphorylation cascade) × H²
  (clonal selection). The four legs and the β\* operating point have not been
  identified for TCR.

- **Is there an IG CC for RNA folding?** RNA folds co-transcriptionally, so
  the "substrate" is the growing strand and the "product" is the native fold.
  The IG CC would run between a high-surprise (unfolded) and a low-surprise
  (native) distribution on the Grassmannian of secondary-structure subspaces.
  The adiabatic leg would be the helix nucleation step (parallel transport
  through a low-entropy intermediate).

- **What is the minimum η for a functional enzyme?** Below some threshold η_min,
  the engine extracts insufficient work to overcome thermal noise and catalysis
  fails. Is η_min universal, or does it depend on the reaction type (oxidation,
  hydrolysis, transfer)?

---

## Literature

- Crooks (2007) "Measuring thermodynamic length" — Fisher metric on thermodynamic
  state space; geodesics minimise dissipation
- Ito (2017) arXiv:1712.04311 — stochastic thermodynamics and information geometry;
  uncertainty relations as geometric inequalities
- Souriau (2024) — Carnot's second principle via symplectic geometry and Pfaff foliations
- Hopfield (1974) *J. Mol. Biol.* 105:197 — kinetic proofreading; the irreversible step
- Pauling (1948) *Nature* 161:707 — enzyme complementarity to transition state
- Buckley, Paper 325 — The 6-731 IG Carnot cycle; uniqueness theorem; η ≈ 0.18
- Buckley, Paper 510 — Proofreading as QEC; four-leg IG CC; β\* operating point
- Buckley, Paper 574 — Catalysis as parallel transport on Gr(n_e, n_orb); x574d proposed

---

*See also:*
[Biology runs quantum error correction](biological-qec.md) ·
[The Grassmannian is the universal space for correlated systems](grassmannian-universality.md) ·
[β is a coordinate](beta-plane.md) ·
[The Fano crystal is universal](fano-crystal.md) — Paper 325 is the Fano instance of the IG CC
