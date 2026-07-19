---
layout: default
title: "Designing Proteins by Writing Programmes"
parent: Explainers
nav_exclude: true
tags: [g-walk-protein-design, metalloenzyme, alphafold, proteinmpnn, haemoglobin, psii, rnr, orbit-design, catalysis, photosystem-ii, nitrogenase, cooperativity, hill-coefficient]
portfolio: A
---

## If You Know What a Protein Computes, You Can Design One That Computes It

*Plain-language explainer for [doi:10.5281/zenodo.21224111](https://doi.org/10.5281/zenodo.21224111) (#490)*

---

## The central idea in one sentence

Every metalloenzyme executes a short programme over its metal cofactor — expressed in the seven-opcode G-Walk instruction set — and knowing that programme is sufficient to design a new protein sequence that runs it.

---

## Two problems that look unrelated

Ask a biochemist how haemoglobin works and she will describe the Perutz mechanism: four iron-haem groups, oxygen binding at one site triggers a conformational change that makes the next site bind more easily — cooperativity. Ask her how to design a new cooperative oxygen-binding protein and she will say: directed evolution, thousands of screening rounds, years of work.

Ask an AlphaFold user where the atoms in haemoglobin sit and she will get a high-resolution answer in seconds. Ask where to put the atoms in a protein that has been designed to bind oxygen cooperatively with Hill coefficient $n_H > 3$ — and AlphaFold has nothing to say, because it is a structure predictor, not a design tool.

The missing ingredient is a level of description between "structure" and "function": a *programme*. This paper introduces that level and shows how to use it in both directions.

---

## The G-Walk programme of a metalloenzyme

A metalloenzyme is built around a metal cofactor — an iron cluster, a manganese complex, a copper site. The metal atoms sit in a specific geometric arrangement that determines the site symmetry group $G$: the set of rotations and reflections that leave the metal cluster invariant. Under this symmetry, the metal's valence electrons are not all equivalent — they split into *orbits*, groups of electron slots that are related to each other by the symmetry operations.

The *orbit occupancy vector* $\mathbf{v} = (v_1, \ldots, v_k)$ records how many of the available slots in each orbit are occupied. As the enzyme runs its catalytic cycle, electrons arrive and depart, bonds form and break, the spin state changes — and the orbit occupancy vector steps through a sequence of values. That sequence is the G-Walk programme, written in seven opcodes:

- **FLIP** — electron gain (reduction)
- **FLOP** — electron loss (oxidation)
- **SPLIT** — bond cleavage
- **SPLAT** — bond formation
- **TWIST** — spin-state change (spin crossover)
- **LABEL** — group transfer (a chemical tag is attached or detached)
- **ORBIT** — catalytic cycle closure (the register returns to its starting state)

To find the programme of a known enzyme: take the AlphaFold structure, extract the metal cluster geometry, compute its site symmetry group $G$, decompose the electron count into orbits under $G$, and track how the orbit occupancy vector changes at each step of the catalytic cycle. The result is a programme of 8 to 16 opcodes — short enough to read and reason about.

---

## Three case studies

**Haemoglobin cooperativity.** The four iron-haem groups in haemoglobin have approximate $D_{4h}$ symmetry. Under $D_{4h}$, the iron $d$-electrons split into five orbits. The T-state (low affinity, deoxygenated) has orbit occupancy $\mathbf{v} = (4, 2)$ — four electrons in one orbit, two in another. The R-state (high affinity, oxygenated) has $\mathbf{v} = (6, 0)$. The Perutz mechanism, in G-Walk language, is the TWIST opcode firing at the $\Delta\mathbf{v} = (4,2) \to (6,0)$ transition.

The Hill coefficient — the classic measure of cooperativity, experimentally about 2.8 — emerges from the orbit structure. The G-Walk calculation gives $n_H = 3.29$, close to the experimental value, without fitting any parameters to the oxygen-binding data.

**Ribonucleotide reductase (RNR).** This enzyme generates the DNA building blocks in every living cell. Its active site is a diiron cluster with approximate $C_{2v}$ symmetry. The G-Walk programme correctly predicts all five key active-site residues as orbit-stabilising — residues whose removal destroys activity because they hold the metal cluster in the geometry required by the programme.

**Photosystem II (PSII).** The most complex enzyme in biology: the only known catalyst that splits water into oxygen, protons, and electrons at room temperature, driven by sunlight. Its manganese cluster ($\text{Mn}_4\text{CaO}_5$) has approximate $C_1$ symmetry with one "dangler" manganese that breaks the symmetry of the cubic subunit. The G-Walk analysis identifies the dangler as a design requirement — an enzyme without the $C_1$ asymmetry cannot close the ORBIT opcode for oxygen evolution. This is a falsifiable prediction: a symmetric four-manganese cluster cannot split water.

---

## The two directions: forward and inverse

The **forward pipeline** takes a sequence, predicts structure with AlphaFold, extracts the metal cluster geometry, computes $G$ and the orbit decomposition, and reads off the catalytic programme. This runs automatically and is validated on the three case studies above.

The **inverse pipeline** runs in reverse: specify a target programme, infer what $G$ and cofactor geometry are required to execute it, look up or construct the corresponding metal cluster, then use ProteinMPNN or RFdiffusion to generate amino acid sequences that fold around that geometry. The resulting sequences can be synthesised and characterised by EPR spectroscopy — which reads the orbit occupancy vector directly as a spin-state fingerprint.

These two pipelines together form a two-way bridge between sequence space and programme space that does not previously exist.

---

## Why this matters for artificial photosynthesis

For 30 years, the central goal of solar energy research has been a synthetic catalyst that splits water as efficiently as PSII does. Billions of dollars of experiments have produced catalysts that work, but only at high overpotential (wasting energy) or under harsh conditions. The G-Walk analysis offers a specific diagnosis: the synthetic catalysts fail because they have the wrong site symmetry group. They use symmetric metal clusters ($T_d$, $O_h$, $D_{4h}$) that lack the $C_1$ dangler structure that the G-Walk programme requires. The design rule from the forward pipeline — build an $\text{Mn}_4$ cluster with one asymmetric Mn and a specific $\mu$-oxo bridging topology — is an actionable target that current approaches do not provide.

---

## The big picture

AlphaFold tells you *where the atoms are*. G-Walk protein design tells you *what the protein computes*. Neither is a substitute for the other; they are complementary levels of description. A protein's function is not determined by its structure alone — it is determined by the programme that the structure executes. The forward pipeline reads that programme from a structure; the inverse pipeline writes structures that run a specified programme.

The broader implication is that protein design is a programming problem. Once the programme is written in a language with a clear semantics — seven opcodes over the orbit occupancy register — it becomes possible to reason about what is achievable, what is hardware-locked, and where engineering effort is most likely to succeed.

---

*See also:*
- [G-Walk Chemistry as Tropical DFT](https://doi.org/10.5281/zenodo.21224113) (#491) — why the orbit occupancy vector is the exact classical limit of quantum chemistry
- [Metabolism as Computation](https://doi.org/10.5281/zenodo.21219724) (#509) — the same seven opcodes applied to whole metabolic pathways
- [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) (#419) — the full thermodynamic framework underlying the β* operating point
