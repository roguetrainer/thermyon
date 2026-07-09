---
layout: default
title: "Each correction to the atom halves the error"
parent: Explainers
nav_exclude: false
tags: [mean-field-theory, thomas-fermi, scott-correction, schwinger, fefferman-seco, adelic-atom, number-theory, riemann-zeta, van-der-corput, h-k-ladder, trs-framework, quantum-chemistry, atomic-physics]
portfolio: A
---

## Each correction to the atom halves the error

*Plain-language explainer for [doi:10.5281/zenodo.21250670](https://doi.org/10.5281/zenodo.21250670) (#550)*

---

## The central idea in one sentence

The successive approximations to the quantum atom — Thomas-Fermi (1927), Scott (1952), Schwinger (1981), Fefferman-Seco (1990–1994) — occupy distinct levels H⁰, H⁰′, and H¹ of the TRS cohomological ladder, and each level halves the error in the ground-state energy.

---

## The atom is harder than it looks

The ground-state energy E(Z) of a neutral atom with Z protons — the energy you need to pull all Z electrons away from the nucleus — obeys a well-known asymptotic expansion:

$$E(Z) \approx -c_{\rm TF}\, Z^{7/3} + \tfrac{1}{8}Z^2 - c_s Z^{5/3} + \Psi_Q(Z) + \cdots$$

This expansion was proved rigorously over 65 years, by Lieb-Simon (1977), Scott (1952), Schwinger (1981), and Fefferman-Seco (1990–1994). Each term is smaller than the previous by a factor of Z^{-1/3}. The question this paper asks is: *why these particular terms, in this particular order, each reducing the error by roughly half?*

The standard textbook answer is "perturbation theory." This paper argues it is something deeper: the H^k cohomological expansion applied to the atom's self-consistency problem.

---

## The H^k ladder for the atom

The four tiers of the expansion fit precisely into the ISA opcode hierarchy:

| Tier | Term | Exponent | ISA opcode |
|------|------|----------|------------|
| H⁰ | Thomas-Fermi | Z^{7/3} | ORBIT (tropical fixed point) |
| H⁰′ | Scott correction | Z² | FLIP (inner-shell, ℓ=0) |
| H¹ | Schwinger term | Z^{5/3} | TWIST (angular-momentum holonomy) |
| H¹ | Ψ_Q(Z) | Z^{4/3+ε} | TWIST partition function (orbit sum) |
| H² | Adelic atom | all Z | BIND (p-adic shell corrections) |

The Scott correction is H⁰′ rather than H¹ because it arises from the innermost 1s shell, which has zero angular momentum (ℓ = 0) and therefore no TWIST contribution. The first genuinely H¹ correction is the Schwinger term, where the angular-momentum barrier ℓ(ℓ+1)/r² acts as the TWIST potential.

---

## H⁰: Thomas-Fermi as tropical fixed point

The simplest model treats the atom as a continuous ball of electron gas in the field of the nucleus. The electron density ρ(r) satisfies a self-consistency loop: density → potential → density. Solving this loop — the Thomas-Fermi equation — gives the leading energy −c_TF Z^{7/3}.

In ISA terms this is an **ORBIT closure**: the tropical fixed point of the iteration SPLAT∘SPLIT, where SPLAT maps a density to its electrostatic potential and SPLIT fills orbitals up to the Fermi level. The atom's electron cloud converges to a fixed point in function space.

*Error on Hartree-Fock reference: 23.9%*

---

## H⁰′: Scott correction as inner-shell FLIP

The Thomas-Fermi model treats electrons as a continuous gas and misses the innermost electrons — the 1s, 2s shells — which are so tightly bound to the nucleus that they behave as individual quantum wave packets, not gas molecules. Correcting for this adds +(1/8)Z² to the energy.

This is a **FLIP**: the innermost shells flip from the TF approximation (electrons don't see the full nuclear charge Z) to the hydrogenic approximation (they do). It is H⁰′ and not H¹ because the correction involves no angular momentum: the 1s shell has ℓ = 0.

*Error after Scott: 16.2% — roughly halved.*

---

## H¹: Schwinger and Ψ_Q as the TWIST tier

**The Schwinger correction** −c_s Z^{5/3} arises from the angular-momentum barrier ℓ(ℓ+1)/r², which is the TWIST potential in the radial register. It is the first term that requires ℓ > 0 — the first genuinely H¹ correction.

**The Fefferman-Seco oscillatory sum** Ψ_Q(Z) is the most interesting object:

$$\Psi_Q(Z) = \sum_{\ell=1}^{\ell_{\rm TF}} \frac{2\ell+1}{\varphi_\ell}\,\mu\!\left(\frac{\varphi_\ell\, Z^{1/3}}{\pi}\right)$$

where φ_ℓ is the classical radial action in the ℓ-th angular-momentum channel and μ(t) = t − ⌊t⌋ − 1/2 is the sawtooth function.

In ISA language: each ℓ labels a classical periodic orbit in the TF potential (ORBIT label); φ_ℓ is the orbit's action = TWIST phase per traversal; the sawtooth μ is TWIST(φ_ℓ) acting on the Z^{1/3} register. So Ψ_Q is the **H¹ orbit partition function** — the Selberg trace formula for the TF Hamiltonian, with TWIST encoding the classical holonomy.

This identification is precise: the Selberg trace formula for a quantum system expresses the density of states as a sum over classical periodic orbits weighted by their actions. Here the TF potential is the classical system, the electron shells are the quantum states, and Ψ_Q(Z) is that trace formula.

*Error after Schwinger: 9.8% — halved again.*

---

## The halving table

| H^k level | Correction | Error on E(Z) | ISA opcode |
|-----------|-----------|---------------|------------|
| H⁰ | Thomas-Fermi | 23.9% | ORBIT |
| H⁰′ | + Scott term | 16.2% | FLIP |
| H¹ | + Schwinger term | 9.8% | TWIST |
| H² | Adelic atom (proposed) | < 9.8% | BIND[∀p] |

Each step reduces the error by a factor of roughly 0.65. This geometric convergence — observed numerically in Table 1 of the paper for noble-gas atoms Z = 10, 18, 20, 36 compared to Hartree-Fock reference energies — is the signature of a well-organised asymptotic expansion. The paper does not claim a universal constant of exactly 1/2; it claims each H^k step improves on the last.

---

## The aperiodicity condition is H¹ non-degeneracy

Bounding Ψ_Q requires the Van der Corput method, which in turn requires the **Fefferman-Seco aperiodicity condition FS8**: the TF Hamiltonian flow has no resonant periodic orbits, expressed as a lower bound on the TWIST curvature d²F/dΩ² ≥ c₀ > 0.

In ISA terms: a resonant orbit has zero TWIST curvature — its phase accumulates coherently rather than averaging out, contributing O(Z^{1/3}) instead of the smaller O(Z^{1/3−ε}) from aperiodic orbits. The computer-assisted proof of FS8 (the technically hardest step in the FS programme) is precisely the proof that every orbit's TWIST curvature is positive. The three steps of Van der Corput — Poisson summation, stationary-phase evaluation, resummation — map exactly to SPLIT / SPLAT / ORBIT.

The paper's §6.2 suggests that FS8 might be provable via the L-function connection (if the relevant Dirichlet L-function has no real zeros, FS8 follows), converting a computer-assisted numerical bound into an analytic statement. This is a speculative but well-posed open problem.

---

## The connection to the Riemann zeta function

The connection between the atom and the zeta function is precise but indirect. The chain is:

1. Ψ_Q(Z) is equivalent to a Weyl sum S(λ) where λ = Z^{1/3}, and for the TF potential this reduces to the Gauss circle problem.
2. The best-known bound on S(λ) is O(λ^{2α}), governed by the **Hardy exponent** α. The current record is α = 23/73 (Huxley 1993).
3. The size of α is controlled by the zero-free region of ζ(s) in the critical strip: a wider zero-free region gives a smaller α and therefore a tighter bound on Ψ_Q(Z).
4. The Lindelöf hypothesis (α = 1/4 + ε, a consequence of RH) would give the best possible bound.

The upshot: the accuracy of the Fefferman-Seco bound is limited by what we know about the zero-free region of ζ(s). The atom's energy asymptotics and the Riemann zeta function are connected via the Hardy exponent — not via zeta zeros appearing directly in the energy formula, but via the exponent that bounds the oscillatory sum.

---

## The adelic atom (H²)

At the H² level, the paper proposes p-adic shell corrections. At each prime p, the p-adic valuation of the angular momentum quantum number ℓ selects which shells contribute at scale p. The adelic energy is proposed as:

$$E_{\rm adelic}(Z) = E_{\rm TF}(Z)\;\prod_p\!\left(1 + \frac{\delta_p(Z)}{E_{\rm TF}(Z)}\right)$$

This Euler product structure connects atomic physics to L-functions. The p-adic corrections involve the non-Abelian Galois group Gal(Q_p^{ab}/Q_p) acting on δ_p — this is what makes them H² (BIND) rather than H¹ (TWIST). **This is a proposal, not a derived result**: the adelic corrections have not yet been computed numerically, and this is the frontier of Papers 551 and 543.

---

## The Grassmannian connection

The newer Papers 563/568/570 (July 2026) add a geometric perspective that was not available when Paper 550 was written. The Thomas-Fermi self-consistency map — the SPLAT∘SPLIT iteration — acts on electron densities, and each density determines a subspace of occupied orbitals in L²(ℝ³). The space of such subspaces is the Grassmannian Gr(N, ∞). 

The β* snap — the critical Z above which the single-configuration (TF) description becomes inadequate and shell structure takes over — is the Grassmannian angle θ_G at which the leading Schmidt singular value σ₀ drops below the multi-reference threshold. In Paper 570's language: TF = H⁰ (θ_G ≈ 0, single dominant configuration); Scott = H⁰′ correction to the innermost geodesic; Schwinger+Ψ_Q = H¹ TWIST from the off-diagonal (multi-shell) Grassmannian structure. The Fefferman-Seco programme is, from this perspective, the systematic expansion in Grassmannian angle θ_G away from the TF fixed point.

---

## Why this matters for DFT

Current density-functional theory (DFT) codes add corrections to the Thomas-Fermi approximation empirically, through exchange-correlation functionals tuned to reproduce experimental data. The H^k framing suggests a systematic alternative:

- **H⁰ DFT** = Local Density Approximation (LDA) — tropical fixed point
- **H⁰′ DFT** = Gradient corrections (GGA) — inner-shell FLIP correction  
- **H¹ DFT** = Hybrid functionals (B3LYP, PBE0) — TWIST holonomy correction
- **H² DFT** = Range-separated hybrids, RPA, coupled-cluster — BIND correction

The H^k prediction: DFT errors should decrease geometrically for each step up the ladder, independent of which functional family is used. The paper's Table 1 tests this for the asymptotic atomic case.

---

*See also:*
- [The Forge ISA](https://doi.org/10.5281/zenodo.20773514) (#419) — the ORBIT/TWIST/BIND opcodes
- [The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773520) (#420) — the β-snap threshold
- [The Adelic β-Plane](https://doi.org/10.5281/zenodo.21245459) (#543) — the complex β-plane containing the adelic atom
- [Universal Chemical Bonding](https://doi.org/10.5281/zenodo.21277821) (#570) — Grassmannian geometry of bonding; the θ_G snap that separates TF from shell-structured atoms
- [Galois Chemistry = Tropical DFT](https://doi.org/10.5281/zenodo.21224113) (#491) — the molecular H⁰ analogue

*For the full technical treatment, see [doi:10.5281/zenodo.21250670](https://doi.org/10.5281/zenodo.21250670)*
