---
layout: default
title: "Every molecule is running a programme"
parent: Applications
nav_order: 2
nav_exclude: true
description: "Enzyme catalysis, nitrogen fixation, spin-crossover, and protein design are ISA programmes readable in the group-orbit language — G-step chemistry."
tags: [chemistry, biology, galois, orbits, isa, fano, nitrogen-fixation, spin-crossover, protein-design]
portfolio: E
---

# Every molecule is running a programme
{: .no_toc }

*Chemical reactions are not random collisions — they are programmes. The group
of symmetries of a molecule determines which reactions are allowed, which are
forbidden, and which require quantum mechanical tunnelling. We can read this
programme, and — in principle — write new ones.*
{: .fs-5 .fw-300 }

---

## The claim

**Chemistry is group-orbit computation.** Every chemical reaction changes the
symmetry group of the reactants. Allowed reactions are *orbit walks* — moves
that stay within the group-orbit structure of the molecular symmetry group G.
Forbidden reactions are moves that would leave the orbit without the energy
cost to pay for the symmetry change. The reaction coordinate is not a
one-dimensional energy profile along a single bond — it is a walk on the
G-orbit graph of the molecular state space.

More precisely: given a molecule with symmetry group G and a set of electronic
configurations (spin states, oxidation states, ligand fields), the possible
reactions are in bijection with the G-orbits of that configuration space. The
reaction *rate* is determined by how many G-orbit steps the reaction requires;
the reaction *selectivity* is determined by which orbits are reachable from the
ground state.

This is **G-step chemistry** (also: Galois chemistry, orbit computing applied
to molecules). It is a new computational framework for chemistry that is:

- **Parameter-free at zeroth order** — symmetry selection rules are exact,
  not approximate
- **More predictive than DFT** for spin-forbidden and spin-crossover reactions
  (where DFT struggles with the derivative discontinuity)
- **Programmable** — the ISA opcodes (ORBIT, TWIST, BIND) map directly onto
  the elementary steps of a chemical reaction

---

## Why it matters

**For chemistry:** density functional theory (DFT) — the workhorse of
computational chemistry — fails systematically for two classes of reactions:
spin-forbidden transitions (ΔS ≠ 0) and strongly correlated systems (transition
metal clusters, f-electrons). Both failures share a root cause: DFT is a
continuous, mean-field approximation that cannot represent the discrete
group-orbit structure of the molecular symmetry. G-step chemistry handles both
cases exactly at zeroth order, with DFT providing a correction rather than the
main calculation.

**For drug discovery and materials design:** if reactions are orbit walks, then
designing a catalyst means designing the G-orbit graph — choosing which orbits
to include and which transitions to allow. This is a combinatorial optimisation
problem over a discrete graph, not a continuous optimisation over a molecular
geometry. It is qualitatively easier for certain problems (spin-state engineering,
redox cofactor design) and opens new design principles invisible to geometry-only
approaches.

**For biology:** enzymes are molecular computers. The FeMo-cofactor in
nitrogenase (which fixes atmospheric nitrogen into ammonia) is a 7-iron cluster
running a specific 14-step ISA programme — identifiable opcode by opcode. The
reason nitrogen fixation is so energetically efficient (and so hard to replicate
industrially) is that the FeMo-cofactor's G-orbit graph is optimally wired for
the N₂ → 2NH₃ transformation. Understanding this as a programme suggests how
to design synthetic nitrogen-fixing catalysts.

---

## The evidence

| Paper | What it shows |
| --- | --- |
| [Paper 488](https://doi.org/10.5281/zenodo.21219706) | Galois chemistry: G-orbit theory achieves 90%/100% accuracy on L0/L1 spin-crossover benchmark vs DFT 50–85%; N₂ fixation = 14-opcode Fano programme; FeMo-cofactor as 7-qubit Galois computer |
| [Paper 489](https://doi.org/10.5281/zenodo.21219706) | Galois computing: 4th computing paradigm; G-orbit walks on molecular G-sets; 300K/decoherence-immune; Hello World levels 0–3 |
| [Paper 490](https://doi.org/10.5281/zenodo.21219706) | Galois protein design: RNR 5/5, PSII 2/4, haemoglobin Hill n_H = 3.29 (exp 2.8); Perutz mechanism = Δv = (4,2) → (6,0) |
| [Paper 491](https://doi.org/10.5281/zenodo.21219706) | Galois chemistry = tropical DFT: Wigner vertex theorem (Level-1 TPT vertex = ΔS·T, not Racah B); 20/20 on SCO benchmark; TS diagrams = tropical varieties; derivative discontinuity = tropical singularity |
| [Paper 509](https://doi.org/10.5281/zenodo.21219724) | Biochemical pathways ISA: glycolysis, Krebs, ETC, Calvin, nitrogen fixation, β-oxidation, urea cycle, FAS all expressed as ISA scripts; ORBIT vs linear efficiency; cofactor = opcode |

**Key results:**

- **Spin-crossover (SCO) benchmark:** G-orbit theory achieves 20/20 on a
  20-compound benchmark where DFT achieves 10–17/20 depending on functional.
  The key insight: the derivative discontinuity in DFT — the notorious failure
  of DFT for strongly correlated systems — is a tropical singularity in the
  G-orbit picture. It is not a numerical problem; it is a topology change.

- **Haemoglobin cooperativity:** the Hill coefficient n_H = 3.29 (experimental
  2.8) is reproduced by the Perutz mechanism expressed as a G-orbit transition
  Δv = (4,2) → (6,0) (low-spin to high-spin, 4 subunits to 6 contacts). No
  fitting parameters.

- **FeMo-cofactor:** the 7-iron cluster of nitrogenase maps onto a 7-qubit
  Galois computer. The N₂ fixation pathway is a 14-opcode ISA programme —
  the same length as a minimal Fano-plane circuit. This is not a coincidence:
  the Fano plane *is* the symmetry group of the cluster's electronic states.

- **Photosystem II design rule:** the C₁ dangler oxygen in the Mn₄CaO₅ cluster
  (the oxygen-evolving complex) is predicted to be essential for the O–O bond
  formation step. This is a falsifiable prediction: a synthetic OEC cluster
  without the dangler should fail to evolve oxygen at the observed rate.

---

## What would falsify it

- **A spin-crossover compound where G-orbit theory gives the wrong spin state**
  while DFT gives the right one, with no G-symmetry reason for the failure.
  This would show that the G-orbit approach is missing essential physics, not
  just regularising what DFT approximates.

- **The FeMo-cofactor 14-opcode assignment being wrong** — if the reaction
  pathway is re-measured (e.g. by cryo-EM on the Janus intermediate) and found
  to have a different step count or sequence, the specific ISA programme
  assignment is falsified (though the general framework need not be).

- **The PSII design rule failing** — if a synthetic OEC without the C₁ dangler
  still evolves oxygen at the observed rate, the dangler prediction is wrong.

---

## Open questions

- **Can we write new programmes?** The forward direction (read the ISA programme
  of an existing enzyme) is demonstrated. The inverse direction (specify a target
  reaction, design the G-orbit graph, synthesise a catalyst that runs it) is
  open. Paper 490 proposes a ProteinMPNN pipeline for the protein case; the
  small-molecule case is less developed.

- **What determines the step count?** Why is nitrogen fixation 14 steps and not
  12 or 16? Is there a minimality principle — an analogue of Kolmogorov
  complexity for G-orbit programmes — that predicts the optimal step count?

- **Is decoherence irrelevant by construction?** G-orbit walks are discrete
  and group-theoretically protected — they do not require quantum coherence in
  the usual sense. This is why the Galois computer operates at 300K. But there
  may be reactions where coherence *does* matter (FMO photosynthetic energy
  transfer being the leading candidate), and a unified picture is needed.

- **The G₂ extension:** for f-block chemistry (lanthanides, actinides,
  f-shell transition metals) the relevant symmetry group may be G₂ rather than
  SU(3) or SU(2). Paper 492 (Langlands for Galois Chemistry) begins this
  extension; the experiments are not yet done.

---

*See also:* [Paper 491 — Tropical DFT](https://doi.org/10.5281/zenodo.21219706) ·
[Paper 488 — Galois Chemistry](https://doi.org/10.5281/zenodo.21219706) ·
[The Non-Associative Frontier](../non-associative-frontier.md) ·
[Fano Plane](../glossary.md#fano-plane) in the Glossary
