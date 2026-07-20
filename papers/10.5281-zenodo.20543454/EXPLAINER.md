---
layout: default
title: "One Instruction Set, Twenty Orders of Magnitude: The Origami ISA as Nature's Universal Computer"
parent: Explainers
nav_exclude: true
tags: [fano, origami-isa, spectroscopy, universal-computer, 6j-symbol, nuclear-physics]
portfolio: A
---

## One Instruction Set, Twenty Orders of Magnitude

*Plain-language explainer for [doi:10.5281/zenodo.20543454](https://doi.org/10.5281/zenodo.20543454)*

---

## The central idea in one sentence

Five opcodes — FLIP, FLOP, SPLIT, SPLAT, TWIST — suffice to describe nuclear spectroscopy (femtometre scale), photosynthetic energy transfer (nanometre scale), and quantum error correction (chip scale), spanning 20 orders of magnitude, because they all evaluate the same mathematical object: the 6j symbol of the Fano group $\mathbb{Z}_2^3$.

---

## Why do we care?

Physics is usually carved into separate fields with separate tools: nuclear physicists use Racah algebra, quantum chemists use configuration interaction, quantum computing researchers use stabiliser codes. The tools look completely different.

This paper argues they are not different — they are all running the same five-instruction programme on different physical hardware. If correct, this is one of the deepest unifications in mathematical physics since Wigner applied group theory to quantum mechanics in 1931.

The claim is falsifiable and already partially verified: the Pandya transformation in nuclear physics, the CS Magic Composition Theorem in quantum information, and the win condition of the Fano Line Verification Game all evaluate the *same* 6j symbol and give the *same* numerical answer ($-1/3$) for the *same* geometric reason.

---

## The five opcodes

The **Origami ISA** has five instructions:

| Opcode | Mathematical action | Physical meaning |
|--------|--------------------|--------------------|
| FLIP | $1 \to 3$ representation change (covariant→contravariant) | time reversal, particle→antiparticle |
| FLOP | $3 \to 1$ representation change | amplitude → probability |
| SPLIT | $1 \to 4$ trivalent branching | one particle → three-particle vertex |
| SPLAT | $4 \to 1$ trivalent fusion | three-particle annihilation |
| TWIST | ribbon twist (phase) | $U(1)$ phase rotation |

SPLIT and SPLAT are the fundamental vertices — they change the number of legs in a diagram. FLIP and FLOP are the fundamental rewriting rules — they change how representations transform. TWIST adds phases.

The composition rule: SPLIT followed by SPLAT is the identity *if and only if* the intermediate representation satisfies the Pentagon identity — the self-consistency condition of the Origami ISA.

---

## The 6j symbol: the atom of the programme

Every non-trivial computation in the Origami ISA reduces to evaluating a **6j symbol**:

$$\begin{Bmatrix} j_1 & j_2 & j_{12} \\ j_3 & j & j_{23} \end{Bmatrix}$$

This is a number. It depends on six angular momentum labels $j_1, \ldots, j_{23}$ and measures the "cost" of re-coupling — rearranging which pairs of momenta are combined first.

Racah introduced the 6j symbol in 1942 to simplify atomic spectroscopy calculations. Mac Lane wrote down the Pentagon identity in 1963 as the coherence axiom for monoidal categories — without knowing Racah had already found the same equation in nuclear physics. Ponzano and Regge showed in 1968 that the 6j symbol is the amplitude for a tetrahedron in 3D quantum gravity.

Three communities, one equation, 26 years.

---

## The same 6j in three different places

For the Fano group $\mathbb{Z}_2^3$, the 6j symbol takes values in $\{+1/\sqrt{2}, -1/\sqrt{2}, +1/2, -1/2, +1/3, -1/3\}$. The specific value $-1/3$ appears in three apparently unrelated places:

**1. The Pandya transformation (nuclear physics, 1956)**
The Pandya transformation relates two-body matrix elements in different coupling schemes:
$$
\langle (j_a j_d) J | V | (j_b j_c) J \rangle_{\text{particle-hole}} = -(2J+1) \sum_{J'} (2J'+1) \begin{Bmatrix} j_a & j_b & J \\ j_c & j_d & J' \end{Bmatrix} \langle (j_a j_b) J' | V | (j_c j_d) J' \rangle
$$

For the specific 3-qubit configuration matching the Fano triangle, the 6j evaluates to $-1/3$.

**2. The CS Magic Composition Theorem (quantum information, this series)**
The amplitude for two CS gates composing to give a state in the secondary orbit is $-1/3$ — the same 6j symbol of $\mathbb{Z}_2^3$ evaluated on the Fano line incidence structure.

**3. The Fano Line Verification Game (quantum information)**
The classical-quantum gap in the Fano Line Verification Game is determined by the same 6j coefficient. The value $-1/3$ gives the score differential between classical strategies (max $5/7$) and GHZ strategies (max $1$).

Same number, three fields, one geometry.

---

## Every spectroscopic selection rule is an EVP condition

The **Excluded Volume Principle (EVP)** in physics says: two quantum states cannot occupy the same Pauli-group orbit. This is the Pauli exclusion principle, generalised.

This paper proves: every spectroscopic selection rule is an EVP condition in $W(5,2)$. The proof works by showing that the Wigner-Eckart theorem (which governs all spectroscopic transitions) factors through the symplectic form of $W(5,2)$ when restricted to the Fano subgroup $\mathbb{Z}_2^3$.

**Examples verified computationally:**

| System | Selection rule | Circuit size | EVP form |
|--------|---------------|-------------|----------|
| Nuclear $^{48}$Ca | Pandya $6j = -1/3$ | 3 qubits | Fano line incidence |
| X(3872) meson | C-parity doubly forbidden | 5 qubits | Two Fano lines |
| CO$_2$ Q-branch | $\Delta J = 0$ forbidden | 7 qubits | Fano triangle |
| FMO BChl routing | $\eta = 0.1828$ | 7 qubits | 6-7 broken line |
| Ribosome A-site | tRNA decoding fidelity | 21 qubits | 3 Fano planes |

All of these are classically emulable on a laptop. The circuits are small because the physics is Fano-structured — the Hilbert space is much smaller than it appears.

---

## The regime ladder

The Origami ISA has three rungs:

**Rung 0 (ZX/stabiliser):** Clifford circuits, stabiliser states, efficiently simulable classically. Standard quantum error correction lives here.

**Rung 1 (Origami ISA):** Associative diagrammatic calculus, 6j symbols of compact groups, magic states. This is where spectroscopy, quantum chemistry, and non-Clifford quantum computing live. Computationally harder than Rung 0 but still tractable for small systems.

**Rung 2 (731-ISA):** Non-associative extension using octonion associators. Hypothetical RPU hardware. The frog vertex (4-legged) replaces the spider (n-legged). Spectroscopy with genuine $G_2$ non-associativity would live here — but all current evidence suggests physical systems stay at Rung 1.

The surprising discovery: Rung 1 is far richer than previously known. Essentially all of spectroscopy, previously thought to require *ad hoc* methods, reduces to Origami ISA programmes of 3–21 qubits.

---

## The controversial corollary

If every spectroscopic selection rule is an EVP/Origami-ISA condition, then quantum computers are not just useful for *simulating* physics — they are the *natural computational substrate* for physics. A spectroscopic calculation on a SevenQ register is not an approximation to classical spectroscopy; it is a more accurate description of the underlying physics.

This inverts the usual framing: instead of "quantum computers are harder to build but solve some special problems faster," the claim is "classical computers are approximations to quantum hardware, and physics runs natively on the quantum version."

---

## What to read next

- [Spectroscopic Circuits Are Small](https://doi.org/10.5281/zenodo.20584560) — *concrete circuits for CO$_2$, X(3872), nuclear Pandya — all under 21 qubits*

- [Magic Flow in the Origami ISA](https://doi.org/10.5281/zenodo.20584547) — *how magic propagates through circuits; ORBIT opcode as a flow meter*

- [Fano Orbit Decomposition](https://doi.org/10.5281/zenodo.20541583) — *the 3-qubit phase-space foundation*

- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) — *the same ISA in photosynthetic energy transfer*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20543454](https://doi.org/10.5281/zenodo.20543454).*
