---
layout: default
title: "Differentiable Nash Equilibria"
parent: Explainers
nav_exclude: true
tags: [economics, game-theory, differentiable-programming, climate]
portfolio: G
---

# Differentiable Nash Equilibria: An Accessible Guide

*Plain-language explainer for Paper 315 (preprint forthcoming)*

## The question Nash equilibrium cannot answer

Canada is considering raising its carbon price by \$15 per tonne.
By how much does that shift the probability that the G20 climate
coalition holds together?

Nash equilibrium theory cannot answer this question. It can tell
you whether full cooperation is *an* equilibrium — but not how
sensitively the equilibrium participation rate responds to a carbon
price change. The best-response correspondence is discontinuous: an
infinitesimal change in payoffs can shift an equilibrium
discontinuously, and the gradient simply does not exist at the
equilibrium.

This paper gives the gradient.

## What the Quantal Response Equilibrium adds — and what it doesn't

The Quantal Response Equilibrium (QRE) was introduced by McKelvey
and Palfrey in 1995. It is well-known in behavioural game theory
and has been applied to dozens of experimental datasets. The key
idea: instead of each player playing a *best response* (the argmax
of expected utility), each player plays a *softmax response* — a
Boltzmann distribution over actions, with weight proportional to
$\exp(\beta \cdot \text{expected utility})$. At high $\beta$
(rational players), the softmax concentrates on the best action.
At $\beta \to \infty$, it collapses to the argmax exactly: the Nash
equilibrium is recovered.

The QRE is smooth. But the existing QRE literature uses this
smoothness in a specific way: to *estimate* $\beta$ from observed
choice data, or to trace the path of equilibria as $\beta$ varies.

**What nobody did before this paper:** differentiate through the QRE
fixed point with respect to *structural parameters* — tax rates,
damage coefficients, transfer payments. That derivative is the object
you need for policy design, not parameter estimation. It is given
by the Implicit Function Theorem (IFT), applied to the smooth
fixed-point equation that defines the QRE.

The IFT gradient is:

$$\frac{\partial \tilde{\sigma}^\beta}{\partial \theta}
= \beta\, J_F^{-1} \cdot
\mathrm{diag}(\tilde{\sigma}^\beta) \cdot
(I - \mathbf{1}\tilde{\sigma}^{\beta\top}) \cdot
\frac{\partial \mathbb{E}U}{\partial \theta}$$

where $J_F$ is the Jacobian of the QRE fixed-point equation and
$\theta$ is any structural parameter. This formula is computable
in a single backward pass through the QRE fixed point in JAX or
PyTorch.

## Three things this unlocks

### 1. Coalition stability gradients

In the climate coalition game, each country chooses to cooperate
(invest in decarbonisation) or free-ride. The QRE participation
probability $\tilde{\sigma}^\beta(C)$ is a smooth function of all
payoff parameters. Its gradient with respect to a carbon price $\tau$
is the **marginal coalition-stability gain** of the policy: for each
dollar per tonne of carbon price, how much does the participation
probability rise?

The IFT formula (Proposition 3.2 of the paper) gives this gradient
in closed form:

$$\frac{\partial \tilde{\sigma}^\beta(C)}{\partial \tau}
= \frac{\beta\, \tilde{\sigma}^\beta(C)\,(1 - \tilde{\sigma}^\beta(C))}
       {1 - \beta J} \cdot e_i$$

where $e_i$ is the actor's emission intensity and $J$ is the social
interaction strength. The denominator $1 - \beta J$ is the key: it
tells you how close the system is to a tipping point.

### 2. Optimal heterogeneous carbon prices via reverse stress testing

The paper formulates coalition stability as a **reverse stress test**
(RST): given a coalition that is partially stable, find the
minimum-cost carbon price schedule $\boldsymbol{\tau}^*$ that pushes
every actor's participation probability above a target threshold
$p^\dagger = 85\%$.

This is exactly the same mathematical problem as supply-chain RST
(Paper 314): minimise total cost subject to a survival constraint,
using JAX gradient descent on a differentiable loss. The
**criticality vector** $c_i = \partial \tilde{\sigma}^\beta_i /
\partial \tau_i$ ranks actors by how efficiently a carbon price
increase improves their participation — high $c_i$ means a small
tax increase brings a large coalition-stability gain.

At the calibrated temperature $\beta^* = 3.2$ (entropy-matched to
observed Paris Agreement NDC revision behaviour), the minimum-cost
schedule is:

| Actor type | $\Phi_i$ (yield surface) | Carbon price $\tau_i^*$ | Criticality |
|---|---|---|---|
| Temperate industrial | 7.2 | \$28.5/tCO₂ | 0.031 |
| Global mean | 17.7 | \$17.3/tCO₂ | 0.044 |
| Tropical agricultural | 29.2 | \$6.1/tCO₂ | 0.058 |
| Sahel economy | 32.1 | \$3.4/tCO₂ | 0.062 |
| Small island state | 33.1 | \$0 | — |

Small island states cooperate from private incentive alone — their
local damage is so severe that the coalition is individually rational
even without any carbon price. Temperate industrial economies need
the highest carbon price to reach the participation threshold. The
criticality vector shows where a marginal dollar of carbon pricing
effort is most effective: tropical and Sahelian actors, who are
closest to the participation threshold.

This is the heterogeneous carbon price as a **gauge field** — the
same structure identified from the geometric side in Paper 311
(equation 6.5), now derived from first principles as the QRE
reverse stress test solution.

### 3. The Schelling bifurcation as a computable early-warning signal

Thomas Schelling (1971) identified a social tipping point in
residential segregation: above a critical threshold of
same-group neighbours, a neighbourhood tips from integrated to
segregated — and the tipping is hard to reverse. The same
mathematical structure appears in climate coalitions: above a
critical defection rate, cooperative participation collapses.

The QRE makes this precise. The participation fixed-point equation
undergoes a **pitchfork bifurcation** at:

$$\beta_c = \frac{1}{J}, \qquad J = p^*(1-p^*) \cdot \frac{\partial \Delta U}{\partial p}$$

Below $\beta_c$: one stable QRE (the unique cooperative equilibrium).
Above $\beta_c$: three fixed points emerge — full cooperation, full
defection, and an unstable middle. The logit path branches.

The **susceptibility**:

$$\chi(\beta) = \frac{\beta\, p(1-p)}{1 - \beta J}$$

diverges as $\beta \to \beta_c$. This is directly observable from
panel data: $\chi$ is the ratio of aggregate participation variance
to individual-level shock variance. An empirical increase in $\chi$
*before* a major coalition event — a mass defection, a treaty
collapse, a sudden surge in NDC ambition — is a measurable leading
indicator of the approach to the tipping point.

The same formula $\chi = 1/(1 - \beta J)$ is the **social
multiplier** of Brock and Durlauf (2001), the **Keynesian beauty
contest fragility** of Morris and Shin (2002), and every ecological
tipping point with a diffusive feedback mechanism. The QRE unifies
them in a single computable object.

## What is new vs. what is known

| Aspect | Status |
|---|---|
| QRE definition and existence | McKelvey-Palfrey 1995 — classical |
| Logit path as $\beta$ varies | Turocy 2005 — classical |
| Calibrating $\beta$ from choice data | Wright & Leyton-Brown 2010 — classical |
| **IFT gradient w.r.t. structural parameters $\theta$** | **This paper — 🆕** |
| **Coalition RST as a differentiable optimisation** | **This paper — 🆕** |
| **Criticality vector for heterogeneous carbon prices** | **This paper — 🆕** |
| **Schelling bifurcation as computable early-warning $\chi(\beta)$** | **This paper — 🆕** |
| Connection to tropical limit and Nash recovery rate | This paper — new framing |

The existing QRE literature treats $\beta$ as the object of interest.
This paper treats $\theta$ — the structural parameters — as the
object of interest, and uses $\beta$ as a fixed (calibrated)
temperature. The IFT gradient with respect to $\theta$ is the policy
gradient; nothing in the prior literature computes it.

## The tropical limit: why the gradient is honest

A common concern with smooth relaxations of combinatorial objects is
that the relaxation is a surrogate — it approximates the original,
but is not the same object, and the gradient of the surrogate may
not reflect the behaviour of the original.

The QRE avoids this by the **tropical limit theorem** (Theorem 6.1):
as $\beta \to \infty$, the QRE converges to the Nash equilibrium at
rate $O(\beta^{-1} \ln |A|)$, where $|A|$ is the number of action
profiles. For the two-action participation game, this is
$O(\beta^{-1} \ln 2)$: at $\beta^* = 3.2$, the QRE is within
$\ln(2)/3.2 \approx 0.22$ in $\ell_1$ norm of the Nash equilibrium.

Calibrating $\beta^*$ from data automatically chooses the
temperature at which this gap is comparable to the empirical
noise in participation rates — meaning the QRE is not a
surrogate but a statistically faithful extension of the Nash
equilibrium.

## The connection to supply-chain RST

The coalition stability RST (equation 3.3 of the paper) and the
supply-chain RST of Paper 314 are mathematically identical:

$$\mathcal{L}(\boldsymbol{\tau})
= \sum_i \mathrm{ReLU}(p_i^\dagger - \tilde{\sigma}^\beta_i(C)) \cdot 10
+ \lambda \sum_i \tau_i$$

In the supply chain: $\tilde{\sigma}^\beta_i$ is replaced by output
capacity, $\tau_i$ by inventory buffer, and $p_i^\dagger$ by the
minimum acceptable throughput. The criticality vector, gradient
descent algorithm, and convergence analysis are identical.

This mathematical identity is not a coincidence. Both problems are
instances of the same abstract structure: a smooth fixed-point
object (QRE participation / SoftMin capacity), a survival
constraint (coalition threshold / output threshold), and a
minimum-cost intervention (carbon tax / buffer stock). The Thermal
Economics programme (Paper 313) makes this structure explicit and
provides the shared IFT infrastructure for both.

## What to read next

- Paper 313: Thermal Economics *(preprint forthcoming)*
  — *The meta-schema: all seven instances of Gibbs relaxation of
  combinatorial economics objects.*
- [Paper 311: The Climate Hazard Yield Surface](https://doi.org/10.5281/zenodo.20291646)
  — *The climate coalition game and heterogeneous carbon prices from
  the geometric side.*
- [Paper 293: Thermal Attribution](https://doi.org/10.5281/zenodo.20236870)
  — *Instance 1 of the same schema: differentiable Shapley values.*
- Paper 314: SoftLeontief *(forthcoming)* — *Instance 2: differentiable
  Leontief I-O and supply-chain RST.*

*For the full technical treatment, see Paper 315 (preprint forthcoming)*
