---
layout: default
title: "The Origami ISA as a Typed Quantum DSL"
parent: Explainers
nav_exclude: true
tags: [origami-isa, typed-dsl, type-theory, associamancy, schur-boundary,
       no-cloning, pentagon, pacioli, linear-types, quantum-foundations]
portfolio: B|C
---

## A Spell-Checker for Quantum Circuits

*Plain-language explainer for [doi:10.5281/zenodo.20681513](https://doi.org/10.5281/zenodo.20681513)*

---

## The central idea in one sentence

The Origami ISA is already a typed programming language — this paper makes the type system explicit, so that a computer can catch circuit errors at construction time rather than after running an experiment.

---

## The problem with quantum circuits today

When you write a quantum circuit in Qiskit, Cirq, or any standard framework, the software lets you do almost anything: apply any gate in any order to any qubit. The only check is whether the gate dimensions match. There is no check for:

- Whether the gate violates the no-cloning theorem
- Whether the gate stays within the correct representation subspace
- Whether the gate requires hardware that doesn't exist

These errors surface as mysteriously bad results after an expensive experiment. The type system in this paper catches them at the moment you write the circuit — before a single qubit is touched.

---

## What a type system does

A **type system** is a set of rules that classifies every object in a programme by what it *is*, and prevents you from combining incompatible objects. In Python: you can't add a string to an integer. In a typed ISA circuit: you can't apply a regime-3 opcode to a regime-2 wire.

This paper gives the Origami ISA three progressively stronger type systems:

**Type System 1 — Simple types.** Every wire in a circuit carries a label — its *representation type*. For quantum circuits, this is the angular momentum quantum number $j$ (spin). For financial circuits, it is the currency (USD, EUR). For spectroscopy, it is the electronic configuration. The Pentagon identity $d^2 = 0$ becomes a typing rule: the SPLAT opcode applied immediately after SPLIT must always return the trivial (vacuum) type. If it doesn't, the circuit is ill-typed — there's leakage outside the computational subspace.

**Type System 2 — Linear types.** Every wire may be used exactly once. This is the quantum no-cloning theorem expressed as a type rule. If you try to use a wire twice, the type checker raises an error before you run anything. The SPLIT opcode is the *only* legal way to duplicate a wire — and it produces four wires, not two, because it corresponds to the 1→4 Pachner move.

**Type System 3 — Dependent types.** The output type of SPLIT *depends* on the input type via the Clebsch-Gordan decomposition — the angular momentum addition rules. Incompatible angular momentum combinations are simply not constructable, because the type system won't let you build them.

---

## The Schur boundary as a type error

The most important result: **associamancy is a compile-time type error**.

Associamancy ([Paper 407](https://doi.org/10.5281/zenodo.20667174)) is the highest level of quantum computational resource — the resource needed to process genuinely complex representations of hidden symmetry groups, those with Frobenius-Schur indicator $\nu_2 = 0$. The SPIN opcode implements this, via $G_2$ triality.

In the type system, wires split into two subtypes:

- **AssocWire** ($\nu_2 \neq 0$): the Origami ISA — standard quantum hardware
- **FullWire** ($\nu_2 = 0$): the 731 ISA — requires native $G_2$-symmetric hardware

The SPIN opcode has the type `FullWire → FullWire`. If you try to apply SPIN to an AssocWire, you get:

```
TypeError: SPIN requires a FullWire with ν₂=0 (the Schur boundary).
Got ν₂=1 for rep (0.5,). This wire is in the Origami ISA (regime 2)
associative sector. SPIN is a regime-3 (731 ISA) opcode requiring
G₂-symmetric hardware or O(polylog(1/ε)) Solovay-Kitaev approximation.
```

This error fires at circuit construction time. Before Paper 412, you would have discovered this problem only after running the circuit on hardware — either getting wrong results (if using Solovay-Kitaev approximation), or a hardware error (if the hardware doesn't support SPIN at all).

---

## The same type system covers finance

The Pacioli Combinator Library ([Paper 306](https://doi.org/10.5281/zenodo.20262070)) defines typed combinators for financial flows. In the typed ISA framework, these are:

- `flow(amount, src, dst)` = the **TWIST** opcode with currency-typed wires
- `sequence(f, g)` = sequential circuit composition
- The Pacioli identity (every debit has a credit) = the Pentagon identity $d^2=0$

The same type checker that prevents a quantum circuit from using SPIN on the wrong wire also prevents a financial circuit from creating money without a corresponding liability. Conservation is enforced *by construction*.

A quantum circuit for nuclear spectroscopy, a financial risk model, and a G₂ quantum gravity amplitude are all programmes in the same typed language — differentiated only by the gauge group $G$ and the wire type labels.

---

## The working code

The paper delivers a working Python implementation in `thermion.core.typed`:

```python
from thermion import Rep, Wire, ISACircuit, frobenius_schur

circuit = ISACircuit()

# Standard SU(2) wire (ν₂ = +1, AssocWire)
w = Wire(Rep((0.5,)))   # j = 1/2

# Pentagon check: SPLAT(SPLIT(w)) = trivial ✓
circuit.pentagon_check(Rep((0.5,)))   # True

# Schur boundary: SPIN on SU(2) wire → TypeError
circuit.spin(w)
# TypeError: SPIN requires a FullWire with ν₂=0 (the Schur boundary)...

# G₂ (1,1) wire has ν₂ = 0 (FullWire) — SPIN is allowed
w2 = Wire(Rep((1, 1)))
out = circuit.spin(w2)   # OK
```

---

## What this means for quantum software

Every existing typed quantum DSL (Quipper, QWIRE, Proto-Quipper) enforces linear types (no-cloning) but has no concept of:

- Representation-typed wires (wires carry more than just "qubit")
- The Schur boundary (the regime-2 / regime-3 distinction)
- Cross-domain portability (the same circuit for quantum, finance, and spectroscopy)

The Origami ISA typed DSL is the first to have all three.

---

## What to read next

- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — the non-technical primer; read this first if you're new to the ISA
- [Associamancy](https://doi.org/10.5281/zenodo.20667174) (#407) — the resource theory that the type system formalises
- [Origami ISA Pulse Sequences](https://doi.org/10.5281/zenodo.20680609) (#411) — the hardware side: what the TypeError *means* physically
- [Non-Associative Hardware is Necessary](https://doi.org/10.5281/zenodo.20667170) (#405) — the proof that the Schur boundary is real, not an artefact

*For the full technical treatment, see [doi:10.5281/zenodo.20681513](https://doi.org/10.5281/zenodo.20681513)*
