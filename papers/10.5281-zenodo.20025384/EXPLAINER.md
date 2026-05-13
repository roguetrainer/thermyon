---
layout: default
title: "Non-Associative Calculus"
parent: Explainers
nav_exclude: false
---

# Non-Associative Calculus: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20025384](https://doi.org/10.5281/zenodo.20025384) (#211)*

## Why do we care?

Every student learns calculus using real numbers: derivatives, integrals, differential equations. These tools work because real numbers are **associative** — $(a \times b) \times c = a \times (b \times c)$ always. This lets you rearrange brackets freely when computing limits and derivatives.

The **octonions** — the 8-dimensional number system that governs $G_2$ geometry and the Fano plane — are *not* associative. This means that standard calculus breaks down when applied to octonions: the chain rule fails in its usual form, integrals are path-dependent in a new way, and ordinary differential equations can have multiple inequivalent solutions depending on the order of operations. For 180 years, since Hamilton invented the quaternions in 1843, no rigorous calculus for fully non-associative algebras has existed.

This paper develops the first such calculus.

## The controversial claim

The central assertion is that **the associator is a first-class differential object, not an error to be corrected.** Standard approaches to hypercomplex calculus (quaternionic analysis, Clifford analysis) either restrict to associative subalgebras or treat non-associativity as a nuisance to be handled by case analysis. This paper claims that the **Associator** $[a,b,c] = (ab)c - a(bc)$ should be treated as a new kind of derivative — a "torsion" in the algebraic sense — and that the correct generalisation of the chain rule is a formula that explicitly includes the associator as a correction term.

## Reasons not to be sceptical

- **The right-division norm is well-defined.** The paper proves that $\|f'(x)\| = \lim_{h \to 0} \|f(x+h) - f(x)\| / \|h\|$ is a valid norm on octonion-valued functions, even though the usual algebraic manipulations of limits require care about bracket order.
- **The Moufang identities provide a substitute for associativity.** The octonions satisfy the Moufang laws ($x(y(xz)) = (x(yx))z$, etc.), which are weaker than associativity but strong enough to prove the main theorems of calculus — including the fundamental theorem of calculus and the existence/uniqueness theorem for ODEs — in modified form.
- **The Fano-Fisher measure is canonical.** The integration measure derived from the $G_2$ Fano-Fisher metric is the unique $G_2$-invariant measure on the octonion unit ball, giving a well-defined notion of "integral" that does not depend on the order of integration.

## The technical core

The paper defines **octonion differentiability** via the right-division norm and proves that a function is differentiable if and only if it satisfies a modified Cauchy-Riemann system that includes the associator as a source term. The **Non-Associative Chain Rule** states: $(f \circ g)'(x) = f'(g(x)) \cdot g'(x) + A(f, g, x)$, where $A$ is the **Associator Correction** — a tensor that vanishes identically when restricted to any associative subalgebra. The paper then develops a theory of **Octonion ODEs**, proving existence and uniqueness under a Lipschitz condition on the associator correction.

## Risks and open problems

The primary open problem is **the $F_4$-Riemann Hypothesis bridge**. The paper identifies the non-associative calculus as the natural language for the automorphic $L^2$ space $L^2(F_4(\mathbb{Q}) \backslash F_4(\mathbb{A}_\mathbb{Q}))$ that is the correct arena for the Riemann Spectrometer programme. However, connecting the Casimir operator on this space to the non-associative derivative developed here requires tools from automorphic forms that have not yet been worked out. A secondary risk is **convergence**: the Moufang-based proofs of existence/uniqueness for ODEs require the Lipschitz constant of the associator correction to be small, and it is not yet known how restrictive this condition is for physically relevant systems.

## What to read next

- [The 731 Frog Calculus (Part 1)](https://doi.org/10.5281/zenodo.19713350) — *The discrete combinatorial precursor to this continuous calculus.*
- [The Riemann Spectrometer](https://doi.org/10.5281/zenodo.19824028) — *The programme this calculus is designed to serve.*
- [Non-Associative Information Geometry](https://doi.org/10.5281/zenodo.20076498) — *The statistical geometry built on the same Fano-Fisher metric.*

*For the full technical treatment, see [doi:10.5281/zenodo.20025384](https://doi.org/10.5281/zenodo.20025384)*
