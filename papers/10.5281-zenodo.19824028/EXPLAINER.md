---
layout: default
title: "The Riemann Spectrometer"
parent: Explainers
nav_exclude: false
---

# The Riemann Spectrometer: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.19824028](https://doi.org/10.5281/zenodo.19824028) (#240)*

## Why do we care?

The **Riemann Hypothesis** is the most famous unsolved problem in mathematics. It concerns where the "zeros" of the Riemann Zeta function sit in the complex plane. Mathematicians have long suspected — via the **Hilbert-Pólya conjecture** — that these zeros are the eigenvalues (resonant frequencies) of some physical operator. If we could identify the right operator and prove its spectrum matches the zeros, we would have solved one of the Millennium Prize Problems.

This paper asks whether the **Exceptional Jordan Algebra** $\mathfrak{J}_3(\mathbb{O})$ — a 27-dimensional algebraic structure whose automorphism group is the exceptional Lie group $F_4$ — might be the natural home for such an operator. It does not answer that question. It is an open invitation to specialists in automorphic forms.

**Important caveat:** this paper explicitly states in its title page that *"this paper does not prove any new theorem. It is an invitation to specialists."* The explainer below reflects that honest framing.

## The controversial claim

The paper does not make a claim strong enough to be "controversial" in the usual sense. It makes a **structural observation**: the Exceptional Jordan Algebra has combinatorial properties that look — qualitatively — like what you would want in a prime-constraining geometry for the Hilbert-Pólya conjecture.

The most specific technical proposal is the **Ihara Zeta pivot**: instead of working with the continuous automorphic spectrum of $F_4$ (which has the wrong asymptotic growth to match the Riemann zeros), the paper proposes using the discrete **Ihara Zeta function** of the 24-cell — the finite spherical building that the continuous $F_4$ fluid "crystallises" onto at low temperature. The roots of this discrete Ihara Zeta function are candidates to match the Riemann zeros. Whether they actually do is an open question.

## Reasons not to be sceptical

- **Exceptional groups and number theory are genuinely connected.** The exceptional groups $F_4$, $E_6$, $E_7$, $E_8$ appear in serious automorphic forms research (Gross-Savin, Gan-Gurevich-Jiang, Kim-Shahidi). This is not a crank connection.
- **The Ihara Zeta pivot solves a real problem.** Earlier versions of this paper suffered from a fatal "Weyl asymptotics mismatch" — the continuous $F_4$ spectrum grows as $T^{28}$, far too fast to match the Riemann zeros. The crystallisation to the discrete 24-cell sidesteps this. It is a genuine methodological improvement.
- **The Albert-Associator Null Test (AANT)** is an honest falsification protocol: a five-control diagnostic designed to distinguish a real structural connection from a signal-processing coincidence. Proposing your own falsification test is the opposite of wishful thinking.

## Reasons to be sceptical

An independent editorial review (reproduced in the paper folder) rated this work **4.5/10 — "wrong but interesting."** The main gaps are:

- **No Hilbert space is constructed.** $\mathfrak{J}_3(\mathbb{O})$ is 27-dimensional; it has at most 27 eigenvalues. The Riemann zeros are countably infinite. The paper does not specify how an infinite-dimensional Hilbert space arises.
- **The central object "$\mathbb{O}(\mathbb{A}_\mathbb{Q})$" (Adelic Octonions) is not well-defined.** The octonions split over $\mathbb{Q}_p$ for most primes, losing the non-associative structure the paper depends on. The correct arena — automorphic $L^2$ spaces on $F_4(\mathbb{A}_\mathbb{Q})$ — is classical but the paper does not work in it rigorously.
- **The Ihara-prime experiment was run and returned a null result.** A computational test constructing an "Awkward Prime hinge graph" and comparing its Ihara spectrum to the Riemann zeros found no match. The null result is correctly reported.

## The technical core

The paper proposes three structural ingredients for a future Hilbert-Pólya operator:

1. **The arena:** $L^2(F_4(\mathbb{Q}) \backslash F_4(\mathbb{A}_\mathbb{Q}))$ — the automorphic $L^2$ space on the exceptional group $F_4$, following the Langlands programme. (This is the correct version of the undefined "Adelic Octonions.")

2. **The operator:** A Casimir or Hecke operator on this space, whose spectrum would decompose into automorphic representations. The question is whether $\zeta(s)$ appears naturally in this decomposition.

3. **The discretisation:** The 24-cell (the finite spherical building of $F_4$) provides a discrete graph whose Ihara Zeta function is better-behaved asymptotically than the continuous spectrum. Berkovich analytification provides the theoretical framework for the continuous-to-discrete deformation.

None of these ingredients are assembled into a working construction. The paper identifies them as the right components and asks whether automorphic forms specialists can connect them.

## Risks and open problems

- **The Weyl asymptotics must be verified.** The number of Riemann zeros with $|\gamma_n| < T$ grows as $(T/2\pi)\log(T/2\pi e)$. Any candidate operator must reproduce this counting law. The paper does not check this.
- **The non-associativity must earn its place.** It is not currently clear whether the exceptional structure of $F_4/E_6$ forces the required spectral properties, or whether the non-associativity narrative is irrelevant to the actual spectral theory.
- **The AANT falsification protocol has not been fully executed.** Running all five controls at scale (the E8 Gosset polytope with 240 vertices has the right size for reliable statistics) remains future work.

## What to read next

- [The 731 Frog Calculus (Part 1)](https://doi.org/10.5281/zenodo.19713350) — *The non-associative $G_2$ geometry that underlies the ASA's approach to exceptional structures.*
- [Geometric Shadows in Apéry's Polynomial](https://doi.org/10.5281/zenodo.20031913) — *Connects $\zeta(3)$ to the same $G_2$ Fano geometry appearing in this paper.*

*For the full technical treatment, see [doi:10.5281/zenodo.19824028](https://doi.org/10.5281/zenodo.19824028)*
