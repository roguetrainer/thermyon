---
layout: default
title: "Thermodynamic Information Routing: A Unified Framework for Gibbs Aggregation Across Economics, Computation, and Knowledge Retrieval"
parent: Explainers
nav_exclude: true
tags: [economics, thermodynamics, ai-ml, optimisation]
portfolio: G
---

# Thermodynamic Information Routing: A Unified Framework for Gibbs Aggregation Across Economics, Computation, and Knowledge Retrieval: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20237288](https://doi.org/10.5281/zenodo.20237288) (#294)*

## The central idea in one sentence

Eight independent research programmes across economics, neuroscience, statistical mechanics, and machine learning independently derived the same mathematical object — the Gibbs distribution — from domain-specific first principles, and this convergence is not a coincidence: there is a unique routing primitive that simultaneously preserves three geometric conservation laws.

## Eight independent derivations of the same formula

The **Gibbs distribution** is:

$$w_i(\beta) = \frac{e^{\beta U_i}}{\sum_j e^{\beta U_j}},$$

where $U_i$ is the utility (or energy, or value) of option $i$ and $\beta > 0$ is a concentration parameter (inverse temperature, rationality, or signal-to-noise ratio). Here are eight research traditions that derived exactly this formula independently:

1. **McFadden (1974, 2000 Nobel)**: Logit model from utility maximisation with Gumbel-distributed noise. The extreme-value distribution is the unique distribution whose maximum is again Gumbel — a fixed-point property that forces $w_i \propto e^{\beta U_i}$.

2. **Sims (2003, 2011 Nobel)**: Rational inattention. An agent with a Shannon entropy budget $\kappa$ maximises expected utility subject to $H(w) \leq \kappa$. The unique solution is $w_i \propto e^{\lambda U_i}$ where $\lambda$ is the Lagrange multiplier on the entropy constraint.

3. **McKelvey and Palfrey (1995)**: Quantal Response Equilibrium. Game-theoretic equilibrium with noise: players best-respond imperfectly, with mistake probability decreasing in the cost of the mistake. The unique symmetric equilibrium is the logit QRE: $w_i \propto e^{\beta U_i}$.

4. **Jaynes (1957)**: Maximum Entropy (MaxEnt). The unique distribution that maximises Shannon entropy subject to a constraint on mean utility $\langle U \rangle = \bar{U}$ is the Gibbs distribution with $\beta$ as the Lagrange multiplier.

5. **Gibbs (1902)**: Statistical mechanics. The canonical ensemble — the distribution of states for a system in thermal contact with a heat bath at temperature $T = 1/k_B \beta$ — is $w_i \propto e^{-\beta E_i}$, where $E_i$ is the energy of state $i$.

6. **Goel, Saleh, and colleagues (2012)**: Molecular motors. Optimal energy transduction in biochemical systems: a motor protein allocating chemical energy among conformational states maximises work output subject to thermodynamic consistency. The unique solution is the Gibbs distribution.

7. **Friston (2010)**: Free energy principle in neuroscience. The brain minimises a variational free energy functional $F = \langle E \rangle - H$. At the minimum, the recognition distribution is the Gibbs distribution with precision $\beta$ as a free parameter.

8. **ASA/MGE**: The Maslov-Gibbs Einsum. The tropical ($\beta \to \infty$) limit recovers the (min, +) or (max, +) semiring of tropical geometry; the Gaussian ($\beta \to 0$) limit recovers averaging. The Gibbs distribution is the unique interpolation between these limits that is compatible with the symplectic structure of Hamiltonian flow.

## Why the convergence is not a coincidence

The paper identifies the three conservation laws that uniquely force the Gibbs form:

**Conservation 1: Conformal invariance (scale-freedom in utility units)**. The routing primitive $w_i(\beta)$ must be invariant under linear rescaling of utilities: $U_i \to \alpha U_i + c$ should rescale $\beta$ to $\beta/\alpha$ and shift normalisation, without changing the qualitative structure. This rules out, for example, $w_i \propto U_i^n$ (power-law routing) for any $n \neq 1$ when utilities are negative.

**Conservation 2: Symplectic structure (Hamiltonian flow)**. The routing must be the stationary distribution of a Hamiltonian dynamical system — a system that conserves the volume of phase space (Liouville's theorem). This rules out any dissipative routing rule. The unique stationary distribution of a Hamiltonian system in contact with a heat bath is the Gibbs distribution.

**Conservation 3: Adiabatic invariance ($\beta$-schedule tracking)**. When $\beta$ changes slowly (adiabatically), the routing must track the instantaneous Gibbs distribution without producing entropy. This is the condition for reversible computation — the $\beta$-ramp can be run forwards (deliberation) and backwards (forgetting) without information loss. The Gibbs distribution is the unique routing primitive with this property.

The three conservation laws together form the **TIR axiom system**. The main theorem of the paper is: the Gibbs distribution is the unique routing primitive satisfying all three axioms, for any choice of geometry $G$ over the option space.

## The geometry $G$: the only domain-specific ingredient

Different applications differ only in their choice of geometry $G$ — the space over which the options $\{1, \ldots, N\}$ are defined and the metric on that space. The paper classifies four types:

1. **Abelian geometry** (flat, commutative): Options are independent. The Gibbs distribution factorises over options. This is the standard logit model of McFadden, the MaxEnt distribution of Jaynes, the canonical ensemble of Gibbs.

2. **Fano geometry** (seven points, non-commutative): Options have octonion-like structure. The routing must respect the Fano plane incidence relations. This geometry appears in ASA's computation framework.

3. **$G_2$ geometry** (exceptional Lie group): Options are related by the symmetries of the octonions. This geometry appears in the exceptional holonomy connections of Paper 285.

4. **Catalan geometry** (tree-structured, hierarchical): Options are arranged in a binary tree; the routing is a hierarchical softmax. This geometry appears in knowledge retrieval (hierarchical softmax in word2vec) and in the Parisi ultrametric tree for spin glasses.

## Escaping Arrow and Condorcet

Arrow's Impossibility Theorem (1951): no social choice function mapping utility profiles to a preference ranking satisfies all four of Arrow's axioms simultaneously. The Condorcet paradox: pairwise majority voting can produce cycles even when individual preferences are transitive.

TIR escapes both, cleanly. The reason:

- Arrow's theorem applies to functions mapping utility profiles to **rankings** (total orders). TIR produces a **probability measure** over options, not a ranking. The four Arrow axioms are not well-typed for probability measures.
- The Condorcet paradox arises from pairwise **tournaments** — binary comparisons. TIR makes no binary comparisons: all options coexist simultaneously in the Gibbs distribution. No tournament is held; no cycle can form.

The log-partition function $\mathcal{W}(\beta) = \beta^{-1} \ln Z(\beta)$ is a well-defined, differentiable scalar welfare measure. It is not a ranking; it is a free energy. Social choice in TIR is not about picking a winner — it is about characterising the distribution.

## Information routing in retrieval systems

The paper's third application domain is knowledge retrieval. A retrieval system routes a query $q$ to a set of candidate documents $\{d_1, \ldots, d_N\}$ with scores $U_i = \text{sim}(q, d_i)$. The standard retrieval model uses the softmax over scores — the Gibbs distribution at $\beta = 1$ — to produce a probability ranking.

TIR provides the missing justification: the softmax is the unique retrieval primitive satisfying conformal invariance (doubling all similarities does not change qualitative ranking), symplectic structure (the ranking is derived from a Hamiltonian similarity function), and adiabatic invariance (smoothly increasing $\beta$ from 0 to $\infty$ implements beam search without information loss).

The temperature $\beta$ is the "retrieval temperature": at $\beta \to 0$, all documents are returned with equal probability (maximum diversity, zero precision); at $\beta \to \infty$, only the top-ranked document is returned (maximum precision, zero diversity). The optimal $\beta$ balances precision and recall according to the specific retrieval task.

## What to read next

- [Buckley (2026) — The Temperature of Rationality](https://doi.org/10.5281/zenodo.20234841) — *The MGE in economic contexts: the Gibbs distribution applied to market dynamics.*
- [Buckley (2026) — Thermal Attribution](https://doi.org/10.5281/zenodo.20236870) — *Shapley values as a Gibbs-weighted attribution primitive: TIR applied to cooperative game theory.*
- [The Maslov-Gibbs Einsum (MGE)](https://doi.org/10.5281/zenodo.17981393) — *The computational primitive underlying all eight derivations: tropical and Gaussian limits unified.*

*For the full technical treatment, see [doi:10.5281/zenodo.20237288](https://doi.org/10.5281/zenodo.20237288)*
