---
layout: default
title: "Schrödinger's Equation on the Grassmannian"
parent: Explainers
nav_exclude: true
tags: [grassmannian, schrodinger, action-principle, casscf, dirac-frenkel, schmidt-decomposition, noon, berry-connection, beta-snap, bifurcation, quantum-chemistry, h-k-ladder, trs-framework]
portfolio: A
---

## The wavefunction equation nobody was solving correctly

*Plain-language explainer for [doi:10.5281/zenodo.21277819](https://doi.org/10.5281/zenodo.21277819) (#568)*

---

## The one-sentence version

Every quantum chemistry method — CASSCF, MCTDH, tDMRG — has been solving an approximate version of the Schrödinger equation on the Grassmannian; this paper derives the exact one and shows that the famous β* snap (the DFT failure threshold) is not an empirical rule but a bifurcation condition in the exact action.

---

## What the Grassmannian is and why the wavefunction lives there

A molecule with n_e electrons and n_orb orbitals has a wavefunction that is, in principle, a vector in a Hilbert space of dimension C(n_orb, n_e) — astronomically large for any real system. The standard approach is to pick an **active subspace**: a k-dimensional collection of orbitals that matter most, and work only within that subspace.

The set of all possible k-dimensional subspaces of an n-dimensional orbital space is the **Grassmannian** Gr(k,n). Each point on this manifold is one possible active-space choice. The correlated wavefunction is not a single point on the Grassmannian — it is a **Schmidt decomposition**:

$$|\Psi\rangle = \sum_{k=0}^{r-1} \sigma_k \, |\alpha_k\rangle \otimes |\beta_k\rangle$$

where σ_k are the Schmidt weights (square-rooted natural orbital occupancies) and |α_k⟩, |β_k⟩ are orbital basis states. This decomposition lives on the **Schmidt secant variety** — a stratified subset of Gr(k,n) that includes all states with Schmidt rank ≤ r.

The key new idea: **the Schmidt rank r should be a variational parameter**, not fixed in advance by chemical intuition. The correct action principle determines r automatically from the second variation.

---

## The correct action functional

Applying the Dirac-Frenkel variational principle to the Schmidt decomposition yields an action:

$$S = \int dt \left[ \sum_k \sigma_k^2 \bigl(A_k^\alpha + A_k^\beta\bigr) - \langle\Psi|H|\Psi\rangle \right]$$

The term A_k^α + A_k^β is the **Berry connection** on the Grassmannian — it accounts for the geometric phase accumulated as the orbital subspace rotates in time. The σ_k² weights mean that more strongly occupied natural orbitals contribute more to the kinetic (geometric) term.

**Why this is new:** existing methods (CASSCF, MCTDH, tDMRG) correspond to approximations or constraints on this action:
- CASSCF: fixes r, ignores off-diagonal Berry coupling between different Schmidt components
- MCTDH: treats the α and β sectors independently
- tDMRG: truncates Schmidt rank by SVD threshold, not by variational principle

All of them miss the **off-diagonal coupling terms** that arise when σ_k² varies in time. These terms become significant precisely when the active space is changing — near bond-breaking, conical intersections, or spin-state crossings.

---

## The β* snap as a bifurcation, not a rule

The threshold σ₀² ≈ 0.88 — below which DFT fails and multi-reference methods are needed — appears throughout this framework (Papers 596, 594). Here it gets a derivation.

The rank-1 fixed point on the Grassmannian (the Hartree-Fock solution) is dynamically **stable** when:

$$|H_{01}|^2 < \sigma_0^2 (H_{11} - H_{00})$$

When the off-diagonal coupling |H₀₁| (the "resonance coupling" between the dominant orbital configuration and the first excited one) exceeds a threshold set by the energy gap and the Schmidt weight, the rank-1 fixed point becomes **unstable**. The wavefunction is no longer a single Slater determinant — it must split into a superposition. This is the β* snap.

In other words: the β* snap is not an empirical observation that DFT fails at σ₀² ≈ 0.88. It is the **bifurcation condition** of the exact action. DFT fails there because the single-determinant ansatz becomes dynamically unstable at precisely that point.

The condition is:

$$|H_{01}|^2 = \sigma_0^2 (H_{11} - H_{00}) \quad \Leftrightarrow \quad \theta_G \approx 20°$$

where θ_G is the Grassmannian angle (Paper 594). The 20° threshold and the σ₀² ≈ 0.88 threshold are the same condition expressed in two different coordinate systems on the Grassmannian.

---

## Recovery of existing methods

The action is general. Known methods are recovered as limits:

| Method | Constraint on action | What is missed |
|--------|---------------------|----------------|
| Hartree-Fock | r = 1, σ₀ = 1 | All correlation |
| CASSCF | r fixed, off-diagonal Berry coupling = 0 | Inter-Schmidt-component coupling |
| MCTDH | α and β sectors decoupled | Cross-sector Berry terms |
| tDMRG | r truncated by SVD threshold | Variational determination of r |
| G-walk chemistry (β→∞) | Tropical limit of action | Dynamic/quantum effects |

In the **tropical limit** β → ∞, the Berry connection terms vanish (no geometric phase at zero temperature) and the action reduces to minimising ⟨Ψ|H|Ψ⟩ over G-orbits — which is exactly G-walk/Galois chemistry (Paper 491). The Hartree-Fock energy is the tropical fixed point of the full action.

---

## Connection to scattering amplitudes

The structure of the action — a Berry-connection kinetic term weighted by Schmidt weights, minus a Hamiltonian potential — is **formally analogous** to the Grassmannian volume form that underlies scattering amplitudes in planar N=4 super-Yang-Mills theory (the amplituhedron, Arkani-Hamed & Trnka 2013).

Both involve:
- Integration over Gr(k,n)
- A measure weighted by minors of the Grassmannian coordinate matrix (= Schmidt weights)
- A "potential" term (Hamiltonian / amplitude integrand)

Whether this is a precise duality or a structural coincidence is left open. Paper 574 develops the connection further.

---

## The equations of motion

The Euler-Lagrange equations from this action are geodesic flows on Gr(n_α, n_orb) × Gr(n_β, n_orb), driven by an effective Hamiltonian that includes both the physical H and the Berry-connection curvature. In ISA language:

- The geodesic flow is the **ORBIT opcode** — moving the orbital subspace along the Grassmannian
- The Berry connection curvature is the **TWIST opcode** — accumulating geometric phase
- The bifurcation (Schmidt rank increase) is the **BIND opcode** — a new Schmidt component is born when the rank-1 point becomes unstable

The Schrödinger equation on the Grassmannian is the ISA programme written as a continuous-time flow, rather than a sequence of discrete opcodes.

---

## What this changes in practice

For computational chemistry: the off-diagonal coupling terms provide a **correction to CASSCF orbital gradients** that is non-zero whenever the Schmidt weights are changing in time (e.g., along a reaction path that crosses a conical intersection). Current CASSCF implementations miss this correction.

For the ISA framework: the β* snap now has a derivation from first principles, not just an empirical correlation. This strengthens the claim that the H¹/H² boundary is a physical phase transition, not a convenient threshold.

---

*See also:*

- [Grassmannian Compression](https://doi.org/10.5281/zenodo.21309088) (#594) — CASSCF as geodesic on Gr(k,n); Maslov index; the β* snap numerically
- [Weyl DFT Accelerator](https://doi.org/10.5281/zenodo.21346033) (#596) — the β* snap as DFT failure detector; r = 0.990 correlation
- [Universal Chemical Bonding](https://doi.org/10.5281/zenodo.21277821) (#570) — the three ISA bonding descriptors; θ_G, n_bond, H₀₁
- [Orbit Processing Unit](https://doi.org/10.5281/zenodo.21360837) (#598) — the OPU as the computational model for Grassmannian dynamics

*For the full technical treatment, see [doi:10.5281/zenodo.21277819](https://doi.org/10.5281/zenodo.21277819)*
