---
layout: default
title: "Economic Gauge Theory: Stock-Flow Consistency, Thermodynamic Constraints, and Climate Risk on the Pacioli Manifold"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics, agent-based-models]
portfolio: G
---

# Economic Gauge Theory: Stock-Flow Consistency, Thermodynamic Constraints, and Climate Risk on the Pacioli Manifold: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20259495](https://doi.org/10.5281/zenodo.20259495) (#300)*

## The central idea in one sentence

Stock-flow consistency is the conservation law of economics, the gauge group $(R_{>0}, \times)$ generates the accounting identities via Noether's theorem, and climate risk enters as curvature — path-dependent valuation that no portfolio of standard instruments can hedge.

## Three deep unifications

This paper unifies three bodies of economic thought that have previously appeared unrelated:

1. **Godley-Lavoie stock-flow consistent (SFC) macroeconomics** — the tradition, pioneered by Wynne Godley at Cambridge, that insists every flow of funds must be tracked from source to destination, with no money created from thin air or lost in transit.
2. **Financial gauge theory (FGT)** — the framework (introduced in Papers 289-301) that interprets prices as connections, arbitrage as curvature, and accounting identities as gauge invariance.
3. **Landauer-Shannon information thermodynamics** — the result that information processing has a minimum thermodynamic cost, and the application of this to price discovery in financial markets.

The synthesis is the **Economic Gauge Theory (EGT)**: a single mathematical framework that contains all three as special cases.

## Stock-flow consistency as conservation

Godley's fundamental insight was that national accounts must balance at every level of disaggregation. Every dollar borrowed by a household is lent by a bank. Every current account deficit is a capital account surplus. Every government deficit is a private sector surplus. These identities are not approximations — they are exact accounting constraints.

In the language of differential topology, these constraints are expressed as $\partial^2 = 0$: the boundary of a boundary is zero. The Pacioli manifold is the directed graph of institutional flows; the constraint $\partial^2 = 0$ is the statement that flows are conserved at every node.

This is the same mathematical structure as the conservation law in a gauge field theory. The conserved current is the flow of value; the conservation law is the accounting identity; the symmetry (by Noether's theorem) is the gauge group $(R_{>0}, \times)$.

**Noether's theorem applied to EGT**: For every continuous symmetry of the action, there is a conserved current. The symmetry of the economic action under $(R_{>0}, \times)$ — simultaneously rescaling all prices by a constant $\lambda$ — leaves the real structure of the economy unchanged. The conserved current associated with this symmetry is the accounting identity: for every rescaling, the sum of all flows into any node equals the sum of all flows out.

This is not a restatement of SFC in new language. It is a proof that SFC must hold in any theory that has the gauge group $(R_{>0}, \times)$ as a symmetry. The accounting identities are not assumptions — they are theorems.

## Climate risk as curvature

Standard financial risk models — Value at Risk, Expected Shortfall, the Greeks — assume that the risk-free discount rate and asset prices follow processes with well-defined second moments and no path-dependence beyond the Markov state. Climate risk violates both assumptions.

**Stranded asset risk** — the possibility that fossil fuel reserves become economically unextractable before they are extracted — creates path-dependence in valuation. Whether a reserve is stranded depends on which carbon taxes and clean energy mandates are enacted, in what order, and on what timeline. As Paper 292 shows, the sequencing of climate policies is non-associative: the associator $[\text{carbon tax}, \text{clean energy subsidy}, \text{stranded asset writedown}]$ is large and non-zero.

In FGT language, this means the connection on the asset valuation bundle is **not flat in the presence of climate policy uncertainty**. The curvature $F \neq 0$ implies that the value of a stranded asset depends on the path of policy implementation — which route through policy-space you take from today to the Paris Agreement target.

Path-dependent valuation cannot be hedged by any portfolio of standard instruments (forwards, options on specific assets), because hedging requires replication — constructing a portfolio that mirrors the payoff regardless of the path taken. When the payoff depends on the path (non-zero curvature), replication requires instruments sensitive to the curvature itself — instruments that do not yet exist in standard financial markets.

EGT therefore predicts **systematic under-pricing of climate risk**: standard instruments cannot capture curvature, so climate risk will be under-hedged until curvature-sensitive instruments (analogues of volatility swaps, which are sensitive to the variance of the path, not just its endpoint) are introduced.

## The thermodynamic constraint on economic growth

Landauer's principle (1961) states that erasing one bit of information requires a minimum energy expenditure of $k_B T \ln 2$, where $k_B$ is Boltzmann's constant and $T$ is the ambient temperature. This is a thermodynamic lower bound on computation.

Applied to financial markets, Landauer's principle implies a lower bound on the energy cost of **price discovery**: determining the market-clearing price of an asset requires processing information, and information processing consumes energy. For a market with $N$ assets and $M$ active participants, the minimum energy cost of price discovery per trading round is of order $N M k_B T \ln 2$.

The EGT thermodynamic constraint is: **an economy cannot grow in real terms faster than it can process price information**, where the information processing rate is bounded by the available energy dissipation rate.

This is not a statement about any specific technology — it applies to any market mechanism, from open-outcry trading pits to algorithmic electronic markets. It provides a physical upper bound on economic growth rates as a function of available energy, independent of the production function or preferences.

The bound is not tight under current conditions — existing economies operate far from the Landauer limit. But as computation becomes the dominant economic activity (AI training, financial risk modelling, logistics optimisation), the thermodynamic constraint becomes relevant and eventually binding.

## Worked example: Godley's sectoral balances in EGT

The Godley sectoral balance identity is

$$(\text{Government deficit}) + (\text{Current account surplus}) + (\text{Private sector surplus}) = 0.$$

In EGT, this is the flatness condition on the three-sector connection. The three sectors (government, foreign, private) are the three fibres; the flows between them (taxes, transfers, exports, imports, borrowing, lending) are the connection coefficients. The sectoral balance identity is $F = 0$ for this three-sector bundle.

Austerity policy (reducing the government deficit) changes the connection on the government fibre. By the flatness condition, this must be compensated by changes in the other two fibres: either the current account must improve (more exports, fewer imports) or the private sector must run a larger surplus (less borrowing, more saving). If neither happens, the connection becomes curved — and curvature (in this model) means unplanned inventory accumulation, unexpected rises in household debt, or sudden capital outflows.

This is Godley's "three balances" argument, derived from first principles using gauge theory rather than accounting identities.

## What to read next

- [Buckley (2026) — A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505) — *Entry point: connections, curvature, and the gauge group for economists.*
- [Buckley (2026) — The Topology of Conservation](https://doi.org/10.5281/zenodo.20234853) — *The Pacioli manifold and double-entry bookkeeping as discrete gauge theory.*
- [Buckley (2026) — Beyond DAGs](https://doi.org/10.5281/zenodo.20234870) — *Non-associative algebra of policy interventions: the climate curvature argument in detail.*
- [Buckley (2026) — Differentiable Agent-Based Macroeconomics](https://doi.org/10.5281/zenodo.20261945) — *The computational implementation of EGT as a differentiable macroeconomic model.*

*For the full technical treatment, see [doi:10.5281/zenodo.20259495](https://doi.org/10.5281/zenodo.20259495)*
