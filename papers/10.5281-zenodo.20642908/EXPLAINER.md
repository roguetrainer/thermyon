---
layout: default
title: "Systemic Risk as H²"
parent: Explainers
nav_exclude: true
tags: [sheaf-cohomology, systemic-risk, xva, wrong-way-risk, sifi, contagion, pentagon, stress-testing, econiac, h2, 2008-crisis, financial-stability]
portfolio: G
---

## The 2008 Crisis Was a Topological Event — and Standard Stress Tests Cannot See It

*Plain-language explainer for [doi:10.5281/zenodo.20642908](https://doi.org/10.5281/zenodo.20642908) (#397)*

---

## The central idea in one sentence

Financial crises are H² events: they occur when individually manageable risks at each institution become mutually inconsistent at the system level, producing a topological obstruction that no bilateral hedge can remove — and standard stress tests, which only compute H⁰ (bilateral) exposures, are structurally blind to this.

---

## Three levels of financial risk

The primer ([#398](https://doi.org/10.5281/zenodo.20642983)) introduces three structural levels of risk. This paper applies them to systemic crises.

**H⁰ — Bilateral risk.** Two parties, one instrument. A forward contract between Bank A and Bank B is H⁰ risk: fully hedgeable with the opposite forward. Standard credit risk, counterparty risk, and most XVA calculations live here. Regulators measure this well.

**H¹ — Triangular risk.** Three or more parties, interacting. Convexity risk (the gap between a swap and its replicating portfolio), basis risk (the spread between two instruments that should move together), correlation risk, CVA/FVA at the portfolio level — all of these only appear when you look at three or more parties simultaneously. H¹ risk is **not hedgeable** with any collection of bilateral instruments. It requires three-way agreements. Most pre-2008 risk management dealt with H¹ well at the individual-institution level.

**H² — Systemic risk.** The full network of institutions, interacting. H² risk arises when the H¹ risks of individual institutions are **mutually inconsistent**: each institution manages its correlation exposure correctly in isolation, but the correlation assumptions are contradictory across the system. When this happens, a small shock cascades. No single-institution instrument can hedge H² risk; it can only be managed by changing the topology of the system.

---

## Why 2008 was H²

Before 2008, mortgage risk was managed as H¹ at each institution. Each bank computed its mortgage correlation exposure (H¹) and hedged it, largely via CDO tranching and CDS contracts. These hedges were correct in isolation.

The problem was systemic: every bank's correlation hedge assumed that mortgage defaults were correlated within regions but independent across banks. This cross-institution correlation was an H² class — a global consistency condition on all the individual H¹ hedges simultaneously. Nobody computed it, because no single institution could see it; it only existed at the level of the full financial system.

When mortgage defaults began, the H² class became non-trivial: the individual institutions' H¹ correlation models were mutually inconsistent. The cascade was not a failure of individual risk models. It was a topological event — the H² obstruction becoming non-zero — and it was invisible to every standard risk measure in use.

The paper proves this formally: the **Pentagon identity** (the consistency condition for composition of financial contracts, which underlies no-arbitrage) **failed at the system level** in 2008. The failure was not local (no single contract was mispriced) but global (the collection of contracts was internally inconsistent). H² measures exactly this global inconsistency.

---

## The cohomological stress test

The paper proposes a three-tier stress test that regulators could run:

**Tier 1 (H⁰ test):** Compute bilateral losses if each exposure defaults. This is what Basel III prescribes. It detects individual institution failure but not cascade.

**Tier 2 (H¹ test):** Propagate shocks through interaction triangles: if A loses on B, and B loses on C, does A's loss on B trigger a further loss on C through the C-A connection? H¹ captures propagation within triads — the mechanism of second-order contagion.

**Tier 3 (H² test):** Check whether the full system of H¹ risks is internally consistent. If H² ≠ 0, the system has a topological obstruction: a global inconsistency that will trigger a cascade regardless of how well-capitalised each individual institution is.

Only the H² test detects the onset of systemic cascades. The Basel framework runs only Tier 1. The paper argues that Tier 3 must be added.

---

## The SIFI theorem

A **systemically important financial institution** (SIFI) is currently defined by size (too big to fail) or by network centrality (too connected to fail). The paper replaces this with a topological definition:

> **SIFI Theorem:** A financial institution is systemically important if and only if its removal from the system changes the H² class of the interaction sheaf — that is, if it is "too H²-critical to fail."

This is computable. Given the network of exposures, you compute the H² class of the full system, then remove each institution in turn and recompute. If H² changes, that institution is a SIFI. If H² does not change, removing that institution does not alter the systemic risk profile.

This definition is independent of size and is not fooled by complexity of instrument. AIG in 2008 was not large — it was H²-critical: its CDS portfolio was the hinge that made the mortgage correlation H² class non-trivial. Removing AIG (via orderly resolution) would have changed H²; this is why its failure triggered a cascade.

---

## What regulators could do

The H² framework suggests concrete regulatory tools:

1. **Require H² reporting**: institutions above a threshold must report their contribution to the system's H² class, not just their bilateral exposures.
2. **Cap H²**: if the system-level H² class exceeds a threshold, require structural changes (netting, clearing, instrument simplification) that reduce H².
3. **SIFI designation by H²-criticality**: replace the current size/connectivity criteria with the topological criterion above.

The mathematics to do this exists; the paper provides it. The regulatory will to do it is a different question.

---

*See also:*
- [The Topology of Risk: A Primer](https://doi.org/10.5281/zenodo.20642983) (#398) — the gentle introduction to H⁰/H¹/H² for practitioners; read this first
- [CIP Deviation as Persistent H¹](https://doi.org/10.5281/zenodo.20586817) (#438) — regulatory capital as a curvature floor; H¹ that cannot be traded away
- [A Cohomological Theory of Clearing and Netting](https://doi.org/10.5281/zenodo.20586821) (#439) — H² impossibility theorem for full multilateral netting

*For the full technical treatment, see [doi:10.5281/zenodo.20642908](https://doi.org/10.5281/zenodo.20642908)*
