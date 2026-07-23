---
layout: default
title: "Quantum speedup has a cohomological address"
parent: Applications
nav_order: 4
nav_exclude: true
description: "H⁰, H¹, and H² classify which computational problems admit which kinds of quantum speedup — and why some problems are hard at every cohomological level."
tags: [complexity, cohomology, quantum-speedup, shor, grover, h0, h1, h2, bqp, magic, twist]
portfolio: F
---

# Quantum speedup has a cohomological address
{: .no_toc }

*Not all quantum speedups are the same. Grover search, Shor factoring, and
topological quantum computation are qualitatively different — and the difference
is precisely which cohomology level H⁰, H¹, or H² the speedup lives at.
The H^k ladder is a periodic table of quantum advantage.*
{: .fs-5 .fw-300 }

---

## The claim

**Every quantum speedup can be assigned a cohomological level H^k, and the
level determines the nature and limits of the advantage.**

The three cohomology groups H⁰, H¹, H² of a computational problem are not
abstract mathematical objects — they are the three distinct mechanisms by
which quantum mechanics can outperform classical computation:

- **H⁰ (tropical / classical)** — the level of exact, deterministic structure.
  Problems at H⁰ are solvable classically; quantum mechanics adds nothing.
  This is the regime of stabiliser circuits (Gottesman-Knill), tropical
  geometry, and the Origami ISA.

- **H¹ (statistical / interference)** — the level of global structure that
  classical sampling cannot efficiently explore. Quantum speedups at H¹ arise
  from interference — the ability to cancel wrong paths and reinforce right
  ones. Shor's algorithm lives here: the quantum Fourier transform is an H¹
  operation (TWIST failure at the period-finding step), and the speedup is
  exponential. Grover search is also H¹, but the speedup is only quadratic
  because the problem has weaker global structure.

- **H² (topological / non-Abelian)** — the level of topology-changing
  operations. Quantum speedups at H² arise from non-Abelian braiding —
  operations that cannot be decomposed into sequences of H⁰ and H¹ steps.
  Topological quantum computation (Fibonacci anyons, Kitaev's toric code
  in its fault-tolerant regime) lives here. The speedup is exponential and
  *intrinsically fault-tolerant*, because errors are topologically suppressed.

**The key insight:** the cohomological level is not just a classification of
algorithms — it is a classification of *where the hard part lives*. A problem
is hard at H^k if it requires a genuine H^k operation that cannot be simulated
by operations at lower levels. Problems that are classically hard but only
require H¹ (like factoring) are in BQP but not believed to be in P. Problems
that require H² are outside BQP on classical hardware and require topological
quantum hardware.

---

## Why it matters

**It explains the zoo of quantum algorithms.** The known quantum algorithms
divide cleanly into H¹ (Fourier-sampling algorithms: Shor, Simon, Deutsch-Jozsa,
Bernstein-Vazirani) and H² (topological algorithms: anyonic computation,
knot invariants, Jones polynomial). Grover is H¹ but with weaker structure
(unstructured search vs structured period-finding), which is why the speedup
is quadratic rather than exponential. The H^k classification predicts the
speedup *type* from the structure of the problem, not from the details of
the algorithm.

**It explains why some problems are hard at every level.** A problem in
PSPACE requires H⁰ + H¹ + H² simultaneously — it has structure at every
cohomological level, and a quantum computer that can only access H⁰ and H¹
cannot solve it faster than classical. This is the cohomological interpretation
of the conjecture BQP ≠ PSPACE.

**It gives a design principle for new algorithms.** To find a new quantum
speedup, find a problem with exploitable H¹ or H² structure — a hidden
periodicity (H¹), a global topological invariant (H²), or a combination.
The H^k classification tells you where to look.

**It connects to magic resource theory.** The T-gate — the elementary magic
operation — is the minimal H¹ → H¹ lift that breaks classical simulability.
Adding BIND at the H² level introduces genuine topological (H²) structure.
The magic resource theory (Papers 469/470) is the resource theory of H¹
access; the 731-ISA is the resource theory of H² access.

---

## The evidence

| Paper | What it shows |
| --- | --- |
| [Paper 420](https://doi.org/10.5281/zenodo.20773526) | H^k complexity ladder: β₂ jump at α*; routing algorithm; H⁰/H¹/H² as β regimes; snap threshold as phase boundary |
| [Paper 421](https://doi.org/10.5281/zenodo.20773526) | H^k classification of quantum speedup: Shor = H¹; Grover = H¹ (weak); topological QC = H²; new algorithm directions |
| [Paper 472](https://doi.org/10.5281/zenodo.21219704) | Shor lifting: Shor = Clifford (mana = 0) at the QFT step; D_N hidden shift: NAQFT fires TWIST, mana > 0; eigenphase spectrum as T-count replacement |
| [Paper 473](https://doi.org/10.5281/zenodo.21219706) | Meld projections: Grover intermediate magic states are Clifford-simulable; Grover's algorithm as Origami ISA programme; eigenphase spectrum + asymptotic stabiliser complexity |

**Key results:**

- **Shor is H¹, not H².** Shor's algorithm requires no genuine magic (mana = 0
  at every step) and no topological operations. It is a pure H¹ algorithm —
  the quantum Fourier transform exploits global interference structure (hidden
  periodicity) that classical algorithms cannot access. The speedup is
  exponential because the period-finding problem has maximal H¹ structure.
  (Paper 472, x472a–c.)

- **Grover intermediate states are Clifford-simulable.** The magic states
  generated during Grover's algorithm are not genuine magic — they are in the
  dark magic tier (TV = 1, Clifford-simulable). The quadratic speedup does not
  come from magic resource injection but from amplitude amplification, which is
  a purely H¹ phenomenon. (Paper 473, x473b.)

- **The snap threshold β* is the H¹/H⁰ phase boundary.** Below β*, the system
  is in the H¹ regime (diffuse, interference-dominated); above β*, it
  crystallises into H⁰ (classical, deterministic). The BKT transition and the
  TWIST failure condition are the same event viewed in different coordinates.
  (Paper 420.)

- **H² requires BIND at a non-Abelian rung.** No sequence of H⁰ and H¹
  operations (tropical + Gibbs + Meld without BIND) can generate an H²
  invariant. BIND is the irreducible H² opcode. This is why topological quantum
  computation requires physical anyons or equivalent hardware — not just better
  gates. (Papers 445/446.)

---

## What would falsify it

- **A quantum algorithm for an NP-complete problem** that works without H²
  operations. If BQP ⊇ NP were proved, the H^k classification would need
  revision — NP-complete problems would have to be reanalysed for H¹ structure
  we have missed.

- **A classical algorithm simulating the QFT in polynomial time** without
  exploiting any H¹ structure — which would mean the Fourier transform does
  not genuinely require H¹ and the Shor speedup has a classical explanation
  at H⁰.

- **Grover achieving better than quadratic speedup** on a structured instance,
  which would imply the instance has H¹ structure not captured by the
  unstructured-search analysis.

---

## Open questions

- **Is there an H³ or higher?** The H^k tower is in principle infinite. H³
  would correspond to operations that change the topology of a 3-manifold —
  Pachner moves in three dimensions. Are there computational problems that
  are hard at H² but easy at H³? The answer likely requires a quantum gravity
  computer (spin foam processor), which does not yet exist.

- **What is the exact relationship between H^k level and complexity class?**
  The conjecture is H⁰ ↔ P, H¹ ↔ BQP, H² ↔ (topological BQP with built-in
  fault tolerance). But the boundaries are not proved. Is there a problem in
  BQP that requires H² — i.e., cannot be done with H¹ alone?

- **Can the H^k level of a problem be computed?** Given a problem instance,
  is there an efficient procedure to determine which H^k level it lives at?
  If yes, this would be a practical tool for identifying where to look for
  quantum speedup.

- **The eigenphase spectrum as T-count replacement.** Paper 472 proposes the
  eigenphase spectrum of the unitary as a replacement for T-count as the
  canonical measure of H¹ resource content. This has not been fully worked
  out for multi-qubit systems; it may give a finer classification than T-count
  within the H¹ tier.

---

*See also:* [H^k Complexity Ladder — Paper 420](https://doi.org/10.5281/zenodo.20773526) ·
[Magic has a periodic table](magic-structure.md) ·
[BKT Transition / TWIST Failure](../glossary.md#bkt-transition--twist-failure) in the Glossary ·
[The Non-Associative Frontier](../non-associative-frontier.md)
