---
layout: default
title: "Currency Bundles: Foreign Exchange as Connection Curvature on the Financial Manifold"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics]
portfolio: G
---

# Currency Bundles: Foreign Exchange as Connection Curvature on the Financial Manifold: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20242355](https://doi.org/10.5281/zenodo.20242355) (#295)*

## The central idea in one sentence

An exchange rate is a connection — a rule for parallel-transporting value between currency fibres — and triangular arbitrage is non-zero curvature: the gauge-theoretic proof that the market is not perfectly efficient.

## Currencies as fibres

Imagine the global financial system as a manifold — a geometric space where each point represents a different economic context (a country, a sector, a time period). Over each point, there is a **fibre**: a copy of $(R_{>0}, \times)$, the positive reals under multiplication. An element of the fibre is a price: how many units of the local currency are needed to buy a reference basket of goods.

A currency is, in this language, a choice of **local trivialisation** of this bundle. The US dollar is one way to label the positive-real fibre over the US. The euro is a different way to label the fibre over the eurozone. An exchange rate $S_{USD/EUR}$ is a **transition function** between these two trivialisations — it tells you how to identify one fibre with the other.

This is exactly the structure of a **fibre bundle** in differential geometry, and exchange rates are exactly the **connection coefficients** — the objects that tell you how to parallel-transport from one fibre to another.

## Triangular arbitrage is curvature

Consider three currencies: USD, EUR, and GBP. Starting with \$1, you can:
1. Convert to euros: $1 \to S_{EUR/USD}$ euros.
2. Convert to pounds: $S_{EUR/USD} \to S_{EUR/USD} \cdot S_{GBP/EUR}$ pounds.
3. Convert back to dollars: $\to S_{EUR/USD} \cdot S_{GBP/EUR} \cdot S_{USD/GBP}$ dollars.

If this round trip returns exactly \$1, then

$$S_{EUR/USD} \cdot S_{GBP/EUR} \cdot S_{USD/GBP} = 1.$$

This is the **no-arbitrage condition for a triangle of currencies**. In gauge theory language, it says that the **holonomy** of the connection around the triangle USD→EUR→GBP→USD is trivial: you come back to where you started with the same value.

If the product is not 1, then arbitrage exists — you can make money by routing currency conversions around the triangle. The deviation from 1 is precisely the **curvature** $F$ of the connection on the currency bundle:

$$F = dA + A \wedge A,$$

where $A = \ln S$ is the logarithmic exchange rate (which converts multiplicative to additive structure). Flat connection ($F = 0$) means no triangular arbitrage. Non-zero curvature means the geometry of the currency bundle has holes — places where value is not conserved under parallel transport.

## The gauge group and purchasing power parity

The gauge group of the currency bundle is $(R_{>0}, \times)$: simultaneously multiplying all prices in a given currency by a constant $\lambda > 0$. This is a change of units — going from pounds to pence, or from euros to eurocents. Physical quantities (price ratios) are unchanged; only the labelling changes.

**Purchasing power parity (PPP)** is the statement that, in the long run, exchange rates should be chosen so that the connection is flat. PPP is gauge-fixing: choosing a convention so that a basket of identical goods costs the same in every currency (after conversion). The gauge-fixed exchange rate is the PPP rate; the actual exchange rate is the sum of the PPP rate and the curvature correction.

Long-run deviations from PPP are, in this language, **persistent curvature**: the currency connection has not relaxed to its flat value. The mean-reversion of real exchange rates to PPP is the dynamical statement that the curvature slowly dissipates under the action of trade and capital flows.

## Interest rate parity as a flatness condition

Covered interest rate parity (CIP) is the no-arbitrage condition on the **joint** currency-plus-time bundle. It states that the forward exchange rate must satisfy

$$F_{USD/EUR}(T) = S_{USD/EUR}(0) \cdot \frac{P_{EUR}(0, T)}{P_{USD}(0, T)},$$

where $P(0,T)$ is the domestic-currency discount factor for maturity $T$. In gauge language: the curvature of the joint connection — combining the FX connection and the interest rate connection — must be zero.

CIP held almost perfectly from 1990 to 2008. After 2008, CIP deviations became persistent and large, especially for USD/EUR and USD/JPY. In FGT terms: the financial crisis created non-zero curvature in the joint currency-time bundle. The curvature persists because balance-sheet constraints prevent arbitrageurs from fully eliminating it — the arbitrage is real but the capital required to trade it is constrained by leverage limits.

## The FH theory: the native $(R_{>0}, \times)$ framework

The standard Black-Scholes and interest rate models are formulated in $(R, +)$ — additive arithmetic. This requires taking logarithms ($\ln S$) to convert exchange rates into additive quantities, which introduces a spurious asymmetry (the log-normal distribution treats large positive returns differently from large negative returns, which are bounded at $-100\%$).

The **Financial Holonomy (FH)** theory is formulated natively in $(R_{>0}, \times)$ — multiplicative arithmetic. Exchange rates, discount factors, and survival probabilities are all naturally multiplicative: a sequence of daily returns compounds multiplicatively. The FH theory treats these objects as elements of the gauge group directly, without logarithmic transformation.

The HJM interest rate model and the standard Black-Scholes FX model are recovered from FH in the **continuum limit**: when the manifold is fine-grained in time and the connections are smooth, FH reduces to the familiar Itô-calculus models. The Libor Market Model (LMM) is the **lattice limit**: when the time grid is discrete (a finite set of payment dates), FH reduces to the discrete-time swap market model.

FH is thus the parent framework from which both continuous-time and discrete-time models are derived as limiting cases of the same geometric structure.

## Why the gauge group is $(R_{>0}, \times)$ and not $U(1)$

Many papers on financial gauge theory use the group $U(1)$ — the circle group of complex numbers with modulus 1 — as the gauge group. This is mathematically convenient but economically incorrect.

Prices are positive real numbers, not phases. Multiplying a price by $e^{i\theta}$ (a complex rotation) has no economic meaning. The correct gauge group is $(R_{>0}, \times)$ — positive real rescalings. This group is isomorphic to $(R, +)$ via the logarithm, so it is a one-dimensional Lie group, just like $U(1)$. But the physical interpretation is entirely different: $(R_{>0}, \times)$ acts by rescaling prices (changing the unit of account), while $U(1)$ would act by rotating phases (which has no economic meaning).

## What to read next

- [Buckley (2026) — A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505) — *The full vocabulary of connections, curvature, and gauge invariance for economists.*
- [Buckley (2026) — Term Structure Bundles](https://doi.org/10.5281/zenodo.20244445) — *The time connection: yield curves as the temporal analogue of exchange rates.*
- [Buckley (2026) — Credit Bundles](https://doi.org/10.5281/zenodo.20257596) — *Survival probabilities as credit connections: the third component of the full FGT connection.*
- [Buckley (2026) — Valuation Adjustments as Curvature](https://doi.org/10.5281/zenodo.20257724) — *XVA as integrals of curvature over trade lifetimes.*

*For the full technical treatment, see [doi:10.5281/zenodo.20242355](https://doi.org/10.5281/zenodo.20242355)*
