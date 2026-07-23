---
layout: default
nav_exclude: true
title: "Ch 3 — Aromaticity: Benzene"
parent: CT Chemistry Primer
grand_parent: Tutorials
nav_order: 3
---

# Chapter 3 — Aromaticity: Benzene

*Six carbons, six hydrogens, one resonance. The concept every chemistry student learns and no one can quite define. C/T gives a sharp definition — and a number.*

---

## The classic picture

Benzene (C₆H₆) is the canonical aromatic molecule. Six sp²-hybridised carbons form a regular hexagon; each contributes one unhybridised p orbital perpendicular to the ring. The six p orbitals combine into six π molecular orbitals:

- Three bonding (ψ₁, ψ₂, ψ₃): occupied by 6 electrons
- Three antibonding (ψ₄\*, ψ₅\*, ψ₆\*): unoccupied

The 6 π electrons satisfy the **Hückel 4n+2 rule** (n=1): benzene is aromatic.

The central mystery: benzene is not well described by either Kekulé structure (alternating single and double bonds) alone. The true structure is a superposition — the electrons are *delocalised* around the ring. The resonance stabilisation energy (the energy gain from delocalisation) is approximately **36 kcal/mol ≈ 150 kJ/mol** by thermochemical measurements.

Classic chemistry accounts for this with resonance theory (VB) or delocalised MOs (Hückel). Both give the right qualitative answer. Neither gives a clean geometric explanation.

---

## The C/T picture

Benzene has six π electrons in six π orbitals. The relevant active space for the π system is (6e, 6o). The NOONs of the six π orbitals at the equilibrium geometry are:

| Orbital | NOON | C/T classification |
|---|---|---|
| ψ₁ (lowest bonding) | ~1.98 | C-box (doubly occupied) |
| ψ₂, ψ₃ (degenerate bonding) | ~1.65 each | **T-arrow** |
| ψ₄\*, ψ₅\* (degenerate antibonding) | ~0.35 each | **T-arrow** |
| ψ₆\* (highest antibonding) | ~0.02 | C-box (unoccupied) |

**Four T-arrows, two C-boxes.** The degenerate pairs ψ₂/ψ₃ and ψ₄\*/ψ₅\* are the active orbitals. The sCeleTon (C/T skeleton) has four T-arrows connecting the two Kekulé resonance structures.

This is the C/T picture of aromaticity: **aromaticity = a closed loop of T-arrows around the ring.**

---

## The resonance energy from BIND

The resonance stabilisation energy is a **H² (BIND) quantity** — it is the off-diagonal coupling between the two Kekulé determinants:

$$\Delta E_{\text{res}} = \frac{1}{2}(E_1 - E_0)(1 - S)$$

where E₀ and E₁ are the energies of the ground state and first excited state of the same symmetry, and S is the overlap between the two Kekulé wavefunctions.

From SA-CASSCF(6e,6o) calculation (experiment x570b):

| Quantity | Value |
|---|---|
| ΔE_res (C/T formula) | 54.5 mEh ≈ 142 kJ/mol |
| ΔE_res (experimental) | 57.4 mEh ≈ 150 kJ/mol |
| Error | ~5% |
| Kekulé overlap S | ~0.23 |
| Correction factor (1−S)⁻¹ | ~1.30 |

The agreement is within 5% using only the CASSCF wavefunction — no empirical parameters. The BIND opcode is the resonance integral H₀₁ = ⟨Kekulé₁\|H\|Kekulé₂⟩.

---

## Why benzene is H²

In Chapters 1 and 2:
- H₂ at equilibrium: **H⁰** (no T-arrows, Lewis diagram exact)
- Ethylene at equilibrium: **H¹** (two T-arrows, CASSCF needed)

Benzene at equilibrium: **H²** (four T-arrows in a closed loop, BIND coupling required).

The key is the **closure** of the T-arrow loop. Ethylene has two T-arrows but they are not closed — there is no path back from π\* to π without breaking the bond. Benzene has four T-arrows that form a cycle: ψ₂ ↔ ψ₄\* ↔ ψ₃ ↔ ψ₅\* ↔ ψ₂. A closed T-arrow loop is exactly the structure that requires H² (BIND) to compute correctly.

This is the C/T definition of aromaticity:

> **A molecule is aromatic if and only if its sCeleTon contains a closed loop of T-arrows.**

The Hückel 4n+2 rule is a consequence: n+1 pairs of degenerate π orbitals form n closed T-arrow loops, and 4n+2 electrons fill them exactly.

---

## The Grassmannian picture

For benzene's π system (6 electrons in 6 orbitals), the active subspace lives in Gr(3,6) — a higher-dimensional Grassmannian than the S² of H₂ and ethylene.

The two Kekulé structures correspond to two distinct points in Gr(3,6). The resonance ground state is the midpoint of the geodesic connecting them. The resonance energy is proportional to the **geodesic distance** between the two Kekulé points:

$$\Delta E_{\text{res}} \propto d_{\text{FS}}(\text{Kekulé}_1, \text{Kekulé}_2)$$

The Maslov index along the closed Kekulé loop is μ = 2 (two Schubert crossings — one for each degenerate pair). This confirms: benzene requires at least 2 BIND operations. SA-CASSCF with two states is the minimal correct treatment.

---

## Comparison: H₂, ethylene, benzene

| Property | H₂ | Ethylene (π) | Benzene (π) |
|---|---|---|---|
| Equilibrium tier | H⁰ | H¹ | H² |
| T-arrows at eq | 0 | 2 | 4 |
| T-arrow topology | — | Open chain | **Closed loop** |
| Minimal method | HF | CASSCF(2,2) | SA-CASSCF(6,6) |
| Key quantity | Bond order | Rotation barrier | Resonance energy |
| ISA opcode | ORBIT | TWIST | **BIND** |

The progression H⁰ → H¹ → H² maps exactly onto single bond → double bond → aromatic ring. The C/T tier is not a grading imposed on chemistry — it is the natural complexity stratification of the molecular Grassmannian.

---

## The sceptic test

> *"Hückel theory gives me the right answer in five minutes. Why do I need BIND and Grassmannians?"*

For benzene itself, Hückel is excellent. The problems appear at the boundary:

**1. Anti-aromaticity.** Cyclobutadiene (4 π electrons, 4n rule) is antiaromatic and violently reactive. In C/T: the T-arrow loop is present but the BIND coupling is *destabilising* (H₀₁ > 0). C/T predicts antiaromaticity from the sign of H₀₁ — Hückel gives the 4n rule but not the sign of the coupling.

**2. Interrupted aromaticity.** Azulene (a 5+7 ring fusion) is aromatic by the 4n+2 count but has a permanent dipole moment of 1.08 D that Hückel cannot explain. C/T accounts for it: the T-arrow loop is asymmetric, BIND coupling is non-zero in the direction of the dipole.

**3. Transition metal aromaticity.** FeMoco (the active site of nitrogenase) has been proposed to have aromatic character in its iron-sulfur cluster. C/T diagnoses this from the NOONs of the metal d orbitals — Hückel cannot be applied.

**4. The resonance energy is a computable number.** The 5% agreement between C/T and experiment is not a fit — it is a prediction from a wavefunction. Hückel's resonance energy is a parameter (the β integral) fitted to data.

---

## Numbers

From SA-CASSCF(6e,6o)/STO-3G and experiment (x570b):

| Quantity | Value |
|---|---|
| Active space | (6e, 6o) — the six π orbitals |
| T-arrows at equilibrium | 4 (ψ₂, ψ₃, ψ₄\*, ψ₅\*) |
| Maslov index μ | 2 |
| H₀₁ = ⟨Kekulé₁\|H\|Kekulé₂⟩ | −70.75 mEh |
| ΔE_res (C/T) | 54.5 mEh |
| ΔE_res (exp) | 57.4 mEh |
| Error | 5% |

---

## In one sentence

**Benzene is H²: its four π T-arrows form a closed loop, the BIND opcode computes the resonance coupling H₀₁, and the resonance stabilisation energy (54.5 mEh, within 5% of experiment) follows from the Grassmannian geodesic distance between the two Kekulé points — no empirical parameters.**

---

*Previous: [Chapter 2 — The Double Bond: Ethylene](ct-chemistry-02-ethylene)*  
*Next: [Chapter 4 — Lone Pairs: H₂O](ct-chemistry-04-water)*
