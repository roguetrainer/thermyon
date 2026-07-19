---
layout: default
title: "The H^k Complexity Ladder"
parent: Explainers
nav_exclude: true
tags: [complexity, sheaf-cohomology, h0, h1, h2, bpp, bqp, pspace, p-np, beta-star, algorithmic-hardness, constraint-satisfaction, sat, euler-characteristic]
portfolio: A
---

## Why Some Hard Problems Are Easy in Practice — and How to Tell in Advance

*Plain-language explainer for [doi:10.5281/zenodo.20773526](https://doi.org/10.5281/zenodo.20773526) (#420)*

---

## The central idea in one sentence

Algorithmic hardness is not binary (easy vs. NP-hard) but graded: every problem instance lives at a specific rung of a cohomological ladder, computable in polynomial time from the Euler characteristic of the constraint graph, that tells you which algorithm to apply before you spend any effort solving it.

---

## The problem with P=NP

The P=NP question asks: is every problem whose solution can be quickly *verified* also quickly *solvable*? After fifty years this remains open — but it also asks the wrong question for practitioners.

Industrial SAT solvers routinely handle instances with millions of variables in seconds, even though SAT is NP-hard in the worst case. The reason is that most real instances are nowhere near the worst case. P=NP gives you no way to predict, before running the solver, whether a specific instance will be easy or hard. It is a statement about the worst case over all possible instances, not about the typical instance you actually have.

The H^k complexity ladder replaces this binary worst-case framing with a graded, instance-specific diagnostic.

---

## The constraint graph and its topology

Every constraint-satisfaction problem has a **constraint graph**: variables are vertices, constraints are edges (or hyperedges). The topology of this graph — not just its size — determines hardness.

The key invariant is the **Euler characteristic** χ = V − E + F (vertices minus edges plus triangular faces). Computing χ takes O(n + m) time — linear in the problem size. From χ you can read off the **Betti numbers** β₀, β₁, β₂, which count topological holes at each dimension:

- β₀ = number of connected components
- β₁ = number of independent cycles (H¹, the "loop count")
- β₂ = number of independent voids (H², the "bubble count")

These numbers classify the instance:

| Rung | Condition | What it means | Cheapest algorithm | Cost |
|------|-----------|---------------|--------------------|------|
| 0 | H⁰ = 0 (no solution) | Detect and stop | Constraint propagation | O(n) |
| 1 | H¹ ≠ 0, H² = 0 | Local obstructions only | Forge ISA at β* | Polynomial |
| 2 | H² ≠ 0 | Global obstruction | Hard search | Conjectured NP |
| k ≥ 3 | H^k ≠ 0 | Higher obstruction | Unknown | Conjectured #P/PSPACE |

The H^k rung of a problem instance is computable in polynomial time. Knowing the rung before searching saves potentially exponential work.

---

## Calibration on k-XOR-SAT

For linear systems over F₂ (k-XOR-SAT), the sheaf cohomology is analytically known. Writing α = m/n for the ratio of clauses to variables:

- dim H⁰/n → max(0, 1 − α): at low clause density, many solutions exist; H⁰ is large
- dim H¹/n → max(0, α − 1): at high clause density, the system is over-determined; H¹ grows

The **phase transition** from satisfiable to unsatisfiable sits exactly at α = 1, where H⁰ and H¹ swap dominance. Experiment x419e confirms these formulae to four decimal places for n up to 1000, and identifies the **spectral gap** λ_min(AᵀA) as the Forge ISA critical temperature β*(ρ)⁻², connecting the algebraic phase transition to the ISA's β-deformation parameter.

This is a proof of concept: the H^k diagnostic is not just a classification scheme but a quantitative prediction, numerically validated.

---

## The β* routing algorithm

The practical output of the ladder is a routing decision:

1. Compute χ in O(n + m).
2. Infer the Betti numbers from χ and the known topology class.
3. If β₂ = 0 (rung ≤ 1): route to the Forge ISA at temperature β* = 1/√λ_min. The Forge ISA will find a solution or prove infeasibility in polynomial time.
4. If β₂ > 0 (rung 2+): route to a full combinatorial solver (DPLL, CDCL, etc.). This instance is genuinely hard.

The threshold β* at which the Forge ISA solver converges is directly computable from the spectral gap — the smallest eigenvalue of the constraint matrix. A large gap (easy landscape) gives a low β* (solver converges quickly). A small gap (rugged landscape, many near-solutions) gives a high β* (solver must anneal slowly). When H² ≠ 0, the gap closes entirely and Forge fails — the instance requires the full NP-hard search.

This explains the empirical observation that NP-hard problems are easy in practice: most industrial instances have β₂ = 0. Only instances near the phase boundary (α ≈ 4.267 for Boolean 3-SAT) have β₂ > 0 and are genuinely hard.

---

## Why this does not resolve P=NP

The H^k framework does not answer whether P = NP. It stratifies *instances*, not *problems*. The class of all NP problems still contains instances at every rung, including rung ≥ 2. What the framework offers is:

- A polynomial-time pre-diagnostic that P=NP cannot provide
- An explanation for why NP-hard problems feel easy most of the time
- A quantitative prediction (β*) that guides algorithm selection

The P=NP question asks about the worst rung of the worst problem. The H^k ladder asks about the actual rung of the actual instance in front of you. These are different and complementary questions.

---

## The open frontier: Boolean 3-SAT

Extending the framework to Boolean SAT requires a non-linear sheaf — the cavity sheaf of Mézard and Montanari — whose H² is conjectured to jump at the known phase transition α* ≈ 4.267. Three candidate sheaves were explored in experiments x419b–d; the cavity construction is identified as the correct target for a future paper. Proving that H²(cavity sheaf) ≠ 0 exactly at α* would give a topological explanation of the SAT phase transition, and might constitute a proof that 3-SAT at the phase boundary is genuinely NP-hard — not just empirically hard.

---

*See also:*
- [The Forge ISA](https://doi.org/10.5281/zenodo.20516899) — the β-deformation engine that solves rung-1 instances
- [Systemic Risk as H²](https://doi.org/10.5281/zenodo.20642908) (#397) — H² applied to financial contagion: the same topological obstruction that makes 3-SAT hard makes financial crises unhedgeable
- [The H^k Pricing Paper](https://doi.org/10.5281/zenodo.21158959) (#478) — H⁰/H¹/H² stratification of derivatives markets

*For the full technical treatment, see [doi:10.5281/zenodo.20773526](https://doi.org/10.5281/zenodo.20773526)*
