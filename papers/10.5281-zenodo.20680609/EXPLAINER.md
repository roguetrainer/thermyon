---
layout: default
title: "Origami ISA Pulse Sequences: Optimal Control of the 731 Gate Set"
parent: Explainers
nav_exclude: false
tags: [origami-isa, pulse-control, grape, drag, triality, berry-phase, g2, holonomic, hardware]
portfolio: C|F
---

## What Do the Opcodes Look Like as Physical Pulses?

*Plain-language explainer for [doi:10.5281/zenodo.20680609](https://doi.org/10.5281/zenodo.20680609) (#411)*

---

## The central idea in one sentence

Every Origami ISA opcode is a shaped microwave or laser pulse, DRAG is the ISA type checker, and G₂ holonomic gates are topologically protected in a way that SU(2) gates are not.

---

## Bridging two communities

The Origami ISA programme specifies *what* a gate should do algebraically. The optimal control community (GRAPE, DRAG, randomised benchmarking) optimises *how* to shape the pulse to implement it. These two communities have not previously spoken the same language. This paper bridges them.

---

## The three results

**DRAG is the ISA type checker.** In a transmon qubit, the $|2\rangle$ state (second excited level) is always present. A TWIST pulse that leaks amplitude into $|2\rangle$ is, in ISA terms, an *ill-typed* operation — TWIST should stay within the computational subspace $\{|0\rangle, |1\rangle\}$. DRAG (Derivative Removal via Adiabatic Gate) suppresses this leakage by adding a derivative term to the pulse envelope. DRAG is the pulse-level implementation of the ISA typing rule. ISA-augmented GRAPE reduces leakage by 63% vs standard GRAPE.

**SPIN costs 12 CNOTs as a permutation, then hits an obstruction.** The SPIN opcode (G₂ triality) acts on 7 Fano-point qubits as a permutation of order 3. As a permutation, it costs exactly 12 CNOTs. But its phase component — $i\sqrt{7}/2$ — is not a root of unity, so it cannot be implemented exactly by any standard gate set. This is the hardware signature of associamancy.

**G₂ holonomic gates have discrete Berry phases.** The Weyl group of G₂ is $D_6$ (dihedral, order 12). All closed loops in G₂ parameter space give holonomies in this discrete group — 12 possible values, not a continuous angle. This discreteness gives topological protection: small perturbations to the control path that stay within one Weyl chamber leave the gate *exactly* unchanged. SU(2) holonomic gates have no such protection.

---

## What to read next

- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — why reaching Level 2 (associamancy) is worth the effort
- [The Typed DSL](https://doi.org/10.5281/zenodo.20681513) (#412) — the software side of the same story

*For the full technical treatment, see [doi:10.5281/zenodo.20680609](https://doi.org/10.5281/zenodo.20680609)*
