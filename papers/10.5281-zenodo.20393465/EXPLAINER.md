---
layout: default
title: "Evolutionary Quantum Programming"
parent: Explainers
nav_exclude: true
tags: [fano, biophysics, origami-isa, evolution, fmo, photosynthesis, lhcii, pe545, directed-energy-transfer, broken-symmetry, passive-qec, quantum-biology]
portfolio: B
---

## Evolution Wrote a Quantum Programme — and We Can Read It

*Plain-language explainer for [doi:10.5281/zenodo.20393465](https://doi.org/10.5281/zenodo.20393465) (#321)*

---

## The central idea in one sentence

Evolution has independently discovered, optimised, and conserved a specific algebraic instruction sequence for directed quantum energy transfer — SPLIT → SPLAT → FLIP → FLOP in the Origami ISA — readable from the coupling matrix of any photosynthetic or redox-active biological complex, and enforced not by active error correction but by the passive topology of the protein scaffold.

---

## The problem of directed energy transfer

Photosynthesis begins with a problem that electronics engineers would recognise: you have a light-harvesting antenna that absorbs photons almost anywhere, and you need to funnel that energy to a single reaction centre with near-perfect efficiency, in femtoseconds, at room temperature, across a protein complex that is constantly being battered by thermal noise.

Classical physics says this should be hard. Random diffusion dissipates energy; thermal noise destroys quantum coherence in picoseconds; there are thousands of equally plausible pathways through the molecular lattice.

Yet measured efficiencies in the FMO complex (green sulfur bacteria), LHCII (plant photosynthesis), and PE545 (marine algae) all exceed 95%. Something is enforcing directionality.

---

## The Fano plane in the FMO complex

The Fenchel-Matthews-Olson (FMO) complex has seven bacteriochlorophyll (BChl) molecules arranged to funnel excitation energy from the antenna to the reaction centre.

The coupling constants between these seven molecules — the rates at which excitation hops between sites — are not random. When you write the full 7×7 coupling matrix, a pattern emerges: **six of the seven possible coupling lines are strong, and one is weak**. The weak coupling — a factor of 6–17 times weaker than the others — sits precisely on the line connecting the antenna-input site (BChl-1) to the reaction-centre-output site (BChl-3/4).

The six strong couplings form a near-perfect Fano plane: the 7-point, 7-line projective geometry PG(2,2). This is the same geometry that underlies the octonion algebra and the exceptional Lie group G₂. The one broken line is not an accident — it is the directed transfer channel.

The ISA interpretation:

- **Six intact Fano lines** (strong couplings): implement SPLIT ∘ SPLAT = identity. This is the Frobenius axiom — a passive quantum error correction loop. Excitation that wanders off the correct path gets reflected back by the intact Fano geometry, at no energetic cost.
- **One broken Fano line** (weak coupling at the transfer interface): this is the FLIP channel — the sole allowed exit from the error-correcting antenna loop into the reaction centre output.
- **Charge separation at the reaction centre**: this is FLOP — irreversible, directional, completing the transfer.

The full ISA programme is: SPLIT (absorb photon, create superposition) → SPLAT (passive QEC reflection on intact Fano lines) → FLIP (cross the broken line to the output) → FLOP (charge separation, irreversible). Four opcodes. ~3 billion years of evolution converged on this sequence.

---

## The same pattern in three independent systems

The Broken-Symmetry Gateway Principle holds across multiple independently evolved complexes:

| Complex | Sites | Intact lines | Broken line | Coupling ratio | Function |
|---------|-------|-------------|-------------|----------------|----------|
| FMO | 7 BChl | 6 Fano lines | 1 antenna→RC | 6–17× weaker | Excitation energy transfer |
| LHCII | 14 Chl | 6+6 (doubled Fano) | 1 inter-plane | ~4× weaker | Antenna → reaction centre |
| PE545 | 8 bilin (7+1) | 6 Fano + linker | 1 sink isolation | ~30× weaker | EET sink isolation |

Three different organisms, three different pigment types, three different evolutionary lineages — but the same broken-symmetry gateway architecture. The ISA programme is conserved because it is the unique solution to the directed quantum transfer problem under thermal noise.

---

## Passive QEC: why no active error correction is needed

Standard quantum error correction (used in quantum computers) is active: you measure the error syndrome, identify which qubit flipped, and apply a corrective gate. This requires classical overhead, measurement backaction, and ancilla qubits.

The FMO complex implements **passive QEC**: the intact Fano lines form a topological loop that automatically redirects misrouted excitations back toward the transfer pathway, without any measurement or classical feedback. The error correction is built into the geometry of the coupling matrix.

This is possible because the Frobenius axiom (SPLIT ∘ SPLAT = identity) is a topological identity, not a dynamical one. It holds as long as the coupling matrix has the Fano structure — which the protein scaffold enforces by construction, through the spatial arrangement of the pigment molecules. The protein is not a passive scaffold; it is a topology enforcer.

The broken line is the topological "diode": excitations flowing from antenna to output cross the weak coupling and are unlikely to return. Excitations that do return are caught by the passive QEC loop and recycled. The asymmetry of the broken line, combined with the symmetric QEC of the intact lines, gives the observed directionality.

---

## The Turing analogy

Alan Turing (1952) showed that reaction-diffusion equations — differential equations governing the spread of chemical signals in space — underlie biological spatial pattern formation: stripes on zebras, spots on leopards, pigmentation in shells. This is a **spatial** programme: chemistry instantiating a spatial computation in the developing organism.

The ISA programme in photosynthetic complexes is the **functional** analogue: a quantum instruction sequence instantiated in the coupling matrix of a biomolecular complex, performing directed computation on the excitation wavefunction. The substrate is different (quantum rather than chemical), the domain is different (functional rather than spatial), but the principle is the same: biology computes by imposing algebraic structure on a physical substrate, and that structure is readable from the data.

Both are H¹ TWIST programmes in the ISA language — one instantiated in space, one in the functional coupling matrix. Both were discovered by evolution because they are the correct solutions to their respective engineering problems.

---

## Reading evolution's code

The practical implication is a new way to analyse biological energy transfer complexes. Instead of asking "what is the rate matrix?" or "what is the Hamiltonian?", ask:

1. Is the coupling matrix close to a Fano-plane structure?
2. If yes, which line is broken, and by what factor?
3. Does the broken line connect the input and output of the directed transfer?

If all three answers are yes, the complex is running the SPLIT → SPLAT → FLIP → FLOP programme. You can read the programme from the coupling constants without solving the quantum dynamics. The ISA is a Rosetta Stone: it translates the numerical coupling matrix into a functional description.

This has already been applied to FMO, LHCII, and PE545. The next candidates are the peridinin-chlorophyll protein (PCP) and the phycocyanin antenna of cyanobacteria.

---

*See also:*
- [The Broken Line: Fano Topology and Passive QEC](https://doi.org/10.5281/zenodo.20369283) (#319) — the proof paper; Theorem 1: broken-Fano topology implies passive quantum error correction; FMO efficiency η=0.1828 reproduced
- [Spiders for Molecules](https://doi.org/10.5281/zenodo.20400638) (#353) — diagrammatic treatment of molecular energy transfer; FMO as a spider diagram
- [Virtual Monopoles in the FeMo-Cofactor](https://doi.org/10.5281/zenodo.20761315) (#390) — G₂ topology in biological nitrogen fixation; the same Fano geometry in a redox-active metalloprotein

*For the full technical treatment, see [doi:10.5281/zenodo.20393465](https://doi.org/10.5281/zenodo.20393465)*
