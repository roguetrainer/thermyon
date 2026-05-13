---
layout: default
title: "The zeta(21) Apery Ladder"
parent: Explainers
nav_exclude: false
tags: [grand-challenges, number-theory, recurrence, g2]
---

# The ζ(21) Apéry Ladder: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20029647](https://doi.org/10.5281/zenodo.20029647) (#265)*

## Why do we care?

The values of the Riemann Zeta function at odd integers — $\zeta(3)$, $\zeta(5)$, $\zeta(7)$, ... — are among the deepest mysteries in number theory. We know $\zeta(3)$ is irrational (Apéry, 1978), but we do not know whether $\zeta(5)$, $\zeta(7)$, or any higher odd value is irrational, transcendental, or algebraically independent. These numbers appear throughout physics (quantum field theory loop integrals, string theory amplitudes) but their arithmetic nature is almost entirely unknown.

This paper asks whether the $G_2$ geometry — the non-associative octonion structure — can generate a "ladder" of explicit rational approximations that climb toward $\zeta(21)$. The target $\zeta(21)$ is chosen because 21 is the dimension of the Exceptional Jordan Algebra, making it a natural candidate for a $G_2$-flavoured irrationality proof.

## The controversial claim

The central assertion is that **the irrationality measure of $\zeta(2n+1)$ is controlled by the $G_2$ Fano geometry for $n$ related to the octonion dimension.** Standard analytic number theory approaches these values via hypergeometric series and Padé approximants. This paper claims that the correct "approximant engine" is the Maslov-Gibbs Einsum (MGE) acting on the 14-dimensional $\mathfrak{g}_2$ Lie algebra, and that the resulting rational sequences converge faster than classical methods for the specific values predicted by the Fano incidence structure.

## Reasons not to be sceptical

- **Apéry's original proof** used a recursion whose coefficients are now understood to arise from the Apéry polynomial $A(n) = 34n^3 + 51n^2 + 27n + 5$. The constants 34 and 5 appear naturally in $G_2$ geometry (dimension of the algebra and number of Fano points), suggesting a structural connection.
- **The ladder structure** is a well-defined mathematical object: the rungs are the dimensions of successive exceptional algebras ($G_2$: 14, $F_4$: 52, $E_6$: 78, ...), and the zeta values at these dimensions are natural targets.
- **Numerical evidence** shows that MGE-generated rational sequences approach $\zeta(3)$ with irrationality exponent consistent with Apéry's bound, providing a sanity check on the method.

## The technical core

The paper constructs an **Apéry Ladder** by applying the MGE operator to the Casimir element of $\mathfrak{g}_2$. The inverse-temperature parameter $\beta$ is driven through a sequence of values corresponding to the rungs of the ladder. At each rung, the MGE produces a rational number $p_n/q_n$ that approximates the target zeta value. The **Fano-Fisher Metric** measures how close each approximant is to the "Fano line" of exact rational values, providing a geometric criterion for convergence.

## Risks and open problems

The primary risk is **algebraic over-fitting**. The constants 34 and 5 appear in the Apéry polynomial, and they also appear in $G_2$ geometry — but this may be a numerical coincidence rather than a structural connection. Until a proof is given that the MGE recursion *forces* these constants to appear (rather than merely reproducing them), the connection remains a conjecture. A secondary risk is that the ladder may terminate: it is not known whether the $G_2$ geometry generates convergents for $\zeta(21)$ specifically, or only for $\zeta(3)$.

## What to read next

- [Geometric Shadows in Apéry's Polynomial](https://doi.org/10.5281/zenodo.20031913) — *The companion paper showing how the Apéry polynomial factors through $G_2$ structure.*
- [The Riemann Spectrometer](https://doi.org/10.5281/zenodo.19824028) — *The broader programme connecting $G_2$ geometry to the Riemann zeros.*

*For the full technical treatment, see [doi:10.5281/zenodo.20029647](https://doi.org/10.5281/zenodo.20029647)*
