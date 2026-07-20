---
layout: default
title: "Differentiable Agent-Based Macroeconomics: A Gauge-Theoretic Digital Twin on the Pacioli Manifold"
parent: Explainers
nav_exclude: true
tags: [economics, agent-based-models, ai-ml, optimisation]
portfolio: G
---

# Differentiable Agent-Based Macroeconomics: A Gauge-Theoretic Digital Twin on the Pacioli Manifold: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20261945](https://doi.org/10.5281/zenodo.20261945) (#305)*

## The central idea in one sentence

By replacing every discrete threshold rule in a standard agent-based economic model with its smooth Gibbs equivalent, we obtain a fully differentiable macroeconomic digital twin that can be calibrated by gradient descent and used to compute policy gradients in a single backward pass.

## The calibration problem in agent-based models

Agent-based models (ABMs) have attracted substantial interest in macroeconomics precisely because they avoid the representative-agent approximation: they model heterogeneous households, firms, and banks that follow simple local rules and interact to produce aggregate dynamics. INET's MARK model, Dawid's Eurace model, and Turrell's Bank of England ABM are prominent examples. All generate rich, realistic dynamics including financial crises, inequality dynamics, and non-linear multiplier effects.

But calibration is a persistent problem. Because ABMs contain hard threshold rules — a firm hires if profits exceed a fixed threshold, a bank calls a loan if the borrower's loan-to-value exceeds 80%, a household switches mortgage provider if the rate differential exceeds 50 basis points — the model is not differentiable. You cannot compute $\partial(\text{output})/\partial(\text{parameter})$ by automatic differentiation. Calibration requires simulation-based inference (SMC, ABC, surrogate modelling) — all expensive, all approximate, none scalable to large models.

This paper solves the calibration problem by making the ABM differentiable.

## The MGE replacement rule

Every discrete threshold rule has a smooth Gibbs equivalent. The **Maslov-Gibbs Einsum (MGE)** is the universal smoothing operator:

$$p_i(\beta) = \frac{e^{\beta U_i}}{\sum_j e^{\beta U_j}},$$

where $U_i$ is the utility (or payoff) of option $i$ and $\beta > 0$ is the rationality parameter. At $\beta \to \infty$, this concentrates all probability on the highest-utility option — recovering the hard threshold rule. At finite $\beta$, agents choose probabilistically with probabilities proportional to exponentiated utilities.

The replacement procedure is mechanical:

1. **Identify** every binary or discrete threshold decision in the ABM.
2. **Replace** `if profit > threshold: hire` with the MGE soft version: probability of hiring $= \sigma(\beta \cdot (\text{profit} - \text{threshold}))$, where $\sigma$ is the logistic function.
3. **Use** PyTorch or JAX throughout, so that every operation is tracked by the autograd tape.

The result is a model where every state variable and every aggregate statistic is a differentiable function of all parameters. The gradient $\partial(\text{aggregate})/\partial(\text{parameter})$ can be computed exactly in a single backward pass.

## The Pacioli constraint: accounting identities by construction

Standard ABMs enforce accounting identities (stock-flow consistency) as separate checks — post-hoc tests that verify the simulation has not violated conservation laws. This is fragile: a bug can break stock-flow consistency silently.

The gauge-theoretic formulation builds conservation in by construction. The Pacioli manifold's fundamental condition $\partial^2 = 0$ (the boundary of a boundary is zero) is the continuous analogue of double-entry bookkeeping. In the differentiable ABM, this is implemented as a **type constraint on computations**: the PCL (Pacioli Combinator Library, Paper 306) only allows compositions of agents and transactions that preserve $\partial^2 = 0$. Accounting violations are type errors caught at compile time, not runtime surprises caught at validation time.

The gauge group $(R_{>0}, \times)$ acts on all nominal quantities simultaneously — a choice of price level. The model's real outputs (employment rate, Gini coefficient, real GDP growth, investment-to-GDP ratio) are gauge-invariant by construction and do not depend on this arbitrary choice.

## Calibration by gradient descent

With the differentiable ABM in place, calibration becomes a standard machine learning problem. Define a loss function:

$$\mathcal{L}(\theta) = \sum_{t=1}^{T} \sum_{k} w_k \left(\hat{y}_k^{(t)} - y_k^{(t)}(\theta)\right)^2,$$

where $\hat{y}_k^{(t)}$ are observed national accounts data (GDP, consumption, investment, unemployment), $y_k^{(t)}(\theta)$ are the model's predictions with parameter vector $\theta$, and $w_k$ are weights. Minimise $\mathcal{L}(\theta)$ by gradient descent using $\nabla_\theta \mathcal{L}$ computed by automatic differentiation.

This is standard PyTorch training. The model runs on GPU. A calibration epoch (one pass through the observed data) takes seconds, not hours. The gradient is exact, not estimated by finite differences or surrogate approximation.

## Policy analysis: the fiscal multiplier gradient

Once calibrated, the differentiable ABM provides something unavailable from standard models: **policy gradients**. The question "what is the effect of a 1% increase in the fiscal multiplier on GDP three years from now?" is answered by:

$$\frac{\partial \text{GDP}(t+3)}{\partial m_{\text{fiscal}}} = \text{computed by a single backward pass.}$$

This gradient accounts for all general equilibrium effects: the induced change in household income, the resulting change in consumption, the multiplied effect on firm revenues, the consequent hiring decisions, the second-round income effects, and so on — all captured exactly by the autograd tape.

Standard linearised DSGE models compute this gradient analytically (but only for small perturbations around a steady state). Non-linear DSGE models approximate it by particle filters. Standard ABMs cannot compute it at all. The differentiable ABM computes it exactly, for large perturbations, in a non-linear model with heterogeneous agents.

## A worked example: COVID fiscal policy

The paper's main application is a differentiable reconstruction of the 2020-2021 COVID fiscal response. Agents are households (heterogeneous income, wealth, sector exposure), firms (heterogeneous leverage, labour demand, order books), banks (leverage constraints, loan books), and a government (tax-and-transfer, bond issuance).

The calibration targets are: UK national accounts 2018Q1-2023Q4, household income distribution, firm leverage distribution, bank capital ratios. After calibration, the model is used to compute:

1. $\partial(\text{employment})/\partial(\text{furlough\_generosity})$ — the marginal employment effect of the UK's Coronavirus Job Retention Scheme.
2. $\partial(\text{inflation})/\partial(\text{fiscal\_transfer})$ — the distributional contribution to post-COVID inflation from household transfer payments.
3. $\partial(\text{firm\_insolvency\_rate})/\partial(\text{loan\_guarantee\_threshold})$ — the optimal CBILS loan guarantee threshold to minimise insolvency.

All three are computed in a single backward pass of a single calibrated model, rather than three separate analyses with separate assumptions.

## The $\beta$ parameter as a policy lever

The rationality parameter $\beta$ is not just a nuisance to be calibrated away — it is itself a policy-relevant quantity. The paper shows that $\beta$ can be estimated separately for different agent types (households, firms, banks) and that these estimates are informative about:

- **Cognitive load**: Low $\beta$ for household mortgage decisions suggests that simplified product design (fewer choices, clearer comparison) would improve welfare.
- **Strategic uncertainty**: Low $\beta$ for firm investment decisions in high-uncertainty periods (COVID, Brexit) explains investment depresssion without requiring animal spirits or irreversibility costs.
- **Market stress**: $\beta \to \infty$ for bank funding decisions before a crisis indicates that a small change in the funding landscape can produce a discontinuous flight to safety.

## What to read next

- [Buckley (2026) — The Temperature of Rationality](https://doi.org/10.5281/zenodo.20234841) — *The MGE primitive: the Gibbs distribution as the universal economic decision rule.*
- [Buckley (2026) — The Topology of Conservation](https://doi.org/10.5281/zenodo.20234853) — *The Pacioli manifold: the accounting structure this model enforces by construction.*
- [Buckley (2026) — Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259495) — *Stock-flow consistency and climate risk in the full EGT framework.*
- [Buckley (2026) — The Pacioli Combinator Library](https://doi.org/10.5281/zenodo.20262070) — *The DSL that implements the differentiable ABM.*

*For the full technical treatment, see [doi:10.5281/zenodo.20261945](https://doi.org/10.5281/zenodo.20261945)*
