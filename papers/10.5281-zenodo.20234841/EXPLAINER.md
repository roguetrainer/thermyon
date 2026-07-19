---
layout: default
title: "The Temperature of Rationality"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics, agent-based-models, ai-ml]
---

# The Temperature of Rationality: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20234841](https://doi.org/10.5281/zenodo.20234841) (#289)*

## The central idea in one sentence

Economic rationality is not binary — it is a temperature, and like physical temperature it can be measured, controlled, and used to predict phase transitions in markets, elections, and ecosystems.

## Why economists need a "temperature"

Standard economic models contain a troubling idealization: the perfectly rational agent who instantly computes the best possible response to any situation. This representative agent is mathematically convenient but empirically wrong. Real agents face cognitive costs, time limits, and genuine uncertainty. The standard fix — behavioral economics — introduces a long list of specific biases. This paper proposes a different approach: a single parameter, $\beta$, that controls the *sharpness* of decision-making.

At $\beta = 0$, agents choose uniformly at random — zero rationality, maximum entropy. At $\beta \to \infty$, agents pick the best option with probability 1 — perfect rationality, zero entropy. Every real agent sits somewhere in between. The number $\beta$ is the inverse temperature of rationality.

This is not a metaphor. Daniel McFadden (1974 Nobel laureate) derived the exact same mathematical formula from economic first principles — utility maximisation under Gumbel noise. Christopher Sims (2011 Nobel laureate) derived it again from information theory — optimal choice under a Shannon entropy budget. The formula they both found is the **Gibbs distribution**:

$$p_i(\beta) = \frac{e^{\beta U_i}}{\sum_j e^{\beta U_j}}$$

where $U_i$ is the utility of option $i$. This paper's contribution is to recognise that this formula is the same object as the Maslov-Gibbs partition function used elsewhere in the ASA framework — and to build a complete thermodynamic economic theory on top of it.

## The partition function is welfare

The log-partition function $\mathcal{W}(\beta) = \beta^{-1} \ln Z$ is not just a normalisation constant. It equals:

$$\mathcal{W}(\beta) = \mathbb{E}[U] + \beta^{-1} H$$

where $\mathbb{E}[U]$ is expected utility and $H$ is the Shannon entropy of the choice distribution. At high $\beta$, welfare is dominated by utility (efficiency). At low $\beta$, welfare is dominated by diversity (exploration). A policy that maximises $\mathcal{W}(\beta)$ at the right $\beta$ balances both — neither ruthless efficiency nor pure randomness.

This resolves a long-standing complaint about cost-benefit analysis: it implicitly assumes $\beta = \infty$ and ignores the social value of diversity, redundancy, and resilience.

## Deliberation takes time: the adiabatic condition

How long does a decision require? The answer depends on the energy gap $\Delta E(\beta)$ between the best and second-best option, and on how fast $\beta$ is rising. The **adiabatic condition** is:

$$
\left|\frac{d\beta}{dt}\right| \leq c \cdot \Delta E(\beta)^2
$$

Rush the decision (ramp $\beta$ too fast) and the system undergoes a non-adiabatic quench — it gets trapped in the wrong state. This is not a new metaphor: it is the quantum adiabatic theorem applied to economic dynamics, with $\beta$ playing the role of inverse temperature in a spin glass.

The $\beta$-ramp — a schedule from $\beta = 0$ to $\beta_{\mathrm{final}}$ — is a formal model of deliberation. Patient deliberation (slow ramp) reaches the globally optimal equilibrium. Hasty deliberation (fast ramp) locks in the first locally stable state it finds.

## A worked example: the stag hunt

Two hunters can cooperate to catch a stag (payoff 4 each) or individually chase rabbits (payoff 2 each). Standard game theory gives two Nash equilibria: both stag (Pareto optimal) or both rabbit (risk-dominant). Which one do agents reach?

The Gibbs ensemble answers this with a $\beta$-ramp. At $\beta = 0$, each hunter chooses randomly. As $\beta$ rises, the cooperation equilibrium (stag) emerges first if the ramp is slow enough to let the agents coordinate. If $\beta$ jumps directly to a high value, agents lock in rabbit-rabbit: the risk-dominant equilibrium, not the socially optimal one.

The adiabatic condition quantifies exactly how long coordination takes. Impatient policy (too little time for deliberation) produces the inferior equilibrium; patient policy produces the optimal one.

## Phase transitions in economies and ecosystems

The most striking result is the phase transition formula. In a network of $N$ agents with social interaction strength $J$, the **social multiplier** is:

$$\chi(\beta) = \frac{1}{1 - J\beta}$$

This diverges at $\beta J = 1$. Below this critical point, the economy is in the normal regime: small shocks produce small responses. Above it, the economy tips into a coordinated state — either mass adoption or mass panic, depending on the sign of $J$.

The formula $\beta J = 1$ is the same critical point as:
- The **Schelling tipping point** in residential segregation (1971)
- The **Keynesian beauty contest** fragility threshold (Keynes 1936; Morris-Shin 2002)
- **Ecological tipping points** — ice-albedo feedback, AMOC disruption, permafrost methane release

All are instances of a diffusive feedback mechanism hitting the same critical temperature. The Gibbs ensemble makes this explicit and computable: the early-warning gradient $\partial\chi/\partial\beta$ diverges before the tipping point, giving a measurable signal of approaching regime change.

## The 2008 crisis as a non-adiabatic quench

Tom Hurd's (2013) double cascade model is the paper's primary worked example. Hurd was the first to integrate solvency and liquidity contagion in a single mathematical framework. This paper gives that framework a thermodynamic interpretation.

**Solvency cascade**: when bank $i$ fails, its creditors lose part of their assets. This is a standard (additive) cascade — losses sum linearly. Modelled in the standard semiring.

**Liquidity freeze**: when too many institutions try to sell the same asset simultaneously, the market price collapses. This is a tropical (min, +) cascade — the bottleneck is the minimum available liquidity. Modelled in the tropical semiring.

The hybrid — solvency and liquidity interacting — is SoftMin$_\beta$, the Gibbs ensemble acting on both cascades simultaneously. At $\beta \to \infty$, SoftMin collapses to hard min (the tropical limit): a completely frozen market. At finite $\beta$, the market retains some liquidity even under stress.

**The 2008 interpretation:** Markets were operating at high $\beta$ (high confidence in pricing models, tight spreads, low perceived volatility). The subprime revelation shifted the utility landscape discontinuously. The system lacked sufficient entropy — $\beta$ was too high to allow smooth reallocation. The result was a non-adiabatic quench: the market froze at a metastable state far from the new equilibrium.

**QE as entropy injection**: central bank asset purchases temporarily lowered $\beta$ by reducing the penalty on liquidity hoarding, allowing the market to explore the new equilibrium space. This is not a special trick — it is the standard thermodynamic mechanism for escaping a metastable state.

## Arrow's Impossibility Theorem does not apply

Arrow's theorem (1951) states that no social choice function can simultaneously satisfy four reasonable axioms. This result is a source of genuine pessimism in welfare economics.

The Gibbs ensemble escapes it cleanly, by category error. Arrow's theorem applies to functions that map utility profiles to **preference rankings**. The Gibbs social-choice function maps utility profiles to a **probability measure** on the space of outcomes. Arrow's four conditions — unrestricted domain, Pareto efficiency, independence of irrelevant alternatives, non-dictatorship — are not well-typed for this object.

The log-partition function $\mathcal{W}$ replaces the welfare ranking with a differentiable scalar. The Condorcet paradox (majority cycles in pairwise voting) cannot form because no pairwise tournament is held: all options coexist simultaneously in the Gibbs distribution.

## Differentiable agent-based models

Every discrete threshold rule in a standard agent-based model can be replaced by its Gibbs-ensemble equivalent — a smooth Gibbs or SoftMin transition parametrised by $\beta$. The result is an end-to-end differentiable model calibratable by gradient descent in PyTorch or JAX.

Differentiability also moves risk models from passive measurement to active control. The gradient $\partial(\text{systemic risk})/\partial B_i$, computed in a single backward pass, identifies which capital buffer allocation produces the largest systemic risk reduction. This cannot be computed from non-differentiable threshold models.

## Connection to sustainable economics

The Gibbs ensemble is directly applicable to post-growth macroeconomics and stock-flow consistent (SFC) models. Jackson and Victor's LowGrow model (2019, 2020) — the leading quantitative framework for post-growth macroeconomics — contains a Real Economy module whose agent decisions are exactly the kind of heterogeneous threshold choices the Gibbs ensemble smooths. Ecological tipping points in LowGrow are structurally identical to financial coordination phase transitions: both are $\beta J = 1$ critical points where the social multiplier diverges.

The $\beta$-ramp predicts computable early-warning gradients $\partial\chi/\partial\beta$ for climate-economic regime change.

## What to read next

- [Buckley (2026b) — The Topology of Conservation](https://doi.org/10.5281/zenodo.20234853) — *Double-entry accounting as a discrete gauge theory: the conservation-law space within which Gibbs ensemble dynamics operate.*
- [Buckley (2026c) — Beyond DAGs](https://doi.org/10.5281/zenodo.20234870) — *Non-associative algebra of policy interventions: why the order in which policies are applied changes their effect.*
- [The Maslov-Gibbs Einsum (MGE)](https://doi.org/10.5281/zenodo.17981393) — *The computational primitive that Paper 289 applies to economics: the same partition function governing tropical optimisation and gradient routing.*

*For the full technical treatment, see [doi:10.5281/zenodo.20234841](https://doi.org/10.5281/zenodo.20234841)*
