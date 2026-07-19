---
layout: default
title: "Credit Bundles: Survival Probabilities as Parallel Transport on the Pacioli Manifold"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics]
portfolio: G
---

# Credit Bundles: Survival Probabilities as Parallel Transport on the Pacioli Manifold: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20257596](https://doi.org/10.5281/zenodo.20257596) (#298)*

## The central idea in one sentence

A credit default swap is a connection on the Pacioli manifold, and the survival probability is its holonomy — the mathematical object that measures how much value is lost when you parallel-transport a cash flow through the risk of default.

## Credit risk as geometry

A lender who holds a corporate bond faces two kinds of risk: interest rate risk (the risk-free discount rate changes) and credit risk (the borrower defaults). Standard credit risk models treat these as two separate multiplicative adjustments: the bond price is the risk-free price multiplied by a "survival probability". This paper shows that this separation is not an ad hoc convenience — it is the natural structure of a gauge theory with two independent connections.

The risk-free discount factor $P(t, T)$ is a connection on the **time bundle** over the Pacioli manifold — a rule for transporting value across maturities. The survival probability $S(t)$ is a connection on the **credit bundle** — a rule for transporting the promise of future payment through the possibility of default. These two connections live in different bundles and their curvatures are, in general, independent.

## The hazard rate connection

The survival probability of a borrower over the interval $[0, t]$ is

$$S(t) = \exp\!\left(-\int_0^t \lambda(s)\,ds\right),$$

where $\lambda(s) \geq 0$ is the **hazard rate** (also called the default intensity or credit spread, in the appropriate limit). This formula is structurally identical to the parallel transport formula for a connection $A = \lambda\,dt$ along the time axis:

$$\text{holonomy} = \mathcal{P}\exp\!\left(-\int_0^t A\right) = e^{-\int_0^t \lambda(s)\,ds} = S(t).$$

The hazard rate $\lambda(t)$ is the connection coefficient — the infinitesimal generator of survival probability. Just as the yield curve $r(t, T)$ is the connection coefficient for the risk-free time bundle, the hazard rate curve $\lambda(t, T)$ is the connection coefficient for the credit bundle.

## What curvature means in credit markets

In a bundle with a single one-dimensional fibre (Abelian gauge theory), the curvature of a connection is a two-form $F = dA$. For the credit bundle, curvature in the $(t_1, t_2)$ plane — meaning between two different obligors or two different time horizons — measures **default correlation**.

Concretely: if obligor $A$ and obligor $B$ are independent (zero correlation), the combined survival probability is $S_A(t) \cdot S_B(t)$, and the connections on their respective credit bundles have zero mutual curvature. If defaults are correlated — as they notoriously were during the 2008 subprime crisis — the path from "both survive" to "both default" is not independent of the route taken through the credit event space. This path-dependence is exactly what non-zero curvature measures.

The CDO (collateralised debt obligation) pricing problem that destroyed several investment banks in 2007-2008 was, in this language, a curvature estimation problem. The Gaussian copula model (Li 2000) implicitly assumed flat connections on the joint credit bundle. It was catastrophically wrong because the actual curvature — the correlation between mortgage defaults across different US cities and income bands — was large and positive.

## Transporting a dollar through credit risk

To price a corporate bond paying \$1 at time $T$ from borrower $B$, you need to parallel-transport that dollar from time $T$ back to today using **two connections in series**:

1. **The risk-free connection**: multiply by the risk-free discount factor $P(0, T)$ to adjust for the time value of money.
2. **The credit connection**: multiply by the survival probability $S(0, T) = e^{-\int_0^T \lambda(s)\,ds}$ to adjust for default risk.

The bond price is $V(0) = P(0, T) \cdot S(0, T)$. This is the holonomy of the combined connection along the path from today to $T$.

For a portfolio of bonds with correlated default risk, the combined survival probability is **not** the product of individual survival probabilities — curvature creates cross-terms. This is why structured credit products like CDOs require models that go beyond individual hazard rates and capture the joint curvature of the credit bundle.

## Credit default swaps as connections

A credit default swap (CDS) is a contract where the protection buyer pays a periodic spread $s$ in exchange for a payment of $(1 - R)$ (where $R$ is the recovery rate) if the reference entity defaults. The CDS spread $s$ is set so the contract has zero value at inception — it is the fair price of the credit connection.

In FGT language, the CDS spread is the **Yang-Mills action** of the credit connection: it is the coupon you pay for the right to be "gauged away" from the credit risk. The no-arbitrage CDS spread is

$$s = \frac{(1-R) \int_0^T P(0,t) \cdot (-dS(t))}{\int_0^T P(0,t) \cdot S(t)\,dt},$$

where the numerator is the expected loss weighted by the risk-free discount factor, and the denominator is the risky annuity (the duration of the CDS). This is a ratio of curvature integrals.

## Recovery rates as boundary conditions

When default occurs, the recovery rate $R$ determines what fraction of the promised payment is delivered. In the gauge theory language, $R$ is a **boundary condition** on the credit bundle at the default event. A recovery of $R = 0$ (complete loss) means the connection degenerates — the fibre collapses to zero. A recovery of $R = 1$ (full recovery) means the default was not really a default — the connection is smooth.

The uncertainty about recovery rates is a source of **gauge ambiguity**: different recovery conventions (recovery of face value, recovery of market value, recovery of treasury) correspond to different ways of choosing the boundary condition, and they produce different credit spreads even when the default probability is the same.

## CVA as integrated curvature

The Credit Valuation Adjustment (CVA) is the correction to the risk-free price of a derivative for the possibility that the counterparty defaults before the trade matures. In FGT, CVA is the **integral of the credit curvature** over the trade's lifetime:

$$\text{CVA} = (1-R) \int_0^T \text{EE}(t) \cdot (-dS(t)),$$

where $\text{EE}(t)$ is the expected exposure at time $t$ and $-dS(t) = \lambda(t) S(t)\,dt$ is the default probability density. This is a Wilson loop integral in the credit bundle, summed over all possible default times weighted by the risk-free expected exposure.

## What to read next

- [Buckley (2026) — A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505) — *Connections, curvature, and conservation on the Pacioli manifold: the vocabulary this paper uses.*
- [Buckley (2026) — Term Structure Bundles](https://doi.org/10.5281/zenodo.20244445) — *The risk-free time connection: how the yield curve fits into the same framework.*
- [Buckley (2026) — Valuation Adjustments as Curvature](https://doi.org/10.5281/zenodo.20257724) — *CVA, DVA, FVA, and the full XVA suite as components of a unified curvature tensor.*
- [Buckley (2026) — Currency Bundles](https://doi.org/10.5281/zenodo.20242355) — *FX connections: how exchange rates sit alongside credit connections in the full FGT framework.*

*For the full technical treatment, see [doi:10.5281/zenodo.20257596](https://doi.org/10.5281/zenodo.20257596)*
