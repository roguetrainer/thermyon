---
layout: default
title: "Term Structure Bundles: Interest Rates as Temporal Connections on the Pacioli Manifold"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics]
portfolio: G
---

# Term Structure Bundles: Interest Rates as Temporal Connections on the Pacioli Manifold: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20244445](https://doi.org/10.5281/zenodo.20244445) (#296)*

## The central idea in one sentence

The yield curve is a connection on a time bundle over the Pacioli manifold, and the Heath-Jarrow-Morton no-arbitrage condition is the statement that this connection is flat — a geometric fact that subsumes an entire textbook of interest rate modelling.

## What a yield curve actually is

A yield curve is a function $r(T)$ that tells you the annualised return on a zero-coupon bond maturing at time $T$. If you lend £1 today and receive it back at time $T$ with no intermediate coupons, the yield is:

$$r(0, T) = -\frac{\ln P(0, T)}{T},$$

where $P(0, T)$ is the price today of £1 to be delivered at time $T$ — the **discount factor**.

Equivalently, the **forward rate** $f(0, T)$ is the instantaneous rate at which the yield curve is accruing at time $T$:

$$f(0, T) = -\frac{\partial \ln P(0, T)}{\partial T}.$$

The forward rate is the **connection coefficient** on the time bundle. To parallel-transport £1 from time $T$ to time $T + dT$, you multiply by $e^{-f(0,T) dT}$. The full discount factor is the path-ordered exponential of the forward rate:

$$P(0, T) = \exp\!\left(-\int_0^T f(0, s)\,ds\right) = \mathcal{P}\exp\!\left(-\int_0^T A\right),$$

where $A = f(0,t)\,dt$ is the connection 1-form on the time axis. This is the holonomy of the time connection along the path from 0 to $T$.

## The HJM no-arbitrage condition as flatness

Heath, Jarrow, and Morton (1992) showed that the drift of the forward rate under the risk-neutral measure must satisfy:

$$d f(t, T) = \sigma(t, T) \cdot \int_t^T \sigma(t, u)\,du \cdot dt + \sigma(t, T)\,dW_t,$$

where $\sigma(t, T)$ is the volatility of the forward rate and $W_t$ is a Brownian motion. The drift term is **determined entirely by the volatility**: you cannot freely choose both.

This HJM drift condition is the no-arbitrage condition on the time connection. In gauge theory language, it is the statement that the curvature of the connection must be zero:

$$F = dA + A \wedge A = 0.$$

Expanding this in components: the change in the connection coefficient $f(t, T)$ over time is constrained by the volatility structure via the flatness condition. The HJM drift is the unique drift that maintains flatness — any other drift would introduce curvature, which is arbitrage.

The key insight is that the entire HJM framework — which generates an infinite-dimensional family of interest rate models including Hull-White, Ho-Lee, and the shifted lognormal models — is unified as different choices of the volatility function $\sigma(t, T)$ subject to the single geometric constraint $F = 0$.

## The Libor Market Model as lattice gauge theory

The Libor Market Model (LMM, Brace-Gatarek-Musiela 1997) is the standard term structure model for pricing interest rate derivatives (caps, floors, swaptions) because it directly models observable market rates — Libor forward rates $L(t; T_k, T_{k+1})$ — rather than instantaneous forward rates.

In the gauge theory framework, LMM is **lattice gauge theory**: gauge theory defined on a discrete grid of time points $\{T_0, T_1, \ldots, T_N\}$ rather than a continuum. Each link $[T_k, T_{k+1}]$ carries a link variable — the discrete connection — which is the Libor forward rate $L_k(t)$. The holonomy around a plaquette (a rectangular loop in the $(t, T)$ plane) is the swap rate.

The LMM no-arbitrage condition (the drift constraint on each $L_k$) is the discrete flatness condition: the product of link variables around any plaquette must equal 1. This is the lattice analogue of $F = 0$.

The passage from LMM (lattice) to HJM (continuum) is a **continuum limit**: as the tenor spacing $\Delta T = T_{k+1} - T_k \to 0$, the discrete link variables become continuous connection coefficients and the lattice flatness condition becomes the HJM drift condition. This is exactly the continuum limit that takes lattice gauge theory to continuum Yang-Mills theory in physics.

## The FH theory: the native framework

Both HJM and LMM are formulated in the additive arithmetic of $(R, +)$: forward rates are added, Brownian increments are added, Itô corrections are added. This requires logarithmic transformations to connect to the multiplicative world of prices and discount factors.

The **Financial Holonomy (FH)** theory works directly in $(R_{>0}, \times)$: discount factors, survival probabilities, and growth factors are all multiplicative. No logarithm is needed. The connection is a multiplicative quantity — a positive real number per unit time — and holonomy is a product rather than an exponential of an integral.

FH is the **native** formulation; HJM and LMM are derived as limiting cases:
- **HJM** is the continuum, infinitesimal-connection limit of FH: when flows are continuous and connections are smooth.
- **LMM** is the discrete, finite-connection limit of FH: when flows occur on a fixed schedule of payment dates.

The FH framework accommodates features that neither HJM nor LMM handles natively: negative interest rates (a genuine puzzle for lognormal LMM, since $\ln(L_k)$ is not defined for $L_k < 0$), multiplicative jumps (which are natural in $(R_{>0}, \times)$), and non-flat connections (which FH can represent while HJM and LMM, being no-arbitrage frameworks, cannot).

## Term structure moves and gauge transformations

A parallel shift of the yield curve — all forward rates move by the same amount $\Delta$ — is the simplest yield curve move, corresponding to a change in the short rate. In gauge language, it is a **gauge transformation**: shifting $A \to A + d\Lambda$ (where $\Lambda$ is a scalar function) changes the connection without changing its curvature.

More complex yield curve moves — steepening, flattening, twisting — are **not** pure gauge transformations: they change the shape of the connection and can change the curvature (if the change is not consistent with flatness). A steepening of the yield curve in a flat-connection market is therefore an unusual event from the gauge perspective: it requires either the introduction of real curvature (arbitrage) or a simultaneous change in the volatility structure that preserves flatness.

This gives a geometric interpretation of principal component analysis (PCA) of yield curve moves: the three dominant principal components (level, slope, curvature) are three directions in the space of connection deformations — two gauge directions (level and slope) plus one curvature direction.

## What to read next

- [Buckley (2026) — A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505) — *The core vocabulary: connections, curvature, and the gauge group.*
- [Buckley (2026) — Currency Bundles](https://doi.org/10.5281/zenodo.20242355) — *FX connections: how exchange rates sit alongside interest rates in the full FGT framework.*
- [Buckley (2026) — Credit Bundles](https://doi.org/10.5281/zenodo.20257596) — *Survival probabilities as credit connections: the third component of the joint discount-credit-FX connection.*
- [Buckley (2026) — Valuation Adjustments as Curvature](https://doi.org/10.5281/zenodo.20257724) — *XVA as curvature of the combined interest rate, credit, and funding connection.*

*For the full technical treatment, see [doi:10.5281/zenodo.20244445](https://doi.org/10.5281/zenodo.20244445)*
