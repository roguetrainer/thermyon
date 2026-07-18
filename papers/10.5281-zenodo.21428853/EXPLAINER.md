---
layout: default
title: "Origami: An Open Quantum ISA"
parent: Explainers
nav_exclude: false
tags: [origami-isa, quantum-computing, open-standard, risc-v, bind-opcode, simulability, zx-calculus, nisq, h-k-ladder, trs-framework]
portfolio: C
---

## Origami: An Open Instruction Set Architecture for Quantum Computing

*Plain-language explainer for [doi:10.5281/zenodo.21428853](https://doi.org/10.5281/zenodo.21428853) (#631)*

{% include isa-nav.html %}

---

## The RISC-V moment quantum computing hasn't had yet

Classical computing solved its fragmentation problem in the 1980s. Before x86, every chip vendor shipped incompatible instruction sets — Motorola 68000, Intel 8086, Zilog Z80. Software was not portable. Then the industry agreed on a common abstraction layer — the ISA, the instruction set architecture — and software compounding began. The same program runs on a laptop, a phone, a server. Compilers target the ISA, not the chip.

Quantum computing is at exactly that inflection point. Every hardware vendor ships its own SDK: IBM Qiskit, Google Cirq, IonQ SDK, Quantinuum tket, QuEra Bloqade, Xanadu PennyLane. A circuit written for one platform requires non-trivial rewriting for another. A Toffoli gate decomposes differently on superconducting versus trapped-ion hardware. There is no agreed semantic layer above gate sets.

**Origami** is the proposal for that layer.

---

## Five opcodes. One language.

Origami has exactly five opcodes — the minimal set sufficient for universal quantum computation:

| Opcode | Symbol | What it does | Classical analogue |
|--------|--------|-------------|-------------------|
| **LABEL** ⊢ 🏷️ | `⊢` | Prepare a register in a known state | Variable assignment |
| **ORBIT** 𝒪 🔄 | `𝒪` | Apply a symmetry / permutation | SWAP, bit permutation |
| **TWIST** ∮ 🌀 | `∮` | Apply a continuous phase rotation | No direct analogue |
| **BIND** ⋈ 💎 | `⋈` | Entangle two registers | **No classical analogue** |
| **FLIP** ⌁ 🎲 | `⌁` | Measure; apply classical feedback | Read register |

The five opcodes are not arbitrary. They are the generators of the categorical hierarchy that underlies all of quantum mechanics: LABEL and ORBIT generate classical reversible computation; TWIST adds quantum phase (the Berry phase, the ribbon element of a monoidal category); BIND adds genuine entanglement (the non-trivial associator, the F-matrix of a fusion category); FLIP collapses quantum information back to classical. This derivation is carried out in eight independent ways in [Paper 455](https://doi.org/10.5281/zenodo.20774076) — every route leads to the same five opcodes.

---

## The key insight: simulability as a structural type

The most important feature of Origami is not the opcode names. It is what the stratification *means*.

The five opcodes split into three tiers based on which cohomological degree (H⁰, H¹, H²) they require:

```
H⁰  —  LABEL 🏷️  +  ORBIT 🔄  +  FLIP 🎲
        Classical reversible computation.
        Every classical boolean circuit is an Origami H⁰ programme.

H¹  —  add TWIST 🌀
        Clifford / stabiliser circuits.
        Classically simulable (Gottesman-Knill theorem).
        Quantum interference without quantum advantage.

H²  —  add BIND 💎
        Universal quantum computation.
        Classically hard in general (BQP-complete).
        This is where quantum advantage lives.
```

**A programme is classically simulable if and only if it contains no BIND opcode.**

This turns quantum advantage from a post-hoc argument ("we believe this is hard classically") into a *structural certificate*: inspect the programme for BIND. If BIND is absent, route to classical silicon. If BIND is present, route to quantum hardware. The compiler can make this decision automatically, without understanding the algorithm.

This is the quantum analogue of type checking: just as a type system catches errors before runtime, the H^k tier catches classical-vs-quantum routing decisions before execution.

---

## Classical computing is already running Origami

This is the key message for the quantum-classical hybrid industry.

Your classical code is already an Origami programme — it just never calls BIND 💎. The quantum co-processor is the BIND 💎 execution unit. The compiler decides which subroutines need BIND 💎 and routes them to quantum hardware; everything else stays on classical silicon running H⁰/H¹ opcodes.

```
H⁰ only  (LABEL 🏷️ + ORBIT 🔄 + FLIP 🎲):  classical boolean circuit
H¹       (add TWIST 🌀):                    Clifford circuit — still classical simulation
H²       (add BIND 💎):                     quantum subroutine — route to QPU
```

The hybrid architecture is just an Origami programme with mixed H^k tiers. The quantum ISA layer is not a replacement for classical computation — it is an extension. Exactly like how RISC-V's optional F extension adds floating-point without breaking integer code.

---

## Every qubit modality implements the same five opcodes

One of Origami's core claims is that every major qubit platform implements the same five opcodes, just via different physical mechanisms:

| Opcode | Superconducting | Trapped-ion | Photonic | Neutral atom |
|--------|----------------|-------------|----------|--------------|
| LABEL ⊢ | Reset to \|0⟩ | Doppler cool + optical pump | Fock state \|n=0⟩ | Ground state prep |
| ORBIT 🔄 | Frame rotation (virtual Z) | RF rotation | Beam splitter | Rydberg global drive |
| TWIST 🌀 | Arbitrary Z rotation | AC Stark shift | Phase shifter | Local AC Stark |
| BIND 💎 | Two-qubit CZ gate | Mølmer-Sørensen | KLM / fusion | Rydberg CZ |
| FLIP ⌁ | Dispersive readout | Fluorescence | Homodyne detection | Fluorescence |

An Origami compiler targeting any of these platforms emits the same five opcodes. The backend maps them to native gates. A BIND on superconducting hardware becomes a CZ; on trapped-ion, it becomes a Mølmer-Sørensen gate; on topological hardware, it becomes a braid. The algorithm sees the same interface in every case.

---

## Why five and not more?

**Fewer won't work.** Removing BIND makes the ISA classically simulable — no quantum advantage. Removing TWIST removes continuous phase control — no interference. Removing FLIP removes the classical feedback loop that makes adaptive circuits possible.

**More is unnecessary.** The Toffoli gate (three-qubit) compiles to BIND 💎 + TWIST 🌀 + ORBIT 🔄 in a fixed decomposition. The CNOT gate is BIND 💎 with local ORBIT 🔄 dressing. The T gate is TWIST 🌀 applied after BIND 💎-mediated magic state injection. Everything in standard quantum computing decomposes into five.

The ZX-calculus — the strongest existing diagrammatic framework for quantum circuits — is exactly the H¹ fragment of Origami (LABEL + ORBIT + TWIST + FLIP). Origami subsumes ZX by adding BIND at H². Adopting Origami is backwards-compatible with ZX investments.

---

## The NISQ layer: β-deformation

For current noisy intermediate-scale quantum (NISQ) devices, Origami provides a principled degradation model via the **β-deformation**.

At ideal quantum operation (β → ∞), BIND 💎 is a perfect two-qubit entangling gate. As hardware noise increases (β decreases), the BIND opcode degrades continuously from quantum to classical. The parameter β is the inverse temperature of the hardware — literally the ratio of coherence energy to thermal noise.

The compiler can use β to decide: is a noisy BIND on this hardware worth calling, or is a classical approximation (H¹ circuit, no BIND) cheaper? This is the hybrid tradeoff made mathematically precise. It gives a single continuous dial from fully classical (β → 0) to fully quantum (β → ∞), with NISQ in between.

---

## The call to action

The paper ends with six concrete proposals for the quantum computing community:

1. **Hardware vendors**: publish a certified BIND fidelity (not just gate fidelity) and a β value for your hardware
2. **SDK authors**: add an Origami IR layer between user code and native gate compilation
3. **Algorithm authors**: annotate circuits with H^k tier requirements, not just gate counts
4. **Compiler teams**: implement H^k-aware routing to split classical and quantum subroutines
5. **Standards bodies**: adopt Origami as the semantic layer in the quantum software stack
6. **Theorists**: extend the ISA to topological hardware (where BIND = braid, not gate)

The goal is a RISC-V for quantum computing: an open standard that enables independent innovation above and below the line, and lets the software ecosystem compound independently of hardware choices.

---

## Where to go next

- **The opcodes in depth**: [The ISA Opcodes](/opcodes/) — full mathematical treatment of all five opcodes, their categorical foundations, and their appearances across physics, chemistry, and mathematics
- **The β-plane geometry**: [Forge & Meld ISAs](/forge-meld/) — how β connects the classical Origami ISA to the quantum Meld ISA via Wick rotation
- **The non-associative frontier**: [731-ISA](/non-associative-frontier/) — what happens when BIND operates at the octonion (𝕆) rung; G₂ symmetry; Fano plane
- **Origami for chemistry**: [The OPU](https://doi.org/10.5281/zenodo.21360838) (#598) — Origami running on a Grassmannian tape; CASSCF as an Origami programme
- **Origami for QEC**: [Diagrammatic QEC as ISA](https://doi.org/10.5281/zenodo.21372999) (#607) — fault-tolerant compilers in the Origami framework
- **Completeness proof**: [ISA Completeness](https://doi.org/10.5281/zenodo.21219698) (#469) — nine SWAP-classes; formal proof that the five opcodes are complete

{% include isa-nav.html %}

*For the full technical treatment, see [doi:10.5281/zenodo.21428853](https://doi.org/10.5281/zenodo.21428853)*
