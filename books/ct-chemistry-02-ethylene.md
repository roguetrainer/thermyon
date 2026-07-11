---
layout: default
title: "Ch 2 — The Double Bond: Ethylene"
parent: CT Chemistry Primer
grand_parent: Books
nav_order: 2
---

# Chapter 2 — The Double Bond: Ethylene

*Two carbons, four hydrogens, one π bond. Classic chemistry adds a second orbital story on top of Chapter 1. C/T says: there are now two T-arrows at equilibrium — and twisting the bond is a diradical snap in slow motion.*

---

## The classic picture

Ethylene (C₂H₄) has a carbon–carbon double bond. The two carbons are sp²-hybridised: three sp² hybrids form the σ framework (C–C and C–H bonds), and the remaining unhybridised p orbitals on each carbon overlap sideways to form the π system:

- **π (bonding)**: p orbitals in phase, electrons delocalised above and below the plane
- **π\* (antibonding)**: p orbitals out of phase, nodal plane between the carbons

At equilibrium (R_CC = 1.34 Å, planar geometry), both electrons go into π. The π bond order = 1, total C=C bond order = 2.

| Quantity | Value |
|---|---|
| C=C bond length | 1.34 Å |
| C=C bond energy | 720 kJ/mol (cf. 346 kJ/mol for C–C) |
| Rotation barrier | ~65 kJ/mol (rotation about C–C breaks π bond) |
| Ground state geometry | Planar (D₂h symmetry) |

The rotation barrier is the classic signature of the π bond: rotating one CH₂ group by 90° costs energy because the p orbitals become orthogonal and the π bond breaks.

---

## The C/T picture at equilibrium

At the planar equilibrium geometry, we ask for the NOONs of the π and π\* orbitals. These come from a correlated (CASSCF) calculation in the (2e, 2o) active space:

| Orbital | NOON | C/T classification |
|---|---|---|
| π (bonding) | ~1.93 | **T-arrow** (active) |
| π\* (antibonding) | ~0.07 | **T-arrow** (active) |

**Both orbitals are T-arrows.** Unlike H₂ at equilibrium (which was H⁰ with both orbitals as C-boxes), ethylene at equilibrium already has active character — it is **H¹** even in its ground state.

This is the first qualitative difference between a single bond and a double bond: the π system carries intrinsic correlation that the σ system does not.

The active space is a point in Gr(1, 2) — the same Bloch sphere as H₂ — but the equilibrium point sits much further from the pole:

$$\theta_{\text{eq}} \approx 2\arcsin\!\sqrt{\frac{0.07}{2}} \approx 22°$$

Compare: for H₂ at equilibrium, θ_eq ≈ 8.2°. Ethylene starts deeper into H¹ territory.

---

## Why π bonds have inherent T-arrow character

For the σ bond in H₂, the equilibrium NOONs are ~1.975 / ~0.025 — very close to 2 and 0. The σ orbital is almost exactly doubly occupied, and the Lewis diagram (two electrons in σ) is essentially exact.

For the π bond in ethylene, the equilibrium NOONs are ~1.93 / ~0.07. This is already outside the C-box range (NOON < 0.02 or > 1.98). Why?

The π bond is intrinsically weaker than the σ bond. The sideways overlap of p orbitals is smaller than the head-on overlap of sp² hybrids. Weaker overlap → smaller bonding/antibonding splitting → the antibonding orbital dips lower in energy and picks up more occupation in the correlated ground state.

In MaxEnt language: the Lagrange multipliers for π and π\* are smaller in magnitude than for σ and σ\*. The Gibbs weight is more evenly distributed between |ππ⟩ and |π\*π\*⟩ configurations. The two electrons are not quite as firmly committed to the bonding orbital.

This is the C/T explanation of why double bonds are harder to model with DFT than single bonds: the π system is H¹ at equilibrium, not H⁰.

---

## The rotation barrier as a diradical snap

Now rotate one CH₂ group by angle φ about the C–C axis. What happens to the NOONs?

| φ (°) | n(π) | n(π\*) | C/T tier | Classic description |
|---|---|---|---|---|
| 0° | ~1.93 | ~0.07 | H¹ | Planar — π bond intact |
| 30° | ~1.80 | ~0.20 | H¹ | π bond weakening |
| 60° | ~1.50 | ~0.50 | H¹/H² | Strong correlation |
| **90°** | **~1.00** | **~1.00** | **H²** | **Diradical — π bond broken** |

At φ = 90° (perpendicular geometry), the two p orbitals are exactly orthogonal. The π and π\* orbitals are degenerate. Both NOONs → 1.00. The molecule is a **diradical**: two unpaired electrons, one on each carbon.

In C/T language: the perpendicular geometry is the **diradical snap**. The active-space point has reached the equator of the Bloch sphere (θ = 90°). This is exactly the same geometric event as H₂ near dissociation — the geodesic hits the Schubert variety.

The rotation barrier (≈65 kJ/mol) is the energy cost of this snap: you are paying to move the active-space point from θ ≈ 22° (planar, bonded) to θ = 90° (perpendicular, diradical).

---

## The Bloch sphere picture

For ethylene's π system (2 electrons in 2 orbitals), the Grassmannian is again Gr(1, 2) ≅ S². The torsion angle φ parameterises a curve on S²:

$$\theta(\varphi) = 2\arcsin\!\sqrt{\frac{n_{\pi^\ast}(\varphi)}{2}}$$

The curve starts at θ ≈ 22° (planar) and rises monotonically to θ = 90° (perpendicular). Unlike H₂'s bond-stretching trajectory (which can return to the same point), the torsion trajectory is a **one-way path** from bonded to diradical.

The Berry phase of the full 0° → 90° → 0° rotation loop (twist and return) is non-zero — a concrete H¹ signature. The rotation barrier is not just an energy cost: it is the geometric price of a topological event.

---

## Comparison: H₂ vs ethylene

| Property | H₂ (σ bond) | Ethylene (π bond) |
|---|---|---|
| Equilibrium tier | H⁰ | H¹ |
| Equilibrium NOON (antibonding) | ~0.025 | ~0.07 |
| θ at equilibrium | ~8.2° | ~22° |
| Bond-breaking event | Dissociation (stretch R) | Torsion (rotate φ) |
| Snap geometry | R ≈ 1.0–1.5 Å | φ = 90° (exact) |
| Correlation at equilibrium | None (HF exact) | Moderate (CASSCF needed) |
| DFT reliability | Excellent | Good for energy; poor for diradical |

The single bond is H⁰ at equilibrium. The double bond is H¹ at equilibrium. The C/T tier is a direct read of the bond type — no orbital diagram required.

---

## The sceptic test

> *"My DFT calculation gives the right rotation barrier for ethylene. Why do I need C/T?"*

For ethylene itself, DFT works. The problem appears in three places:

**1. Twisted π systems in photochemistry.** At φ = 90°, the ground state and first excited state are nearly degenerate (this is a conical intersection). DFT fails here — it is a single-reference method. The C/T method flags φ = 90° as H² (both NOONs ≈ 1) and tells you that CASSCF or MRCI is required.

**2. Conjugated systems.** In polyenes (butadiene, hexatriene, …), the π systems are coupled. The active space grows. C/T automatically selects the correct active orbitals from the NOONs — no expert judgement about which π bonds to include.

**3. The rotation barrier decomposition.** Classic chemistry says the barrier "comes from the π bond." C/T quantifies this: the barrier is ∫ dθ along the geodesic on S², weighted by the Fubini-Study metric. This is not a new number — it is a geometric interpretation of a known number.

---

## Numbers

Indicative values from CASSCF(2e, 2o)/STO-3G (ethylene):

| Quantity | Value |
|---|---|
| Equilibrium n(π) | ≈ 1.93 |
| Equilibrium n(π\*) | ≈ 0.07 |
| θ at equilibrium | ≈ 22° |
| n(π) at φ = 90° | ≈ 1.00 |
| n(π\*) at φ = 90° | ≈ 1.00 |
| θ at φ = 90° | 90° (exact by symmetry) |
| Rotation barrier (CASSCF) | ≈ 65 kJ/mol |

The φ = 90° values are exact by symmetry: the D₂ point group at perpendicular geometry forces π and π\* to be degenerate.

---

## In one sentence

**Ethylene's π bond is H¹ at equilibrium (both π and π\* are T-arrows), and rotating the molecule to 90° is a diradical snap — the active-space point reaches the equator of the Bloch sphere, exactly as H₂ does near dissociation, but driven by geometry rather than distance.**

---

*Previous: [Chapter 1 — The Single Bond: H₂](ct-chemistry-01-h2)*  
*Next: [Chapter 3 — Aromaticity: Benzene](ct-chemistry-03-benzene)*
