---
layout: default
title: "Weyl DFT Accelerator"
parent: Explainers
nav_exclude: true
tags: [dft, casscf, weyl-chamber, noon-spectrum, active-space, quantum-chemistry, correlation, grassmannian, mge, h-k-ladder, trs-framework]
portfolio: A
---

## DFT knows when it fails — you just need to listen to the right signal

*Plain-language explainer for [doi:10.5281/zenodo.21346077](https://doi.org/10.5281/zenodo.21346077) (#596)*

---

## The problem

Density Functional Theory (DFT) is the workhorse of computational chemistry. It is fast, scalable, and correct for most molecules near their equilibrium geometry. But it fails — silently and badly — for bond-breaking reactions, transition-metal catalysts, and strongly correlated systems. The errors can exceed 20 kcal/mol: enough to reverse a predicted reaction outcome.

The standard response: expert chemists recognise the problematic systems by intuition and run more expensive multi-reference methods (CASSCF, CASPT2, MRCI). Non-experts are left guessing.

**This paper gives DFT a failure detector:** a cheap pre-screening step that automatically identifies where DFT will fail, routes those regions to the minimal corrective method, and leaves the rest for DFT.

---

## The signal: NOON spectrum and the Weyl c₂ coordinate

The key insight comes from the **NOON spectrum** — the natural orbital occupation numbers obtained by diagonalising the one-particle density matrix from a cheap MP2 calculation:

- σ₀² ≈ 1.0 (doubly occupied or empty): uncorrelated, H⁰ regime, DFT works
- σ₀² ∈ (0.88, 1.0): weakly correlated, H¹ regime, CCSD suffices
- σ₀² < 0.88: strongly correlated, H² regime, DFT fails, CASSCF required

The threshold 0.88 corresponds to the **β* snap** — the Schubert variety boundary on the Grassmannian Gr(k,n). This is not a fitted parameter: it is the locus in orbital-occupation space where the wavefunction topology changes qualitatively, and DFT's exchange-correlation functional (parameterised on weakly correlated systems) loses contact with reality.

**Correlation with DFT error:** Pearson r(c₂, |E_DFT − E_FCI|) = **0.990** across all tested systems. The Weyl c₂ coordinate is a near-perfect predictor of where DFT is wrong.

---

## Why DFT fails where it does: the derivative discontinuity is a topological boundary

DFT fails at strong correlation not because of insufficient basis sets or missing dispersion — it fails because the exact XC functional has a **derivative discontinuity** at integer occupation numbers, and approximate functionals cannot reproduce this.

The ISA interpretation: the derivative discontinuity is the Schubert variety boundary c₂ = δ* in the Weyl chamber. DFT is parameterised on training data from H⁰ and H¹ systems; it cannot represent the non-local entanglement structure (H² BIND content) of strongly correlated wavefunctions. The error is not numerical — it is topological. The wavefunction has changed qualitative character, and DFT's functional form cannot follow.

This is why adding more basis functions, using hybrid functionals, or increasing the DFT integration grid does not fix strong correlation: you cannot reach H² from H¹ by continuous deformation of the XC functional parameters.

---

## The routing algorithm

Given a molecule, the Weyl router proceeds in three steps:

**Step 1 — Cheap pre-screen (MP2 NOON, ~1 min):**
Run MP2. Extract NOON spectrum. Compute the proxy Grassmannian angle:
$$\theta_G \approx 90° \times (1 - |2n_{\rm HOMO} - 1|)$$
Map each orbital pair to its Weyl stratum: H⁰ (frozen), H¹ (CCSD), or H² (CASSCF).

**Step 2 — Route by tier:**
- H⁰ pairs (σ₀² > 0.99): re-freeze. No correlation energy missed — the Bredon cohomology H²_L = 1 theorem guarantees the error is topologically suppressed.
- H¹ pairs (0.88 < σ₀² < 0.99): CCSD. Single-reference correlation is sufficient in this stratum.
- H² pairs (σ₀² < 0.88): CASSCF. The minimum active space is exactly the H² pairs identified by the screen.

**Step 3 — Targeted expensive calculation:**
Run CASSCF only on the identified H² pairs. For most molecules, this is 0–2 orbital pairs — a minimal active space. The remaining orbitals are handled by DFT or CCSD.

**Speedup:** 7–36× over full CASSCF for the test molecules, with sub-kcal/mol accuracy in the H⁰ and H¹ strata.

---

## Key experimental results

**x596a — θ_G proxy validation** (6/6 PASS):
The cheap MP2-based θ_G proxy predicts the true CASSCF θ_G with r = 0.899 on 8 molecules (H₂, N₂, F₂, CO, H₂O, Fe²⁺, benzene, ozone). The proxy correctly identifies all H² systems (4/4) and all H⁰/H¹ systems (4/4).

**x596b — DFT error correlation** (r = 0.990):
Weyl c₂ vs |E_DFT − E_FCI| across 30+ geometries and 6 molecules. The correlation is tighter than any single molecular descriptor previously reported.

**x596c — N₂ active space** (CASSCF(4,4)):
N₂ at R = 1.8 Å: two H² π-bond pairs identified. CASSCF(4,4) captures 75% of correlation energy; 12.9× speedup over CASSCF(10,8). Active space selection is automatic — no expert knowledge required.

**x596d — Fe²⁺ spin-crossover** (CASSCF, def2-TZVP):
Fe²⁺ d-electron configuration: CI ratio 36× over Hartree-Fock. The spin-augmentation rule (β_eff → β_eff/(2S+1) for open-shell transition metals) correctly routes the high-spin state to CASSCF while leaving the low-spin state in the CCSD stratum.

**x596e — MGE soft router** (continuous interpolation):
The hard threshold c₂ = δ* is the T→0 limit of the MGE soft router:
$$p_{\rm CASSCF} = \sigma\!\left(\beta_{\rm eff}\,(c_2 - \delta^*)\right), \quad \beta_{\rm eff} = \frac{\Delta_{\rm HL}}{k_{\rm corr}(2S+1)}$$
The continuous interpolation smooths the routing decision: p ranges from 0.024 (N₂ at equilibrium, DFT safe) to 0.911 (N₂ at R = 1.8 Å, CASSCF essential). Every hard threshold in science is the T→0 limit of an MGE — this is Paper 597's thesis applied here.

---

## The spin-augmentation rule for transition metals

Open-shell transition metals require a correction to the routing rule. A high-spin Fe²⁺ (S=2, 2S+1=5) complex has NOONs near 1.0 in the HF limit, but those near-integer NOONs reflect Pauli exchange (the spin-1 condition forcing each orbital to be singly occupied), not uncorrelated H⁰ character.

The fix: reduce β_eff by the spin multiplicity factor:
$$\beta_{\rm eff} = \frac{\Delta_{\rm HL}}{k_{\rm corr}(2S+1)}$$

This correctly softens the routing probability for high-spin systems, routing them to CASSCF even when their NOON spectrum looks H⁰-like. Confirmed: Fe²⁺ with 2S+1=5 routes correctly to CASSCF while low-spin (2S+1=1) routes to CCSD.

---

## What this paper does not claim

- The Weyl router is not a replacement for expert knowledge in extreme cases (FeMoco, actinide complexes with f-electrons in the active space)
- The θ_G proxy underestimates the true angle for strongly ionic systems (electrostatic charge separation mimics orbital correlation in the NOON signal)
- The r = 0.990 correlation is on a 30-point test set; it needs validation on larger, more diverse benchmarks
- The Bredon H²_L = 1 guarantee for H⁰ freezing is rigorous; the H¹ → CCSD routing is empirically validated but not proved with the same rigour

---

*See also:*

- [Grassmannian Compression](https://doi.org/10.5281/zenodo.21309088) (#594) — CASSCF as geodesic on Gr(k,n); Schubert halt condition; Maslov index
- [Weyl Chamber Homology](https://doi.org/10.5281/zenodo.21345107) (#595) — the Weyl c₂ coordinate; Bredon cohomology H²_L = 1; topology of 2-qubit gates and orbital pairs
- [Orbit Processing Unit](https://doi.org/10.5281/zenodo.21360838) (#598) — the OPU theory; the β* snap as the halting condition of the Grassmannian tape
- [Universal Chemical Bonding](https://doi.org/10.5281/zenodo.21277821) (#570) — the same Grassmannian geometry in the bonding context

*For the full technical treatment, see [doi:10.5281/zenodo.21346077](https://doi.org/10.5281/zenodo.21346077)*
