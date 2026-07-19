---
layout: default
title: "Magic Has a Kind, Not Just an Amount: The Fano Orbit Decomposition"
parent: Explainers
nav_exclude: true
tags: [fano, magic, wigner, phase-space, qec, orbit-valence]
portfolio: F
---

## Magic Has a Kind, Not Just an Amount

*Plain-language explainer for [doi:10.5281/zenodo.20541583](https://doi.org/10.5281/zenodo.20541583)*

---

## The central idea in one sentence

The 3-qubit phase space has a hidden seven-fold structure — the Fano plane — and a state's *kind* of magic (which of the seven orbits carries its Wigner negativity) determines which computations it enables, independently of how much magic it has.

---

## Why do we care?

Quantum computers can do things classical computers cannot. But not all quantum gates are created equal. The *Clifford gates* — H, CNOT, S — are powerful but ultimately simulable classically. To get genuine quantum advantage you need a *non-Clifford* gate: T, CS, CCZ. The resource that makes non-Clifford gates possible is called **magic**.

The standard picture: magic is a single number, the Wigner negativity $\mathcal{N}(\rho)$. More negativity = more magic = better. Factory protocols accept states above a negativity threshold and discard the rest.

**This paper shows that picture is incomplete.** Magic has a *kind* — a valence — not just an amount. Two states with identical negativity can be completely useless for each other's intended computations. Worse: using the wrong *kind* of magic actively makes things worse than using no magic at all.

---

## The geometry: a 63-point universe

The 3-qubit Pauli group (ignoring phases) has 63 non-identity elements. Think of these as 63 points in a discrete universe called the **symplectic polar space** $W(5,2)$.

This universe has a natural geometry: two points *commute* if their symplectic inner product is zero, *anticommute* otherwise. The geometry determines which observables can be measured simultaneously.

Hidden inside this 63-point universe is the **Fano plane** $PG(2,2)$: a 7-point subgeometry where every pair of points commutes, and every triple of points forms a "line" (a maximal commuting set of size 3). These 7 points are exactly the GHZ stabilisers:

```
ZZI,  ZIZ,  IZZ,
XXX,  YYX,  YXY,  XYY
```

The GHZ state $|000\rangle + |111\rangle$ is supported *exactly* on these 7 points — its Wigner function is $+1/8$ on the Fano plane and zero everywhere else. The Fano plane is the classical, zero-magic sector of 3-qubit phase space.

---

## The 7 orbits: where magic lives

The remaining $63 - 7 = 56$ points are where Wigner negativity can live. This paper proves they are not a featureless sea — they split into exactly **7 orbits of 8 points each**, one orbit per Fano line:

```
Orbit O₀:  commutes with line 0  {ZZI, ZIZ, IZZ},  anticommutes with all others
Orbit O₁:  commutes with line 1  {ZZI, XXX, YYX},  anticommutes with all others
  ...
Orbit O₆:  commutes with line 6  {IZZ, YXY, XYY},  anticommutes with all others
```

Each orbit has a *signature*: it commutes with exactly one Fano line and anticommutes with all six others. No other signatures exist — the 56 non-Fano points are completely partitioned by these 7 patterns.

<div style="background:#f8f8f8; border-left:4px solid #1f6feb; padding:1rem; margin:1.5rem 0; border-radius:4px;">
<strong>Theorem (Fano Orbit Decomposition).</strong>
The 56 non-classical points of $W(5,2)$ decompose as
$$W(5,2) \setminus PG(2,2) = \mathcal{O}_0 \sqcup \mathcal{O}_1 \sqcup \cdots \sqcup \mathcal{O}_6$$
where each orbit $\mathcal{O}_L$ has exactly 8 points, determined by commuting with Fano line $L$.
</div>

---

## The magic valence label

**Definition.** For a magic state $\rho$, the *orbit negativity* is
$$\mathcal{N}_L(\rho) = \sum_{u \in \mathcal{O}_L,\, W_\rho(u) < 0} \lvert W_\rho(u)\rvert$$
and the *magic valence label* is $\{p_L(\rho)\} = \{\mathcal{N}_L / \mathcal{N}\}_{L=0}^6$ — a probability distribution over the 7 orbits.

This is a strictly finer invariant than the total negativity $\mathcal{N}$. Two states can agree on $\mathcal{N}$ but differ on every $p_L$.

**Examples:**

| State | $\mathcal{N}$ | Dominant orbit | Valence |
|-------|--------------|----------------|---------|
| $\mathrm{CS}_{01}\|{+++}\rangle$ | $1/8$ | $\mathcal{O}_1$ only | $(0,1,0,0,0,0,0)$ |
| $\mathrm{CS}_{02}\|{+++}\rangle$ | $1/8$ | $\mathcal{O}_2$ only | $(0,0,1,0,0,0,0)$ |
| $\mathrm{CS}_{12}\|{+++}\rangle$ | $1/8$ | $\mathcal{O}_3$ only | $(0,0,0,1,0,0,0)$ |
| $\mathrm{CCZ}\|{+++}\rangle$ | higher | 6 of 7 orbits | spread |

The three CS states have *identical* total negativity. A negativity-only filter cannot tell them apart.

---

## Three levels of nested Fano structure

The orbit decomposition reveals three nested levels of Fano geometry:

**Level 0 — The Fano plane itself:** the 7 GHZ stabilisers, classical, zero magic.

**Level 1 — The orbit labels form a *second* Fano plane:** for any two orbits $\mathcal{O}_L$ and $\mathcal{O}_M$, all cross-XOR products $u \oplus v$ land in a unique third orbit $\mathcal{O}_{L \oplus M}$. The XOR triples
$$\{0,1,4\},\ \{0,2,5\},\ \{0,3,6\},\ \{1,2,3\},\ \{1,5,6\},\ \{2,4,6\},\ \{3,4,5\}$$
form a second copy of $PG(2,2)$ on the orbit labels. This is the **XOR-Fano composition rule** — it governs how magic states combine under two-qubit gates.

**Level 2 — Each orbit contains two Lagrangian 4-cliques:** each $\mathcal{O}_L$ splits into two groups of 4 ($\mathcal{O}_L^A$, $\mathcal{O}_L^B$) where all 4 points within each group mutually commute, and all 16 cross-pairs anticommute. Each 4-clique is a maximal abelian subgroup — the same type of structure as the Fano plane itself.

---

## The broken-line connection

Paper [325](https://doi.org/10.5281/zenodo.20400638) showed that the FMO biological light-harvesting complex implements a *6-7 architecture*: 6 intact Fano lines plus 1 weakened line. This produces directed energy transfer with efficiency $\eta > 0$. The intact 7-line Fano gives $\eta = 0$.

This paper shows these are the same phenomenon in phase space:

| Physical picture (6-7 architecture) | Phase-space picture (this paper) |
|--------------------------------------|----------------------------------|
| Intact Fano: $\eta = 0$, equilibrium | GHZ: Wigner on $PG(2,2)$, zero magic |
| Break line $L$: $\eta > 0$, directed | Magic: Wigner activates $\mathcal{O}_L$ |
| $PSL(2,7)$ symmetry intact | Acts transitively on all 7 orbits |
| One broken line | $p_L = 1$ — pure single-orbit magic |

The orbit $\mathcal{O}_L$ is the phase-space incarnation of the broken Fano line $L$. Magic is broken-line activation.

---

## The spontaneous symmetry breaking analogy

The 6-7 Fano symmetry breaking $PSL(2,7) \to S_4$ is the discrete finite-group analogue of electroweak symmetry breaking $SU(2) \times U(1) \to U(1)$:

- 6 intact Fano lines ↔ massless photon (unbroken generator)
- 1 broken Fano line ↔ massive W and Z bosons (broken generators)
- activated orbit $\mathcal{O}_L$ ↔ Goldstone mode
- $\eta > 0$ ↔ Higgs VEV (order parameter)
- 7 choices of broken line ↔ 7 discrete vacua

The mechanism differs — Fano breaking is architectural or evolutionary rather than potential-driven — but the group-theoretic structure is the same.

---

## What to read next

- [A Valence Theory of Quantum Magic](https://doi.org/10.5281/zenodo.20541665) — *the resource theory built on this orbit decomposition; CS magic composition theorem; why wrong magic is worse than no magic*

- [Beyond Gottesman-Knill](https://doi.org/10.5281/zenodo.20581492) — *orbit valence as a finer simulability boundary; magic-valence mismatch score below 0.5*

- [The Fano Magic State Factory](https://doi.org/10.5281/zenodo.PENDING) — *practical application: orbit post-selection Pareto-dominates negativity post-selection at ≥25% coherent fault rate*

- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) — *the same Fano geometry in photosynthetic energy transfer*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20541583](https://doi.org/10.5281/zenodo.20541583).*
