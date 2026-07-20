---
layout: default
title: "Magic Has Valence"
parent: Explainers
nav_exclude: true
tags: [magic, stabiliser, orbit, fano, wigner, clifford, valence, origami-isa, phase-space, circuit-verification, ghz, cz-gate, qubit]
portfolio: A
---

## The Scalar Magic Measure Is a Luminance Meter — This Paper Builds the Spectrometer

*Plain-language explainer for [doi:10.5281/zenodo.20956666](https://doi.org/10.5281/zenodo.20956666) (#466)*

---

## The central idea in one sentence

The standard magic measure tells you *how much* magic a quantum state has, but not *what kind* — just as a luminance meter measures total light intensity but cannot distinguish red from blue; this paper builds the spectrometer: a 7-component orbit label derived from the Fano geometry of 3-qubit phase space that classifies states the scalar measure cannot tell apart.

---

## The problem: a measure that misses the point

Quantum computing has a precise notion of how "non-classical" a state is: the *mana*, or total Wigner negativity $\mathcal{N}$. It is a scalar — one number per state. It satisfies all the formal properties of a resource measure. And for many purposes it is the right tool.

But consider two states produced by running a Hadamard gate followed by a CZ gate on three qubits in the all-plus state:

- $\lvert\psi_1\rangle = H_0 \cdot \mathrm{CZ}_{01} \cdot \lvert{+++}\rangle$ (CZ between qubits 0 and 1)
- $\lvert\psi_3\rangle = H_2 \cdot \mathrm{CZ}_{12} \cdot \lvert{+++}\rangle$ (CZ between qubits 1 and 2)

Run every standard diagnostic on these two states:

| Diagnostic | ψ₁ | ψ₃ |
|---|---|---|
| Wigner negativity $\mathcal{N}$ | $1/8$ | $1/8$ |
| Stabiliser Rényi entropy | equal | equal |
| Schmidt spectrum | equal | equal |
| Fidelity between ψ₁ and ψ₃ | — | $1/4$ |

Every green light. Standard process tomography calls them equivalent. But they are *not* the same state — one was produced by CZ₀₁, the other by CZ₁₂. If your downstream circuit was designed expecting ψ₁ and receives ψ₃ instead, every two-qubit entangling operation it subsequently applies will be wrong — with 3/4 error rate per use site. The scalar $\mathcal{N}$ cannot catch this.

What can? The *orbit label*.

---

## The Fano plane inside 3-qubit phase space

Three qubits have 63 non-identity Pauli operators (all tensor products of $I, X, Y, Z$ on three qubits, excluding the trivial identity). The GHZ state $\frac{1}{\sqrt{2}}(\lvert 000\rangle + \lvert 111\rangle)$ is stabilised by seven of them:

$$ZZI,\quad ZIZ,\quad IZZ,\quad XXX,\quad YYX,\quad YXY,\quad XYY$$

These seven operators form the **Fano plane** $PG(2,2)$ — the unique projective plane of order 2, with 7 points and 7 lines, each line containing exactly 3 points, each point lying on exactly 3 lines. The Fano plane is not a metaphor here; it is a precise fact about the symplectic geometry of $\mathbb{F}_2^6$, the binary phase space of 3 qubits.

The $63 - 7 = 56$ remaining Pauli operators are **not** GHZ stabilisers. What are they?

---

## The 7 orbits of 8

Each of the 56 non-Fano Pauli operators has a definite commutation pattern with the Fano plane: it commutes with the three stabilisers on exactly one Fano line, and anticommutes with at least one stabiliser on every other line. There are 7 Fano lines, so there are **7 orbits**, each containing exactly 8 operators:

$$7 \times 8 = 56 \checkmark$$

The **orbit** $\mathcal{O}_L$ of a Pauli operator $u$ is the index $L$ of the unique Fano line $\ell_L$ that $u$ commutes with entirely. This is a pure combinatorial fact — it follows from the symplectic form on $\mathbb{F}_2^6$ and requires no choice of states, no measurements, and no convention.

The three orbits have a natural geometry:

- **Circle orbit $\mathcal{O}_0$** (grey): the inscribed circle $\{ZZI, ZIZ, IZZ\}$ — the all-$Z$ line. Fixed by all qubit-permutation (SWAP) operations.
- **Median orbits $\mathcal{O}_1, \mathcal{O}_2, \mathcal{O}_3$** (red/blue/yellow): the three lines through the pivot $XXX$. SWAP gates permute within this group but never exit it.
- **Side orbits $\mathcal{O}_4, \mathcal{O}_5, \mathcal{O}_6$** (green/orange/purple): the three lines not through $XXX$. SWAP gates permute within this group.

**SWAP gates never cross between median and side orbits.** This is the $S_3$ SWAP-routing theorem: qubit permutations respect the two-tier Fano structure.

---

## The orbit label (magic valence)

For any 3-qubit state $\rho$, define the **negativity weight** in orbit $L$ as the total Wigner negativity concentrated in $\mathcal{O}_L$:

$$p_L(\rho) = \frac{\mathcal{N}_L(\rho)}{\mathcal{N}(\rho)}, \qquad \mathcal{N}_L(\rho) = \sum_{\substack{u \in \mathcal{O}_L \\ W_\rho(u) < 0}} \lvert W_\rho(u)\rvert$$

The **orbit label** (or *magic valence label*) is the 7-component distribution $\{p_L(\rho)\}_{L=0}^{6}$. It tells you not just how much Wigner negativity the state has, but *which orbit it lives in*.

For the two CZ-type states above:
- ψ₁: all negativity in orbit 1 — orbit label $(0,1,0,0,0,0,0)$
- ψ₃: all negativity in orbit 3 — orbit label $(0,0,0,1,0,0,0)$

Different orbit labels. The spectrometer distinguishes them instantly; the luminance meter cannot.

---

## The five theorems

**1. Orbit Inequivalence.** Two CZ-type stabiliser states of different median orbit types ($A \neq B$, $A,B \in \{1,2,3\}$) have fidelity $\lvert\langle\psi_A\lvert\psi_B\rangle\rvert^2 = 1/4$, no SWAP sequence maps one to the other, and substituting one for the other introduces a coherent Clifford error with $3/4$ error rate per use site.

**2. Fano fidelity rule.** Whether two states have fidelity $1/4$ or $0$ is determined by whether they share a Fano point type: states sharing the same Fano point in their orbit commutation pattern have fidelity $1/4$; orthogonal orbit pairs have fidelity $0$.

**3. Mana linearity.** The orbit negativity $\mathcal{N}_L$ is linear in the Wigner function, so the orbit label of a circuit output can be tracked gate by gate without full state tomography.

**4. S₃ SWAP-routing theorem.** Qubit-permutation gates act on the orbit label as the symmetric group S₃ — permuting within orbits {1,2,3} and within orbits {4,5,6}, fixing orbit 0, never crossing between the two groups.

**5. Single-shot distinguishability.** For orthogonal orbit pairs (fidelity $= 0$), a *single* Pauli measurement suffices to identify the orbit, named explicitly by the Fano geometry.

---

## What this means for circuit verification

The most important application is catching **CZ routing bugs** — a class of hardware error where the wrong CZ gate fires. On superconducting processors with fixed coupling maps, CZ₀₁, CZ₀₂, and CZ₁₂ are physically distinct operations. A routing miscalibration can apply the wrong one.

Standard benchmarking — randomised benchmarking, cross-entropy benchmarking, process fidelity — measures *total gate error rate*. It cannot detect a gate that works perfectly but is the wrong gate. The orbit label can, at **zero additional experimental cost**: the 56 Pauli inner products needed to compute it are already present in standard process tomography data. No new experiments required.

---

## The Hudson's theorem subtlety

A technical point matters here. Hudson's theorem — the result that stabiliser states have non-negative Wigner functions — holds for *odd-dimensional* systems (qutrits, etc.) but **not for qubits**. In even dimension, the discrete Wigner function can assign negative values to stabiliser states. This is why ψ₁ and ψ₃ can have $\mathcal{N} = 1/8 > 0$ while being stabiliser states with zero magic resource.

The orbit label is therefore *not* a magic resource measure in the resource-theory sense — it is a **phase-space geometric invariant** that distinguishes stabiliser states from each other. The companion paper ([doi:10.5281/zenodo.21219712](https://doi.org/10.5281/zenodo.21219712), #476... see also #467) extends the orbit classification to genuine magic states via T-gate dressing of the CZ-type basis.

---

## Connection to the Origami ISA

The 3-qubit GHZ frame is the natural block primitive of the Origami ISA — the 3-qubit register is the minimal register for which the Fano geometry is non-trivial. The orbit structure is preserved under ZX diagram rewriting and coincides with the parity-check geometry of the Steane $[[7,1,3]]$ code: the same 7-point / 7-line structure that makes the Steane code correct one error also partitions the non-stabiliser Paulis into 7 orbits of 8.

The orbit label is the Origami ISA's built-in spectrometer for the SPLIT and SPLAT opcodes — it tells you which two-qubit entangling structure a state carries, not just how much.

---

## What this paper does not claim

**Not a better synthesis algorithm.** The orbit label is a diagnostic, not a synthesis procedure. It tells you whether the resource state your factory produced matches the gate teleportation gadget you are about to feed it into. It does not give you a faster or cheaper way to produce that state.

**Not relevant to single-qubit rotation synthesis.** If your workflow is sequential T-gate injection to approximate single-qubit rotations (Solovay-Kitaev), this paper is silent. That protocol works correctly; the orbit structure of 3-qubit phase space does not enter.

**Not a challenge to Clifford+T universality.** Any multi-qubit unitary can be synthesized using Clifford+T. The orbit mismatch pathology arises inside that framework — specifically when a multi-qubit resource state consumed by a gate teleportation gadget is the wrong orbital species — not as a limitation of the gate set.

**Not relevant if you design backwards from the target gate.** If you identify the desired non-Clifford gate, derive its resource state analytically, and build your factory specifically for that state, you know the target orbit by construction. The failure mode the orbit label catches is most relevant when certifying the output of an existing factory against a scalar threshold (mana $> 0$), not when building a factory from scratch around a known target.

**Three qubits only.** The Fano structure is specific to 3-qubit phase space ($4^3 - 1 = 63 = 7 + 56$). Extension to $n > 3$ qubits requires a separate analysis of the Clifford group action on $PG(2n-1, 2)$ and is an open problem.

---

*See also:*
- [Magic Orbits](https://doi.org/10.5281/zenodo.21219712) (#467) — T-gate dressing extends the classification to genuine magic states; 9 SWAP-classes
- [Hot Logic: A Complete Magic Resource Theory](https://doi.org/10.5281/zenodo.21219700) (#470) — why TV (not $\mathcal{N}$) is the correct discriminant for genuine vs dark magic
- [Nine Normal Forms of C₃ Circuits](https://doi.org/10.5281/zenodo.21219698) (#469) — the full 9-class normal form theorem that 466/467 feed into

*For the full technical treatment, see [doi:10.5281/zenodo.20956666](https://doi.org/10.5281/zenodo.20956666)*
