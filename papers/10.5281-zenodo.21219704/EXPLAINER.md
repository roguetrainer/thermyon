---
layout: default
title: "The Cookie-Cutter Lifting Programme"
parent: Explainers
nav_exclude: false
tags: [quantum-algorithms, shor, grover, magic, clifford, isa, twist-opcode, mana, cookie-cutter, lifting-programme, complexity, naqft, dihedral-group, stabiliser, wigner-function, mana, eigenphase-spectrum]
portfolio: B
---

## Shor's Algorithm Has No Magic — and That Is the Surprise

*Plain-language explainer for [doi:10.5281/zenodo.21219704](https://doi.org/10.5281/zenodo.21219704) (#472)*

---

## The central idea in one sentence

A systematic "cookie-cutter" procedure — write any classical algorithm in ISA form at the classical level, then identify where the quantum lifting inserts a TWIST opcode — predicts whether an algorithm requires magic (non-Clifford resources) or achieves its speedup purely from stabiliser-level interference, and the answer for Shor's algorithm is: no magic required.

---

## What magic is, and why it matters

Quantum computing is not all one thing. There is a precise stratification:

- **Stabiliser circuits** (the Clifford tier, $C_2$): circuits built from Hadamard, CNOT, and phase gates. These are surprisingly powerful — they can create entanglement and superposition — but the Gottesman-Knill theorem proves they can be simulated efficiently on a classical computer. No quantum speedup here.

- **Magic circuits** (the $C_3$ tier and beyond): circuits that additionally include non-Clifford gates such as the T gate ($45°$ rotation around the Z axis). These cannot be efficiently classically simulated. The resource that makes the difference is called *magic*, measured by the total variation of the Wigner function (a phase-space representation of the quantum state).

The question this paper asks: when we take a classical algorithm and "lift" it to a quantum algorithm, does that quantum algorithm actually need magic to get its speedup? Or does it stay entirely in the Clifford tier?

---

## The lifting procedure

The Origami ISA provides a standard vocabulary of seven opcodes — FLIP, FLOP, SPLIT, SPLAT, TWIST, SWAP, LABEL/ORBIT — for writing any quantum circuit. The **cookie-cutter lifting procedure** works as follows:

1. Take a classical algorithm and write it as an ISA programme at the classical level ($\beta = 0$, all $C_1$ opcodes: only bit operations, no phases).
2. Replace classical building blocks with their quantum analogues: FLIP(bit-flip) → FLIP(Hadamard), FLOP(function evaluation) → FLOP(quantum oracle), and so on.
3. Ask: does the lifted programme insert any **TWIST** opcodes? The TWIST opcode is the ISA marker for non-Clifford content. It fires whenever the circuit requires a gate whose eigenphase spectrum contains irrational multiples of $\pi$ — phases that escape the roots-of-unity lattice that Clifford circuits live in.

If no TWIST appears, the algorithm is Clifford-level. Its speedup, if any, comes not from magic but from a different resource: *coherent cancellation* — the ability of quantum amplitudes to destructively interfere and annihilate wrong answers.

---

## Act 1: Shor is Clifford

For Shor's factoring algorithm (tested at $N=15$, $a=7$), the full ISA trace is:

$$\text{LABEL} \to \text{FLIP}^{\otimes 4} \to \text{FLOP}(U_f) \to \text{FLIP}(\text{QFT}) \to \text{MEASURE}$$

At every step, the mana (total variation of the Wigner function minus one) is exactly zero. No TWIST fires. The abelian quantum Fourier transform (QFT) over $\mathbb{Z}_{2^n}$ decomposes into Hadamard gates and controlled-phase gates with angles $\pi / 2^k$; all of these are in $C_2$.

The mechanism of the speedup is *stabiliser complexity*, not magic. After the FLOP step, the state $\frac{1}{\sqrt{2^n}} \sum_x \lvert x\rangle\lvert f(x)\rangle$ is still a stabiliser state — but its stabiliser generators have exponential weight, implicitly encoding the entire function table of $f$. The QFT then decompresses this exponential-weight description in $O(n^2)$ gates, by constructive interference at multiples of $1/r$ and destructive interference everywhere else. Classical computation cannot do this because the tropical (classical) limit discards phases, leaving no mechanism for destructive interference.

**The punchline:** Shor's exponential speedup over classical factoring is real and deep, but it requires no magic at all. The speedup lives entirely in $C_2$.

---

## Act 2: Non-abelian hidden shift requires magic

The picture changes for the **$D_N$ hidden-shift problem**: given a function $f(x) = g(x \cdot s^{-1})$ for a secret shift $s$ in the dihedral group $D_N$, find $s$ using a non-abelian quantum Fourier transform (NAQFT).

For $D_4$ (dihedral group of order 8), the ISA trace is:

$$\text{LABEL} \to \text{FLIP} \to \text{FLOP}(U_f) \to \text{NAQFT}$$

After the NAQFT, the mana jumps to $(3 + 2\sqrt{2})/4 - 1 \approx 0.457 > 0$. The TWIST opcode fires at the NAQFT step.

Why? The dihedral group $D_N$ for $N \geq 3$ has two-dimensional irreducible representations. The NAQFT must diagonalise the group algebra $\mathbb{C}[D_N]$ into these irrep blocks, which requires a $2 \times 2$ rotation matrix with angle $2\pi j / N$ — an irrational eigenphase for $N \geq 3$. Irrational phases are outside the Clifford group. The TWIST opcode fires; genuine magic ($\mathrm{mana} > 0$, negative Wigner function) appears.

A sweep over $D_N$ for $N \in \{2, 3, 4, 5, 6, 8\}$ confirms the pattern: only $D_2$ (the Klein four-group, all one-dimensional irreducible representations) has $\mathrm{mana} = 0$. Every $D_N$ with $N \geq 3$ requires magic.

---

## The eigenphase spectrum as a universal magic meter

For non-dyadic groups (those whose order is not a power of 2), the standard Wigner-function mana gives padding artefacts when the state is embedded in a qubit Hilbert space. The paper proposes the **eigenphase spectrum** of the NAQFT gate as the basis-independent replacement:

$$\text{non-Clifford fraction} = \frac{\lvert\{\theta \in \text{spec}(\text{NAQFT}) : \theta \notin \{0, \pi/2, \pi, 3\pi/2\}\}\rvert}{\lvert\text{spec}(\text{NAQFT})\rvert}$$

This is zero for abelian groups (all eigenphases are rational multiples of $\pi$, hence Clifford), and strictly positive for any $D_N$ with $N \geq 3$. Unlike T-count, the eigenphase spectrum is an invariant of the group $G$ itself, independent of gate decomposition or qubit embedding.

---

## The big picture

The cookie-cutter lifting procedure provides a compile-time prediction of computational tier. Before running a quantum algorithm, read its ISA opcode sequence: if no TWIST appears, the algorithm is Clifford-level; if TWIST fires, magic is present and classical simulation is hard.

Two roads to quantum advantage emerge from this analysis:

| Road | Mechanism | Representative algorithm | Magic? |
|---|---|---|---|
| Clifford complexity | Exponential-weight stabiliser states + coherent cancellation | Shor (factoring, period-finding) | No |
| Magic | Non-abelian Fourier transform; irrational eigenphases; TWIST fires | $D_N$ hidden shift ($N \geq 3$); universal fault-tolerant QC | Yes |

The ISA provides a single vocabulary that classifies both. The TWIST opcode is the magic boundary — when it fires, you have crossed from $C_2$ into $C_3$.

---

*See also:*
- [The Projective Hierarchy of Computation](https://doi.org/10.5281/zenodo.21219706) (#473) — the conceptual framework for why classical, Clifford, and magic are the three projections of the Meld
- [ISA Completeness](https://doi.org/10.5281/zenodo.21219698) (#469) — the nine normal forms of $C_3$ circuits; the classification underlying the TWIST boundary
- [The Clifford Hierarchy as Group Cohomology](https://doi.org/10.5281/zenodo.21158943) (#476) — why the TWIST opcode is a $\mathbb{Z}_2$ cohomology class, not just a definition

*For the full technical treatment, see [doi:10.5281/zenodo.21219704](https://doi.org/10.5281/zenodo.21219704)*
