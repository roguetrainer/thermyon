---
layout: default
title: "The Topology of Risk: A Primer"
parent: Explainers
nav_exclude: true
tags: [sheaf-cohomology, primer, bilateral-risk, triangular-risk, systemic-risk, xva, 2008-crisis, econiac, tutorial, h0, h1, h2, finance]
portfolio: G
---

## Risk Has Three Levels. Standard Finance Only Measures One.

*Plain-language explainer for [doi:10.5281/zenodo.20642983](https://doi.org/10.5281/zenodo.20642983) (#398)*

---

## The central idea in one sentence

Financial risk has three structural levels — bilateral (H⁰), triangular (H¹), and systemic (H²) — and the tools that work perfectly at each lower level become completely blind to the level above it, which is why regulators who managed bilateral risk well in 2007 had no warning of the 2008 collapse.

---

## Who this is for

This primer is explicitly written for practitioners with no topology or abstract algebra. High-school arithmetic and basic probability are sufficient. Every concept is built from a single running example — three banks and a money market fund — before any technical language appears.

This explainer follows the same structure as the paper itself.

---

## Level 1: Bilateral risk (H⁰)

Imagine Bank A lends €100 to Bank B. If B defaults, A loses €100. This is **bilateral risk**: risk between exactly two parties.

Bilateral risk is perfectly manageable. A can buy credit protection from a third party, enter a credit default swap, or post collateral. Everything in classical finance — the Black-Scholes formula, value at risk, credit metrics — is designed to measure and hedge bilateral risk. It does this well.

Bilateral risk is H⁰ in the language of cohomology. The "0" means it lives at individual edges of the financial network: each edge (each contract) between two nodes (institutions) carries a risk that can be evaluated in isolation.

Standard bank regulation (Basel III capital requirements) measures H⁰. This is necessary but not sufficient.

---

## Level 2: Triangular risk (H¹)

Now add Bank C. A has lent to B, B has lent to C, and C has lent to A, forming a triangle.

The question arises: if B defaults, does A's loss on B *also* trigger a loss on C, which then feeds back to A through C's exposure to A? This **triangular interaction** is not visible at the bilateral level. A's bilateral exposure to B is fine; B's bilateral exposure to C is fine; C's bilateral exposure to A is fine. Only looking at all three simultaneously reveals the loop.

Triangular risk is H¹: it lives on the cycles (loops) of the financial network, not the edges. The concrete examples are:

- **Convexity risk:** the difference between the value of a portfolio of swaps and the value of the single swap that replicates them — a three-party effect (you, the counterparty, and the funding market)
- **Basis risk:** two instruments that should track each other (LIBOR and OIS, for instance) diverge because they are connected through different triangles of counterparties
- **CVA/FVA:** counterparty value adjustment and funding value adjustment — both require knowing the triangle of your position, your counterparty, and your funding desk

H¹ risk is **not hedgeable** with any collection of bilateral (H⁰) instruments. You cannot eliminate a loop by trading edges. This is the topological content: loops are qualitatively different from edges, and an instrument that covers an edge cannot cover a loop.

---

## Level 3: Systemic risk (H²)

Now add the money market fund. The three banks and the fund are all interconnected. Each institution manages its own H¹ triangular risks. But the question now is: are those H¹ risk models **mutually consistent**?

Consistency here has a precise meaning. Each institution's H¹ model assigns a correlation (or probability) to the triangle of exposures involving that institution. Systemic risk — H² — is the failure of these correlations to be globally consistent across all institutions simultaneously.

The simplest illustration: Bank A's model says "B and C default together with probability 0.3". Bank B's model says "A and C default together with probability 0.2". Bank C's model says "A and B default together with probability 0.4". These three numbers might be individually plausible — each bank's model looks fine — but collectively they may be inconsistent: there is no joint probability distribution over {A,B,C} that simultaneously gives all three pairwise correlations. When such an inconsistency exists, the system has non-zero H², and a shock can cascade in ways that no individual institution can see or hedge.

H² risk is **not hedgeable** by any single-institution instrument. By definition, it requires knowing the global consistency of all institutions' models simultaneously.

---

## The 2008 lesson

Before 2008, mortgage correlation risk was managed as H¹ at each institution. Each bank's model of mortgage default correlation (within their own portfolio) was reasonable in isolation. The global inconsistency — the H² class of the whole system — was never computed, because no single institution could compute it.

When mortgage defaults began, the H² obstruction became non-trivial: the individual correlation models were mutually inconsistent. The cascade that followed was not caused by any single institution's failure of risk management. It was a topological event at the system level.

The paper makes this precise and proposes concrete regulatory tools to measure H² before the next crisis.

---

## The hierarchy is irreversible

A key point the primer emphasises: each level is genuinely inaccessible from the level below.

- No amount of H⁰ (bilateral) hedging eliminates H¹ (triangular) risk.
- No amount of H¹ hedging eliminates H² (systemic) risk.

This is not a practical limitation but a mathematical theorem. Cohomology classes at level k cannot be detected or cancelled by instruments that live at level k−1. The regulators who told us in 2007 that the financial system was sound were not wrong about the bilateral risks they measured. They were measuring the wrong level.

---

*See also:*
- [Systemic Risk as H²](https://doi.org/10.5281/zenodo.20642908) (#397) — the full technical treatment; the SIFI theorem; the cohomological stress test; the 2008 proof
- [The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526) (#420) — the same H⁰/H¹/H² stratification applied to algorithmic hardness; exactly the same mathematics, different domain
- [CIP Deviation as Persistent H¹](https://doi.org/10.5281/zenodo.20586817) (#438) — a live H¹ anomaly in today's FX market: the cross-currency basis that never closes

*For the full technical treatment, see [doi:10.5281/zenodo.20642983](https://doi.org/10.5281/zenodo.20642983)*
