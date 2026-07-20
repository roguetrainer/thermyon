---
layout: default
title: "The Thermal AZ Table"
parent: Explainers
nav_exclude: true
tags: [tenfold-way, az-table, origami-isa, forge-isa, symmetry-class, topological-insulator, kitaev, bott-periodicity, thermal-classification, superconductor, majorana, g2, octonions]
portfolio: A
---

## Every Topological Phase of Matter, Classified by Three ISA Opcodes

*Plain-language explainer for [doi:10.5281/zenodo.20955478](https://doi.org/10.5281/zenodo.20955478) (#457)*

---

## The central idea in one sentence

The Altland–Zirnbauer tenfold way — the complete classification of topological phases of matter — maps onto exactly three Origami ISA opcodes (FLIP, FLOP, TWIST), and thermalising this table with the Forge ISA reveals a computable critical temperature β* at which each topological class boundary dissolves.

---

## What the tenfold way classifies

Topological insulators and superconductors are materials whose bulk is insulating but whose surface conducts electricity with extraordinary robustness — the conduction is protected by topology and cannot be destroyed by disorder or imperfections, as long as the disorder does not break certain symmetries.

Altland and Zirnbauer showed in 1997 that all such phases are classified by just three discrete symmetries:

- **Time reversal T**: does the system look the same if you run time backwards? T² = +1 (bosons) or T² = −1 (fermions).
- **Particle-hole C** (charge conjugation): does the system look the same if you swap electrons for holes? C² = +1 or C² = −1.
- **Chiral S** (sublattice symmetry): a combination of T and C; S² = +1 always.

Each symmetry is either present (+1), present with a sign (−1), or absent (0). There are exactly **ten** combinations — the tenfold way — and in each spatial dimension, each combination either admits a topological phase or doesn't, and if it does, the phases are classified by an integer or Z₂. This gives Kitaev's periodic table of topological phases.

---

## The ISA embedding

The three symmetries map cleanly onto three Origami ISA opcodes:

| AZ symmetry | ISA opcode | Physical meaning |
|-------------|------------|------------------|
| Time reversal T | FLIP | Reversal of orientation; T² = ±1 is the FLIP orientation sign |
| Particle-hole C | FLOP | Exchange of creation/annihilation; exact opcode correspondence |
| Chiral S | TWIST | Phase twist combining T and C; carries topological gap information |

This is an **embedding**, not an isomorphism. FLOP implements C exactly. But TWIST and FLIP each carry additional structure that the zero-temperature AZ table does not see: TWIST records the topological gap (how far the system is from a phase transition), and FLIP records diagrammatic orientation (the direction of the boundary mode). The ISA is richer than the AZ table.

The embedding is verified against the twelve-model master table of the Opcode Rosetta Stone: all twelve models fall correctly into either the real (ℝ) or complex (ℂ) column of the Baez threefold split. No quaternionic (ℍ) models appear — identifying a complete experimental programme for a companion paper.

---

## Thermalising the table with the Forge ISA

The AZ classification is zero-temperature: symmetry is either exactly present or exactly absent, like a switch. Real materials are never at zero temperature. The sharp symmetry constraints soften to smooth crossovers as temperature rises, and eventually all topological protection is lost.

The Forge ISA provides a natural thermalisation: replace the sharp symmetry constraints with Gibbs weights at inverse temperature β. Each of the ten AZ classes then has a **critical temperature β*** at which the TWIST opcode first fails — the point where thermal fluctuations disorder the system enough to close the topological gap and destroy the protected surface state.

β* is computable from the topological gap Δ:

**β* ≈ 1/Δ**

A large gap (robust topology, hard to disorder) gives a small β* (high critical temperature). A small gap (fragile phase, near a transition) gives a large β* (low critical temperature). This makes β* a **class-boundary detector**: if the measured β* deviates from 1/Δ, the system is near a topological phase transition.

---

## Bott periodicity from the ISA

One of the deepest facts about the tenfold way is its periodicity: the pattern of which classes admit topological phases repeats with period 2 in spatial dimension for complex classes, and period 8 for real classes. This is Bott periodicity, a fundamental result in algebraic topology.

The ISA provides a new derivation of this periodicity:

- **Period 2 (complex classes, ℂ-column):** These classes use only FLIP and FLOP opcodes. Two applications of the Cayley–Dickson construction (ℝ → ℂ → ℍ) give a 2-periodic orbit. The Forge ISA implements this via the 2-periodic phase structure of complex Gibbs weights.

- **Period 8 (real classes, ℝ-column):** These classes include TWIST. Eight applications of the Cayley–Dickson construction cycle through ℝ → ℂ → ℍ → 𝕆 and back, giving period 8. The saturating step — the one that closes the 8-cycle — is identified with the **octonion algebra** 𝕆 and the G₂ automorphism group. This connects topological insulators to the exceptional Lie algebra G₂ and to the Fano plane geometry that underlies the 731 ISA.

The Fidkowski–Kitaev collapse (the topological invariant ℤ → ℤ₈ for Majorana chains in class BDI) is reinterpreted as a BIND insertion: promoting a FLOP-only programme (free Majorana chain) to a FLOP + BIND programme (interacting Majorana chain with octonion structure), with gap closure at the BIND-insertion point.

---

## What the table tells you

Given any material or model, the ISA classification tells you:

1. **Which opcodes it uses** — the FLIP/FLOP/TWIST combination determines the AZ symmetry class and hence whether a topological phase is possible at all.
2. **What the critical temperature is** — β* = 1/Δ tells you whether the topological protection survives to experimentally accessible temperatures.
3. **Whether it is in the ℝ or ℂ column** — ℂ-column materials (period-2 classes) have simpler topology; ℝ-column materials (period-8 classes) have octonion geometry at their saturation point and are connected to G₂ physics.

The ISA makes the tenfold way operational: not just a classification scheme, but a computable programme that outputs the stability and character of any topological phase.

---

*See also:*
- [The Kitaev Menagerie in the Forge](https://doi.org/10.5281/zenodo.20752352) (#445) — anyon models as ISA programmes; toric code as H¹; Fibonacci anyons as 731 ISA
- [The Opcode Rosetta Stone](https://doi.org/10.5281/zenodo.20773563) (#447) — twelve models × seven opcodes; the master verification table used here
- [The Self-Dual G₂ Architecture](https://doi.org/10.5281/zenodo.20694527) (#435) — the G₂/Fano connection that drives period-8 saturation

*For the full technical treatment, see [doi:10.5281/zenodo.20955478](https://doi.org/10.5281/zenodo.20955478)*
