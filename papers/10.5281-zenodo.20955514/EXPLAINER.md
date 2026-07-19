---
layout: default
title: "Resource Theory as Circuit Syntax"
parent: Explainers
nav_exclude: true
tags: [resource-theory, prop, coloured-prop, circuit-syntax, monoidal-category, frobenius, zx-calculus, origami-isa, dark-magic, stabiliser, quantum-foundations]
portfolio: A
---

## Diagrams Are Not Just Pictures — They Are the Algebra

*Plain-language explainer for [doi:10.5281/zenodo.20955514](https://doi.org/10.5281/zenodo.20955514) (#468)*

---

## The central idea in one sentence

The Origami ISA, viewed as a coloured PROP (a category of typed wires and rewriting rules), gives quantum resource theory a *syntax* — a grammar of circuits in which preparation, transformation, and measurement are distinct morphism types rather than properties of the same state vector.

---

## What standard resource theory misses

In the standard framework, a quantum resource is a property of a state: a state is *magic* if it cannot be prepared by Clifford gates alone, *entangled* if it cannot be prepared locally, and so on. Free operations are those that cannot increase the resource. The framework is powerful but there is a gap: preparation and measurement are treated as properties of the same object (the state vector), and the pictorial, diagram-based element is almost entirely absent.

This matters because circuits have *direction*. A preparation is a morphism from the empty system to a Hilbert space; a measurement is a morphism back. They are not the same kind of thing, and collapsing both into "state properties" obscures the distinction between what a state *costs* to make and what it *yields* when measured.

---

## PROPs: the right language for circuit syntax

A **PROP** (PROduct and Permutation category) is a strict symmetric monoidal category whose objects are natural numbers (representing wire counts) and whose morphisms are circuits. A **coloured PROP** assigns types to wires — for example, distinguishing a "classical bit wire" from a "quantum qubit wire" from a "magic-tier wire."

The Origami ISA is a coloured PROP with three wire colours:

| Wire colour | Meaning | Opcode tier |
| --- | --- | --- |
| Classical (black) | Bits, tropical arithmetic | H⁰ / stabiliser |
| Clifford (blue) | Stabiliser states, Pauli operators | H¹ / Clifford |
| Magic (red) | Non-stabiliser, genuine quantum resources | H² / magic |

A circuit in the ISA is a morphism in this coloured PROP. Composition is wire-to-wire connection. The seven opcodes (FLIP, FLOP, SPLIT, SPLAT, TWIST, LABEL, ORBIT) are the generators of the PROP.

---

## Dark magic as a rewrite rule

The three-tier magic taxonomy (stabiliser / dark magic / genuine magic) established in companion papers has a natural PROP interpretation:

- A **stabiliser gate** is a morphism that rewrites to the identity on classical wires — no magic wire is consumed or produced.
- A **dark-magic gate** has $\mathrm{TV} = 1$ and a non-negative Wigner function *in aggregate*, but Wigner-negative *locally*. In the PROP, it is a morphism that *looks like* a magic wire consumer but rewrites to a classical wire — it is a "rewrite-to-identity" in disguise.
- A **genuine-magic gate** ($\mathrm{TV} > 1$) irreducibly consumes a red wire and cannot be rewritten to operate only on blue or black wires.

This is the key insight: dark magic is not just a resource-theory concept — it is a *syntactic* phenomenon. A dark-magic gate is one whose PROP morphism factors through the classical rewrite system even though it appears to require quantum wires.

---

## Extending ZX-calculus

The ZX-calculus (Coecke & Duncan 2011) is a PROP for qubit Clifford circuits with two generators (Z-spider and X-spider) and rewriting rules. It is complete for the Clifford group: any Clifford circuit can be reduced to a normal form by applying the ZX rules.

The Origami ISA extends ZX in two directions:

1. **The T-gate generator.** Adding the T-gate to ZX requires at minimum one new generator (the "T-box") and new rewriting rules. The ISA framework identifies this generator with the TWIST opcode at the Clifford/magic boundary — the generator of $H^2(\mathrm{Sp}(4,\mathbb{F}_2); \mathbb{Z}_2)$.

2. **The $C_3$ tier.** The graded ZX+T presentation gives a *typed* extension: Clifford wires (blue) are rewritten by ZX rules; magic wires (red) require the T-box. Dark-magic circuits live at the interface — they consume red wires syntactically but reduce to blue-wire morphisms under the extended rewrite system.

---

## The big picture

Making resource theory syntactic has a practical payoff: circuit optimisation becomes *type-checking*. A compiler for the Origami ISA can determine — at parse time, without executing the circuit — whether a gate consumes genuine magic (red wire, irreducible) or dark magic (red wire, rewrite-to-blue). This separates the resource cost that must be paid in hardware (genuine magic state distillation) from the cost that can be eliminated by symbolic rewriting.

The coloured PROP framework also unifies the ISA with prior work: ZX-calculus is the blue-wire sub-PROP; classical reversible computing is the black-wire sub-PROP; and the full Origami ISA is the three-coloured extension that connects all three.

---

*See also:* [doi:10.5281/zenodo.21219698](https://doi.org/10.5281/zenodo.21219698) (ISA Completeness — nine normal forms) · [doi:10.5281/zenodo.21219700](https://doi.org/10.5281/zenodo.21219700) (Hot Logic — complete magic resource theory) · [The ISA Opcodes](../../opcodes.md)
