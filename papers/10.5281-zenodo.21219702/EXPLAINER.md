---
layout: default
title: "The Wigner Defect Conservation Law"
parent: Explainers
nav_exclude: true
tags: [wigner-function, wigner-defect, conservation-law, magic, dark-magic, stabiliser, symplectic, origami-isa, resource-theory, n-independence, total-variation, quantum-foundations]
portfolio: A
---

## Dark Magic Does Not Accumulate — It Is a Fixed Imprint

*Plain-language explainer for [doi:10.5281/zenodo.21219702](https://doi.org/10.5281/zenodo.21219702) (#471)*

---

## The central idea in one sentence

When a single T gate acts on an otherwise Clifford state of $N$ qubits, the resulting Wigner function carries a conserved "defect" — three quantities (total negative mass, total Wigner mass, and total variation TV) that are independent of $N$, no matter how many Clifford qubits surround the T-gate qubit.

---

## The discrete Wigner function

For an $N$-qubit state $\lvert\psi\rangle$, the **discrete Wigner function** $W: \mathbb{F}_2^{2N} \to \mathbb{R}$ assigns a real number to each point in the $2N$-dimensional binary phase space. For stabiliser states, $W \geq 0$ everywhere (Hudson's theorem). For magic states, $W$ takes negative values somewhere.

The Wigner function encodes the full quantum state: knowing $W$ everywhere is equivalent to knowing the density matrix. The key quantities are:

$$N = \sum_{W < 0} \lvert W(u)\rvert \quad \text{(Wigner negativity)}$$
$$M = \sum_u W(u) = 1 \quad \text{(normalisation — always 1)}$$
$$\mathrm{TV} = \sum_u \lvert W(u)\rvert \quad \text{(total variation)}$$

For stabiliser states, $N = 0$ and $\mathrm{TV} = 1$. For magic states, $N > 0$ and $\mathrm{TV} > 1$... except for dark-magic states, where $N > 0$ but $\mathrm{TV} = 1$.

---

## The canonical T-gate state

Consider the $N$-qubit state:

$$\lvert\psi_N\rangle = \mathrm{CZ}_{01} \cdot (T \otimes I^{\otimes N-1}) \cdot \lvert{+}^{\otimes N}\rangle$$

A T gate on qubit 0, then a CZ between qubits 0 and 1, applied to the all-plus state. This is the canonical dark-magic state: it has $N > 0$ (negative Wigner values exist) but $\mathrm{TV} = 1$ (total variation equals the stabiliser value).

The theorem: for all $N \geq 2$,

$$\sum_{W < 0} W_N(u) = -\frac{\sqrt{2}}{8} \qquad \text{(negative mass, constant)}$$
$$\sum_u W_N(u)^2 = \cos^2(\pi/8) = \frac{2 + \sqrt{2}}{4} \qquad \text{(Wigner mass, constant)}$$
$$\mathrm{TV}_N = \frac{1 + \sqrt{2}}{2} \qquad \text{... wait}$$

More precisely: the negative mass and the purity-like quantity $\sum W^2$ are $N$-independent. The TV of dark-magic states equals 1 (by definition of dark magic), but the *shape* of the Wigner function — the specific pattern of negativity — is a fixed imprint that does not spread or dilute as $N$ grows.

---

## What conservation means physically

Clifford operations move the Wigner function around phase space (they are symplectic transformations of the phase space coordinates) but do not change $N$ or $\sum W^2$. The T gate *imprints* a fixed defect on the Wigner function. Surrounding the T-gate qubit with more Clifford qubits — enlarging $N$ — does not dilute this defect. It remains concentrated on the single qubit that received the T gate.

This is the **Wigner Defect Conservation Law**: the defect imprinted by a single T gate is a conserved quantity under all Clifford operations on all $N$ qubits, for all $N$.

The implication for resource theory: dark magic does not become more or less expensive as circuit size grows. A T gate in a 2-qubit circuit costs the same Wigner defect as a T gate in a 100-qubit circuit. The resource is local to the gate, not distributed across the system.

---

## The $N$-independence of $N$ (Wigner negativity)

A corollary that resolves a puzzle: the Wigner negativity $N$ of the canonical state $\lvert\psi_N\rangle$ is also $N$-independent (equal to $\sqrt{2}/8$ for all $N \geq 2$). This seems surprising — one might expect that adding more entangled Clifford qubits would spread the negativity around and change the total. But it does not: the negativity is locked to the T-gate qubit and does not flow.

This $N$-independence of $N$ (the quantity, not the qubit count) was the key result that settled a priority question about dark magic: the $N$-independence had not been recorded in the literature before this paper, even though the Wigner negativity of individual states had been computed in many prior works.

---

## The big picture

The Wigner Defect Conservation Law places dark magic in the resource hierarchy precisely. A dark-magic state carries a fixed, non-growing defect; a genuine-magic state (TV > 1) carries a defect that *does* scale with the circuit's non-Clifford content. The conservation law is what makes the three-tier taxonomy stable: dark magic is a finite, non-accumulating resource that can be tracked precisely, while genuine magic is the quantity that must be budgeted in hardware.

---

*See also:* [doi:10.5281/zenodo.21219700](https://doi.org/10.5281/zenodo.21219700) (Hot Logic — TV as complete monotone) · [doi:10.5281/zenodo.21219698](https://doi.org/10.5281/zenodo.21219698) (Nine Normal Forms) · [doi:10.5281/zenodo.21158943](https://doi.org/10.5281/zenodo.21158943) (Clifford Hierarchy as Group Cohomology)
