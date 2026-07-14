---
layout: default
title: "One Programme, Many Backends"
parent: Explainers
nav_exclude: false
tags: [quantum-programming, isa, pennylane, bind-count, hardware-independent, clifford, berry-phase, qft, shor, rosetta-stone, h-k-ladder, trs-framework]
portfolio: C
---

## One programme, many backends: the ISA as a universal quantum language

*Plain-language explainer for [doi:10.5281/zenodo.21360909](https://doi.org/10.5281/zenodo.21360909) (#605)*

---

## The classical analogy

When you write a C program, you do not write it in x86 assembly for Intel, then rewrite it in ARM assembly for Apple Silicon, then rewrite it again for RISC-V. You write it once in a high-level language, and a compiler translates it to each target. The compiler handles the machine-specific details; your algorithm is expressed once.

Quantum computing lacks this layer. Algorithms are typically written in gate-level assembly — Qiskit for IBM, Cirq for Google, tket for IonQ — and porting between platforms requires manual retranslation. This paper introduces the missing layer: the **Origami ISA** as a hardware-independent quantum instruction set.

---

## The three-tier ISA

The Origami ISA has eight opcodes across three tiers:

| Tier | Opcodes | Physical meaning | H^k level |
|------|---------|-----------------|-----------|
| **H⁰** — tropical / classical | ORBIT, SPLIT, SPLAT, LABEL | Gibbs sampling, subspace selection, readout | H⁰ |
| **H¹** — Clifford / Berry | TWIST, FLIP, FLOP | Phase gates, Hadamard, SWAP | H¹ |
| **H²** — magic / entangling | BIND | MS gate, CNOT, CZ, Rydberg entangler | H² |

The tier structure is a resource hierarchy: H⁰ operations are classically simulable, H¹ operations require quantum coherence but no entanglement, and H² (BIND) operations generate genuine multi-qubit entanglement that resists classical simulation.

---

## The Rosetta Stone: opcode → physical gate

The same ISA opcode compiles to different physical gates on different platforms:

| ISA opcode | IonQ / Quantinuum | IBM / Google | QuEra / Pasqal |
|------------|------------------|--------------|----------------|
| ORBIT[θ,φ] | R(θ,φ) — native ms laser pulse | Rx(θ)·Rz(φ) | Rx(θ)·Rz(φ) |
| TWIST[φ] | R_z(φ) — virtual frame update | RZ(φ) — virtual | RZ(φ) — virtual |
| FLIP | ORBIT[π/2, 0] | H (Hadamard) | H (Hadamard) |
| BIND[i,j] | U_MS(π/4) — phonon bus | CZ + local rotations | CZ — Rydberg blockade |
| LABEL | Fluorescence σ_z | Dispersive readout | Fluorescence |

**The key invariant:** the BIND count — the number of BIND opcodes in the programme — is the same on every backend. CNOT, CZ, and U_MS(π/4) are all 1 BIND; iSWAP is 2 BINDs; SWAP is 3 BINDs. This count is a property of the *algorithm*, not the hardware.

---

## Tutorial 1: Bell state (Hello World)

The Bell state |Φ⁺⟩ = (|00⟩ + |11⟩)/√2 is the simplest entangled state. Every quantum programming course starts here.

**ISA programme (hardware-independent):**
```
ORBIT[|00⟩]       -- initialise two qubits in ground state
FLIP[qubit 0]     -- Hadamard: |0⟩ → (|0⟩+|1⟩)/√2
BIND[qubits 0,1]  -- entangle: generates |Φ⁺⟩
LABEL[both]       -- measure
```

This 2-opcode programme (FLIP + BIND) is the canonical Bell state preparation. On every backend it compiles to 3 physical gates, but the ISA expression is identical across all platforms.

**ISA accounting:**
- BIND count: 1 — the irreducible H² cost; cannot be reduced without changing the computation
- Mana / TV: 0 / 1 — Bell states are stabiliser states; no magic required
- H^k tier: H² — no H¹ circuit can produce an entangled state

---

## Tutorial 2: GHZ state (n qubits)

The n-qubit GHZ state (|00...0⟩ + |11...1⟩)/√2 generalises the Bell state to many qubits.

**ISA programme:**
```
ORBIT[|00...0⟩]         -- n qubits initialised
FLIP[qubit 0]           -- superposition on control qubit
BIND[0→1] · BIND[0→2] · ... · BIND[0→n-1]  -- propagate entanglement
LABEL[all n qubits]     -- always outputs 00...0 or 11...1
```

BIND count: n−1 (irreducible — each BIND entangles exactly one new qubit).

**Why this reveals hardware differences:** on IonQ/Quantinuum (all-to-all connectivity), all n−1 BINDs are mutually independent and execute in a single parallel layer — **BIND depth = 1**. On IBM (nearest-neighbour), the BINDs must be chained sequentially — **BIND depth = n−1**. Same programme, same BIND count, different BIND depth. Fidelity scales with depth, not count.

---

## Tutorial 3: Quantum Fourier Transform

The QFT is the quantum analogue of the discrete Fourier transform. It is the engine behind Shor's factoring algorithm.

**ISA accounting for QFT_n:**
- ORBIT gates: O(n²/2) — one-qubit rotations
- TWIST gates: O(n²/2) — controlled-phase gates (virtual Z)
- BIND count: **0**

The QFT uses zero BINDs. It is an entirely H¹ circuit — Clifford gates and phase gates, no entangling operations in the BIND sense. (The controlled-phase gates in the QFT circuit look like 2-qubit gates but have KAK c₂ = 0 — they lie on the H¹/H² boundary and require 0 BINDs.)

**Implication for Shor's algorithm:** Shor's speedup is not due to entanglement in the BIND sense. The speedup is topological — a Berry phase accumulated by the QFT's controlled-phase sequence. The quantum modular exponentiation step does require BINDs, but the QFT itself is purely H¹.

This sharpens a common misconception: quantum speedup = entanglement. Correct for some algorithms; wrong for QFT-based ones.

---

## The H¹ sector: where ZX calculus lives

ZX calculus is a graphical rewriting system for quantum circuits. Its Z-spiders and X-spiders generate all Clifford (H¹) operations, and the rewriting rules are complete for Clifford+T. It is excellent for optimising circuits within the H¹ sector.

What ZX calculus does not provide:
- The H⁰ (classical/tropical) tier — no ORBIT/SPLIT/SPLAT opcodes
- The Schubert structure on Gr(k,n) — no notion of a computational tape
- A canonical halting condition — no β* snap
- Hardware-specific compilation — ZX is abstract, not a cross-compiler

The ISA subsumes ZX calculus in the H¹ sector: any ZX diagram translates directly to an ISA programme using only TWIST, FLIP, FLOP, and LABEL (0 BINDs). The ISA adds the H⁰ and H² tiers that ZX does not address, and provides the Schubert structure that makes the programme meaningful as a computation on the Grassmannian.

---

## The pennylane-opu package

The open-source package `pennylane-opu` implements the ISA cross-compilation functor in Python/PennyLane:

```python
import pennylane as qml
from pennylane_opu import ISADevice

# Same programme, three backends
dev_ionq    = ISADevice("ionq.qpu",    wires=n)   # compiles to MS gates
dev_ibm     = ISADevice("qiskit.ibmq", wires=n)   # compiles to CZ gates
dev_neutral = ISADevice("braket.quera", wires=n)   # compiles to Rydberg CZ

@qml.qnode(dev_ionq)
def ghz_isa(n):
    qml.ISAFlip(wires=0)
    for k in range(1, n):
        qml.ISABind(wires=[0, k])
    return qml.probs()

# Runs the same ISA programme on any backend
```

The device-level functor handles:
1. BIND → hardware-specific entangling gate (U_MS / CZ / Rydberg CZ)
2. TWIST → virtual frame update on ions; physical RZ on superconducting
3. Connectivity-aware routing: insert SWAPs only when needed

---

## What this paper does not claim

- The ISA is not a new physical gate set — it is an abstraction layer above existing gates
- The BIND count does not tell you the circuit depth on any specific hardware — depth depends on connectivity (see GHZ example)
- The ISA does not automatically find the optimal circuit — it gives the correct *resource accounting*; optimisation is a separate compiler problem
- QFT having 0 BINDs does not mean Shor's algorithm is easy to simulate classically — the modular exponentiation oracle does require BINDs

---

*See also:*

- [Orbit Processing Unit](https://doi.org/10.5281/zenodo.21360838) (#598) — the Grassmannian tape; OPU theory
- [Trapped-Ion OPU](https://doi.org/10.5281/zenodo.21360907) (#604) — why MS gate = BIND; BIND depth as quantum advantage metric
- [QT01 — Bell State](https://adelic-simplicial-architecture/isa-zoo/qt01-bell-state/) — zoo entry for the Bell state ISA programme
- [QT02 — GHZ State](https://adelic-simplicial-architecture/isa-zoo/qt02-ghz-state/) — BIND count vs BIND depth for GHZ
- [QT03 — QFT](https://adelic-simplicial-architecture/isa-zoo/qt03-qft/) — QFT has 0 BINDs; Shor speedup is H¹

*For the full technical treatment, see [doi:10.5281/zenodo.21360909](https://doi.org/10.5281/zenodo.21360909)*
