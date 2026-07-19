---
layout: default
title: "The Maslov-Gibbs Einsum (MGE)"
parent: Explainers
nav_exclude: true
tags: [core-engine, mge, tropical, beta, maslov, gibbs, einsum, partition-function, origami-isa, forge-isa, meld-isa, ambient, dodecagon, log-sum-exp, semiring, phase-transition, snap-event, turing, adelic, beta-plane]
portfolio: A
---

## One Equation, Every Computational Model

*Plain-language explainer for [doi:10.5281/zenodo.17981393](https://doi.org/10.5281/zenodo.17981393) (#201)*

---

## The central idea in one sentence

The Maslov-Gibbs Einsum is a single parameterised equation — the Gibbs partition function written as a tensor contraction — whose behaviour changes continuously from smooth probability distribution to hard discrete logic as a single parameter β rises from zero to infinity, and which reproduces twelve foundational constructs of mathematics and computer science as exact limiting cases.

---

## The equation

$$\pi_k(\beta) = \frac{e^{-\beta E_k}}{\sum_j e^{-\beta E_j}}$$

This is the Boltzmann/Gibbs distribution, written for a system with energy levels $E_k$ and inverse temperature β. It is also the softmax function in every neural network. It is also the forward algorithm in hidden Markov models. It is also the Viterbi algorithm at the limit. It is also the attention mechanism in Transformers. These are not analogies — they are the same equation at different values of β, different index structures, or different choices of energy tensor.

The MGE is the formal packaging of this observation: write the equation as a high-dimensional **einsum tensor contraction** over an energy tensor $\mathbf{E}$, so that the same code path handles all cases by varying β and the contraction pattern.

---

## What β does

β is the inverse temperature — the single dial that controls what kind of computation you get.

| β | Arithmetic | What it computes |
|---|---|---|
| 0 | Uniform weights | The Ambient — no commitment, pure exploration |
| real, finite | Gibbs weights | Statistical mechanics; the Forge ISA |
| real → ∞ | Tropical max | Hard discrete logic; the Origami ISA |
| imaginary ($it$) | Complex phases | Quantum amplitudes; the Meld ISA |
| negative | Inverted Boltzmann | Population inversion; lasers |
| complex ($\sigma + it$) | Damped oscillation | PT-symmetric quantum mechanics |
| p-adic | Ultrametric | p-adic computation |

The transition from Gibbs weights to the tropical maximum is the key limit. As β → ∞, the softmax concentrates all weight on the single lowest-energy configuration:

$$\lim_{\beta \to \infty} \frac{e^{-\beta E_k}}{\sum_j e^{-\beta E_j}} \;\to\; \delta_{k,\,\mathrm{argmin}_j\, E_j}$$

A smooth probability distribution over all paths collapses to a point — the ground state. This is Maslov dequantisation: the passage from the real number field to the tropical semiring $(\mathbb{R} \cup \{-\infty\}, \max, +)$. The **snap event** at $\beta^\star$ is the threshold at which the distribution commits to its answer.

The domain of β is not just the positive real axis. Paper 543 ([doi:10.5281/zenodo.21245459](https://doi.org/10.5281/zenodo.21245459)) establishes that the complete parameter space is the **adèlic β-plane** — the product of the real line and all p-adic completions of ℚ. Ostrowski's theorem shows this is exhaustive: every non-trivial absolute value on ℚ is either Archimedean (giving ℝ) or p-adic (giving ℚ_p).

---

## The MGE Dodecagon: twelve constructs, one equation

The paper demonstrates that twelve foundational constructs across mathematics, physics, and computer science are exact limiting cases of the MGE at specific values of β and specific contraction patterns:

| Construct | β regime | Field |
|---|---|---|
| Softmax / attention | Finite real | Machine learning |
| Boltzmann distribution | Finite real | Statistical mechanics |
| Gibbs free energy | Finite real | Thermodynamics |
| Log-sum-exp | Finite real | Convex analysis |
| Viterbi algorithm | Large real | Sequence decoding |
| Tropical maximum | Large real | Tropical geometry |
| Dynamic programming | Large real | Combinatorial optimisation |
| Optimal transport (Sinkhorn) | Finite real | Geometry / logistics |
| Forward-backward algorithm | Finite real | Hidden Markov models |
| Hamilton-Jacobi equation | Large real | Control theory |
| Schrödinger bridge | Imaginary | Quantum mechanics |
| Extreme value statistics (Gumbel) | Large real | Probability theory |

These are not approximations or analogies. Each is obtained by choosing the right index structure for $\mathbf{E}$ and taking the appropriate limit of β. The MGE is the common parent.

---

## Turing completeness

Turing completeness follows directly from the tropical convergence result — no appeal to specific universal automata required.

Any single Turing machine step is a finite-state transduction: a lookup table $T_{i_1 \dots i_k}$ mapping a finite neighbourhood of tape symbols and head states to a new symbol, direction, and state. Such a table is a finite tensor with a positive spectral gap $\delta > 0$. The MGE recovers it exactly at β → ∞, with error bounded by $\mathcal{O}(e^{-\beta\delta})$. Since MGE steps compose — the output weight vector of one step is a valid input to the next — the MGE can simulate any sequence of Turing machine transitions.

This makes Turing completeness a **corollary of the convergence theorem**, not a separate empirical claim.

---

## Three geometric invariances

Beyond the dodecagon, the paper establishes three structural properties of the MGE:

**1. Conformal invariance.** Uniform scaling of all energies $E_k \mapsto \lambda E_k$ is equivalent to rescaling β → β/λ. The shape of the distribution is invariant under joint rescaling — only the ratio $\beta / \Delta E$ matters.

**2. Symplectic volume preservation.** The flow on the probability simplex induced by varying β preserves symplectic volume (Liouville's theorem). The MGE is a Hamiltonian flow on the space of distributions.

**3. Adiabatic topological protection.** If β is ramped slowly relative to the spectral gap, the ground state is tracked adiabatically. The convergence rate is exponential: $\mathcal{O}(e^{-\beta \Delta E})$.

---

## The ISA trilogy

The MGE is the engine underneath all three operative ISAs:

**Origami ISA** (β → ∞): the tropical limit — the MGE frozen to its ground state. Classical Boolean logic, dynamic programming, shortest paths.

**Forge ISA** (β real, finite): the MGE in full Gibbs mode — statistical mechanics, annealing, thermodynamic computation. The snap event $\beta^\star$ separates the exploratory phase from the committed phase.

**Meld ISA** (β = it): Wick-rotate β to imaginary — the MGE becomes a sum of complex phases, i.e. a quantum amplitude. Clifford circuits live here as the quantum tropical semiring; the T gate is the first non-Clifford operation because $e^{i\pi/4}$ is 2-adically non-integral.

The **Ambient** (β = 0) is the uniform limit: no energy landscape, no preference, pure Hodge theory. All three operative ISAs precipitate from the Ambient as β moves away from zero.

---

## The adèlic β-plane extensions (v16)

**Negative β:** When β < 0, the MGE inverts — the highest-energy state receives the largest weight. This is precisely a population inversion: the condition for stimulated emission in laser physics. The Ambient (β = 0) is the boundary between absorption and emission.

**Complex β = σ + it:** Interpolates between the thermal and quantum regimes. The exceptional points of PT-symmetric Hamiltonians — where two eigenvalues coalesce — are branch points of the partition function $Z_\beta$, loci where $\frac{1}{\beta}\log Z_\beta$ has a branch cut. The Berry phase around such a branch point is the TWIST opcode of the Forge ISA.

**p-adic β:** The p-adic completions of ℚ attach at β = 0 (the Ambient), not at β → ∞. The Clifford group's matrix entries are 2-adically integral; the T gate's entry $e^{i\pi/4}$ is not. The magic gap between Clifford and universal quantum computation is a p-adic integrality condition, invisible on the real axis alone.

**Palmer's $I_U$:** The Invariant Set Postulate's measure-zero fractal subset of Hilbert space is the adèlically integral slice — states whose p-adic valuations are non-negative for every prime p. Cantor-like in real measure, but p-adic measure one.

---

## What this paper does and does not claim

The softmax, Viterbi, log-sum-exp, and Boltzmann distribution were all known before this paper. What is new is:

1. The formal unification as a single parameterised tensor contraction (the einsum packaging)
2. The MGE Dodecagon — systematic enumeration of the twelve limiting cases
3. The three geometric invariances (conformal, symplectic, adiabatic)
4. Turing completeness as a direct corollary of the convergence theorem
5. The identification of β as a coordinate on the adèlic β-plane whose full domain determines the computational regime

The MGE is not the equation that computes things. It is the equation that explains why so many different computations are the same thing.

---

*See also:*

- [The Adèlic β-Plane](https://doi.org/10.5281/zenodo.21245459) (#543) — the full parameter space: β complex, negative, and p-adic; Ostrowski's theorem closes the map; PT-symmetry; Palmer's $I_U$
- [Planck's Constant in Disguise](https://doi.org/10.5281/zenodo.20752384) (#443) — six classical dualities (Cole-Hopf, Black-Scholes, Sinkhorn, Viterbi, Hamilton-Jacobi, quantum groups) as semiring deformations of the MGE
- [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) (#419) — the positive real axis: snap event, vorton architecture, thermodynamic computation at finite β
- [The Meld ISA](https://doi.org/10.5281/zenodo.20773563) (#454) — the imaginary axis: Wick rotation, quantum algorithms, T-gate as obstruction
- [Hodge Theory as the Smooth Limit](https://doi.org/10.5281/zenodo.20684838) (#417) — the β = 0 Ambient: discrete algorithms as tropical shadows of smooth manifold problems

*For the full technical treatment, see [doi:10.5281/zenodo.17981393](https://doi.org/10.5281/zenodo.17981393)*
