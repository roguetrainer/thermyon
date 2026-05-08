---
layout: default
title: "Portfolio B — Foundations"
parent: Portfolios
nav_order: 2
---

# Portfolio B — Foundational Mathematics

**Primary audience:** Mathematicians — algebraic geometry, category theory, exceptional Lie theory, combinatorics

---

## ASA for Mathematicians

Portfolio B contains the purely mathematical foundations of the ASA: the algebraic structures, geometric objects, and category-theoretic frameworks that the computational papers build on. If you want to understand *why* the octonions and exceptional Lie groups appear, and what new mathematical objects the ASA introduces, start here.

The **Fano-Foam Manifold** (Paper 200) introduces the central geometric object: a 7-dimensional manifold whose cells are labelled by the points and lines of the Fano plane $\mathrm{PG}(2,2)$, with an excluded-volume principle enforcing that no two occupied cells share a Fano line. This is the combinatorial substrate from which the octonion multiplication table, the $G_2$ holonomy, and the associator geometry all emerge. The excluded-volume principle is the geometric shadow of the Pauli exclusion principle — and Paper 200 argues these are the same fact at different scales.

The **731-Calculus** (Paper 207) is the magmoidal category theory underlying the ASA's instruction set. "731" refers to the 7 Fano points, 3 points per line, and 1 associator per triple: the minimal data of a non-associative algebra. The 731-Calculus constructs a monoidal category whose objects are octonionic spin-foam states and whose morphisms are Pachner moves — local retriangulations of the Fano simplex. This gives the ASA a rigorous categorical semantics and connects it to the spin-foam approach to quantum gravity.

The **Magic Square Architecture** (Paper 263) situates the entire ASA within the Freudenthal-Tits magic square — the $4 \times 4$ table of exceptional Lie algebras $\mathfrak{g}(A, B)$ constructed from pairs of division algebras $A, B \in \{\mathbb{R}, \mathbb{C}, \mathbb{H}, \mathbb{O}\}$. The paper argues that the magic square is not merely a classification theorem but a *blueprint*: each cell corresponds to a distinct physical regime, and the ASA is the computational realisation of the bottom-right cell $\mathfrak{e}_8 = \mathfrak{g}(\mathbb{O}, \mathbb{O})$. The diagonal of the magic square ($\mathfrak{g}_2, \mathfrak{f}_4, \mathfrak{e}_6, \mathfrak{e}_8$) is the division-algebra ladder expressed as Lie algebras.

**For algebraic geometers:** the Fano-Fisher metric (Papers 221, Portfolio C-AI) is the Fisher information metric on the $G_2$ statistical manifold — a concrete Riemannian metric on an exceptional Lie group derived from a natural energy functional. The rank-4 decomposition theorem has the flavour of a Lefschetz-type result: the curvature concentrates on a 4-dimensional subspace that rotates under the $G_2$ action.

**For category theorists:** the 731-Calculus (Paper 207) and the Origami ISA (Paper 258, Portfolio C) construct a magmoidal category — a category whose tensor product is non-associative. The coherence data is controlled by the Fano associator, giving a concrete example of a non-associative monoidal category with a finite combinatorial model.

---

## Papers

| # | Paper |
|---|-------|
| [200](../papers/10.5281-zenodo.19869263/) | The Fano-Foam Manifold and the Excluded Volume Principle |
| [207](../papers/10.5281-zenodo.19713350/) | The 731-Calculus: Magmoidal Category Theory, Octonionic Spin Foams, and the Architecture of the Topological Processor |
| [263](../papers/10.5281-zenodo.19928880/) | The Architecture of Inevitability: The Freudenthal-Tits Magic Square as the Blueprint for the ASA |

---

## Key Glossary Terms

[Fano Plane](../glossary/#fano-plane) · [Associator](../glossary/#associator) · [$G_2$](../glossary/#g_2) · [Division Algebra Ladder](../glossary/#division-algebra-ladder) · [Simplicial](../glossary/#simplicial)
