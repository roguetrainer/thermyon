---
layout: default
title: "Molecular Machines as Origami ISA Programmes"
parent: Explainers
nav_exclude: true
tags: [origami-isa, ribosome, fmo, nitrogenase, femoco, fano, 6j-symbol, photosynthesis, molecular-machine, biology]
portfolio: B
---

## The Same Five Operations Run the Ribosome, Photosynthesis, and Nitrogen Fixation

*Plain-language explainer for [doi:10.5281/zenodo.20682101](https://doi.org/10.5281/zenodo.20682101) (#413)*

---

## The central idea in one sentence

Three molecular machines — the ribosome, the FMO photosynthetic complex, and nitrogenase — all share the same 7-node Fano-plane interaction topology, and this topology is the unique architecture with positive thermodynamic efficiency among all 7-node networks.

---

## Why the Fano plane appears in biology

The Fano plane (7 points, 7 lines, 3 points per line) is not just an abstract mathematical object. It is the unique combinatorial structure with these parameters — and evolution independently discovered it in three unrelated molecular machines:

- **Ribosome A-site**: 7 key residues (A1492, A1493, G530, A1913, and others) with 6/7 Fano-line coupling in the cognate (correct) decoding state
- **FMO complex**: 7 bacteriochlorophyll molecules with BChl-3/BChl-4 as the weakened (broken) Fano line
- **FeMo-cofactor**: 7 iron atoms in [7Fe-9S-Mo] with the exact combinatorial structure of the Fano plane

Each machine has exactly one weakened coupling — a broken Fano line — that breaks the 7-fold symmetry. A theorem (proved in Paper 325) says this broken-Fano topology is the *unique* 7-node graph with positive information-geometric Carnot efficiency $\eta > 0$.

---

## Three parameter-free predictions

**FMO efficiency.** With only the BChl-3/BChl-4 coupling ratio $r \approx 0.18$ from the crystal structure as input:
$$\eta = 1 - \mathcal{S}_\mathrm{cold}/\mathcal{S}_\mathrm{hot} = 0.1825$$
Experimentally measured: $\eta \approx 0.18$. No fitting, no free parameters.

**Ribosome decoding.** The 6/7 Fano topology in the cognate state (PDB: 4V9D) drops to 5/7 in the empty and near-cognate states. The broken line (A1913–A1492) spans the 30S–50S subunit junction — unique among the seven residue pairs. This is a structural prediction checkable against any ribosome crystal structure.

**Nitrogenase mechanism.** The N≡N bond-breaking step requires the SPIN opcode (G₂ triality) — a non-associative transition inaccessible to standard quantum chemistry. Virtual monopoles at Fe4/Fe5 mediate the reaction as topological defects of the G₂ gauge field. Prediction: transient Fe4–Fe5 distance change detectable by time-resolved EXAFS.

---

## The ISA opcode mapping

| Opcode | Biological role |
|---|---|
| SPLIT | Pair creation; ribosomal subunit assembly; GTP hydrolysis |
| SPLAT | Recognition decision; 6j symbol evaluation; codon acceptance |
| TWIST | Conformational change; tRNA accommodation |
| FLIP | Proofreading; kinetic back-reaction |
| FLOP | Measurement; fluorescence; readout |
| SPIN | N≡N bond breaking (nitrogenase only) |

---

## What to read next

- [The Decoding Engine](https://doi.org/10.5281/zenodo.20400652) (#324) — full ribosome treatment
- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) (#325) — proof that broken-Fano is the unique efficient topology
- [Virtual Monopoles in the FeMo-Cofactor](https://doi.org/10.5281/zenodo.20346650) (#318) — nitrogenase in detail

*For the full technical treatment, see [doi:10.5281/zenodo.20682101](https://doi.org/10.5281/zenodo.20682101)*
