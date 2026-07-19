---
layout: default
title: "Spin Foams as Origami: LQG from the ISA Perspective"
parent: Explainers
nav_exclude: true
tags: [origami-isa, spin-foam, lqg, g2, triality, barbero-immirzi, fano, quantum-foundations]
portfolio: B|F
---

## Quantum Gravity is Already Running the Origami ISA

*Plain-language explainer for [doi:10.5281/zenodo.20680634](https://doi.org/10.5281/zenodo.20680634)*

---

## The central idea in one sentence

Every spin foam model of quantum gravity — Ponzano-Regge, Barrett-Crane, EPRL — is a programme in the Origami ISA, and recognising this both clarifies why quantum gravity is hard and suggests how it could be extended.

---

## What loop quantum gravity does

Loop quantum gravity (LQG) is one of the leading approaches to quantising spacetime. Instead of treating space as a smooth continuum, LQG describes it as a network of discrete quantum excitations — a **spin network** — where edges carry quantum numbers (spins) and vertices carry interaction amplitudes.

The key amplitude at each vertex is the **6j symbol** (or its higher-dimensional cousins, the 15j symbol). LQG computes the path integral of quantum gravity by summing these amplitudes over all triangulations of spacetime — this is the **spin foam** programme.

The core mathematical constraint is the **Biedenhahn-Elliott identity**: a specific algebraic relation among 6j symbols that guarantees the result doesn't depend on which triangulation you chose. Without it, the theory wouldn't make sense.

---

## The Origami ISA connection

The Biedenhahn-Elliott identity is *exactly* the Pentagon identity $d^2 = 0$ of the Origami ISA.

This is not a metaphor. The mapping is precise:

| Origami ISA opcode | LQG operation | Mathematical role |
|---|---|---|
| SPLIT | Assign spins to spin network edges | Coboundary $\delta^0$ |
| SPLAT | Evaluate 6j symbol at a vertex | Fibre integration |
| TWIST | Gauge transformation (Barbero-Immirzi) | Simplicity constraint |
| FLIP | Time reversal | Antipodal map |
| FLOP | Sum over spin configurations | Partition function trace |

Every LQG spin foam model is a **SPLIT → TWIST → SPLAT → FLOP pipeline**.

---

## What this buys us

Recognising spin foams as Origami ISA programmes is immediately useful in three ways:

**1. Connection to quantum hardware.** The SevenQ register (7 qubits, one per Fano point) can evaluate a single Ponzano-Regge vertex amplitude — the 6j symbol — in O(1) depth. Classical spin foam calculations are exponentially hard; the ISA gives them a quantum speedup.

**2. Connection to other domains.** Nuclear spectroscopy, financial XVA, and quantum error correction all use the same 6j symbol for the same mathematical reason (it is the SPLAT opcode applied to different gauge groups). LQG is the same programme running at the Planck scale.

**3. A natural extension.** Classical LQG uses SU(2) or SL(2,ℂ) — both associative Lie groups. The ISA framework suggests extending to $G_2 = \mathrm{Aut}(\mathbb{O})$, the automorphism group of the octonions. $G_2$ is the fixed-point subgroup of **triality** in Spin(8) — the order-3 outer automorphism that cyclically permutes Spin(8)'s three 8-dimensional representations.

---

## The Barbero-Immirzi problem

Loop quantum gravity has a free parameter: the **Barbero-Immirzi parameter** $\gamma_\mathrm{BI}$. It appears in the area spectrum:

$$A = 8\pi \gamma_\mathrm{BI}\, \ell_\mathrm{P}^2 \sum_i \sqrt{j_i(j_i+1)}$$

In SU(2) LQG, $\gamma_\mathrm{BI}$ is fixed empirically by matching black hole entropy to the Bekenstein-Hawking formula, giving $\gamma_\mathrm{BI}^{\mathrm{SU}(2)} = \ln 2 / (\pi\sqrt{3}) \approx 0.127$. There is no first-principles derivation.

The $G_2$ extension suggests a natural fix. We implement the Domagała-Lewandowski entropy counting for $G_2$-punctured horizons — with only the $G_2$ root system as input, no free parameters — and find that the dominant puncture type is the **14-dimensional adjoint representation** $(0,1)$. The $G_2$ adjoint and fundamental share the same area quantum ($C_2 = 8/3$) but the adjoint wins the entropy competition because $\ln 14 > \ln 7$. This gives:

$$\gamma_\mathrm{BI}^{G_2} = \frac{\sqrt{8/3}}{2\pi \ln 14} \approx 0.09848$$

This is a genuine prediction, different from the SU(2) value, derived entirely from the $G_2$ root system.

---

## Why classical LQG cannot reach this

Classical SU(2) LQG is necessarily **associative**: Lie groups satisfy $(gh)k = g(hk)$ for all elements. This means the order of parenthesisation never matters in spin network computations.

The octonions $\mathbb{O}$ are the unique 8-dimensional non-associative division algebra. $G_2 = \mathrm{Aut}(\mathbb{O})$ is its symmetry group. No computation using only SU(2) or SL(2,ℂ) can access the octonionic sector — it requires the SPIN opcode of the 731 ISA, the generator of triality.

This is the precise sense in which the $G_2$ extension adds genuinely new physics: it is **triality-complete**, while classical LQG is not.

---

## What to read next

- [In Praise of Tetrahedra](https://doi.org/10.5281/zenodo.20581484) (#386) — the 6j symbol in the simplest possible setting
- [The Unhedgeability Theorem](https://doi.org/10.5281/zenodo.20635479) (#396) — the abelian/financial instance of the same Čech-cohomology pattern (no literal 6j symbol)
- [Associamancy](https://doi.org/10.5281/zenodo.20667174) (#407) — the resource theory underlying the $G_2$ extension
- [Origami ISA Pulse Sequences](https://doi.org/10.5281/zenodo.20680609) (#411) — the hardware side of implementing the SPIN opcode

*For the full technical treatment, see [doi:10.5281/zenodo.20680634](https://doi.org/10.5281/zenodo.20680634)*
