---
layout: default
title: "Seven Qubits, Zero Distillation: The TriQ and SevenQ Architecture"
parent: Explainers
nav_exclude: true
tags: [fano, hardware, triq, sevenq, steane-code, origami-isa, qec]
portfolio: C
---

## Seven Qubits, Zero Distillation

*Plain-language explainer for [doi:10.5281/zenodo.20581486](https://doi.org/10.5281/zenodo.20581486)*

---

## The central idea in one sentence

The $[[7,1,3]]$ Steane code — already running on IBM, IonQ, and Quantinuum hardware — *is* the minimal Fano quantum processor, and its 6 gauge degrees of freedom are the 6 magic valences; selecting a gauge enables a CS gate without any magic state distillation.

---

## Why do we care?

Magic state distillation is the biggest overhead in fault-tolerant quantum computing. A single logical T or CS gate currently requires consuming 7–15 physical magic states, each of which requires ~100 noisy copies to prepare. End-to-end, one non-Clifford gate costs roughly **100–1000 physical qubits** and dominates the qubit budget of any fault-tolerant algorithm.

This paper introduces **TriQ** and **SevenQ** — minimal Fano register architectures that eliminate this overhead for the CS-gate family, using hardware that already exists.

---

## The Steane code through a new lens

The $[[7,1,3]]$ Steane code encodes 1 logical qubit into 7 physical qubits, correcting any single-qubit error. It has been used in quantum computing since 1996 and is one of the most experimentally mature QEC codes.

The standard description: 7 physical qubits, 6 stabiliser generators ($Z$-type: $IZZIZZZ$, etc.; $X$-type: $IXXIXXX$, etc.), 1 logical qubit in the protected space.

**The new description:** the 6 stabiliser generators correspond bijectively to the 6 non-classical Fano orbit valences $L \in \{1, 2, 3, 4, 5, 6\}$. The 7 physical qubits are the 7 points of the Fano plane. The stabiliser group *is* the Fano plane $PG(2,2)$ acting on itself.

This is not a rebranding. It reveals new structure: the 6 gauge degrees of freedom of the Steane code (the freedom to choose different representatives of the logical qubit) correspond to the 6 magic orbit valences. Fixing a gauge *selects a magic valence*.

---

## The TriQ: minimal Fano register

The **TriQ** (3-qubit Fano register) is the minimal register for the Origami ISA. Three qubits, corresponding to one Fano line (3 collinear points of $PG(2,2)$). It implements:

- The 3-qubit GHZ stabiliser subgroup
- A single CS gate via orbit-valence selection
- The ORBIT opcode (3-qubit version: 3 measurements instead of 7)

The TriQ is the *primitive*: every larger Fano register is assembled from TriQ triplets.

---

## The SevenQ: complete Fano register

The **SevenQ** (7-qubit complete Fano register) is the full Fano plane instantiated as hardware. It *is* the $[[7,1,3]]$ Steane code — the same 7 physical qubits, the same coupling graph, the same syndrome extraction — but operated with orbit-valence awareness:

```
SevenQ register:
  7 qubits  ←→  7 Fano points
  7 syndrome bits  ←→  ORBIT opcode output
  6 gauge choices  ←→  6 magic orbit valences
  Steane QEC cycle  ←→  ORBIT opcode (free, already running)
```

**No new hardware required.** Any processor currently running the Steane code is a SevenQ processor. The difference is software: instead of discarding the syndrome bits after error correction, they are post-processed to extract the orbit valence label.

---

## The SevenQ-diode: directed routing variant

The **SevenQ-diode** (7Q-d) weakens one of the 7 inter-qubit couplings to a fraction $\varepsilon < 1$ of the symmetric value. This is the hardware implementation of the 6-7 broken-Fano architecture:

- 6 full-strength couplings: passive QEC dark states ($PSL(2,7)$-symmetry-protected)
- 1 weakened coupling: directed magic flow channel

The SevenQ-diode is the quantum analogue of the FMO biological light-harvesting complex — and for the same geometric reason. The FMO complex evolved the 6-7 Fano topology over a billion years; the SevenQ-diode engineers it deliberately.

---

## Gauge selection vs magic state distillation

The standard route to a CS gate:
1. Prepare $\lvert T\rangle$ state (requires ~100 noisy copies + distillation protocol)
2. Consume $\lvert T\rangle$ in a gate teleportation circuit
3. Total cost: ~100–1000 physical qubits

The SevenQ route:
1. The SevenQ register is already running (you need it for QEC anyway)
2. Select gauge $L$ by initialising the gauge subsystem in orbit valence $L$
3. Apply the logical CS gate transversally across all 7 physical qubit triplets
4. Total additional cost: **0 qubits, 0 distillation steps**

The resource is not a magic state — it is the *gauge choice*. Gauge selection is already implicit in any fault-tolerant computation; making it explicit and orbit-typed is the only change required.

---

## The 1531-Anvil: CCZ on 15 qubits

For CCZ gates (the 3-qubit non-Clifford gate underlying Toffoli), the natural architecture is the **1531-Anvil**: 15 qubits arranged as a Reed-Muller $[[15,1,3]]$ code, which contains three overlapping SevenQ registers sharing the central qubit.

The 15 physical qubits correspond to the 15-point Lagrangian subspace of $W(7,2)$ — the $n=4$ analogue of the Fano plane. The 1531-Anvil enables CCZ gates via orbit-valence selection on the 15-qubit gauge subsystem.

This is the architecture for fault-tolerant CCZ without distillation. It requires 15 physical qubits, not the 105–1000 currently used.

---

## Running on existing hardware

| Platform | Steane code available? | SevenQ available? | Notes |
|----------|----------------------|-------------------|-------|
| IBM Falcon/Heron | Yes (7-qubit devices) | Yes | Run ORBIT as post-processing |
| IonQ Harmony/Forte | Yes | Yes | All-to-all coupling simplifies |
| Quantinuum H-series | Yes | Yes | Highest fidelity, native mid-circuit measurement |

The only implementation requirement is: run the 7-qubit Steane code as usual, but instead of discarding the 7 syndrome bits after each QEC round, pass them to the orbit-valence post-processor. No new pulses, no new calibration, no new hardware.

---

## What to read next

- [Fano Orbit Decomposition](https://doi.org/10.5281/zenodo.20541583) — *why there are exactly 7 orbit valences and what they mean*

- [A Valence Theory of Quantum Magic](https://doi.org/10.5281/zenodo.20541665) — *syndrome blindness theorem: wrong magic is worse than no magic*

- [The Fano Magic State Factory](https://doi.org/10.5281/zenodo.PENDING) — *orbit post-selection for magic state factories*

- [Three Routes to Zero-Overhead Non-Clifford Gates](https://doi.org/10.5281/zenodo.20581494) — *gauge selection, gauge injection, gauge distillation compared*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20581486](https://doi.org/10.5281/zenodo.20581486).*
