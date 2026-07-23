---
layout: default
title: "Knots, Spiders & the ISA"
parent: Theory
nav_order: 7
description: "For topologists and algebraic geometers: how the Kuperberg G₂ spider, Khovanov homology, and the Grassmannian connect to the ISA opcode algebra — and what the ISA adds."
tags: [topology, knot-theory, khovanov, spider, g2, grassmannian, bind, fano, kauffman]
portfolio: A
---

# Knots, Spiders & the ISA
{: .no_toc }

*The BIND opcode is the trivalent vertex. The Fano plane is the right coefficient ring. Khovanov homology falls out of the opcode chain complex.*
{: .fs-5 .fw-300 }

---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Start here: Kauffman's problems through the ISA lens

[**Kauffman's Problems Through an Origami ISA Lens**](https://doi.org/10.5281/zenodo.21480280)
is the paper written directly for this audience.

Over forty years, Louis Kauffman developed a sequence of knot invariants —
bracket, Jones polynomial, Khovanov homology, virtual knots, slice concordance,
loop braids — each more powerful than the last, yet none completing the
classification of knots. The ISA reading: this progression is not a sequence of
failures but a **traversal of topological tiers**. Each invariant lives at a
specific level of the H^k cohomological hierarchy, and the reason no single
invariant suffices is that knots occupy multiple tiers simultaneously.

| Invariant | ISA tier | What it detects |
| --- | --- | --- |
| Bracket / Jones polynomial | H⁰ | Writhe; framing; stabiliser-level topology |
| HOMFLY-PT | H⁰–H¹ boundary | Two-variable interpolation across the tier boundary |
| Alexander polynomial | H¹ | Seifert surface genus; H¹ obstruction |
| Khovanov homology | H¹ → H² differential | Categorification = the ISA chain complex differential ∂ |
| Knot Floer homology | H² | Fibred knots; concordance; deep entanglement |
| Virtual knots / loop braids | H²+ | Higher-tier structure; open questions |

The ISA is a lens, not a solver. The paper does not resolve Kauffman's open
problems; it organises them by tier and identifies what a higher-tier invariant
would need to detect.

---

## The starting point: you already know the objects

If you work in low-dimensional topology or representation theory, the relevant
objects are ones you know well:

- The **Kuperberg G₂ spider** — a planar diagram calculus for G₂ representations,
  with trivalent vertices and the 14-dimensional fundamental representation
- **Khovanov homology** — a categorification of the Jones polynomial; the
  differential ∂ on the chain complex satisfies ∂² = 0 by a direct algebraic
  argument
- The **Grassmannian Gr(k,n)** — the space of k-dimensional subspaces of ℂⁿ,
  carrying Schubert calculus, Plücker coordinates, and the amplituhedron
  construction
- The **Fano plane PG(2,2)** — the unique projective plane over GF(2); 7 points,
  7 lines, automorphism group PSL(2,7) of order 168

The ISA claim is that these are not four separate structures imported into physics
from different corners of mathematics. They are four faces of a single underlying
algebra: the opcode algebra of the ISA, whose tier structure (H⁰, H¹, H²) is
the natural home for each.

---

## The G₂ spider is the BIND calculus

### Trivalent vertices and the BIND opcode

The Kuperberg G₂ spider~\[572\] has two generators: trivalent vertices (for the
14-dimensional fundamental of G₂) and crossings. The spider relations — the
planar isotopy moves — determine when two diagrams are equal as morphisms in
the G₂ representation category.

The ISA **BIND** opcode is an H² operation: it takes two systems and creates an
irreducible entanglement between them that cannot be removed by any H⁰ or H¹
operation alone. In the diagrammatic language, BIND is represented by a
trivalent vertex — one wire in, two wires out, with the three legs carrying
the three colour indices of SU(3) (or the three legs of the G₂ fundamental
decomposition).

**Theorem (Paper [572](https://doi.org/10.5281/zenodo.21278538)):** The Kuperberg
G₂ spider is isomorphic to the BIND calculus: there is a functor from the spider
category to the ISA opcode category that sends each trivalent vertex to a BIND
operation and each spider relation to an ISA identity. The BIND theorem —
that any closed BIND diagram evaluates to a scalar in GF(2) — follows from the
spider evaluation formula.

The practical consequence: **every G₂ spider identity is an ISA tautology**, and
vice versa. Computations in the spider calculus can be mechanically verified by
checking ISA opcode sequences; conversely, every ISA proof involving BIND
produces a valid G₂ spider identity.

---

## Khovanov homology from the opcode chain complex

### The ISA chain complex

The ISA has a natural chain complex structure~\[571\]. Assign to each opcode a
cohomological degree:

| Opcode | Degree | Tier |
| --- | --- | --- |
| ORBIT | 0 | H⁰ |
| TWIST, SNAP↑, SNAP↓ | 1 | H¹ |
| BIND, MERGE, LINK | 2 | H² |

The differential ∂: C^k → C^{k+1} is defined by the ISA composition law:
∂(f) = sum over all ways of promoting f by one tier, weighted by the Fano
incidence matrix over GF(2).

**Theorem (Paper [571](https://doi.org/10.5281/zenodo.21278536), x571a):**
∂² = 0. The ISA chain complex (C•, ∂) is a cochain complex.

The proof is direct: ∂²(f) counts paths of length 2 in the Fano incidence
graph, weighted over GF(2). The Fano plane has the property that any two
points determine a unique line, so each such path is counted exactly twice —
and 2 = 0 over GF(2).

### Recovery of Khovanov homology

Khovanov's original construction~\[Kho00\] assigns to a link diagram a chain
complex of graded abelian groups whose Euler characteristic is the Jones
polynomial. The differential is defined by saddle cobordisms between resolutions
of crossings.

The ISA chain complex recovers this: the two resolutions of a crossing are the
two SNAP states (SNAP↑ and SNAP↓), and the saddle cobordism between them is
the BIND differential. The grading on Khovanov's complex is the tier grading
(H⁰ = 0-smoothing, H¹ = 1-smoothing, H² = two-smoothing connected by a cobordism).

The coefficient ring GF(2) — the Fano plane's arithmetic — is exactly the
coefficient ring of Khovanov homology over F₂. The ∂² = 0 proof via Fano
incidence is a one-line alternative to the standard proof by commutativity of
saddle cobordisms.

---

## The Grassmannian as common parent

### Bonding and scattering in the same space

The Grassmannian Gr(k,n) carries two structures that have historically been
studied separately:

- **Schubert calculus** / amplituhedron: the positive Grassmannian Gr+(k,n)
  parametrises scattering amplitudes in N=4 SYM via the BCFW recursion; the
  amplituhedron is a region in Gr(k,k+4)
- **Chemical bonding**: the occupied orbital subspace of a molecule is a
  point in Gr(k,n) (k occupied orbitals in n basis functions); the molecular
  Hamiltonian acts on this space by Schubert intersection

**Paper [574](https://doi.org/10.5281/zenodo.21279006)** shows these are the
same object: the Plücker embedding gives a unified parametrisation of both the
bonding tier (H², irreducible entanglement between orbitals) and the scattering
amplitude (H², irreducible entanglement between external legs). The ISA tier
structure is the Schubert cell decomposition of Gr(k,n):

| Schubert cell | Dimension | ISA tier |
| --- | --- | --- |
| Grassmannian open cell | k(n−k) | H² |
| Codimension-1 Schubert divisor | k(n−k)−1 | H¹ boundary |
| Fixed points of torus action | 0 | H⁰ |

The snap threshold β\* is the codimension-1 Schubert divisor: the locus in
Gr(k,n) where the bonding (or scattering) transitions from one Schubert cell
to another.

---

## The Fano plane as coefficient ring

### Why GF(2) is the right field

The Fano plane PG(2,2) appears in three distinct roles across the ISA:

1. **Colour geometry**: the 7 off-diagonal SU(3) generators correspond to the 7
   Fano points; the 7 Fano lines give the 7 quark colour-charge combinations;
   the colour-singlet condition (baryon) is a closed directed 3-cycle on the
   Fano plane (Paper [545](https://doi.org/10.5281/zenodo.21515760))

2. **Magic state structure**: the Wigner function negativity of a magic state
   is determined by its Fano orbit — which of the 7 Fano lines its Bloch
   vector projects onto (Paper [361](https://doi.org/10.5281/zenodo.20541583))

3. **Chain complex coefficient ring**: the ∂² = 0 proof for the ISA Khovanov
   complex uses the Fano incidence matrix over GF(2) — the unique field with 2
   elements, whose projective plane is the Fano plane

These are not three independent uses of the same combinatorial object. They are
three projections of a single fact: **GF(2) is the natural coefficient field
for ISA computations**, because the ISA distinguishes only two states for each
binary invariant (present/absent, in/out, up/down), and GF(2) is the unique
field with that property.

The Fano plane is the projective geometry of GF(2)³ — the simplest
non-trivial projective plane — and the ISA inherits its structure from it.

**Paper [366](https://doi.org/10.5281/zenodo.20541665)** makes this explicit:
the valence of a quantum magic state is its position in the Fano orbit
decomposition, and the T-count lower bound follows from the Fano orbit structure
over GF(2).

---

## Weyl chamber homology

The Weyl chamber decomposition of a Lie algebra provides a canonical cell
structure. For SU(2) acting on two qubits, the Weyl chambers are the orbits
of the two-qubit exchange group, and the chamber walls are where entanglement
changes tier.

**Paper [595](https://doi.org/10.5281/zenodo.21345107)** computes the Bredon
cohomology of the two-qubit Weyl chamber complex. The result: the H¹ chamber
boundary has a non-trivial Bredon cohomology class — a topological obstruction
to continuously deforming an H¹ state into an H² state without crossing a snap
threshold. This is the cohomological certificate for the tier hierarchy.

The Weyl chamber complex is a CW complex; its cells are the ISA tiers; the
Bredon differential is the ISA ∂. The cohomology is the ISA cohomology.

---

## What the ISA adds for topologists

The ISA framework is not a redescription of known topology. It adds:

1. **A physical interpretation of the coefficient ring.** Khovanov homology over
   GF(2) is usually presented as a computational convenience (the signs cancel).
   The ISA explains *why* GF(2): it is the natural arithmetic of binary physical
   invariants, derived from the Fano plane geometry of the qubit.

2. **A tier interpretation of the chain complex grading.** The cohomological
   degree in the ISA complex is not just a bookkeeping integer — it is the H^k
   tier, which has a direct physical meaning (computational complexity of the
   corresponding process).

3. **A connection between knot invariants and scattering amplitudes.** The
   Grassmannian common parent (Paper [574](https://doi.org/10.5281/zenodo.21279006))
   suggests that the HOMFLY polynomial and scattering amplitudes in gauge
   theory share a Grassmannian Schubert cell decomposition — a precise statement
   that is open as a conjecture.

4. **Proton stability as a topological theorem.** The colour-singlet condition
   for a baryon is a closed Fano orbit (Paper [545](https://doi.org/10.5281/zenodo.21515760));
   baryon number conservation is the winding number of this orbit; proton
   stability below β\*_QCD is a topological theorem, not an accidental symmetry.

---

## Papers

**Core topology papers**

| # | Title | DOI | Notes |
| --- | --- | --- | --- |
| 572 | [The Kuperberg G₂ Spider is the BIND Calculus](https://doi.org/10.5281/zenodo.21278538) | [21278538](https://zenodo.org/records/21278538) | BIND theorem; spider = opcode calculus · [Explainer](/papers/10.5281-zenodo.21278538/) |
| 571 | [The ISA Chain Complex: Khovanov Homology from Opcode Projections](https://doi.org/10.5281/zenodo.21278536) | [21278536](https://zenodo.org/records/21278536) | ∂²=0 proved; Khovanov recovery |
| 574 | [The Grassmannian as Common Parent of Bonding and Scattering](https://doi.org/10.5281/zenodo.21279006) | [21279006](https://zenodo.org/records/21279006) | Gr(k,n) unifies amplituhedron and chemistry · [Explainer](/papers/10.5281-zenodo.21279006/) |
| 595 | [Weyl Chamber Homology](https://doi.org/10.5281/zenodo.21345107) | [21345107](https://zenodo.org/records/21345107) | Bredon cohomology; tier obstruction · [Explainer](/papers/10.5281-zenodo.21345107/) |
| 568 | [Schrödinger's Equation on the Grassmannian](https://doi.org/10.5281/zenodo.21277819) | [21277819](https://zenodo.org/records/21277819) | Correct Schmidt decomposition; Gr(k,n) frame |

**Fano plane and magic**

| # | Title | DOI | Notes |
| --- | --- | --- | --- |
| 361 | [Fano Orbit Decomposition of Magic](https://doi.org/10.5281/zenodo.20541583) | [20541583](https://zenodo.org/records/20541583) | Wigner negativity from Fano orbit · [Explainer](/papers/10.5281-zenodo.20541583/) |
| 366 | [A Valence Theory of Quantum Magic](https://doi.org/10.5281/zenodo.20541665) | [20541665](https://zenodo.org/records/20541665) | T-count lower bound from Fano structure · [Explainer](/papers/10.5281-zenodo.20541665/) |
| 408 | [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) | [20667176](https://zenodo.org/records/20667176) | Accessible entry point · [Explainer](/papers/10.5281-zenodo.20667176/) |
| 545 | [Topological Protection of the Proton](https://doi.org/10.5281/zenodo.21515760) | [21515760](https://zenodo.org/records/21515760) | Baryon number = Fano winding number |

**ISA foundations (for context)**

| # | Title | DOI | Notes |
| --- | --- | --- | --- |
| 469 | [ISA Completeness: Nine Normal Forms](https://doi.org/10.5281/zenodo.21219699) | [21219699](https://zenodo.org/records/21219699) | Completeness theorem; 9 opcode classes |
| 607 | [Diagrammatic QEC as ISA](https://doi.org/10.5281/zenodo.21372998) | [21372998](https://zenodo.org/records/21372998) | ZX-calculus ↔ ISA; footprints and fibres |
| 468 | [Resource Theory as Circuit Syntax](https://doi.org/10.5281/zenodo.20955514) | [20955514](https://zenodo.org/records/20955514) | ISA as symmetric monoidal category · [Explainer](/papers/10.5281-zenodo.20955514/) |

---

## What to read first

{: .note }
> **If you work on spider calculi / planar algebras:**
> Start with [The Kuperberg G₂ Spider is the BIND Calculus](https://doi.org/10.5281/zenodo.21278538).
> It shows exactly how the G₂ spider relations map to BIND opcode identities,
> with explicit diagrammatic proofs. The ISA formalism is introduced only as needed.

{: .note }
> **If you work on Khovanov homology / link homology:**
> Start with [The ISA Chain Complex](https://doi.org/10.5281/zenodo.21278536).
> The ∂² = 0 proof via Fano incidence is in Section 2; the recovery of Khovanov
> homology over GF(2) is in Section 4.

{: .note }
> **If you work on the amplituhedron / positive Grassmannian:**
> Start with [The Grassmannian as Common Parent](https://doi.org/10.5281/zenodo.21279006).
> It identifies the Schubert cell decomposition with the ISA tier structure and
> states the open conjecture connecting HOMFLY to scattering amplitudes.

{: .note }
> **If you want the one-page entry point:**
> Read [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) first.
> It needs no ISA background and makes the Fano geometry concrete in 8 pages.

---

*See also:
[Non-Associative Frontier](/docs/theory/non-associative-frontier) — G₂ geometry
and the octonions ·
[PT Symmetry & Exceptional Points](/docs/theory/pt-symmetry) — a parallel entry-point
page written for non-Hermitian physicists ·
[Opcodes reference](/docs/reference/opcodes) — canonical definitions of all 8 ISA opcodes*
