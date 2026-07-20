---
layout: default
title: "The Pentagon ISA"
parent: Explainers
nav_exclude: true
tags: [pentagon-isa, coherence, confluence, monoidal-categories, diamond-lemma, uniqueness, h-k-ladder, trs-framework]
portfolio: B
---

## The Pentagon ISA: Why There Is Only One ISA

*Plain-language explainer for [doi:10.5281/zenodo.21416916](https://doi.org/10.5281/zenodo.21416916) (#622)*

{% include isa-nav.html %}

---

## The coherence question

Eight independent derivations in [Paper 455](https://doi.org/10.5281/zenodo.20774076) all arrive at the same five opcodes. But is there only *one* way to organise those five opcodes into a consistent computational system? Could there be two different ISAs with the same opcodes but different rewriting rules — and if so, which one is "correct"?

The **Pentagon ISA** answers this: there is exactly one. The five opcodes, with their rewriting rules, form a confluent and terminating rewriting system. Any two programmes that compute the same function can be reduced to the same normal form. The ISA is unique.

---

## The Pentagon identity

The name comes from the **pentagon identity** of monoidal category theory — the coherence condition that says all ways of re-associating a four-fold tensor product $(A \otimes B) \otimes (C \otimes D)$ give the same result:

```
((A⊗B)⊗C)⊗D
     ↙           ↘
(A⊗(B⊗C))⊗D    (A⊗B)⊗(C⊗D)
     ↓                 ↓
A⊗((B⊗C)⊗D)    A⊗(B⊗(C⊗D))
     ↘           ↙
    A⊗(B⊗(C⊗D))
```

Five vertices. Five edges. One commuting pentagon. This diagram must commute in any monoidal category — and the five opcodes are the generators of exactly such a category.

The pentagon has five sides. The ISA has five opcodes. This is not a coincidence: the five opcodes are the minimal generators needed to express the pentagon identity and all its consequences.

---

## What "confluent and terminating" means

A rewriting system (like the ISA opcodes with their identities) is:

- **Terminating**: every sequence of rewrites eventually stops. You cannot rewrite forever in circles.
- **Confluent** (Church-Rosser): if two different sequences of rewrites lead to different intermediate forms, they can always be reunited — there is always a common descendant.

Together, termination + confluence = **unique normal forms**. Every ISA programme reduces to exactly one normal form, regardless of the order in which you apply the rewriting rules. This is the Diamond Lemma (Bergman 1978), applied to the Motive PROP.

The practical consequence: ISA programmes can be optimised in any order. A compiler can apply simplifications greedily, without worrying about getting stuck in a suboptimal rewrite sequence.

---

## The H^k type system enforces confluence

The key technical result: the H^k type system (which assigns each opcode to a cohomological tier H⁰/H¹/H²) is not decorative. It is the mechanism that prevents the rewriting rules from looping.

Without the type system, BIND 💎 and TWIST 🌀 could potentially rewrite into each other in cycles. The type system forbids this: H² opcodes (BIND 💎) cannot rewrite into H¹ opcodes (TWIST 🌀) because that would lower the cohomological degree, which is forbidden by the chain complex structure (d∘d = 0 means you cannot go down two levels).

The type system is the termination order. Confluence follows from the Diamond Lemma once termination is established.

---

## Five sides, five opcodes

Mac Lane's coherence theorem (1963) proved that all monoidal categories are equivalent to strict ones — you never need to track associativity brackets. The Pentagon ISA extends this: not only is associativity coherent, but the entire ISA rewriting system is confluent. Every quantum computing equivalence you might want to prove reduces to a chain of pentagon moves.

This is why the ISA can serve as an open standard: its equational theory is decidable (terminating and confluent), so any two implementations can be compared by reducing to normal form.

---

*See also:*
- [The Motive ISA](https://doi.org/10.5281/zenodo.21416910) — the abstract parent whose coherence the Pentagon ISA proves
- [The Rising Sea ISA](https://doi.org/10.5281/zenodo.21416914) — the β-plane fibration of all ISAs
- [ISA Completeness](https://doi.org/10.5281/zenodo.21219698) (#469) — nine SWAP-classes; formal completeness proof

{% include isa-nav.html %}

*For the full technical treatment, see [doi:10.5281/zenodo.21416916](https://doi.org/10.5281/zenodo.21416916)*
