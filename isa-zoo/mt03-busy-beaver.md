---
layout: default
title: "MT03 — Busy Beaver and Gödel Incompleteness"
parent: ISA Zoo
nav_exclude: true
---

# MT03 — Busy Beaver and Gödel Incompleteness

| Field | Value |
|-------|-------|
| **Domain** | Mathematical Methods |
| **System** | n-state, 2-symbol Turing machines |
| **Group** | Sₙ × ℤ₂ (state permutations × symbol flip) |
| **H^k tier** | H² |
| **ISA** | Origami (β → ∞) |
| **Status** | Validated |
| **Opcodes** | ORBIT · LABEL · FLOP · BIND |
| **Papers** | Paper 543 |

---

## Physical system

The **Busy Beaver function** Σ(n) is the maximum number of 1s a halting n-state,
2-symbol Turing machine can write on an initially blank tape. Equivalently, S(n)
is the maximum number of steps any halting n-state TM takes. These are:

| n | Σ(n) | S(n) |
|---|------|------|
| 1 | 1 | 1 |
| 2 | 4 | 6 |
| 3 | 6 | 21 |
| 4 | 13 | 107 |
| 5 | 4098 | 47,176,870 |
| 6 | ≥ 10,910 | ≥ 7.4×10³⁶,534 |

**Σ(n) grows faster than any computable function.** This is not a theorem about
large numbers — it is a theorem about the boundary of computability. Σ(n) is
well-defined (there are finitely many n-state TMs), but it cannot be computed by
any Turing machine. For large n, the value of Σ(n) is independent of ZFC: to
determine whether a specific TM halts may require axioms beyond any fixed formal
system. The Busy Beaver function maps the boundary between the decidable and the
undecidable onto a single, concretely defined integer sequence.

---

## Target category

**TM(n)** — the category of n-state, 2-symbol Turing machine computations.
Objects: tape configurations (bi-infinite sequences over {0,1} with a marked
head position and state). Morphisms: single computation steps (state × symbol →
new state × new symbol × head direction). The halting state H is a terminal
object; non-halting TMs have no morphism to H.

## Interpretation functor

F: C → TM(n) defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Computation step: (state, tape) → (new state, new tape, head ±1); the fundamental TM transition |
| LABEL  | State assignment: the current state q ∈ {1,...,n,H}; the eigenvalue of the configuration at each step |
| FLOP   | Symbol write: 0 → 1 or 1 → 0 on the tape cell under the head; the bit-flip opcode as tape write |
| BIND   | Halting certificate: the H² class that distinguishes halting from non-halting TMs; the obstruction that cannot be detected by any finite ORBIT sequence alone |

## ISA programme

```
INIT:    LABEL[tape = 0^inf, state = q1, head = 0]   -- blank tape, start state
STEP:    ORBIT[(q, s) -> (q', s', d) | transition table]  -- one TM step
WRITE:   FLOP[s -> s' | per transition]              -- write new symbol
MOVE:    LABEL[head += d | d in {-1, +1}]            -- head movement
HALT?:   LABEL[state = H?]                           -- halting test
BIND:    BIND[halts? | undecidable for general n]    -- H2 obstruction
COUNT:   LABEL[Sigma(n) = max over halting TMs of ones-written]  -- Busy Beaver value
```

## Computable output

- **Σ(n) for small n**: Σ(1)=1, Σ(2)=4, Σ(3)=6, Σ(4)=13, Σ(5)=4098, Σ(6)≥10,910.
  These are validated by exhaustive enumeration of all n-state TMs and simulation
  of halting ones. They are the ORBIT outputs of the computation — integers
  counting the maximum 1s written.
- **Non-computability certificate**: there is no Turing machine that computes Σ(n)
  for all n. The proof is the BIND obstruction: if Σ were computable, the halting
  problem would be decidable (simulate all TMs and check against Σ(n)). The
  halting problem's undecidability is the H² cohomological obstruction in TM(n)
  — the morphism to H does not exist in the category, and no amount of ORBIT steps
  can detect its absence.
- **Independence from ZFC**: for sufficiently large n, the statement "Σ(n) = k"
  for specific k is independent of ZFC. Scott Aaronson and Adam Yedidia (2016)
  showed a 7,918-state TM whose halting is independent of ZFC. Smaller examples
  likely exist. This is the ultimate BIND obstruction: the H² class is not just
  uncomputable, it is formally unprovable within any fixed axiom system.

## Connection to the ISA framework

**The Busy Beaver is an H² entry because halting is a BIND.** The distinction
between H⁰ (tropical, decidable), H¹ (Clifford, efficiently simulable), and H²
(magic, not efficiently simulable) in quantum computing has a direct analogue in
computability theory:

| ISA tier | Quantum analogue | Computability analogue |
|----------|-----------------|----------------------|
| H⁰ Origami | Classical simulation (stabiliser) | Decidable (recursive) |
| H¹ Forge | Polynomial-time quantum | RE (recursively enumerable) |
| H² Meld | Universal quantum / magic | Non-RE (undecidable) |

The Busy Beaver sits at H²: the halting question is not in RE (you cannot
enumerate halting TMs and confirm non-halting ones — there is no algorithm for
the complement). The BIND opcode is the categorical morphism that *would* resolve
the halting question if it existed; its non-existence in TM(n) is the Gödel
incompleteness theorem in ISA language.

**The β-plane reading:** the Busy Beaver lives at β → 0 (Meld ISA) because:
- At β → ∞ (Origami, tropical), computation is decidable — the tropical argmax
  selects the unique ground state in finite time
- At β = β* (Forge, snap), computation may run for a very long time but halts
- At β → 0 (Meld, Ambient), the computation has access to all paths simultaneously
  — it is the quantum superposition of all computation paths, and measuring the
  result corresponds to the halting certificate

The Busy Beaver function is the β → 0 limit of the computation landscape: the
quantity you could compute if you could explore all paths simultaneously (at the
Ambient) and then measure at β → ∞ (Origami). The obstruction is that this
two-step process (Meld then Origami) cannot be implemented for general TMs
because the Meld step (quantum superposition over all computation paths) is
itself not computable — it requires an infinite-dimensional Hilbert space indexed
by all computation histories.

**Connection to Gödel:** Gödel incompleteness is the statement that the BIND
obstruction in TM(n) is not removable by adding more ORBIT steps (more axioms).
Every consistent extension of ZFC has a Gödel sentence that is true but
unprovable — a new H² class appears at each extension. This is the H^k tower
failure at H²: there is no H³ that resolves all H² obstructions simultaneously,
because a hypothetical "completeness oracle" would itself be subject to a
higher-order incompleteness theorem.

**The Fano connection:** the appearance of 21 = 3×7 in the Apéry sequence (MT02)
and the G₂ choreography conjecture (D02) may connect to the Busy Beaver: it is
known that the TM corresponding to a specific mathematical conjecture (e.g.,
the Riemann Hypothesis) can be encoded in a TM with on the order of tens of
states. The 5-state BB champion encodes aspects of Goldbach-type arguments.
Whether the Fano plane (7 points, 7 lines) has a natural Busy Beaver encoding
remains an open question.

## Validation

- Σ(1)–Σ(4): computed by Rado (1962) who introduced the function; independently
  verified many times.
- Σ(5) = 4098: Lin & Rado (1965); confirmed by exhaustive enumeration.
- Σ(6) ≥ 10,910: Marxen & Buntrock (1990); current record TM found.
- Non-computability: Rado (1962), immediate from the halting problem.
- ZFC independence: Yedidia & Aaronson (2016), arXiv:1605.04901.

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
