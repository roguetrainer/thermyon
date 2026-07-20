---
layout: default
title: "The Climate Hazard Yield Surface"
parent: Explainers
nav_exclude: true
tags: [economics, climate, policy, gauge-theory]
portfolio: G
---

# The Climate Hazard Yield Surface: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20291646](https://doi.org/10.5281/zenodo.20291646) (#311)*

## The central idea in one sentence

Addressing climate change is not a cost — it is an investment with a 14-year payback period, a 13:1 return by 2075 under median damage assumptions, and a two-dimensional yield surface that makes the entire Stern-Nordhaus discount-rate debate obsolete.

## The framing failure

The dominant public framing of climate economics presents mitigation as a cost: a percentage of GDP foregone, a rise in energy prices, a constraint on growth. This framing is structurally incomplete. It presents only one side of a ledger that has a dominant asset entry.

Climate action has two cash flows:

- **Outflow**: the green premium — additional capital expenditure on low-carbon infrastructure, paid over roughly 25 years
- **Inflow**: damage avoided — GDP that would otherwise be destroyed by physical climate impacts (floods, droughts, sea-level rise, agricultural collapse, heat stress), arriving continuously for the rest of the century

The ratio of inflow to outflow is what this paper calls the **Climate Hazard Yield Surface**. Under median expert-elicited damage assumptions, calibrated to Canada:

| Horizon | Net per-household benefit | NPV at 3% |
|---|---|---|
| 2038 (payback) | $0 | — |
| 2050 | ~$100,000 | ~$53,000 |
| 2075 | ~$487,000 | ~$182,000 |
| 2100 | — | ~$244,000 |

Against a total transition cost per household of roughly $36,000 (cumulative 2024–2075), the 2075 ratio is **13:1 at median** and **144:1 under tail-risk assumptions**.

## Why it is a surface, not a curve

A standard bond yield curve $r(T)$ is one-dimensional: it maps a single maturity date $T$ to the annualised return. You buy the bond today; the payoff is determined by when it matures.

The climate investment payoff depends on *two* dates: when you invest and when you collect. Investing in 2025 and measuring in 2050 gives a different return than investing in 2035 and measuring in 2075, even if the gap is the same — because the carbon budget shrinks, the effectiveness of mitigation declines, and the damage function is nonlinear.

Formally, $\Phi(t_{\mathrm{inv}}, t_{\mathrm{pay}})$ is a function of two variables. It is defined on a **triangular domain** — you cannot collect before you invest — and it has properties directly analogous to a bond surface:

| Fixed income | Climate |
|---|---|
| Yield curve $r(T)$ — 1D | Yield surface $\Phi(t_i, t_p)$ — 2D |
| Triangular forward-rate surface $f(T_1, T_2)$ | Triangular climate surface $\Phi(t_{\mathrm{inv}}, t_{\mathrm{pay}})$ |
| Positive convexity near deflation floor | Positive curvature near 3°C tipping point |
| Par line (yield = coupon) | Breakeven isocurve ($\Phi = 1$) |
| Bond duration limit | Doomsday clock $\mathcal{B}(t_{\mathrm{pay}})$ |

## The doomsday clock is a curve, not a point

Standard climate communication speaks of a "deadline" — a single year by which action must be taken. This is the wrong geometric object.

The correct object is the **breakeven isocurve** $\mathcal{B}(t_{\mathrm{pay}})$: for each payoff horizon, the last investment date at which a dollar of mitigation still returns at least a dollar in avoided damage by that horizon. It is a curve on the yield surface, not a point.

Under the median Carbon Tracker (2026) damage calibration:

| Payoff horizon | Last effective investment date | Window from today |
|---|---|---|
| 2035 | 2031 | 7 years |
| 2050 | 2047 | 23 years |
| 2075 | 2069 | 45 years |
| 2100 | 2087 | 63 years |

Later payoff horizons tolerate later investment dates. The "doomsday clock" is not a single deadline but a table of conditional deadlines: *for a given risk tolerance, here is your last date to act for each payoff horizon*. This is the language fixed-income investors use naturally for callable bonds. It is the language climate communication should adopt.

## Why the Stern-Nordhaus debate is the wrong question

The paper proves (Theorem 3.3) that the climate yield surface is **non-separable**: there are no functions $f$ and $g$ such that $\Phi(t_{\mathrm{inv}}, t_{\mathrm{pay}}) = f(t_{\mathrm{inv}}) \cdot g(t_{\mathrm{pay}})$.

This matters because standard cost-benefit analysis assumes separability. Multiplying future benefits by a discount factor $e^{-rT}$ only makes sense if the surface factors into independent investment and payoff terms. It doesn't.

The Stern-Nordhaus debate — low discount rate (Stern: 1.4%) versus high discount rate (Nordhaus: 4.3%) — is a debate about which one-dimensional cross-section of a two-dimensional surface to present as "the" climate economics. Neither cross-section is canonical. The surface itself is the only honest object.

More seriously: Nordhaus's DICE model calibrates the damage function at $\gamma = 1.4$, $d_3 = 2.1\%$ (only 2.1% GDP loss at 3°C warming). The empirical evidence — surveyed by Burke, Hsiang & Miguel (2015) across 166 countries and by the Carbon Tracker / University of Exeter (2026) expert elicitation — puts the median damage at 10% GDP at 3°C with a nonlinearity exponent of $\gamma = 2.5$. The EconIAC automatic differentiation framework computes the resulting understatement directly:

$$\frac{\Phi(\text{median})}{\Phi(\text{Nordhaus})} = \begin{cases} 4.8\times & \text{2050 horizon} \\ 6.4\times & \text{2075 horizon} \\ 8.1\times & \text{2100 horizon} \end{cases}$$

This is not a rounding error. A policymaker using Nordhaus's calibration to evaluate a 2075 investment understates the return by a factor of 6.4 — a qualitative misclassification of whether the investment is worthwhile.

## The tragedy of the commons — and its resolution

The yield surface $\Phi$ is the *social* return. Climate mitigation is a public good: the damage it avoids is non-excludable (everyone benefits regardless of who paid) and non-rival (one country's avoided warming does not reduce another's). This creates a structural wedge between the social return and the private return available to any single investor.

The **free-rider discount** is $(1 - 2s)$, where $s$ is the fraction of actors who defect. At $s > 1/2$, a contributing actor is worse off in relative terms than a free-rider even though investment is socially beneficial. The Nash equilibrium of the non-cooperative game is universal defection — not because actors are irrational, but because they are rational in a game whose equilibrium is collectively catastrophic.

This is the ant-and-grasshopper fable inverted. In Aesop's version, the grasshopper starves because its own failure to prepare has private consequences. In the climate version, the grasshopper's survival depends on whether the ants invested — warming is determined by *aggregate* emissions, not individual contributions. The rational grasshopper always free-rides.

## Not all grasshoppers are equal: the geography of incentives

The social yield surface $\Phi$ is an average. Behind it lies a family of **actor-specific surfaces** $\Phi_i$, varying sharply by geography, economic structure, and exposure to climate hazards.

A small island state facing existential sea-level risk, or a Sahelian economy dependent on rain-fed agriculture, has a local damage surface $\Phi_i$ an order of magnitude above the global mean. The paper proves an **incentive inversion theorem**: actor $i$ has a positive private return to unilateral investment if and only if $\Phi_i > 2\bar{\Phi}$ — their local damage must exceed twice the global mean.

The EconIAC framework computes the **free-rider tolerance threshold** $s_i^* = \Phi_i / (\Phi_i + \bar{\Phi})$ for each actor type:

| Actor type | Local surface $\Phi_i$ | Tolerates up to $s_i^*$ defectors |
|---|---|---|
| Temperate industrial | 7.2 | 29% |
| Global mean | 17.7 | 50% |
| Tropical agricultural | 29.2 | 62% |
| Sahel economy | 32.1 | 64% |
| Small island state | 33.1 | 65% |

A small island state maintains a positive private return even when 65% of actors are free-riding. A temperate industrial economy defects once fewer than 71% are cooperating. This defines the **natural core of the cooperative coalition** — the actors who cooperate even without binding enforcement, simply because their local damage is existential.

The tragedy is concentrated in the off-diagonal quadrants: actors who are desperate but powerless (Bangladesh, Maldives, Sahel nations), and actors who are decisive but barely incentivised (USA historically, Russia, Gulf states). Efficient climate policy must address both simultaneously — carbon pricing for the second group, loss-and-damage transfers for the first.

## The EGT connection: $\Phi$ as holonomy

In Economic Gauge Theory (Paper 300), climate damage appears as **curvature** on the equity column of the balance sheet: value destroyed that no sector can claim as an asset. The climate yield surface is the *holonomy* of this climate connection — the gap that opens when you trace the loop from "invest at $t_{\mathrm{inv}}$" through "carbon accumulates" and "damage realised at $t_{\mathrm{pay}}$" back to the initial balance sheet.

On a flat manifold (no climate damage, $F = 0$), $\Phi = 0$: the loop closes. On the curved manifold ($F \neq 0$), $\Phi > 0$: the loop does not close, and the gap is the damage avoided by having invested.

The non-separability of $\Phi$ is the gauge-theoretic statement that the climate connection has non-trivial holonomy: it cannot be gauged away by a choice of frame (equivalently, by a choice of discount rate). This is why no single discount rate is "correct" for climate investment — the surface must be evaluated as a whole.

The structural parallel with the term-structure surface of Paper 296 is geometric: both $\Phi(t_{\mathrm{inv}}, t_{\mathrm{pay}})$ and the forward-rate surface $f(T_1, T_2)$ are defined on triangular domains, forced by causality constraints, and non-separable for the same reason — both encode holonomy on the Pacioli manifold. The connection coefficients are different objects (climate curvature vs. financial forward rates), but the geometry is the same.

## Coalition RST: the supply chain analogy

The problem of finding the minimum carbon price schedule that stabilises a cooperative climate coalition is structurally identical to the **reverse stress testing** problem for supply chains (Paper introduced alongside this work): given a network where some nodes fail, find the minimum inventory buffer that maintains output above threshold.

In both cases, JAX automatic differentiation computes the criticality gradient — which node's failure (which actor's defection) most damages the network (the climate coalition) — and gradient descent finds the minimum-cost intervention. The EconIAC framework implements both as the same optimisation, making the mathematical identity explicit.

## What to read next

- [Paper 300: Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259495) — *The Pacioli manifold, curvature, and climate risk as holonomy.*
- [Paper 296: Term Structure Bundles](https://doi.org/10.5281/zenodo.20244445) — *The structural parallel: forward-rate surfaces and the HJM flatness condition.*
- [Paper 294: Thermodynamic Information Routing](https://doi.org/10.5281/zenodo.20237288) — *TIR routing and the carbon tax phase boundary τ\*.*

*For the full technical treatment, see [doi:10.5281/zenodo.20291646](https://doi.org/10.5281/zenodo.20291646)*
