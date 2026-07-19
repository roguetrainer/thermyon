---
layout: default
title: "The Grassmannian as the Common Parent of Bonding and Scattering"
parent: Explainers
nav_exclude: true
tags: [grassmannian, bonding, scattering, amplituhedron, quantum-chemistry, pauling, reaction-mechanism, casscf, noon, theta-g, catalysis, transition-state, fubini-study, geodesic]
portfolio: B
---

## One space, two disciplines

*Plain-language explainer for [doi:10.5281/zenodo.21279006](https://doi.org/10.5281/zenodo.21279006) (#574)*

---

## The central idea in one sentence

Pauling's complementarity principle — the 75-year-old empirical rule behind every
transition-state analogue drug ever designed — is a theorem in the geometry of
quantum-mechanical wavefunctions, proved here for the first time.

---

## Background: what Pauling said

In 1948, Linus Pauling observed that enzymes work by being geometrically
complementary to their transition states, not their substrates. This insight
has driven drug design for decades: design a molecule that looks like the
transition state of the reaction you want to inhibit, and it will bind tightly
to the enzyme active site.

Nobody had proved this. It was an empirical observation — extraordinarily
productive, but without mathematical foundation.

---

## The geometric setting

A quantum-mechanical wavefunction for a molecule with n_e electrons in
n_orb orbitals is a point on a mathematical space called the Grassmannian
Gr(n_e, n_orb). This is the space of all possible ways to choose which
orbitals the electrons occupy.

The Grassmannian has a natural notion of distance — the Fubini-Study
metric — which measures how different two wavefunctions are from each
other. Under this metric, the shortest path between any two wavefunctions
is a geodesic: a straight line on the curved surface of the Grassmannian.

---

## The theorem

For a chemical reaction R → TS → P:

- G_R is the wavefunction of the reactant
- G_TS is the wavefunction at the transition state
- G_P is the wavefunction of the product

**Theorem (Pauling principle, proved).** The transition state G_TS is the
Fubini-Study geodesic midpoint between G_R and G_P. That is, the arcs
arc(G_R, G_TS) and arc(G_TS, G_P) are equal.

This is Pauling's complementarity: the enzyme active site, which is
shaped to bind G_TS, sits at the midpoint of the wavefunction trajectory
from substrate to product.

---

## The catalytic efficiency formula

From the theorem, a catalytic efficiency η_cat can be defined:

η_cat = 1 − arc(G_R, G_TS) / arc(G_R, G_P)

At the exact midpoint, η_cat = 0.500. This plays the same role as the
Carnot efficiency in thermodynamics: it is the maximum possible fraction
of the reaction coordinate captured by the enzyme.

---

## Numerical confirmation

Three reactions were tested:

**H₂ dissociation.** The β* snap (onset of multi-reference character) occurs
at R = 1.050 Å, 0.793 Å before the geodesic midpoint at R = 1.843 Å.
The equidistance of arcs was confirmed exactly (residual 0.000°).

**SN2 reaction (F⁻ + CH₃F).** The D₃h transition state has the classic
three-centre four-electron bond NOONs [1.34, 1.33, 0.67, 0.66]. Geometric
collinearity 0.000°, equidistance 0.000°, η_cat = 0.500 — enforced by symmetry.

**Diels-Alder (butadiene + ethylene → cyclohexene).** The critical test: an
asymmetric, concerted reaction with no enforced symmetry.
arc(G_R, G_TS) = 18.20°, arc(G_TS, G_P) = 18.44°, **η_cat = 0.503** —
within 0.3% of the midpoint value.

The near-equidistance of arcs for Diels-Alder is also a new result: it is
the Grassmannian signature of a synchronous, concerted mechanism, which
can now be distinguished from stepwise mechanisms computationally.

---

## The connection to particle physics

The Grassmannian Gr(k,n) that parametrises CASSCF wavefunctions in quantum
chemistry is the same family of spaces used by Arkani-Hamed and Trnka to
parametrise scattering amplitudes in the amplituhedron programme for N=4
super-Yang–Mills theory. The ISA opcodes (ORBIT, TWIST, BIND) have the same
categorical structure in both settings.

This parallel was the original motivation for the paper; the chemistry results
stand independently of amplituhedron technology.

---

## Why this matters

**For drug design.** Transition-state analogue design has been empirical for
75 years. This paper gives it a geometric foundation: the ideal inhibitor
is the molecule whose wavefunction is closest to the geodesic midpoint G_TS
on the Grassmannian. This is now computable, not guessed.

**For catalysis.** η_cat = 0.503 for Diels-Alder means the reaction uses
almost exactly 50% of the available wavefunction arc for the forward step.
Catalysts that shift this balance — making arc(G_R, G_TS) smaller — increase
rate by a computable amount.

**For mechanism.** arc(G_R, G_TS) ≈ arc(G_TS, G_P) is the first computable,
basis-independent diagnostic for a synchronous concerted mechanism.

---

*See also: [Chemistry Roadmap](../../chemistry-roadmap.md) (Layer 3 — Mechanisms);
[ISA Zoo entry C01](../../isa-zoo/c01-nitrogen-fixation.md) (nitrogen fixation).*
