---
layout: default
title: "Beyond DAGs: A Non-Associative Algebra of Policy Interventions"
parent: Explainers
nav_exclude: true
tags: [economics, optimisation]
portfolio: G
---

# Beyond DAGs: A Non-Associative Algebra of Policy Interventions: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20234870](https://doi.org/10.5281/zenodo.20234870) (#292)*

## The central idea in one sentence

The standard causal model — a directed acyclic graph — secretly assumes that the order in which interventions are applied does not matter, but in real economies it does, and the mathematics of alternative algebras captures exactly when and why.

## The hidden assumption in causal graphs

Pearl's do-calculus and Rubin's potential outcomes framework have transformed empirical economics. But both are built on directed acyclic graphs (DAGs), and DAGs carry a hidden assumption: **associativity**. When you compose interventions $A$ and $B$ in a DAG, $A \circ B$ means "apply $A$ to the system, then apply $B$". The graph structure guarantees that $(A \circ B) \circ C = A \circ (B \circ C)$ — the bracketing never matters.

But in the real world, does Brexit then COVID equal COVID then Brexit? Clearly not. The British economy that Brexit created had different supply-chain structure, different labour-market frictions, and different international relationships than the pre-Brexit economy. COVID struck that altered system. The sequence is not associative.

This failure is not a bug in the data — it is a structural feature of complex adaptive systems. Interventions change the system they act on. Later interventions act on the changed system, not the original one. The correct mathematical object for this situation is not a group or a category — it is an **alternative algebra**.

## What the associator measures

In any algebra where composition $\circ$ may not be associative, define the **associator**:

$$[A, B, C] = (A \circ B) \circ C - A \circ (B \circ C).$$

In a standard DAG-based causal model, $[A, B, C] = 0$ always. This paper's main claim is that policy interventions have non-zero associators, and that these associators are empirically estimable.

The magnitude $\|[A, B, C]\|$ measures the degree to which the effect of $C$ depends on whether $A$ or $B$ was applied first. A large associator means the sequencing of prior policies fundamentally changes what the later policy does. A zero associator means the causal graph is an adequate model.

Alternative algebras satisfy a weaker condition than associativity: the **Moufang identity**

$$(A \circ B) \circ (C \circ A) = A \circ ((B \circ C) \circ A).$$

This is not a random weakening. The Moufang identity is precisely the condition needed for the algebra to have a well-defined notion of "inverse intervention" — a policy that undoes the effect of a prior policy. Without Moufang, you cannot even ask "what would undo Brexit?". With it, the question has a unique mathematical answer.

## Three worked examples

**Example 1: NAFTA then CETA vs. CETA then NAFTA.** NAFTA (1994) restructured Canadian manufacturing around continental supply chains, creating extensive US-Canada production integration. CETA (2017) then layered European market access on top of this integrated system. Had CETA been signed first, Canadian firms would have oriented toward European standards and regulatory frameworks — and NAFTA would subsequently have encountered different firms, different capital stocks, and different comparative advantages. The associator $[NAFTA, CETA, \text{EU standards}]$ is large and positive: the order of trade liberalisation determines the equilibrium it produces.

**Example 2: The 2008 Bear Stearns bailout.** The Federal Reserve arranged the Bear Stearns rescue in March 2008, signalling that large institutions would not be allowed to fail. Lehman Brothers then failed in September 2008. The question is: what would have happened if Lehman had failed first (March) and Bear second (September)? The Bear bailout changed beliefs about government policy, which changed how Lehman's counterparties behaved, which changed what the Lehman failure meant. The associator here captures belief-updating dynamics: the algebra of bailout decisions is alternative but not associative because each decision updates the common knowledge state on which subsequent decisions act.

**Example 3: Dodd-Frank and shadow banking.** Dodd-Frank (2010) increased capital requirements for bank holding companies. Shadow banking activity (money market funds, repo markets, securitisation vehicles) then expanded to fill the gap. Had the shadow banking system been regulated first, Dodd-Frank's capital rules would have acted on a different financial architecture. The associator $[\text{Dodd-Frank}, \text{shadow banking growth}, \text{macroprudential rules}]$ measures regulatory arbitrage: the degree to which the sequence of regulation determines the equilibrium financial structure.

## The algebra of economic policy

The paper constructs the **Policy Intervention Algebra** (PIA): a vector space of interventions equipped with the non-associative composition $\circ$ representing sequential application in a complex economy. The key structural results are:

1. **Alternative, not associative**: PIA satisfies Moufang identities but not full associativity. This is exactly the level of structure needed to define inverse interventions.

2. **Non-commutativity is the rule**: $A \circ B \neq B \circ A$ generically. The commutator $[A, B] = A \circ B - B \circ A$ measures the sequencing effect — how much the order of two simultaneous policies matters if they are implemented in sequence.

3. **The associator is a tensor**: $[A, B, C]$ is trilinear in its arguments and transforms correctly under changes of basis in the intervention space. It can be estimated from panel data on policy sequences.

## Connection to octonions and exceptional algebras

Alternative algebras have a unique structure theorem: by Artin's theorem, every alternative algebra that is not associative is related to the octonions. The octonions $\mathbb{O}$ are the eight-dimensional division algebra with 480 multiplication rules — all alternative but none associative beyond individual subsets.

This is not merely a formal connection. The paper shows that the PIA for a sufficiently complex economy — one with more than seven distinct policy levers with non-zero mutual associators — must embed into an octonion-like structure. The Fano plane (the geometry of octonion multiplication) makes a concrete appearance: the seven lines of the Fano plane correspond to seven maximal associative sub-algebras of the PIA, each representing a sub-system of policies that can be analysed with standard DAG methods.

## What this changes in practice

The practical upshot is that empirical researchers estimating policy effects in sequence-dependent settings need to estimate the associator, not just the main effect and the interaction term. A regression with treatment dummies for $A$ and $B$ and an interaction $A \times B$ implicitly assumes $[A, B, C] = 0$ for all $C$. This paper provides the correct specification and shows the bias from the standard approach.

## What to read next

- [Buckley (2026) — The Temperature of Rationality](https://doi.org/10.5281/zenodo.20234841) — *MGE-based economic rationality: the Gibbs framework within which policy sequencing operates.*
- [Buckley (2026) — The Topology of Conservation](https://doi.org/10.5281/zenodo.20234853) — *The Pacioli manifold: the geometric substrate on which policy interventions act.*
- [Buckley (2026) — Thermodynamic Information Routing](https://doi.org/10.5281/zenodo.20237288) — *Why the Gibbs distribution is universal: the axiomatic foundation shared by causal inference and thermodynamics.*

*For the full technical treatment, see [doi:10.5281/zenodo.20234870](https://doi.org/10.5281/zenodo.20234870)*
