---
layout: default
title: "Metabolism Is a Computer Programme"
parent: Explainers
nav_exclude: true
tags: [metabolism, biochemistry, isa, glycolysis, krebs-cycle, electron-transport, calvin-cycle, nitrogen-fixation, atp, cofactor, origami-isa, orbit-opcode, h0, h1, aerobic, anaerobic]
portfolio: A
---

## Every Metabolic Pathway Is a Short Programme in Seven Opcodes

*Plain-language explainer for [doi:10.5281/zenodo.21219724](https://doi.org/10.5281/zenodo.21219724) (#509)*

---

## The central idea in one sentence

Every major metabolic pathway — glycolysis, the Krebs cycle, photosynthesis, nitrogen fixation — can be written as a programme of 8 to 16 opcodes drawn from the seven-instruction Origami ISA, and that rewriting reveals structural facts about efficiency, rate-limiting steps, disease mechanisms, and engineering retargetability that no other formalism makes visible.

---

## Three ways biochemists already describe metabolism — and what each misses

Biochemists have three standard tools for describing metabolic pathways.

*Stoichiometric models* (flux balance analysis) treat metabolism as a linear programme over reaction fluxes. They track which molecules are consumed and produced, optimise ATP yield under constraints, and predict growth rates. What they cannot do: distinguish a catalyst that is regenerated at the end of a cycle from a substrate that is permanently consumed. That distinction — loop versus pipeline — is the difference between aerobic respiration and fermentation, yet flux balance analysis treats them the same way.

*Kinetic models* (systems of differential equations) describe every reaction rate, every enzyme concentration, every feedback loop. They can simulate a metabolic network but produce no qualitative insight. An 800-equation model of glycolysis must be numerically integrated for each organism and condition; it does not tell you *why* glycolysis stops at pyruvate.

*Reaction network graphs* (KEGG, MetaCyc) represent metabolites as nodes and reactions as edges. They identify metabolic hubs (ATP, NADH) and modular structures (glycolysis, pentose phosphate pathway). But they cannot explain why NAD$^+$ is a hub rather than a substrate. The answer requires distinguishing a *register* — a molecule that participates in reactions and is regenerated at cycle end — from a *substrate* that is consumed. Network graphs have no such distinction.

The Origami ISA introduces exactly this distinction, and three others that follow from it.

---

## The seven opcodes

Six of the seven opcodes operate on chemical bonds and electron counts:

- **FLIP** — an electron is gained (reduction); typically by NAD$^+$ becoming NADH
- **FLOP** — an electron is lost (oxidation); NADH back to NAD$^+$
- **SPLIT** — a bond is cleaved; a larger molecule becomes two smaller ones
- **SPLAT** — a bond is formed; two molecules join
- **TWIST** — the spin state changes (spin crossover); the enzyme switches between high-spin and low-spin metal configurations, gating which subsequent reactions are accessible
- **LABEL** — a chemical tag (a phosphate group, an acetyl group) is attached to or detached from a molecule without forming a persistent bond to it

The seventh opcode is structural:

- **ORBIT** — the catalytic cycle closes; the register molecule returns to its initial state, ready to repeat

The ORBIT opcode is what distinguishes a catalytic cycle from a linear pathway. Glycolysis has no ORBIT opcode — pyruvate is the dead end, and the pathway must receive new glucose to run again. The Krebs cycle has an ORBIT opcode: oxaloacetate (OAA) is the register, consumed at the start of each turn and regenerated at the end. This is why the Krebs cycle can run on a continuous stream of acetyl-CoA without exhausting any of its own components.

---

## Why aerobic respiration yields 18 times more ATP than fermentation

Glycolysis converts one glucose molecule (six carbons) to two pyruvate molecules (three carbons each), yielding a net of 2 ATP. Full aerobic respiration — glycolysis plus the Krebs cycle plus oxidative phosphorylation — yields about 36 ATP from the same glucose. The ratio is 18. This is not an accident of biochemical detail; it is a structural consequence of opcode composition.

Glycolysis is an *H*$^0$ programme: a pipeline with no ORBIT opcode. Pyruvate retains most of the chemical energy of glucose (roughly 84% of the Gibbs free energy of complete combustion). The ORBIT-free programme cannot extract that energy — it terminates before the job is done.

The Krebs cycle is an *H*$^1$ programme: an ORBIT programme in which the register (OAA) is preserved across every turn. Each turn of the cycle completely oxidises two carbon atoms from acetyl-CoA to CO$_2$ and captures the electrons as NADH and FADH$_2$. Because the register is preserved, the cycle can turn indefinitely on a continuous supply of acetyl-CoA. The electron transport chain then runs a second ORBIT (the proton gradient across the inner mitochondrial membrane, maintained by a rotary molecular motor) to convert those electrons into ATP.

The 18-fold efficiency ratio is the ratio of ORBIT-enabled extraction to linear extraction. It holds regardless of organism, temperature, or membrane composition, because it is a structural property of the programme, not a parameter of the implementation.

---

## Cofactors are opcode implementations

Every major metabolic cofactor implements exactly one opcode class:

| Cofactor | Opcode | Reason |
|---|---|---|
| NAD$^+$/NADH | FLIP/FLOP | 2-electron carrier, protein-controlled redox potential |
| FAD/FADH$_2$ | TWIST | 1-electron or 2-electron switchable via the semiquinone radical intermediate — a spin-crossover state |
| ATP/ADP | LABEL | Phosphoryl group as a chemical tag; no persistent bond forms at the transfer site |
| CoA | SPLIT/SPLAT | Acyl group carrier; SPLIT attaches an acyl group to CoA, SPLAT releases it |
| Fe-S clusters | ORBIT scaffold | Multi-electron relay enabling full catalytic cycle closure |
| Haem/porphyrin | TWIST-gated ORBIT | Spin state of the iron controls substrate access |

This mapping has a sharp prediction: an organism that loses a cofactor loses an entire opcode class, not a scattered set of individual reactions. NAD$^+$ deficiency (pellagra) knocks out the FLIP opcode throughout metabolism, causing energy failure across all organ systems. FAD deficiency knocks out the TWIST opcode, producing a more localised failure at the spin-crossover junctions in the electron transport chain. The symptoms cluster by opcode class, not by pathway — a fact that is invisible in stoichiometric or kinetic descriptions.

---

## What the ISA reveals about rate-limiting enzymes

In each metabolic programme, the enzyme that implements the *unique* opcode for a given step cannot be bypassed. Succinate dehydrogenase (Complex II of the electron transport chain) is both a Krebs cycle enzyme and an electron transport enzyme: it is the only biological molecule that sits at the junction between the C-chemistry register (Krebs) and the electron-transport register. It implements the TWIST opcode that couples those two ORBIT programmes. Remove it, and both registers stall — which is why Complex II inhibitors are lethally effective even at low concentrations.

By contrast, enzymes that implement opcodes with multiple physical implementations can be inhibited individually with modest effect. Kinases implement the LABEL opcode, and there are hundreds of kinases in any cell. Inhibiting one LABEL enzyme simply routes flux through the others.

The ISA makes this distinction precise: *opcode monopoly* (a single enzyme implementing a unique opcode at a junction) predicts lethality; *opcode redundancy* (many enzymes sharing an opcode class) predicts robustness. Directed at metabolic engineering, the same logic predicts which reactions can be rewired and which are locked in place by their opcode role.

---

## The big picture

Metabolism has been described at the level of chemical mechanism for over a century, and at the level of stoichiometric flux for fifty years. Both descriptions are accurate; neither is complete. The ISA adds a third level — the *computational* level — that sits between them.

At this level, the 18-fold yield ratio, the clustering of metabolic disease by cofactor class, the lethality of opcode monopoly enzymes, and the retargetability of redundant enzymes all follow from the same seven-opcode structure. The computational level does not replace biochemistry; it organises it. Metabolism is a computer programme — a short one, written in a language that evolution converged on roughly 3.5 billion years ago.

---

*See also:*
- [G-Walk Protein Design](https://doi.org/10.5281/zenodo.21224111) (#490) — forward and inverse design pipelines for metalloenzymes using the same opcode language
- [G-Walk Chemistry as Tropical DFT](https://doi.org/10.5281/zenodo.21224113) (#491) — why orbit occupancy vectors are the classical limit of quantum chemistry
- [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) (#419) — the thermodynamic framework underlying the $\beta^*$ operating point for catalytic cycles
