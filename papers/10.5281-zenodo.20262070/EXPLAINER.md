---
layout: default
title: "The Pacioli Combinator Library: A Universal Domain-Specific Language for Financial and Economic Computation on the Pacioli Manifold"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics, optimisation]
portfolio: G
---

# The Pacioli Combinator Library: A Universal Domain-Specific Language for Financial and Economic Computation on the Pacioli Manifold: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20262070](https://doi.org/10.5281/zenodo.20262070) (#306)*

## The central idea in one sentence

The Pacioli Combinator Library is a typed domain-specific language where financial computations are composed from gauge-invariant primitives, making accounting violations type errors rather than runtime surprises, and enabling automatic differentiation across an entire model in a single backward pass.

## The problem with financial software

Financial systems are notoriously complex and notoriously error-prone. The sources of error are structural, not incidental:

1. **Implicit conventions**: Is this rate continuously compounded or annually compounded? Is this bond priced dirty or clean? These conventions are implicit in the code and invisible in the types.
2. **Inconsistent accounting**: A spreadsheet that prices a derivative independently of its hedging instruments can produce prices that violate no-arbitrage conditions — detectable only by auditors after the fact.
3. **Non-differentiability**: Hard threshold rules (a loan defaults if LTV > 80%) make the model non-differentiable, preventing gradient-based calibration.
4. **Monolithic architecture**: A risk system that computes CVA cannot easily share code with the ABM that models household credit demand, even though both need survival probability calculations.

The Pacioli Combinator Library (PCL) addresses all four problems simultaneously, using the mathematical structure of the Pacioli manifold as the type system.

## Combinators: the composable building blocks

A combinator is a function that takes functions as inputs and returns a function as output. The PCL's core combinators are:

**`choose(β, f, g)`** — the MGE (Maslov-Gibbs Einsum) combinator. Computes a $\beta$-weighted mixture of the outputs of computations $f$ and $g$:

$$\text{choose}(\beta, f, g)(x) = \frac{e^{\beta f(x)} \cdot f(x) + e^{\beta g(x)} \cdot g(x)}{e^{\beta f(x)} + e^{\beta g(x)}}.$$

At $\beta \to \infty$, this recovers `max(f(x), g(x))` — the tropical (hard maximum) limit. At $\beta = 0$, it returns the average. The rational agent's soft maximum over any finite set of options is an iterated application of `choose`.

**`sequence(f, g)`** — applies $f$ then $g$, threading the output of $f$ as input to $g$. Non-commutative in general: `sequence(f, g) ≠ sequence(g, f)`. This non-commutativity is not a bug — it is the correct behaviour for economic interventions (Paper 292). The type system tracks the ordering.

**`parallel(f, g)`** — applies $f$ and $g$ to independent copies of the input, then combines outputs. Commutative by construction: `parallel(f, g) = parallel(g, f)`. Used for modelling independent agents or independent risk factors.

**`fold(β, fs)`** — folds a list of computations $[f_1, \ldots, f_n]$ using `choose(β, ...)`, producing the soft maximum over all options. This is the fundamental aggregation primitive for markets, auctions, and social choice.

**`transport(connection, path)`** — parallel-transports a value along a `path` on the Pacioli manifold using the specified `connection` (exchange rate, discount factor, or survival probability). Returns the holonomy.

## The type system enforces gauge invariance

The PCL's type system is a dependent type system where every value carries its **gauge label**: which currency, which time, which credit entity it lives in. The type of a euro-denominated value at time $T$ contingent on entity $E$'s survival is:

```
Value[currency=EUR, time=T, credit=E]
```

A `transport` operation takes a `Value[currency=USD, time=0, credit=RiskFree]` and a connection (e.g., an EUR/USD forward rate and a risk-free discount factor) and returns a `Value[currency=EUR, time=T, credit=RiskFree]`. Adding two values with different types is a **type error** — you cannot add a USD price to a EUR price without an explicit conversion.

The conservation law $\partial^2 = 0$ (double-entry bookkeeping) is enforced at the type level: every `sequence(f, g)` composition must conserve the total value across all currency fibres. A composition that generates value from nowhere — a net debit without a corresponding credit — fails to type-check.

This is the formal version of Pacioli's original insight: accounting errors are detectable by type.

## Compiling to JAX for GPU acceleration

The PCL is implemented as a Python DSL that compiles to JAX (Google's accelerated array computation library with automatic differentiation). The compilation process is:

1. **Parse** the PCL expression into a computation graph.
2. **Type-check** the graph for gauge invariance and conservation.
3. **Compile** each combinator to its JAX equivalent: `choose` becomes a softmax-weighted linear combination, `transport` becomes a product of matrix exponentials, `fold` becomes a log-sum-exp reduction.
4. **Differentiate** the compiled graph automatically using JAX's `jax.grad`.

The compiled output runs on GPU (NVIDIA or TPU) with automatic vectorisation over batches of scenarios. A Monte Carlo simulation of 100,000 paths through a multi-currency, multi-credit model, with gradient computation for calibration, runs in seconds rather than minutes.

## The PCL as substrate for Portfolio G

Every computational model in Portfolio G is implemented in the PCL:

- **Paper 289** (Temperature of Rationality): The `choose(β, ...)` combinator is the MGE.
- **Paper 291** (Topology of Conservation): The type system's conservation check is the $\partial^2 = 0$ condition.
- **Paper 292** (Beyond DAGs): `sequence` is non-commutative; the associator of `sequence` is computed by the PCL's algebraic simplifier.
- **Paper 295** (Currency Bundles): The FX `transport` combinator with $(R_{>0}, \times)$ gauge group.
- **Paper 296** (Term Structure Bundles): The yield curve as a `transport` along the time axis.
- **Paper 298** (Credit Bundles): Survival probability as a `transport` along the credit axis.
- **Paper 300** (EGT): The full SFC model as a network of `parallel` and `sequence` combinators.
- **Paper 305** (Differentiable ABM): Each agent rule as a `choose(β, ...)` combinator.

The PCL makes these models interoperable by construction: because they all use the same type system and the same gauge group, a credit model and a macro model can share survival probability computations without an explicit interface layer.

## A worked example: pricing a cross-currency swap

A cross-currency swap exchanges fixed USD cash flows for fixed EUR cash flows over 5 years. In the PCL:

```python
usd_leg = fold(β=∞, [
    transport(usd_discount, path=[0, T_k]) for T_k in payment_dates
])
eur_leg = fold(β=∞, [
    transport(eur_discount, path=[0, T_k]) for T_k in payment_dates
])
xcs_value = sequence(
    transport(fx_connection, path=[USD, EUR]),
    parallel(usd_leg, eur_leg)
)
```

The type checker verifies that the USD and EUR legs are in compatible gauge labels after the FX transport. The conservation check verifies that the swap has zero net value at inception (it is an exchange, not a unilateral payment). The JAX compiler produces a differentiable function of the USD discount curve, EUR discount curve, and FX spot rate, with analytic gradients for calibration.

## What to read next

- [Buckley (2026) — A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505) — *The mathematical framework the PCL implements.*
- [Buckley (2026) — The Temperature of Rationality](https://doi.org/10.5281/zenodo.20234841) — *The `choose(β, ...)` combinator and its economic interpretation.*
- [Buckley (2026) — Differentiable Agent-Based Macroeconomics](https://doi.org/10.5281/zenodo.20261945) — *The PCL applied to a full macroeconomic model.*
- [Buckley (2026) — Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259495) — *The full EGT framework that the PCL's type system enforces.*

*For the full technical treatment, see [doi:10.5281/zenodo.20262070](https://doi.org/10.5281/zenodo.20262070)*
