---
layout: default
title: "Wrong Magic Is Worse Than No Magic: A Valence Theory of Quantum Magic"
parent: Explainers
nav_exclude: false
tags: [fano, magic, orbit-valence, cs-gate, syndrome-blindness, qec]
portfolio: F
---

## Wrong Magic Is Worse Than No Magic

*Plain-language explainer for [doi:10.5281/zenodo.20541665](https://doi.org/10.5281/zenodo.20541665)*

---

## The central idea in one sentence

Three different quantum gates produce states with *identical* negativity and *identical* error-correction syndromes — yet they are maximally different in their computational usefulness, and using the wrong one actively degrades performance below the classical baseline.

---

## Why do we care?

The standard metric for quantum magic is a single number — Wigner negativity $\mathcal{N}(\rho)$. Magic state factories accept states above a negativity threshold and discard the rest. This is analogous to checking the voltage of a battery but not which terminal is positive.

**The syndrome blindness theorem** (proved in this paper): the three controlled-S states

$$\mathrm{CS}_{01}|{+++}\rangle, \quad \mathrm{CS}_{02}|{+++}\rangle, \quad \mathrm{CS}_{12}|{+++}\rangle$$

satisfy:
1. Equal total Wigner negativity: $\mathcal{N} = 1/8$ for all three
2. Identical stabiliser syndromes: all 7 GHZ stabiliser expectation values equal $+1$
3. **Maximally separated orbit valence labels** — they live in completely different orbits

A routing or calibration bug that applies $\mathrm{CS}_{02}$ when $\mathrm{CS}_{01}$ was intended produces a state that passes *every* standard quality check. Yet that state is guaranteed to fail the intended computation — and will score *below* the classical baseline (0.472 vs 0.500) in the Fano Line Verification Game.

**Wrong magic is worse than no magic.**

---

## What is a CS gate and why does its identity matter?

The controlled-S gate $\mathrm{CS}_{ij}$ applies a phase of $i$ to qubit $j$ conditioned on qubit $i$ being in state $\lvert 1\rangle$. On a 3-qubit register, there are three choices: $\mathrm{CS}_{01}$, $\mathrm{CS}_{02}$, $\mathrm{CS}_{12}$.

These are physically distinct operations on hardware with a fixed coupling map (as on all current superconducting processors). A routing bug or miscalibration can apply the wrong one. Standard fidelity benchmarking measures *total gate error rate* — it cannot detect a gate that works perfectly but is the wrong gate.

The orbit valence label detects exactly this failure mode.

---

## The CS magic composition theorem

When two CS gates are applied in sequence, their orbit valences combine via the XOR-Fano rule:

$$\mathrm{CS}_{ij} \cdot \mathrm{CS}_{kl}: \quad L_{\text{out}} = L_{ij} \oplus L_{kl}$$

where $\oplus$ is XOR and the orbit labels follow the lines of a second Fano plane on the orbit indices. This is the **CS Magic Composition Theorem** — the orbit valence algebra is closed under the XOR-Fano rule.

Consequences:
- Two CS gates from the *same* orbit cancel: $L \oplus L = 0$ (stabiliser state, zero magic)
- Two CS gates from *adjacent* orbits produce a specific third orbit
- The full multiplication table is the 7-line structure of the second Fano plane

This means that a quantum compiler can track magic valence through a circuit algebraically, using only XOR arithmetic on 3-bit labels — no Wigner function computation needed at runtime.

---

## The Fano Line Verification Game

The paper introduces the **Fano Line Verification Game** as an operational test of magic valence. Two separated players share a state and receive input questions corresponding to Fano lines. They win if their measurement results are consistent with a Fano-line structure.

Classical players (using no entanglement) win with probability at most $5/7 \approx 0.714$.
Players sharing a GHZ state win with probability $1.000$ (perfect).
Players sharing a *wrong-valence* magic state score $0.472$ — *below the classical bound of $0.500$*.

This is the operational meaning of "wrong magic is worse than no magic": it actively anti-correlates the players' answers, doing worse than independent random guessing.

---

## Why Gottesman-Knill doesn't see this

The Gottesman-Knill theorem says: any quantum circuit consisting entirely of Clifford gates (H, CNOT, S, CZ) can be efficiently simulated classically. A magic state (non-Clifford resource) breaks this.

But Gottesman-Knill treats all magic states as equivalent — it draws a line between "simulable" (no magic) and "not simulable" (some magic). The orbit valence structure shows this line is too coarse. Within the non-simulable region, orbit valence further partitions states by *which* computations they enable. A state in orbit $\mathcal{O}_1$ can enable $\mathrm{CS}_{01}$-type computations but is actively harmful for $\mathrm{CS}_{02}$-type computations.

The correct simulability boundary is not a binary Clifford/non-Clifford line — it is a 7-valued Fano-orbit classifier.

---

## Practical implication: the ORBIT opcode

The 7 GHZ stabiliser expectation values $\langle ZZI\rangle, \langle ZIZ\rangle, \langle IZZ\rangle, \langle XXX\rangle, \langle YYX\rangle, \langle YXY\rangle, \langle XYY\rangle$ determine the orbit valence label directly. These are the same measurements already performed at every $[[7,1,3]]$ Steane code error correction cycle.

**The ORBIT opcode = Steane syndrome extraction.** These two tasks are the same 7 measurements; the QEC and magic-state resource-theory communities have been doing different post-processing on the same bits.

Adding orbit-valence post-processing to an existing Steane-code processor costs zero additional quantum circuit operations. It catches coherent gate-identity errors that syndrome decoders cannot.

---

## What to read next

- [Fano Orbit Decomposition of Magic](https://doi.org/10.5281/zenodo.20541583) — *the mathematical foundation: why there are exactly 7 orbits*

- [The Fano Magic State Factory](https://doi.org/10.5281/zenodo.PENDING) — *the factory protocol: orbit post-selection Pareto-dominates negativity post-selection*

- [SQU, TriQ, and SevenQ](https://doi.org/10.5281/zenodo.20581486) — *the hardware: TriQ and SevenQ registers implement the ORBIT opcode natively*

- [Beyond Gottesman-Knill](https://doi.org/10.5281/zenodo.20581492) — *orbit valence as a finer simulability boundary*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20541665](https://doi.org/10.5281/zenodo.20541665).*
