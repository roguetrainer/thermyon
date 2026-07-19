---
layout: default
title: "Beyond Basel: A Cohomological Framework for Systemic Risk Regulation"
parent: Explainers
nav_exclude: true
tags: [systemic-risk, regulation, basel, g-sib, network-topology, sheaf-cohomology, betti-numbers, funding-loops, capital-requirements, lcr, nsfr, lender-of-last-resort, bagehot, mehrling, ccp, macroprudential, resolution, financial-stability, 2008-crisis, marginal-capital-charge, deep-framework, economics]
portfolio: G
---

## The Regulatory Instrument That Does Not Exist Yet

*Plain-language explainer for [doi:10.5281/zenodo.20701683](https://doi.org/10.5281/zenodo.20701683) (#426)*

---

## The central idea in one sentence

The Basel framework regulates solvency (capital) and liquidity (LCR/NSFR) but has no instrument for a third, deeper category — systemic topology risk, the risk that funding-gap resolutions across institutions conflict at the network level, making the system irresolvable by any bilateral or multilateral netting — and the 2008 crisis was exactly this kind of failure.

---

## What Basel actually measures

Basel III gives regulators three main instruments:

- **Capital requirements** (CET1, Tier 1): can the institution pay its debts? — solvency risk
- **LCR / NSFR ratios**: can it fund itself short-term? — liquidity risk  
- **G-SIB buffer**: is it systemically important? — a size-and-proxy measure

Lehman Brothers had an 11% Tier 1 capital ratio at end-2007. It appeared liquid in August 2008. Every Basel instrument said it was fine. What failed was the *network* — cascading collateral conflicts that no bilateral resolution could untangle. The failure was invisible to every Basel instrument because no regulator was computing the topology of the exposure network.

---

## The three layers of financial risk

The paper identifies three risk categories, each requiring a deeper instrument than the last:

**Layer 0 — Solvency risk** (bilateral, H⁰): Can institution $i$ pay its debts? Measured by capital ratios. Basel III is broadly adequate here.

**Layer 1 — Liquidity risk** (triangular, H¹): Can the *network* fund itself? LCR and NSFR are institution-level instruments — they cannot detect network-level funding loops. Three banks each satisfying LCR individually can still form an irresolvable funding loop collectively. The number of independent funding loops is $\beta_1 = m - n + c$, where $m$ = bilateral exposures, $n$ = institutions, $c$ = connected components. This is computable in $O(n+m)$ time from existing regulatory data.

**Layer 2 — Systemic topology risk** (surface, H²): Can the *network resolve itself*? This is not addressed by any existing instrument. The relevant quantity is $\beta_2 = \dim(\ker B_2 / \operatorname{im} B_1)$ — the number of irresolvable conflict cycles in the three-party exposure network. The G-SIB buffer does not measure this; it gives no actionable restructuring guidance.

---

## The marginal topology capital charge

The paper proposes a new regulatory instrument: a capital charge based on each institution's marginal contribution to systemic irresolvability:

$$K^{\mathrm{top}}_i = \kappa \cdot \Delta\beta_2(i) \cdot \mathrm{EAD}_i$$

where $\Delta\beta_2(i) = \beta_2(\text{full network}) - \beta_2(\text{network without } i)$ is institution $i$'s marginal contribution to the count of irresolvable conflict cycles, and $\kappa$ is a regulatory calibration constant.

Three properties make this instrument attractive:

1. **Actionable:** it tells each institution exactly which bilateral exposures to restructure, novate to a CCP, or reduce. An institution with $\Delta\beta_2(i) = 0$ pays zero regardless of size.
2. **Computable:** $\beta_1$ in $O(n+m)$; $\beta_2$ in $O(n^3)$; marginal $\Delta\beta_2$ in $O(n^2)$ per exposure via rank-one matrix update. The data is largely already collected (EMIR, FR 2052a, AnaCredit).
3. **Incentive-compatible:** CCP clearing, trade compression, and netting set restructuring all reduce the charge directly.

---

## The critical threshold and Bagehot's rule

The paper identifies a critical threshold

$$\beta^*(\rho) = \frac{3}{8}\ln\!\left(\frac{1}{1-\rho}\right)$$

where $\rho$ is the density of active bilateral exposures. This is the inverse temperature at which the exposure network transitions from self-resolving (below $\beta^*$) to cascade-prone (above $\beta^*$). The Countercyclical Capital Buffer should activate automatically when $\rho$ crosses $\rho^*(\beta^*) = 1 - e^{-8/3} \approx 0.931$.

Bagehot's rule — "lend freely at a high rate against good collateral" — is the Layer 1 intervention: the penalty rate corresponds to $\beta^*(\rho)$, the critical temperature at which self-resolution is maximally incentivised while cascade is prevented. Mehrling's extension (dealer of last resort) addresses the same Layer 1 problem for the collateral/shadow banking network.

---

## Why centralisation is mathematically necessary

Systemic topology risk is a global property of the network. Computing $\beta_2 = \dim(\ker B_2 / \operatorname{im} B_1)$ requires both the bilateral exposure matrix $B_1$ and the three-party conflict matrix $B_2$ in full. No individual institution can see both. The network topology regulator must be centralised — not as a policy choice, but as a mathematical necessity: the Betti number is a global invariant that cannot be decomposed into bilateral components.

---

## The 2008 crisis as a topology failure

The standard narrative attributes 2008 to excess leverage, lax underwriting, and regulatory arbitrage. These are correct but incomplete. The deeper failure was topological: the repo/collateral network had accumulated enough three-party conflict cycles ($\beta_2 > 0$) that when Lehman failed, no resolution authority could find a consistent assignment of collateral across the network. The system was irresolvable by construction — and no Basel instrument could have detected this, because none of them measure $\beta_2$.

The paper states this as a theorem: a network with $\beta_2 > 0$ cannot be resolved by any bilateral or multilateral netting, regardless of the solvency or liquidity position of individual institutions.

---

## Companion papers

- [H¹=0 Performance Condition](https://doi.org/10.5281/zenodo.20684509) (#415) — the Layer 1 instrument in detail; the H¹=0 condition as the regulatory performance target
- [Systemic Risk as H²](https://doi.org/10.5281/zenodo.20642908) (#397) — the mathematical framework; Betti numbers and their financial interpretation
- [The Topology of Risk: A Primer](https://doi.org/10.5281/zenodo.20642983) (#398) — accessible introduction to H⁰/H¹/H² for financial practitioners, no mathematical prerequisites

---

## What to read next

- [The Unhedgeability Theorem](https://doi.org/10.5281/zenodo.20635479) (#396) — the mathematical foundation: a financial risk is hedgeable iff its H¹ class is trivial; convexity, basis risk, and XVA as H¹ classes
- [Pacioli Homology](https://doi.org/10.5281/zenodo.20234853) (#291) — double-entry accounting as a gauge theory; the Pacioli identity as a conservation law; the mathematical structure underlying the three-layer architecture
- [XVA as Gauge Curvature](https://doi.org/10.5281/zenodo.20257724) (#299) — CVA/DVA/FVA as curvature of a connection on the Pacioli manifold

*For the full technical treatment, see [doi:10.5281/zenodo.20701683](https://doi.org/10.5281/zenodo.20701683)*
