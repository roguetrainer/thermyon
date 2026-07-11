---
layout: default
title: "Ch 1 — The Single Bond: H₂"
parent: CT Chemistry Primer
grand_parent: Books
nav_order: 1
---

# Chapter 1 — The Single Bond: H₂

*The simplest molecule. Two protons, two electrons, one bond. Classic chemistry gets it right. C/T gets it right more cheaply — and tells you exactly when the classic picture breaks down.*

---

## The classic picture

Two hydrogen atoms, each with one electron in a 1s orbital, approach each other. Their orbitals overlap and split into two combinations:

- **σ (bonding)**: electrons between the nuclei, lowering the energy
- **σ\* (antibonding)**: electrons outside the nuclei, raising the energy

At the equilibrium bond length (0.74 Å), both electrons go into σ. Bond order = 1. Done.

| Quantity | Value |
|---|---|
| Bond length | 0.74 Å |
| Bond energy | 432 kJ/mol |
| Bond order | 1 |
| Orbital picture | σ² (both electrons in bonding MO) |

This is what every first-year chemistry course teaches, and it is correct.

---

## The C/T picture

In C/T language we ask: which orbitals are **C-boxes** (frozen — NOON near 0 or 2) and which are **T-arrows** (active — NOON between 0.02 and 1.98)?

**At equilibrium (R = 0.74 Å):**

| Orbital | NOON | C/T classification |
|---|---|---|
| σ (bonding) | 1.975 | C-box (frozen, doubly occupied) |
| σ\* (antibonding) | 0.025 | C-box (frozen, unoccupied) |

Both orbitals are C-boxes. There are **no T-arrows**. The molecule is **H⁰**.

This means: the Lewis diagram is exact. No correlation energy is needed. Hartree-Fock gives the right answer. The wavefunction is a single Slater determinant |σσ⟩ and nothing else matters.

**The C/T method gives the same answer as the classic method — from a single number (the NOON) rather than from a diagram.**

---

## What C/T adds: the bond-breaking story

Now stretch the bond. What happens to the NOONs?

| R (Å) | n(σ) | n(σ\*) | C/T tier | Classic description |
|---|---|---|---|---|
| 0.50 | 1.990 | 0.010 | H⁰ | Compressed bond, still H⁰ |
| 0.74 | 1.975 | 0.025 | H⁰ | Equilibrium — Lewis exact |
| 1.00 | 1.939 | 0.061 | H⁰ | Still H⁰, but weakening |
| **0.67\*** | **1.980** | **0.020** | **H⁰→H¹ snap** | **C/T threshold crossed** |
| 1.50 | 1.747 | 0.253 | H¹ | Significant correlation |
| 2.00 | 1.424 | 0.576 | H¹/H² | Strong correlation |
| 3.50 | 1.027 | 0.973 | H² | Near-dissociation: two radicals |

\* The **snap** is at R\* ≈ 0.67 Å on the *compression* side (shorter than equilibrium in STO-3G). On stretching, the snap occurs later, around R ≈ 1.0–1.5 Å depending on the basis set.

**The key point**: the C/T method tells you *exactly* when the Lewis diagram breaks down. There is no ambiguity, no judgement call about "when does this molecule become multi-reference." The NOON crossing 0.02 is the answer.

---

## The Bloch sphere: H₂ as a point on S²

For H₂ in a minimal basis (STO-3G), there are only two orbitals: σ and σ\*. The active subspace is at most 1-dimensional, sitting inside a 2-dimensional one-particle space. The space of all 1-dimensional subspaces of ℂ² is **CP¹ ≅ S²** — the Bloch sphere.

The C/T compression map sends each bond length R to a point on S²:

$$\theta(R) = 2\arcsin\!\sqrt{\frac{n_{\sigma^*}(R)}{2}}$$

At equilibrium: θ ≈ 8.2° (near the north pole — mostly C-box).  
At dissociation: θ → 90° (equator — equal occupation, H²).

The bond-stretching trajectory is a **geodesic on S²** — a great-circle arc along the meridian. This is not a model: it is the exact FCI trajectory, confirmed numerically.

The snap at R\* is the point where the geodesic crosses the **Schubert variety** — the locus on S² where the C/T threshold is reached. Before the crossing: H⁰ (Lewis diagram valid). After: H¹ or H² (correlation required).

---

## What Jaynes says

The maximum-entropy state consistent with the NOONs (n_σ, n_σ*) is the free-fermion Gibbs state:

$$\rho_{\text{MaxEnt}} = \frac{e^{-\lambda_\sigma \hat{n}_\sigma - \lambda_{\sigma^\ast} \hat{n}_{\sigma^\ast}}}{Z}, \qquad \lambda_i = \log\!\left(\frac{2}{n_i} - 1\right)$$

At equilibrium: λ_σ = −3.66, λ_σ\* = +3.66 (σ strongly favoured, σ\* strongly disfavoured). The MaxEnt state has 97.5% of its weight in |σσ⟩ — consistent with the Lewis diagram.

At dissociation: λ_σ ≈ λ_σ\* ≈ 0 (both equally probable). The MaxEnt state is maximally mixed between |σσ⟩, |σ\*σ\*⟩, |σσ\*⟩ — consistent with two independent radicals.

The MaxEnt Lagrange multipliers **reproduce the FCI NOONs exactly** (confirmed numerically: reconstruction error = 0.000000 at every geometry). This is Proposition 1 of Paper 594: MaxEnt is not an approximation here, it is exact at the level of the 1-RDM.

---

## The sceptic test

> *"You've just redescribed the σ/σ\* picture in different language. What have you actually gained?"*

Three things:

**1. Automaticity.** The classic picture requires you to know that σ and σ\* are the right orbitals to draw. For H₂ this is obvious. For a transition metal complex with 50 d-orbital combinations, it is not. The C/T method computes the active orbitals from the 1-RDM eigenvalues — no chemical intuition required.

**2. The breakdown criterion.** The classic picture has no built-in way to tell you when it stops being valid. "Multi-reference character" is a judgement call. The C/T method gives a sharp criterion: the molecule is H⁰ if and only if all NOONs are outside (0.02, 1.98). For H₂ this happens at R\* ≈ 0.67 Å (inward) or around 1.0–1.5 Å (outward, basis-dependent). No guesswork.

**3. The energy decomposition.** Once you know the H^k tier, you know what kind of calculation is needed:
- H⁰: Hartree-Fock is exact. No correlation calculation needed.
- H¹: CASSCF with the T-arrow orbitals is sufficient.
- H²: Multi-reference methods (CASPT2, MRCI) are needed. The Maslov index tells you how many non-trivial correlation insertions are required.

For H₂ at equilibrium: **H⁰ → use HF → one Slater determinant → done.** The C/T method confirms what every chemist knows, but now from a theorem rather than from tradition.

---

## Numbers

From experiment x594a (FCI/STO-3G):

| Quantity | Value |
|---|---|
| Equilibrium bond length | R_eq = 0.74 Å (literature) |
| NOON snap geometry | R\* = 0.67 Å (STO-3G) |
| Bloch-sphere angle at snap | θ\* = 12.3° |
| Fubini-Study distance R_eq → R\* | 0.036 rad |
| MaxEnt reconstruction error | 0.000000 (exact) |

---

## In one sentence

**H₂ at equilibrium is H⁰: both orbitals are frozen (C-boxes), the Lewis diagram is exact, and no correlation is needed. The C/T method confirms this from the 1-RDM eigenvalues alone — and tells you precisely where it stops being true.**

---

*Next: [Chapter 2 — The Double Bond: Ethylene](ct-chemistry-02-ethylene)*
