---
layout: default
title: "One Geometry, Two Fields: How Brody & Hughston's Quantum Mechanics and the Fano Plane Are the Same Construction"
parent: Explainers
nav_exclude: true
tags: [fano, quantum-foundations, projective-geometry, wigner, metaplectic, category-theory]
portfolio: F
---

## One Geometry, Two Fields

*Plain-language explainer for [doi:10.5281/zenodo.20634729](https://doi.org/10.5281/zenodo.20634729)*

---

## The central idea in one sentence

Brody and Hughston showed that quantum mechanics is projective geometry over the complex numbers; this paper shows that the Fano orbit decomposition of magic states is the same projective geometry over the two-element field — and that the extra structure needed to make both fully consistent (the *metaplectic extension*) is identical in both cases.

---

## Why do we care?

In 1979, Kibble noticed that the space of pure quantum states is not really a vector space — it is a *projective* space, because multiplying a state by an overall phase leaves all physics unchanged. Brody and Hughston turned this observation into a complete geometric programme through the 1990s and 2000s: quantum mechanics is differential geometry on $\mathbb{CP}^n$, the complex projective space. The Schrödinger equation is a Hamiltonian flow; observables are real functions; transition probabilities are distances; the single-qubit Bloch sphere $S^2$ is the simplest instance.

Separately, the study of quantum computing led to the *discrete phase space* $W(5,2)$: a 63-point finite geometry over the two-element field $\mathrm{GF}(2)$, with a binary version of the same symplectic form. The Fano plane $PG(2,2)$ — seven points, seven lines — sits inside $W(5,2)$ as the classical sector. Magic states live in the complement.

The question this paper asks: are these two programmes related, or is the shared vocabulary (projective space, symplectic form, Lagrangian subspace, Wigner function) a coincidence?

**The answer: they are the same construction over different fields.** The complex numbers $\mathbb{C}$ give Brody & Hughston's programme; the two-element field $\mathrm{GF}(2)$ gives the Fano geometry programme. Both are specialisations of a single abstract structure — a projective space with a symplectic form — parameterised by the choice of field.

---

## The Bloch sphere and the Fano plane are cousins

The Bloch sphere $S^2 \cong \mathbb{CP}^1$ is the space of pure states of a single qubit. It has three coordinates (the three Pauli expectation values $\langle X \rangle, \langle Y \rangle, \langle Z \rangle$), and the rotation group $SO(3)$ acts on it.

The single-qubit discrete phase space $PG(1,2)$ has exactly three points — the three non-identity Pauli operators $X, Y, Z$ — and its symmetry group is $S_3$, the group of permutations of three objects.

Both are the *projective line* over their respective field: $\mathbb{CP}^1$ over $\mathbb{C}$, $PG(1,2)$ over $\mathrm{GF}(2)$. Both have the same type of symmetry group — the projective linear group $PGL(2,\mathbb{F})$ — over their respective fields.

Moving to three qubits:
- Over $\mathbb{C}$: the state space is $\mathbb{CP}^7$ (a 14-dimensional real manifold).
- Over $\mathrm{GF}(2)$: the phase space is $PG(5,2)$, with 63 points.

The Fano plane $PG(2,2)$ inside $PG(5,2)$ — the GHZ stabiliser subspace — is the finite-field analogue of a Lagrangian submanifold of $\mathbb{CP}^7$. Hudson's theorem holds in both settings: a state is classical (Gaussian / stabiliser) if and only if its Wigner function has non-negative support on a Lagrangian subspace.

---

## The comparison table

| Concept | Brody & Hughston ($\mathbb{C}$) | This programme ($\mathrm{GF}(2)$) |
|---------|--------------------------------|----------------------------------|
| Phase space | $\mathbb{CP}^n$ (infinite, smooth) | $PG(2n{-}1, 2)$ (finite, $2^{2n}{-}1$ points) |
| Symplectic form | $\omega = \mathrm{Im}\langle\cdot,\cdot\rangle$ | $\omega(u,v) \in \{0,1\}$ |
| Classical subspace | Lagrangian submanifold | Fano plane $PG(2,2)$ |
| Single-qubit space | $\mathbb{CP}^1 \cong S^2$ (Bloch sphere) | $PG(1,2)$ (3-point line) |
| Classical states | Gaussian states | Stabiliser states |
| Hudson's theorem | Positive Wigner $\leftrightarrow$ Gaussian | Positive Wigner $\leftrightarrow$ stabiliser |
| Non-classical states | Non-Gaussian | Wigner negativity on $\mathcal{O}_L$ |
| Symmetry breaking | Kähler quotient | Orbit $\mathcal{O}_L$ activation |
| Prequantum structure | $U(1)$ Maslov bundle | Metaplectic character $\chi$ |
| 6j symbol | $SU(2)$ Racah coefficient | $\mathbb{Z}_2^3$ Fano coefficient |

---

## The key result: the metaplectic extension

The most important result in the paper concerns the *Wigner functor* — the map sending each quantum state to its Wigner function. A natural question: does this map commute with symmetry transformations?

In Brody & Hughston's programme, the answer is yes — but only if you equip the theory with an additional structure called the **prequantum $U(1)$ line bundle** (the Maslov bundle). Without it, the Wigner function transforms correctly only under *real* symplectic transformations; phase rotations require the extra bundle to remain consistent.

In the discrete programme, exactly the same thing happens. Numerical experiments (x393a) show:

- For **CNOT** gates (real Clifford): Wigner covariance holds exactly — maximum deviation $4 \times 10^{-17}$ (machine zero).
- For **CS** gates (phase Clifford): Wigner covariance fails — deviations of order $0.5$, not numerical noise.

The obstruction is the **metaplectic character** $\chi$ — a sign function on phase space associated to each Clifford gate, satisfying a consistency condition (group 2-cocycle). With $\chi$ included, covariance is restored.

**The bridge theorem:** Brody & Hughston's prequantum $U(1)$ bundle and the discrete metaplectic character $\chi$ are the *same abstract construction* over different fields:

| Field | Central extension | Name |
|-------|------------------|------|
| $\mathbb{C}$ | Maslov $U(1)$ bundle on $\mathbb{CP}^n$ | Prequantum line bundle |
| $\mathrm{GF}(2)$ | Metaplectic character of $\mathrm{Sp}(2n,2)$ | Appleby phase function |
| $\mathbb{R}$ | Maslov index $\in \mathbb{Z}$ | Maslov index |

Both are central extensions of the symplectic group by a circle. Both are required to make the Wigner functor fully natural. This is not an analogy — it is the same theorem over different fields.

---

## What is unique to the discrete setting

Over $\mathbb{C}$, all pure states are equivalent under unitary transformations (Wigner's theorem). There is no way to partition the complement of a Lagrangian submanifold into finitely many orbits with distinct combinatorial signatures.

Over $\mathrm{GF}(2)$, the Fano orbit decomposition does exactly this: the 56 non-Fano phase points split into seven orbits of eight points each, one per Fano line. Each orbit corresponds to a distinct *kind* of magic — a magic valence. This is irreducibly discrete: it depends on the finiteness of $\mathrm{GF}(2)$ and the combinatorial structure of $PSL(2,7)$, and has no continuous analogue.

Magic valence is therefore something genuinely new — a resource-theoretic invariant that Brody & Hughston's programme cannot see, not because their programme is incomplete but because it operates over $\mathbb{C}$ where the structure is invisible.

---

## The 6j symbol bridge

The Wigner 6j symbol appears in both programmes:

- In Brody & Hughston's setting: $SU(2)$ 6j symbols appear in Penrose's spin-network expansion of $\mathbb{CP}^n$. The Pentagon identity (Mac Lane's coherence axiom for monoidal categories) governs their composition.

- In our setting: 6j symbols of the Fano group $\mathbb{Z}_2^3$ govern the orbit composition rule, spectroscopic selection rules, and the Fano Line Verification Game. The same Pentagon identity holds.

The Origami ISA is, in a precise sense, the **spin-$\frac{1}{2}$ discrete limit** of Penrose's spin-network geometry: it is the fragment that survives when all spins are set to $j = \frac{1}{2}$ and the field is reduced from $\mathbb{C}$ to $\mathrm{GF}(2)$.

Racah introduced the 6j symbol in 1942 for nuclear spectroscopy. Mac Lane wrote down the Pentagon identity in 1963 for category theory. Penrose used it for quantum gravity in 1971. We use the $\mathrm{GF}(2)$ version for quantum computing in 2026. One equation, four communities, eighty years.

---

## The twistor connection

Hughston's earlier work on twistor theory embeds quantum mechanics into $\mathbb{CP}^3$ (twistor space), where spacetime points correspond to projective lines via the Klein correspondence.

Over $\mathrm{GF}(2)$, the Klein correspondence has a finite analogue: points of $PG(5,2)$ correspond to lines of $PG(3,2)$. The 63 phase points of the 3-qubit system correspond to 63 lines of the finite projective 3-space. This suggests that the magic valence label — which orbit carries a state's Wigner negativity — may have a twistor interpretation: it identifies the combinatorial class of the corresponding line in finite twistor space.

This connection is conjectural, but it is the direction in which Brody & Hughston's programme naturally extends into finite geometry.

---

## What to read next

- [Fano Orbit Decomposition](https://doi.org/10.5281/zenodo.20541583) — *the mathematics underlying the discrete programme: seven orbits, three nested Fano structures*

- [A Valence Theory of Quantum Magic](https://doi.org/10.5281/zenodo.20541665) — *magic valence labels, syndrome blindness theorem, wrong magic is worse than no magic*

- [The Origami ISA as Nature's Universal Computer](https://doi.org/10.5281/zenodo.20543454) — *the 6j symbol bridge across 20 orders of magnitude*

- Brody, D.C. & Hughston, L.P. (2001). Geometric quantum mechanics. *J. Geom. Phys.* 38, 19–53 — *the canonical reference for the $\mathbb{CP}^n$ programme*

- Gross, D. (2006). Hudson's theorem for finite-dimensional quantum systems. *J. Math. Phys.* 47, 122107 — *the discrete analogue of Hudson's theorem; foundation of the GF(2) programme*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20634729](https://doi.org/10.5281/zenodo.20634729).*
