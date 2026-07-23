---
layout: default
nav_exclude: true
title: Notation and Concepts
parent: CT Chemistry Primer
grand_parent: Tutorials
nav_order: 0
---

# Notation and Concepts

*A reference for terms and notation used throughout the CT Chemistry Primer. Quantum chemistry terms are explained for readers coming from the ISA/physics side; ISA terms are explained for readers coming from chemistry.*

---

## Quantum chemistry notation

### Active space: (Ne, No)

**(Ne, No)** means "Ne electrons in No orbitals." This is the standard shorthand for a CASSCF active space — the subset of electrons and orbitals treated with full correlation.

- **(2e, 2o)**: 2 electrons in 2 orbitals. The minimal active space for a single π bond (ethylene, H₂). The full configuration interaction (FCI) within this space has at most 3 determinants.
- **(6e, 6o)**: 6 electrons in 6 orbitals. The standard active space for the π system of benzene. FCI within this space has 400 determinants; CASSCF handles it exactly for small molecules.
- **(10e, 10e)**: the π system of naphthalene (two fused rings). Already at the edge of routine CASSCF.

**Rule of thumb:** active space grows with the number of π bonds and metal d-orbitals involved. The C/T method selects the active space automatically from the NOONs, removing the need to choose (Ne, No) by hand.

---

### NOON — Natural Orbital Occupation Number

The **NOON** (natural orbital occupation number) of an orbital is the eigenvalue of the one-particle density matrix (1-RDM) corresponding to that orbital. It measures how many electrons, on average, occupy that orbital in the correlated many-body wavefunction.

- Range: 0 ≤ NOON ≤ 2 (for spin-summed, doubly-occupable orbitals)
- NOON = 2: orbital is fully doubly occupied (frozen core behaviour)
- NOON = 0: orbital is fully unoccupied (frozen virtual behaviour)
- NOON = 1: orbital is singly occupied on average — maximally correlated; two electrons are equally likely to be in this orbital or out of it
- NOON ≈ 1.93 / 0.07: π bond in ethylene at equilibrium — mostly doubly occupied but with non-trivial correlation

**The C/T threshold:** NOONs outside (0.02, 1.98) → C-box (frozen). NOONs inside (0.02, 1.98) → T-arrow (active). The 0.02/1.98 values are empirically calibrated; the Weak Lifting Theorem (Paper 588) proves the threshold exists.

---

### Natural orbitals

The **natural orbitals** of a many-body wavefunction are the eigenvectors of the one-particle density matrix (1-RDM). They are the unique set of orbitals for which the wavefunction has the most compact representation — the NOON-weighted basis. All references to "orbital occupation" in this primer are to natural orbital occupations (NOONs), not Hartree-Fock orbital occupations.

---

### CASSCF

**Complete Active Space Self-Consistent Field.** A quantum chemistry method that performs full configuration interaction (FCI) within the active space (Ne, No) while simultaneously optimising the orbital shapes by energy minimisation.

- CASSCF is exact within the active space — it captures all correlation between the active electrons
- It is approximate because it treats the inactive (C-box) electrons with a single Slater determinant (Hartree-Fock level)
- The C/T method tells you which orbitals should go in the active space; CASSCF then solves the problem within that space

---

### SA-CASSCF

**State-Averaged CASSCF.** A variant of CASSCF that optimises a single set of orbitals to simultaneously describe multiple electronic states (ground state + excited states). Required when states are nearly degenerate — as in benzene resonance (Ch 3) or conical intersections.

---

### Hartree-Fock (HF)

The simplest correlated electronic structure method: the wavefunction is approximated as a single Slater determinant (a single electron configuration). HF is exact for H⁰ systems (all NOONs outside (0.02, 1.98)). It fails for H¹ and H² systems because it cannot represent more than one configuration.

---

### DFT — Density Functional Theory

The workhorse of computational chemistry. DFT approximates the many-body wavefunction using only the electron density ρ(r), via a functional E[ρ]. It is computationally cheap and usually accurate for H⁰ systems. DFT fails for strongly correlated (H¹/H²) systems because standard functionals cannot represent multi-configuration character.

The C/T tier pre-diagnostic flags when DFT will fail before running it: if any NOON is inside (0.02, 1.98), DFT needs to be treated with caution.

---

### Energy units: Eh, mEh, kJ/mol, kcal/mol

| Unit | Full name | Value |
|---|---|---|
| Eh | Hartree (atomic unit of energy) | 2625.5 kJ/mol = 627.5 kcal/mol |
| mEh | milli-Hartree (10⁻³ Eh) | 2.626 kJ/mol = 0.6275 kcal/mol |
| kJ/mol | kilojoules per mole | — |
| kcal/mol | kilocalories per mole | 4.184 kJ/mol |

**In this primer:** resonance energies and small energy differences are quoted in mEh because that is the natural scale of electron correlation effects (typically 1–100 mEh). Bond energies and rotation barriers are quoted in kJ/mol because that is the natural scale for chemists.

---

### STO-3G

A minimal Gaussian basis set: each atomic orbital is represented by 3 Gaussian functions. STO-3G is qualitatively correct (right orbital topology, right bond orders) but quantitatively rough (bond lengths and energies off by 5–20%). It is used in this primer for numerical illustrations because FCI calculations are small enough to be exact. Production-quality calculations use larger basis sets (cc-pVDZ, cc-pVTZ, aug-cc-pVQZ, …).

---

### The 1-RDM — One-Particle Reduced Density Matrix

The **1-RDM** is obtained from the full many-body density matrix by tracing over all electrons except one. Its eigenvalues are the NOONs; its eigenvectors are the natural orbitals. The C/T method operates entirely on the 1-RDM — it never needs the full wavefunction. This is why the method is computationally cheap: the 1-RDM of an N-orbital system is an N×N matrix, not a 2^N-dimensional vector.

---

## C/T concepts

### C-box and T-arrow

The two types of orbital in the C/T classification:

- **C-box** (Crystallised): NOON < 0.02 or NOON > 1.98. The orbital is frozen — either almost doubly occupied or almost empty. A single Slater determinant (HF) describes it correctly.
- **T-arrow** (Topological): NOON ∈ (0.02, 1.98). The orbital is active — it participates in the multi-reference correlation. CASSCF or higher is needed.

The names reflect the ISA opcodes: C-boxes carry ORBIT (H⁰) structure; T-arrows carry TWIST (H¹) or BIND (H²) structure.

---

### sCeleTon

The **sCeleTon** (C/T skeleton) is the bipartite graph whose nodes are the C-boxes and T-arrows, with edges connecting each T-arrow to the C-boxes it bridges. The sCeleTon encodes the topology of the active space: a tree-shaped sCeleTon → H¹ (CASSCF sufficient); a closed-loop sCeleTon → H² (BIND/MRCI required).

*Named in session 2026-07-10; defined in Paper 588.*

---

### H^k tier

The complexity tier of a molecular system:

| Tier | Condition | Method needed | ISA opcode |
|---|---|---|---|
| H⁰ | All NOONs outside (0.02, 1.98) | Hartree-Fock | ORBIT |
| H¹ | Some NOONs inside (0.02, 1.98), open sCeleTon | CASSCF | TWIST |
| H² | Closed T-arrow loop in sCeleTon | SA-CASSCF, MRCI, CASPT2 | BIND |

The H^k tier is a pre-diagnostic: it tells you which method to use before running any calculation.

---

### Grassmannian Gr(k, n)

The **Grassmannian** Gr(k, n) is the space of all k-dimensional subspaces of an n-dimensional vector space. In chemistry, the active space of a CASSCF calculation with k active electrons (in the 1-particle picture) and n basis functions is a point in Gr(k, n).

- Gr(1, 2) ≅ S² — the Bloch sphere. This is the space relevant for H₂ in a minimal basis.
- Gr(3, 6) — the space relevant for benzene's π system.

Molecular geometry changes (bond stretching, torsion) trace curves on the Grassmannian. The H^k tier is the topological structure of those curves: H⁰ = fixed point, H¹ = smooth geodesic, H² = path through a Schubert variety crossing (NOON snap).

---

### NOON snap / Schubert crossing

A **NOON snap** occurs when a natural orbital occupation number crosses the C/T threshold (0.02 or 1.98) as a function of molecular geometry. In Grassmannian language, this is the curve hitting a **Schubert variety** — a codimension-1 stratum of the Grassmannian. Each snap contributes ±1 to the **Maslov index** of the path.

---

### Maslov index μ

The **Maslov index** of a molecular path γ(R) is the signed count of NOON snaps along the path. It measures the minimum number of BIND (H²) operations required to represent the wavefunction change along the path. μ = 0 means CASSCF is sufficient; μ > 0 means multi-reference correlation is mandatory.

---

### Berry phase γ

The **Berry phase** is the geometric holonomy accumulated when the active orbital subspace is parallel-transported around a closed loop in molecular configuration space. It is an H² quantity, independent of the Maslov index:

- A loop can have μ = 0 (no NOON snaps) but γ ≠ 0 (non-trivial holonomy)
- A loop can have μ > 0 (NOON snaps) but γ = 0 (no net holonomy)

For enantiomers (R vs S chirality): the NOONs are identical, but the Berry phase around a closed loop encircling the chiral centre has opposite sign for the two mirror images.

*Proved independent of Maslov index: Paper 594, experiments x594b and x594c.*
