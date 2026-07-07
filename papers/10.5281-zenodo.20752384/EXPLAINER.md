---
layout: default
title: "Planck's Constant in Disguise"
parent: Explainers
nav_exclude: false
tags: [semiring-deformation, maslov, tropical, cole-hopf, black-scholes, sinkhorn, kantorovich, viterbi, forward-backward, hamilton-jacobi, schrodinger, burgers, planck, duality, unification]
portfolio: A
---

## Five Famous Equations Are All the Same Equation

*Plain-language explainer for [doi:10.5281/zenodo.20752384](https://doi.org/10.5281/zenodo.20752384) (#443)*

---

## The central idea in one sentence

The Schrödinger equation, the heat equation, Black-Scholes, entropic optimal transport, the Viterbi algorithm, and quantum group representation theory are six instances of a single algebraic operation — the β-softmin — and in every case the parameter that controls the "softness" is playing exactly the role that Planck's constant plays in quantum mechanics: it is a coordinate on the β-plane.

---

## The one operation

Define the **β-softmin** of two numbers $a$ and $b$:

$$a \oplus_\beta b = -\frac{1}{\beta}\log\!\left(e^{-\beta a} + e^{-\beta b}\right)$$

- When $\beta$ is large: $a \oplus_\beta b \to \min(a, b)$ — the smaller one wins outright
- When $\beta$ is small: $a \oplus_\beta b \to \frac{a+b}{2}$ — both contribute equally

This is the LogSumExp operation familiar from machine learning, where it appears as the "temperature" of a softmax. The paper's claim: every one of the five famous equations below is what you get when you apply this operation with a different physical interpretation of β.

---

## The five pairs

### 1. Schrödinger ↔ Hamilton-Jacobi (bridge: ħ)

**Quantum side (small β):** The Schrödinger equation describes a quantum particle exploring all paths simultaneously — interference, superposition, the whole quantum story.

**Classical side (large β):** The Hamilton-Jacobi equation describes a classical particle following the single path of least action.

**The bridge:** Substitute $\psi = e^{iS/\hbar}$ and let $\hbar \to 0$. The Schrödinger equation becomes Hamilton-Jacobi. Planck's constant $\hbar$ is β in disguise — it controls how "spread out" the particle is over paths.

### 2. Heat equation ↔ Inviscid Burgers (bridge: ν viscosity)

**Smooth side:** The heat equation describes diffusion — temperatures average out, solutions stay smooth.

**Shock side:** The inviscid Burgers equation describes a compressible fluid with no viscosity. Solutions develop shocks — sudden discontinuities — in finite time. The location of shocks is a tropical geometry problem: they occur exactly where two minimum-action paths tie.

**The bridge (Cole-Hopf):** Set $v = -2\nu \nabla \log u$ where $u$ solves the heat equation. Then $v$ solves Burgers. As $\nu \to 0$, smooth solutions collapse to shocks. Viscosity is Planck's constant for fluids. **This connection to tropical geometry has not been stated before.**

### 3. Black-Scholes ↔ Hamilton-Jacobi-Bellman (bridge: σ² volatility)

**Probabilistic side:** The Black-Scholes equation prices options by averaging over all possible future price paths under Brownian motion.

**Deterministic side:** When volatility $\sigma \to 0$, prices follow a single deterministic path — the discounted payoff under the risk-free drift. This is the intrinsic value of the option.

**The bridge:** Via the Feynman-Kac formula, Black-Scholes is a heat equation in log-price space. As $\sigma^2 \to 0$, it becomes a first-order transport equation — Hamilton-Jacobi in finance. Volatility $\sigma^2$ is Planck's constant for financial markets.

### 4. Sinkhorn (entropic OT) ↔ Kantorovich OT (bridge: ε regularisation)

**Soft side:** Entropic optimal transport (the Sinkhorn algorithm) moves mass from one distribution to another, but spreads it softly — mass flows along many routes simultaneously, penalised by an entropy term ε.

**Hard side:** Classical optimal transport (the Kantorovich problem, solved by the Hungarian algorithm) moves mass along the single cheapest route. The solution is sparse — a deterministic coupling.

**The bridge:** As $\varepsilon \to 0$, the Sinkhorn solution converges to the Kantorovich solution. The Sinkhorn iteration at $\varepsilon \to 0$ becomes the Hungarian algorithm / tropical matrix permanent. Regularisation parameter ε is Planck's constant for mass transport.

### 5. Forward-Backward (HMM) ↔ Viterbi (bridge: 1/β temperature)

**Probabilistic side:** The forward-backward algorithm in a hidden Markov model computes the full probability distribution over hidden states — summing over all possible paths.

**Deterministic side:** The Viterbi algorithm finds the single most likely hidden state sequence — taking the maximum over paths instead of the sum.

**The bridge:** Replace $\sum$ with $\max$ and $\times$ with $+$ (take logs). Forward-backward becomes Viterbi. This is a semiring substitution: swap the standard (sum, product) semiring for the tropical (max, sum) semiring. Temperature $1/\beta$ is the bridge. **Despite being the most elementary instance of the duality, this is almost never stated explicitly in ML courses.**

---

## The unified table

| Pair | Soft/quantum side | Hard/classical side | Bridge variable |
| --- | --- | --- | --- |
| 1 | Schrödinger | Hamilton-Jacobi | ħ |
| 2 | Heat equation | Burgers shocks | ν (viscosity) |
| 3 | Black-Scholes | HJB / intrinsic value | σ² (volatility) |
| 4 | Sinkhorn OT | Kantorovich OT | ε (regularisation) |
| 5 | Forward-Backward | Viterbi | 1/β (temperature) |

And from [Paper 445](https://doi.org/10.5281/zenodo.20752352) — the sixth pair, discovered after this paper was written:

| 6 | Quantum group $SU(2)_k$ | Classical $SU(2)$ | $q = e^{i\pi\beta}$ (adelic modulus) |

---

---

## The sixth pair: quantum groups and the cyclotomic bridge (added after Paper 445)

When Paper 445 proved that Ising anyons live at $\beta = 1/4$ and Fibonacci anyons at $\beta = 1/5$, a sixth pair became visible:

**Standard side ($\beta \to 0$):** Classical $SU(2)$ — integer quantum dimensions $d_j = 2j+1$, the Racah 6j symbols of nuclear spectroscopy and the Origami ISA.

**Deformed side (finite $\beta$):** The quantum group $SU(2)_k$ at $q = e^{i\pi\beta}$. The representation theory truncates to finitely many spins; the Verlinde formula replaces the Plancherel formula. Topological quantum computation lives here — Ising anyons at $\beta=1/4$, Fibonacci anyons at $\beta=1/5$.

**The bridge:** $q = e^{i\pi\beta}$. This is the $\oplus_\beta$ deformation applied to representation theory — the bridge variable $q$ plays the same algebraic role as $\hbar$, viscosity, volatility, and the others.

**The conductor result (proved numerically, 2026-06-18).** The quantum dimension $d_{1/2} = 2\cos(\pi/N)$ where $N = k+2$ is a Gauss period — an algebraic integer that generates the real cyclotomic field $\mathbb{Q}(\zeta_{2N})^+$. The conductor of this field is exactly $2N = 2/\beta$:

| $k$ | $\beta$ | $d_{1/2}$ | Field | Conductor $= 2/\beta$ |
| --- | --- | --- | --- | --- |
| 2 | 1/4 | $\sqrt{2}$ | $\mathbb{Q}(\zeta_8)^+$ | 8 |
| 3 | 1/5 | $\phi$ (golden ratio) | $\mathbb{Q}(\zeta_{10})^+$ | 10 |
| 4 | 1/6 | $\sqrt{3}$ | $\mathbb{Q}(\zeta_{12})^+$ | 12 |

The cleanest statement: **the conductor of the real cyclotomic field generated by $d_{1/2}$ is $2/\beta$.**

The primes that divide $2/\beta$ are the **ramified primes** of that field — the primes non-trivially aware of the topological phase. For Ising anyons ($\beta=1/4$): only $p=2$ is ramified. For Fibonacci anyons ($\beta=1/5$): $p=2$ and $p=5$. The set of ramified primes is a fingerprint of the phase.

**What a "completion" actually means here.** Every number field has p-adic completions for each prime $p$ — this is a generic fact, not specific to our story. What is specific is which primes are *ramified*: only primes dividing $2/\beta$ see non-trivial structure. Saying the field "has Archimedean and non-Archimedean completions" is true but too generic; the real content is the conductor $= 2/\beta$ and its ramified primes.

**What is NOT p-adic.** The tropical semiring ($\min$, $+$) operates over $\mathbb{R}$ with modified operations — it is not $\mathbb{Q}_p$. An earlier version of this programme incorrectly identified the tropical limit ($\beta \to \infty$) with the p-adic world; that is wrong and explicitly disavowed. The non-Archimedean content lives at *finite* $\beta$ (the conductor structure), not at $\beta \to \infty$.

---

## Where this sits on the β-plane

Paper 543 ([doi:10.5281/zenodo.21245459](https://doi.org/10.5281/zenodo.21245459)) showed that β can be complex, negative, or p-adic — and that each choice gives a different computational regime. The six dualities in this paper are all instances of β moving along the **positive real axis**: from large β (tropical / classical / discrete) back toward small β (smooth / quantum / continuous).

The bridge variables are all coordinates on the same axis:

| Bridge variable | Physical system | β-plane interpretation |
|---|---|---|
| ℏ (Planck) | Quantum → classical | $\hbar = 1/\beta$ on the imaginary axis |
| ν (viscosity) | Heat → Burgers shocks | $\nu \propto 1/\beta$ on the real axis |
| σ² (volatility) | Black-Scholes → HJB | $\sigma^2 \propto 1/\beta$ on the real axis |
| ε (regularisation) | Sinkhorn → Kantorovich | $\varepsilon = 1/\beta$ on the real axis |
| 1/β (temperature) | Forward-backward → Viterbi | β directly |
| q = $e^{i\pi\beta}$ | Quantum group → classical SU(2) | β on the imaginary axis |

The last entry — quantum groups — is the bridge to the Meld ISA: the deformation parameter $q = e^{i\pi\beta}$ is β on the imaginary axis, exactly the Wick rotation that takes Gibbs weights to quantum amplitudes.

## What the paper is not claiming

None of the six individual dualities is new — all are known. What is new is the recognition that they are **the same duality**, and that the bridge variable in every case plays an identical algebraic role. The ML engineer's softmax temperature, the physicist's Planck's constant, the financial mathematician's volatility, and the transport theorist's regularisation are all the same object seen from different fields: a coordinate on the positive real β-axis.

This unification suggests a research programme: any model with a hard discrete limit has a soft (differentiable) counterpart connected by the β-softmin. This is the foundation of the [Differentiable Models series](/papers/315) — Papers 315 (Nash), 316 (Shapley), 442 (SIR epidemics), and beyond.

---

## The implementation

The [Maslov-Gibbs Einsum (MGE)](https://doi.org/10.5281/zenodo.17981393) is the computational realisation of this deformation — a tensor contraction operator that interpolates between standard and tropical arithmetic at finite β. The [TRS framework](https://doi.org/10.5281/zenodo.19858021) is the overarching computational architecture.

---

*See also:*
- [The Adèlic β-Plane](https://doi.org/10.5281/zenodo.21245459) (#543) — the full picture: β complex, negative, and p-adic; the six bridge variables are all coordinates on the same map; Ostrowski's theorem closes it
- [The Maslov-Gibbs Einsum](https://doi.org/10.5281/zenodo.17981393) (#201) — the computational implementation of the β-softmin as an einsum tensor contraction; the MGE Dodecagon
- [The Forge ISA](https://doi.org/10.5281/zenodo.20694527) (#419) — the positive real axis in full: snap event, vorton, thermodynamic computation at finite β
- [The Kitaev Menagerie in Origami](https://doi.org/10.5281/zenodo.20752352) (#445) — the sixth pair in detail: quantum groups, Ising/Fibonacci anyons, conductor = 2/β
- [Differentiable Nash](https://doi.org/10.5281/zenodo.20318527) (#315) — the β-softmin applied to game theory; the first paper in the Differentiable Models series

*For the full technical treatment, see [doi:10.5281/zenodo.20752384](https://doi.org/10.5281/zenodo.20752384)*
