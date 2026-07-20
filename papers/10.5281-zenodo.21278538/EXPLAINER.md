---
layout: default
title: "The Kuperberg G₂ Spider is the BIND Calculus"
parent: Explainers
nav_exclude: true
tags: [g2, fano, octonions, bind, h2, calculus, diagrammatic, spectroscopy, knot-theory, trs-framework]
portfolio: B
---

## A 1996 knot-theory paper and the H² opcode

*Plain-language explainer for [doi:10.5281/zenodo.21278538](https://doi.org/10.5281/zenodo.21278538) (#572)*

---

## The one-sentence version

Greg Kuperberg's 1996 diagrammatic calculus for the exceptional Lie group G₂ — built to compute knot invariants — turns out to be the complete axiomatisation of the BIND opcode, the H² instruction that appears wherever a physical system is fundamentally non-associative.

---

## What is the BIND opcode?

The ISA classifies computations by how complex their interactions are:

- **H⁰ (ORBIT)**: counting configurations — classical, tropical, associative and commutative
- **H¹ (TWIST)**: rotations and interference — quantum but still associative
- **H² (BIND)**: non-associative interactions — the rarest and hardest tier

BIND is the three-body vertex: it couples three objects at once in a way that depends on the *order* of coupling. Swap any two inputs and you can get a different answer. This non-associativity is the hallmark of octonions — the largest normed division algebra — and of the exceptional group G₂ = Aut(octonions).

A BIND operation appears, for example, when three iron atoms in FeMoco form a "Fano triple": a triangular arrangement where the three magnetic orbitals are connected not by pairwise exchange (H¹) but by a genuine three-body interaction encoded in the Fano plane geometry.

---

## What Kuperberg built in 1996

To compute invariants of knots whose strands are "coloured" by the 7-dimensional representation of G₂, Kuperberg needed a diagrammatic calculus — a set of local drawing rules that let you simplify any tangle until only a number remains.

He found five rules (call them R1–R5) for diagrams built from a single trivalent vertex V:

| Rule | Diagram | Evaluation |
|------|---------|-----------|
| R1 (circle) | a closed loop | = 7 |
| R2 (bigon) | two vertices nose-to-nose | = 5 × (identity strand) |
| R3 (square) | four vertices in a square | decomposes into two simpler pieces |
| R4 (pentagon) | five vertices in a ring | = 0 |
| R5 (isotopy) | topological moves | = same diagram |

The key theorem: **these five rules are complete**. Any closed G₂ diagram, however complex, reduces to a number by applying R1–R5 finitely many times.

---

## Why the trivalent vertex V is exactly BIND

The trivalent vertex in Kuperberg's spider evaluates on basis vectors e_i, e_j, e_k of ℝ⁷ as:

    V(eᵢ, eⱼ, eₖ) = φ(eᵢ, eⱼ, eₖ)

where φ is the Fano incidence function: it equals +1 if {i, j, k} form a positively-oriented Fano line, −1 for the opposite orientation, and 0 otherwise. This is identical to the ISA definition of BIND.

The 7-dimensional representation is the 7 imaginary octonion directions. G₂ is the automorphism group of the octonions. The trivalent vertex is the octonion trilinear form. BIND = Fano indicator = octonion trilinear form. All three descriptions are the same object.

---

## What the spider gives us that we did not have

The ISA already defined the BIND opcode and knew it corresponded to G₂. What Kuperberg adds:

**1. A precise normalisation (R2).** BIND composed with its adjoint equals 5 times the identity. Before Kuperberg, the ISA had BIND defined up to a constant. R2 fixes the constant.

**2. A 4-body rewrite rule (R3).** A diagram with four BIND vertices decomposes into two simpler pieces with coefficients 5/7 and 3/7. This is the ISA analogue of arithmetic simplification: R3 lets you reduce multi-BIND programmes to normal form.

**3. A minimum circuit theorem.** The smallest non-trivial closed BIND programme uses exactly 3 vertices (not 1 or 2). Two BIND vertices only produce the bigon (R2), which is just a scalar — trivial at H². Three vertices form the "theta-graph," evaluating to 5 × 7 = 35, which is genuinely H². This also explains why transition-metal spectroscopy is dominated by 4-body interactions: three BIND strands, each connecting a pair of electrons, give 3 × 2 − 3 = 3 shared electrons plus 3 free — a 4-body Coulomb integral, the Racah B-parameter.

**4. A completeness theorem.** Any closed BIND programme terminates with a definite integer answer. This is the ISA computation theorem for H²: BIND programmes always halt.

---

## Where BIND appears in physics

Once you know the axioms, the BIND opcode is recognisable across many domains:

| Domain | BIND manifestation | What R2–R4 compute |
|--------|-------------------|-------------------|
| Transition-metal spectroscopy | Racah B, C parameters | 4-electron Coulomb integrals |
| Nuclear physics | Tensor force S₁₂; seniority number | Pairing-force matrix elements |
| FeMoco (nitrogen fixation) | 7 Fe atoms as 7 spider strands | Full G₂ catalytic programme |
| Knot theory | G₂ link invariant | Integer polynomial in q |
| Topological order | Non-Abelian anyon fusion | F-matrix elements |

The BIND theorem — *non-Abelian topological order ↔ BIND present* — now has a complete proof via Kuperberg's Theorem 6.1.

---

## The β-deformation: continuous temperature

At the β-deformation parameter q = e^{iπβ}, the Kuperberg rules quantise: the integers 7, 5, 3 in R1–R2 become quantum dimensions [7]_β, [5]_β, [3]_β. Snap events — phase transitions in the BIND calculus — occur when one quantum dimension vanishes:

- β = 1/3: the 3-dimensional sector collapses
- β = 1/5: BIND self-pairs become degenerate (BIND can no longer close on itself)
- β = 1/7: the full G₂ sector collapses; the Fano plane vanishes

These are the G₂ critical points of the β-deformed ISA. The β = 1/7 snap is the H² phase transition in the H^k complexity ladder.

---

## A three-level hierarchy

The BIND opcode lives at three levels, each handled by a different framework:

```
Fano 731 crystal (3D, Paper #207)
      ↓  lossless 2D projection
2D Frog Diagram (Paper #281, 4-valent frogs)
      ↓  subdivide each frog into 2 trivalent vertices
Kuperberg G₂ spider (3-valent)
      ↓  apply R1–R5
Scalar ∈ ℤ[q, q⁻¹]
```

The 4-valent frogs of Paper #281 and the 3-valent Kuperberg vertices are not competing: one 4-valent frog equals two Kuperberg vertices joined by an internal edge. Paper #281 keeps the tetrahedron whole and compensates with two local rules (Excluded Volume Principle, Polarity Rule); Kuperberg splits the tetrahedron and needs neither rule. The Poison Frog (Associator Defect) of Paper #281 is exactly the non-zero R4 pentagon remainder made visible as a node in the diagram.

---

## The four-storey building

Kuperberg's spider is the top floor of a four-storey diagrammatic hierarchy:

| Floor | ISA opcode | Calculus | Key property |
|-------|-----------|----------|--------------|
| H² | BIND | G₂ spider (Kuperberg 1996) | Non-associative |
| H¹ | TWIST / FLIP / FLOP | BMW algebra (1989) | Non-commutative |
| H⁰' | FLIP only | Hecke algebra (1964) | Commutative, signed |
| H⁰ | ORBIT / SPLIT / SPLAT | Temperley-Lieb (1971) | Commutative, positive |

The Frog calculus is the full building plus the β-deformation elevator between floors. Kuperberg provides the axioms for the top floor; this paper adds the ISA interpretation, the physical applications, and the β-deformation path that connects all four floors.

---

*See also:*

- [The ISA Chain Complex](https://doi.org/10.5281/zenodo.21278536) (#571) — ISA homology H^k from opcode programmes; BIND = the ∂¹ boundary map
- [Galois Chemistry I](https://doi.org/10.5281/zenodo.21224107) (#488) — FeMoco as a 7-qubit G₂ computer
- [Nuclear Bonding as H²](https://doi.org/10.5281/zenodo.21279217) (#575) — tensor force = BIND; deuteron as the simplest H² system
- [The Kuperberg G₂ spider](https://doi.org/10.1007/BF02101184) — the 1996 source paper
