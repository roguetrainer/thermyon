---
layout: default
title: "The Alchemy of Distributions, Revisited"
parent: Explainers
nav_exclude: true
tags: [rank-transmutation, beta-deformation, tropical-semiring, fisher-information, order-statistics, optimal-transport, origami-isa, jacobi-polynomials, softmax, gibbs-ensemble, differentiable-distributions, sheaf-cohomology, skew-normal, qrtm]
portfolio: A
---

## Every Order Statistic Is a Tropical Limit

*Plain-language explainer for [doi:10.5281/zenodo.20784870](https://doi.org/10.5281/zenodo.20784870) (#456)*

---

## The central idea in one sentence

The rank transmutation map — a 2006 tool for generating skewed distributions by composing two CDFs — is a special case of the ⊕_β semiring deformation: the transmutation parameter λ is Planck's constant in disguise, the order-statistic limits are the tropical boundary at infinite Fisher distance, and every RTM factors as a three-opcode Origami ISA programme.

---

## What a rank transmutation map is

Start with any base distribution with CDF F₁. The quadratic rank transmutation map (QRTM) produces a new distribution with CDF:

$$F_2(x) = F_1(x)\bigl[1 + \lambda(1 - F_1(x))\bigr], \qquad |\lambda| \le 1$$

At λ=0 you recover the base distribution exactly. At λ=+1, F₂(x) = F₁(x)² — the CDF of the **maximum of two independent draws** from F₁. At λ=−1, you get the **minimum of two draws**. At intermediate λ, you get a continuously skewed family interpolating between them.

The full two-parameter polynomial family adds a kurtosis parameter α₂ alongside the skew parameter α₁, with the maximum of three, minimum of three, and median of three all appearing as special cases at specific parameter values.

---

## The surprise: those special cases are tropical limits

Shaw and Buckley noted these special cases but treated them as curiosities — nice closed forms at particular parameter values. The β-deformation framework reveals what they actually are.

In the ⊕_β semiring, the operation

$$a \oplus_\beta b = -\tfrac{1}{\beta}\ln(e^{-\beta a} + e^{-\beta b})$$

interpolates between ordinary addition (β→0) and the hard minimum (β→∞). The maximum and minimum of two draws are the **tropical limits** — the β→∞ endpoints of the deformation. They are not merely special cases; they are a different regime entirely.

**The tropical boundary theorem** makes this precise: as λ→±1, the Fisher information I(λ) diverges to infinity. The order-statistic distributions lie at *infinite* Fisher distance from any interior point. You cannot reach the maximum of two by smooth deformation at finite information cost — the tropical boundary is an information-geometric horizon.

---

## The universal Fisher identity

At the centre of the deformation (λ=0), something clean happens. The Fisher information in λ is:

$$I(0) = \int_0^1 (1-2u)^2\,du = \frac{1}{3}$$

This holds for **any** base distribution F₁ — normal, exponential, Cauchy, beta, anything. The proof is a single change of variables u = F₁(x). The local Fisher speed at the base distribution is always 1/√3 per unit λ — the same geometric constant that appears as the H¹ certificate bound in [Paper 400](https://doi.org/10.5281/zenodo.20653311).

---

## The ISA factorisation

Every RTM has a natural three-step structure in the Origami ISA:

| Step | Opcode | What it does |
|------|--------|-------------|
| 1 | SPLIT_{F₁} | Probability integral transform: map X to uniform u = F₁(x) |
| 2 | FLIP_G | Transmute the uniform via G(u) = u + λu(1−u) |
| 3 | SPLAT_{F₂} | Apply the quantile function F₂⁻¹ to return to the real line |

RTM = SPLAT ∘ FLIP ∘ SPLIT.

The FLIP step is the only non-trivial one, and it has a precise algebraic interpretation: the correction term u(1−u) is the Jacobi weight w^{(1,1)} on [0,1], and the QRTM correction λu(1−u) is the j=½ Wigner-Racah recoupling coefficient — the same object that generates the 6j symbol in angular momentum theory. The symmetric cubic RTM (which changes kurtosis without skew) is the j=1 TWIST recoupling.

---

## The multivariate extension

The univariate RTM extends to joint distributions via the H^k cohomological ladder:

- **H⁰ (bilateral):** independent marginal transmutations; product copula; no interaction
- **H¹ (triangular):** pairwise transmutation parameters {λ_{ij}} subject to a Pentagon consistency condition; the number of independent copula loops is β₁ = m − d + c (the same Betti number as funding loops in systemic risk)
- **H²  (tetrahedral):** four-variable interactions irreducible to pairwise terms; Kendall's τ for four variables is an H² invariant

Sklar's theorem for copulas is the H¹=0 statement: a joint distribution decomposes into pairwise copulas iff the coboundary of the pairwise margins is trivial.

---

## Connection to Sinkhorn optimal transport

The RTM G[F₁(x)] is a quantile transport map — it moves the measure with CDF F₁ to the measure with CDF F₂ via the uniform on [0,1]. The comonotone (Hoeffding) coupling corresponds to G = id, i.e. λ=0.

Sinkhorn optimal transport with regularisation ε is the smooth version: as ε→0 it recovers the comonotone plan; at finite ε it describes a softer mixing. In ⊕_β language: ε ↔ 1/β — high regularisation is the statistical (Forge) regime, low regularisation is the tropical (Origami) regime where the transport plan becomes deterministic.

---

## Where λ fits in the universal parameter table

[Paper 443](https://doi.org/10.5281/zenodo.20752384) identifies a parameter that appears as Planck's constant in quantum mechanics, volatility in Black-Scholes, softmax temperature in machine learning, and regularisation strength in Sinkhorn OT. The transmutation parameter λ is another member:

| λ = 0 | Base distribution — identity transmutation |
| 0 < \|λ\| < 1 | Forge regime — smooth skewed family |
| \|λ\| = 1 | Tropical limit — hard order-statistic selection (infinite Fisher distance) |

The 2006 RTM paper was, in retrospect, the first instance of ⊕_β deformation in the statistics literature — written 18 years before the framework was identified.

---

## What to read next

- [Planck's Constant in Disguise](https://doi.org/10.5281/zenodo.20752384) (#443) — the ⊕_β semiring that unifies six classical dualities; where λ fits in the universal parameter table
- [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) (#419) — the statistical β regime in full; snap event at β*; vorton architecture
- [The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526) (#420) — the cohomological classification underlying the multivariate extension
- [The Unhedgeability Theorem](https://doi.org/10.5281/zenodo.20635479) (#396) — H¹ obstruction in a financial setting; the Pentagon identity as the copula consistency condition

*For the full technical treatment, see [doi:10.5281/zenodo.20784870](https://doi.org/10.5281/zenodo.20784870)*
