---
layout: default
title: "Virtual Monopoles in the FeMo-Cofactor: G₂ Symmetry, Non-Associative Bond Breaking, and Nitrogenase as a Pachner-Move Computer"
parent: Explainers
nav_exclude: true
tags: [fano, g2, octonions, biophysics]
portfolio: B
---

# Virtual Monopoles in the FeMo-Cofactor: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20346650](https://doi.org/10.5281/zenodo.20346650) (#318)*

## The central idea in one sentence

The iron-molybdenum cofactor of nitrogenase — the enzyme that fixes atmospheric nitrogen into the molecules of life — has resisted explanation for fifty years, and we propose that three of its deepest anomalies share a single topological cause: its seven-atom iron-carbide core realises the Fano plane, the simplest finite projective geometry, whose symmetry group is the exceptional Lie group $G_2$.

## The mystery: the enzyme that shouldn't work as well as it does

Every living organism that uses nitrogen — which is every living organism — ultimately depends on nitrogenase, the enzyme that breaks the triple bond of atmospheric N₂ and converts it into ammonia. Without nitrogenase, there is no fixed nitrogen; without fixed nitrogen, there are no amino acids, no DNA, no life.

Nitrogenase does this at room temperature and atmospheric pressure, using a metal cluster called the FeMo-cofactor. Industrial nitrogen fixation (the Haber-Bosch process) requires 400°C and 200 atmospheres of pressure. The enzyme is, by any measure, a chemical miracle.

Three anomalies have resisted fifty years of explanation:

**Anomaly 1: DFT failure.** Broken-symmetry density functional theory — the standard computational tool for open-shell metal clusters — consistently mis-assigns the spin states of the individual iron atoms in the resting state. The ground state has spin $S = 3/2$ by EPR spectroscopy, but DFT cannot reproduce this without imposing an artificial, symmetry-broken initial guess. The error is systematic, not numerical: the functional form is wrong.

**Anomaly 2: The silent carbide.** In 2011 it was discovered that the centre of the FeMo-cofactor contains a single carbon atom, a $\mu_6$-carbide, coordinated to all six iron atoms simultaneously. It is essential for activity — delete it and the enzyme is dead — yet it undergoes no detectable chemistry during the catalytic cycle. It is not protonated, not reduced, not exchanged. Chemists have no explanation for why something chemically inert is functionally indispensable.

**Anomaly 3: The ATP overhead.** Nitrogenase consumes 16 ATP per N₂ fixed. The thermodynamic minimum for breaking the N≡N triple bond requires only 4 ATP. The four-fold excess has no accepted explanation. The energy is not wasted as heat in any obvious way — it simply disappears into the mechanism.

## The proposal: a Fano plane in your enzyme

The FeMo-cofactor core consists of six iron atoms arranged in a trigonal prism, with the central carbide coordinating all six. Count the atoms: six irons plus one carbide equals seven.

The Fano plane is the simplest finite projective geometry: seven points and seven lines, with exactly three points on every line and exactly three lines through every point. Its automorphism group — the group of symmetries that map it to itself — is the exceptional Lie group $G_2$, the same group that describes the algebra of the octonions.

We propose that the seven-atom Fe₆C core realises the Fano plane: the exchange interactions between atoms follow the Fano incidence structure. If true, the electronic Hamiltonian has $G_2$ symmetry, not the lower crystallographic $D_3$ symmetry that the geometric arrangement of atoms suggests.

This single hypothesis addresses all three anomalies simultaneously:

**Anomaly 1 resolved.** A $G_2$-symmetric Heisenberg model with two exchange constants — antiferromagnetic between iron atoms, weaker antiferromagnetic through the carbide — reproduces $S = 3/2$ exactly, without broken symmetry, at the physical spin value $S = 2$ per iron site (Hilbert space dimension $5^7 = 78{,}125$, solved by sparse Lanczos diagonalisation). DFT fails because it imposes $D_3$ symmetry and then breaks it; the correct symmetry is $G_2$ and should not be broken.

**Anomaly 2 resolved.** The carbide is not chemically active but topologically essential: it is the seventh point of the Fano plane. Remove it and the Fano structure — and with it the $G_2$ symmetry and the $S = 3/2$ ground state — collapses. The carbide's role is geometric, not chemical.

**Anomaly 3 resolved.** The excess ATP cost corresponds, within 15%, to the energy cost of the Fano-line closure operation (see below). The enzyme pays a topological tax.

## A second Fano plane: the nitrogen molecule itself

Remarkably, the frontier molecular orbitals of N₂ — the seven quantum states most directly involved in bonding — also realise a copy of the Fano plane:

$$\sigma,\; \pi_x,\; \pi_y,\; \pi^{*}_x,\; \pi^{*}_y,\; \sigma^*,\; \mathrm{N_2}$$

Five of the seven Fano lines in this orbital Fano plane couple bonding orbitals to antibonding orbitals. These five lines encode the Dewar–Chatt–Duncanson (DCD) mechanism — the standard chemical explanation for how transition metals activate N₂, via $\sigma$-donation and $\pi^{*}$-backdonation — as a *geometric identity* of the Fano plane rather than a perturbative approximation. The DCD mechanism is not an approximation that happens to work: it is exact, because it is a consequence of the incidence geometry.

## Bond breaking as non-associative geometry

When N₂ binds to the FeMo-cofactor at the E4H4 state, the two Fano planes — the Fe₆C Fano and the N₂ orbital Fano — are glued together by a *lattice surgery* operation, creating a twelve-node junction. The iron atoms Fe2 and Fe6 play the roles of $\sigma$-donation and $\pi^{*}$-backdonation respectively.

Bond cleavage — the breaking of the N≡N triple bond — is identified with the **Fano-Line Closure operation**: a mathematical transformation that acts on the Fano line $(\sigma, \pi_x, \pi^{*}_x)$ and simultaneously annihilates both the bonding $\sigma$ amplitude and the antibonding $\pi^{*}_x$ amplitude in a single step. This operation is *non-associative*: it cannot be factored into a sequence of ordinary (associative) steps. This is why it is so hard to reproduce computationally and why it requires unusual catalytic machinery. Non-associativity is not a complication to be managed — it is the mechanism.

## The full catalytic cycle as a computer program

One of the more striking results of this paper is that the complete Lowe–Thorneley kinetic cycle for biological nitrogen fixation — eight electron transfers, eight proton transfers, N₂ binding, bond cleavage, and product release — can be written as a fifteen-instruction program in the 731-RPU Origami instruction set architecture:

| Step | Instruction | Chemical meaning |
|------|-------------|-----------------|
| ×4 | `FLIP` | Add e⁻/H⁺ to Fe cluster |
| ×1 | `SPLIT` | N₂ binds; create 12-node junction |
| ×4 | `FLIP` | Add e⁻/H⁺ to junction |
| ×1 | `SPLAT` | N≡N → N+N via Fano-Line Closure |
| ×2 | `FLIP` | Protonate each N fragment → NH₃ |
| ×3 | `FLOP` | Release NH₃, NH₃, H₂ |

Each instruction corresponds to a Pachner move — a local retriangulation of a simplicial complex. The enzyme is, in this sense, a biological implementation of the 731-RPU hardware architecture. The 16 ATP molecules are the power supply.

## What would prove this?

The conjectures are falsifiable. Three tests require no new experiments:

1. **Mössbauer reanalysis.** The four inequivalent iron environments observed by Mössbauer spectroscopy should correspond to two Fano classes: Fe2/Fe4 (positive moment, $\langle S_z\rangle \approx +0.26$) versus Fe3/Fe5/Fe6/Fe7 (negative moment, $\langle S_z\rangle \approx -0.09$ to $-0.12$). Reanalysis of published hyperfine field data in the $G_2$ site basis would confirm or refute this immediately.

2. **EPR fine structure.** The $G_2$ symmetry predicts specific selection rules for the EPR spectrum that differ from those implied by $D_3$. These can be checked against existing data.

3. **DFT with $G_2$ constraint.** A DFT calculation that enforces $G_2$ symmetry as a constraint (rather than $D_3$) should converge to a qualitatively different electronic structure, with $S = 3/2$ as the unconstrained ground state.

Two tests require new experiments:

4. **Muon spin relaxation ($\mu$SR).** Spin fluctuations consistent with geometric frustration would confirm the molecular frustrated-magnet picture.

5. **Inelastic neutron scattering.** Low-energy magnetic excitations below 10 meV, consistent with frustrated exchange, would directly support the conjecture.

## Why the stakes are high

If the $G_2$ conjecture is correct, the implications extend well beyond nitrogenase:

- It would explain the 50-year failure of DFT for this system: the wrong symmetry was assumed from the start.
- It would identify the carbide's role unambiguously, after a decade of speculation since its discovery.
- It would connect biological catalysis to the mathematics of exceptional Lie groups and octonions — a connection that has no precedent.
- It would suggest a design principle for synthetic catalysts: build the Fano geometry in, and the $G_2$ symmetry will do the rest.
- It would imply that non-associative algebra — long considered a mathematical curiosity — plays a functional role in the chemistry of life.

These are large claims, stated here as conjectures. The calculations support them; the experimental tests will decide.

## What to read next

- [Buckley (2026) — The Self-Dual $G_2$ Architecture](https://doi.org/10.5281/zenodo.20101634) — *The Fano-Line Closure Theorem (Theorem 7.5) used in the bond-breaking step.*
- [Buckley (2026) — Non-Associative Information Geometry](https://doi.org/10.5281/zenodo.20076498) — *The Fano-Fisher decomposition that gives $G_2$ its geometric power.*
- [Buckley (2026) — The $G_2$ Boltzmann Machine](https://doi.org/10.5281/zenodo.20319577) — *The Fano plane as an energy landscape organiser — the same structure applied to neural memory.*
- [Buckley (2026) — $G_2$-Symmetric Stabilisation of Magnetic Hopfions](https://doi.org/10.5281/zenodo.20127776) — *Virtual monopole-like excitations in $G_2$-symmetric systems.*

*For the full technical treatment, see [doi:10.5281/zenodo.20346650](https://doi.org/10.5281/zenodo.20346650)*
