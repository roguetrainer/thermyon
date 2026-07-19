---
layout: default
title: "ISA Completeness: Nine Normal Forms"
parent: Explainers
nav_exclude: true
tags: [isa-completeness, nine-normal-forms, three-qubit, prop, rewrite, dark-magic, stabiliser, wigner, quantum-foundations, origami-isa]
portfolio: A
---

## Every Three-Qubit Circuit Belongs to One of Nine Classes

*Plain-language explainer for [doi:10.5281/zenodo.21219698](https://doi.org/10.5281/zenodo.21219698) (#469)*

---

## The central idea in one sentence

The single-phase fragment of three-qubit circuits has exactly nine normal forms under the Origami ISA rewrite system — one stabiliser class, six dark-magic classes, and two genuine-magic classes — and total variation (TV) is the correct discriminant where Wigner negativity $N$ fails.

---

## What "completeness" means

A rewrite system is **complete** if every circuit can be reduced to a unique normal form by applying the rules in any order. Completeness is a strong guarantee: it means the rewrite system does not just simplify circuits, it *classifies* them. Two circuits are equivalent if and only if they reduce to the same normal form.

For quantum circuits, this is hard. The ZX-calculus is complete for Clifford circuits (Backens 2014), but extending completeness to the magic tier requires new generators and new rules. This paper proves completeness for the *single-phase three-qubit fragment* — circuits built from SWAP-class gates applied to three qubits with at most one non-Clifford phase.

---

## The nine classes

The classification proceeds via **SWAP-equivalence**: two circuits are SWAP-equivalent if one can be obtained from the other by permuting qubits. Within each SWAP-class, the circuit is reduced to a normal form by applying the ISA rewrite rules (the coloured-PROP morphisms of [doi:10.5281/zenodo.20955514](https://doi.org/10.5281/zenodo.20955514)).

The nine classes are:

| Class | Type | TV | $W \geq 0$? | Description |
| --- | --- | --- | --- | --- |
| S₁ | Stabiliser | 1 | Yes | Identity / Clifford only |
| D₁–D₆ | Dark magic | 1 | No (locally) | Wigner-negative but TV=1; rewrite-to-stabiliser |
| M₁, M₂ | Genuine magic | >1 | No | Irreducible non-Clifford resource |

The six dark-magic classes are the discovery: circuits that *appear* non-classical (they have negative Wigner function values somewhere) but are nonetheless **TV = 1** — they can be implemented without consuming genuine magic resources. The Wigner negativity measure $N$ used in standard resource theories counts them as magic; TV correctly identifies them as free.

---

## Why Wigner negativity $N$ fails here

The Wigner negativity $N = \sum_{W < 0} \lvert W(u)\rvert$ is a standard measure of non-classicality. For single-qubit states, $N = 0$ if and only if the state is stabiliser. But for multi-qubit states, $N > 0$ is *not* sufficient for genuine magic: a product of a Wigner-negative single-qubit state with a Clifford circuit can have $N > 0$ while remaining simulable.

Dark magic is exactly this phenomenon at the three-qubit level. The six dark-magic classes have $N > 0$ — they are Wigner-negative — but their total variation $\mathrm{TV} = \sum_u \lvert W(u)\rvert = 1$, matching the stabiliser value. TV = 1 is a conserved quantity under Clifford operations and under the dark-magic rewrite rules; TV > 1 is the invariant that correctly flags genuine magic.

This was proved computationally: for each of the 9 SWAP-classes, TV and $N$ were computed on representative states, confirming that $N$ disagrees with the correct classification for all six dark-magic classes.

---

## The stabiliser-check fix

An earlier version of the ISA completeness code had a bug: checking for the stabiliser eigenvalue $+1$ only, when stabilisers can have eigenvalues $\pm 1, \pm i$. The corrected check covers all four eigenvalues and correctly identifies the unique stabiliser class S₁.

---

## The big picture

Nine normal forms gives the ISA a **periodic table of three-qubit gates**: every circuit has a unique address in the table, determined by its SWAP-class and its TV value. This is not just classification for its own sake — it has architectural implications. A quantum compiler using the Origami ISA can:

- Route stabiliser circuits through the H⁰/H¹ hardware tier (free)
- Route dark-magic circuits through the H¹/H² interface (require rewriting, not distillation)
- Reserve genuine-magic hardware resources for M₁ and M₂ only

The nine-class result converts the vague slogan "not all non-Clifford gates are equally expensive" into a precise, computable statement.

---

*See also:* [doi:10.5281/zenodo.21219700](https://doi.org/10.5281/zenodo.21219700) (Hot Logic — TV as complete monotone) · [doi:10.5281/zenodo.20955514](https://doi.org/10.5281/zenodo.20955514) (Resource Theory as Circuit Syntax) · [doi:10.5281/zenodo.21158943](https://doi.org/10.5281/zenodo.21158943) (Clifford Hierarchy as Group Cohomology)
