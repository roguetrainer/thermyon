---
layout: default
title: "Valence as Orbit Occupancy"
parent: Explainers
nav_exclude: true
tags: [valence, orbit-occupancy, aufbau, hund-rules, taube, fano, coordination-chemistry, f-block, d-block, galois-chemistry, g-walk, site-symmetry, representation-theory, ligand-field, origami-isa]
portfolio: A
---

## One Number Unifies Three Centuries of Chemical Rules

*Plain-language explainer for [doi:10.5281/zenodo.21219722](https://doi.org/10.5281/zenodo.21219722) (#487)*

---

## The central idea in one sentence

Chemical valence, oxidation state, and coordination number — three quantities that mainstream chemistry treats as unrelated — are all read-outs of a single object: the *orbit occupancy vector*, which counts how many half-filled slots each symmetry orbit of the valence shell contains.

---

## The problem: three concepts, one word

Ask a chemist for the "valence" of iron and you get three different answers depending on context. In haemoglobin, iron has oxidation state +2, coordination number 6, and a d⁶ electron configuration. Mainstream chemistry handles these with three separate rule sets and never reconciles them.

The situation is even worse at the extremes. For main-group elements, valence counts bonds (carbon = 4). For transition metals, it means coordination number or oxidation state depending on who is asking. For the f-block lanthanides and actinides, the rules are so complicated that textbooks largely give up and go empirical.

The orbit occupancy framework provides a single definition that works across the entire periodic table:

> **The valence of an atom in environment $G$ is the orbit occupancy vector $\mathbf{v} = (v_1, v_2, \ldots, v_k)$, where $v_i$ counts the half-filled slots in the $i$-th orbit of the valence shell under the site symmetry group $G$.**

The three classical "valences" are projections of $\mathbf{v}$ onto different subspaces — they are facets of one gem, not separate gems.

---

## What is an orbit?

When chemists say that d-orbitals "split" into $t_{2g}$ and $e_g$ levels in an octahedral complex, they are using orbit language without naming it. The site symmetry group $G = O_h$ (the symmetry of a regular octahedron) acts on the five d-orbitals and divides them into two orbits: a set of three orbitals ($t_{2g}$) and a set of two ($e_g$). Electrons in the same orbit are energetically equivalent and exchange freely; electrons across orbits do not.

The orbit occupancy vector records how full each orbit is: $v_i = 0$ (empty), up to $v_i = 2n_i$ (full), where $n_i$ is the number of orbitals in orbit $i$. The interesting quantity is how many *half-filled* slots remain — slots occupied by exactly one electron rather than zero or two.

The ISA ORBIT opcode computes this vector directly: `ORBIT(G_site, ρ_shell)` takes the site symmetry group and the shell configuration and returns $\mathbf{v}$.

---

## Four rules become four theorems

Once valence is defined this way, four long-standing empirical rules become provable theorems.

**Theorem 1 (Unification).** Bond valence, oxidation state, and coordination number are three projections of $\mathbf{v}$ onto different subspaces. For main-group elements, all three projections agree (the octet rule = closed orbit at $\ell=0$). For d-block elements in an octahedral field, coordination number = 6 for all d$^n$ because all five d-orbitals overlap with the six ligand $\sigma$ bonds, regardless of how many electrons fill them.

**Theorem 2 (Aufbau).** The ground-state electron configuration minimises the number of partially filled orbits. The famous Cr anomaly — Cr is $[\text{Ar}]\,3d^5\,4s^1$, not $3d^4\,4s^2$ — is not a special-case exception: $3d^5$ completes the single spin-orbit of the d half-shell (one electron per orbital, orbit full in the spin sense), while $3d^4\,4s^2$ leaves both orbits partially occupied. The configuration that fills an orbit always wins.

**Theorem 3 (Hund).** Hund's first rule (maximise spin) holds when the intra-orbit exchange energy $K$ exceeds the crystal-field splitting $\Delta$. It fails — giving a low-spin ground state — precisely when $\Delta/K$ crosses the threshold

$$\frac{\Delta}{K} = \frac{S_\text{HS}(S_\text{HS}+1) - S_\text{LS}(S_\text{LS}+1)}{n_{e_g}^\text{HS} - n_{e_g}^\text{LS}}$$

This is not a rule with exceptions; it is a theorem with an explicit crossover condition. The "strong-field / weak-field" distinction in every coordination-chemistry textbook is the same condition, finally derived from first principles.

**Theorem 4 (Lability).** A complex is kinetically inert if and only if its orbit occupancy vector is *single-orbit complete* — one orbit entirely full, all others empty — which costs energy $\Delta$ to leave. The ISA encodes this as: `TWIST` fires only at cost $\Delta$. This recovers Taube's lability rules (Nobel Prize in Chemistry, 1983) as a theorem. Co$^{3+}$ low-spin ($t_{2g}^6$, single-orbit full) is inert; Cr$^{2+}$ ($t_{2g}^3 e_g^1$, two orbits partially occupied) is labile — exactly as observed.

---

## The f-shell and the Fano plane

The most striking result concerns the lanthanide and actinide series, where 7 f-orbitals are filling simultaneously and standard ligand-field theory breaks down badly.

The exceptional Lie group $G_2$ — the automorphism group of the octonions — acts transitively on the 7 imaginary octonion units $\{e_1, \ldots, e_7\}$. These 7 units are in bijection with the 7 points of the Fano plane (the smallest projective plane, with 7 points and 7 lines). The 7 f-orbitals are in bijection with the same 7 objects: they transform as the 7-dimensional fundamental representation of $G_2$.

**Theorem 4 (f-shell / Fano).** For any f-shell ion whose site symmetry contains $G_2$ as a subgroup, the ground-state magnetic moment is determined by the Fano orbit occupancy vector alone.

For Gd$^{3+}$ (f$^7$, one electron per Fano point), the $G_2$ trace formula forces the total orbital angular momentum to vanish: $L = \sum_{i=1}^7 m_{\ell,i} = 0$. The zero orbital moment of Gd$^{3+}$ is not a coincidence — it is a symmetry theorem. The anomalous magnetic moments of Eu$^{3+}$ and Sm$^{3+}$ arise from *Fano frustration*: for f$^6$ and f$^5$, the Fano orbit is maximally incompletely occupied, leading to maximal J-mixing. This is the quantitative explanation for the two most anomalous rare-earth magnetic moments.

The experimental validation across 72 of 73 test cases (98.6%) — spanning s-, p-, d-, and f-block chemistry — confirms that the orbit occupancy vector captures the dominant physics in each regime.

---

## The ISA as a ligand-field compiler

The practical upshot is a three-line programme that replaces hours of ligand-field calculation:

```
LABEL   (shell, G_site)     -- initialise with orbital config and site group
ORBIT   (G_site, ρ_shell)   -- return orbit occupancy vector v
TWIST   (Δ/J)               -- fires if Δ > J (strong-field / inert condition)
```

Given only the site symmetry group $G$ and the electron count $n$, this programme returns the spin state, predicts kinetic lability, flags Aufbau anomalies, and — for f-shell ions — computes the ground-state magnetic moment. No wavefunction, no DFT, no parameters beyond the group theory.

---

## The big picture

Chemistry has accumulated a thicket of named rules over 150 years — the octet rule, the 18-electron rule, Hund's rules, Taube's rules, the spectrochemical series — each correct in its domain and opaque outside it. The orbit occupancy framework shows they are all shadows of a single algebraic object projected onto different planes. The insight is not that chemists were wrong; it is that the underlying unity was always there, waiting to be named.

---

*See also: [G-walk Chemistry](https://doi.org/10.5281/zenodo.21224107) (#488) — applying the orbit framework to beat DFT on spin-state prediction; [Orbit Computing](https://doi.org/10.5281/zenodo.21224109) (#489) — molecular symmetry groups as a fourth computing paradigm; [Virtual Monopoles in the FeMo-Cofactor](https://doi.org/10.5281/zenodo.20346650) (#318) — the G₂ Fano structure of nitrogenase*

*For the full technical treatment, see [doi:10.5281/zenodo.21219722](https://doi.org/10.5281/zenodo.21219722)*
