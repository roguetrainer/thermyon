---
layout: default
title: β-plane
nav_order: 5
description: "The four ISA regimes of the TRS framework: Origami (β → ∞), Forge (finite β), Meld (β = it), and the Harmonic ISA (β → 0, Hodge) — plus the p-adic and adèlic extensions."
tags: [isa, forge, meld, ambient, harmonic, hodge, beta, snap, mge, gibbs, wick-rotation, tropical, complexity]
portfolio: B
---

# The Operative and Harmonic ISAs
{: .no_toc }

*The TRS framework has four ISA regimes. Three are **operative**: they run
programmes by composing local opcodes over a finite state space — Origami
(β → ∞, tropical), Forge (finite β, thermodynamic), and Meld (β = it, quantum).
The fourth is the **Harmonic ISA** (β → 0): it computes by global relaxation to
harmonic representatives on the smooth manifold from which all three operative
ISAs are carved.*
{: .fs-5 .fw-300 }

---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## The β parameter

β is the **inverse temperature** of the ISA. It is the single dial that controls
which arithmetic the opcodes run over:

$$\pi_k(\beta) = \frac{e^{-\beta E_k}}{\sum_j e^{-\beta E_j}}$$

This is the **Maslov-Gibbs Einsum (MGE)** — the core operation of the entire
framework ([Paper 201](https://doi.org/10.5281/zenodo.17981393)). The β parameter
has two natural extensions from the real positive axis:

| β | Arithmetic | ISA | Regime |
|---|-----------|-----|--------|
| $\beta \to \infty$ | Tropical $(\max,+)$ | Origami (tropical limit) | Frozen; classical; discrete logic |
| $0 < \beta < \infty$ | Real Gibbs ($\mathbb{R}_{>0}$) | Forge | Statistical; thermodynamic; snap at $\beta^*$ |
| $\beta = it$ | Complex ($\mathbb{C}$) | Meld | Quantum; interference; unitary |
| $\beta \to 0$ | Uniform; smooth Hodge | *The Ambient* | Hodge decomposition; harmonic representatives |

The three ISAs are not three different instruction sets — they are the same opcodes
evaluated over three different semirings. The Ambient is not an ISA at all; it is
the smooth manifold from which all three are carved.

---

## The Tropical Limit: Origami at β → ∞

As β → ∞ the Gibbs softmax collapses to the tropical argmax:

$$\lim_{\beta\to\infty} \frac{e^{-\beta E_k}}{\sum_j e^{-\beta E_j}} = \begin{cases} 1 & k = \arg\min_j E_j \\ 0 & \text{otherwise} \end{cases}$$

This is the **tropical $(\max,+)$ semiring**: addition becomes max, multiplication
becomes addition. Polynomial equations become piecewise-linear; algebraic varieties
become polyhedral fans. In this limit the Origami ISA is deterministic, classical
logic — the zero-temperature regime in which the system always picks the
lowest-energy path.

**The tropical limit is the crystal precipitated from the Ambient.** Every
discrete opcode is what survives when the smooth Ambient is frozen to zero temperature.
This is the direction of the relationship: smooth first, discrete as a limit.
Note that Origami — as the five-opcode family — is not confined to this limit;
the tropical regime is one instantiation of the Origami opcodes, evaluated over
$(\max,+)$ rather than over $\mathbb{C}$ or the Gibbs semiring.

---

## The Forge ISA: 0 < β < ∞

At finite β the system explores: lower-energy paths are favoured, but higher-energy
paths still have nonzero weight. This is **thermodynamic computation**.

The Forge ISA ([Paper 419](https://doi.org/10.5281/zenodo.20694527)) is the
statistical regime of the ISA trilogy. Its key features:

**The vorton architecture.** The Forge ISA executes programmes on *vortons* —
topological excitations that carry angular momentum and persist as metastable states
at finite temperature. A vorton is a TWIST-stabilised excitation: it exists because
the ribbon element θ_V has nonzero amplitude at finite β. At β → ∞ (Origami),
vortons freeze into classical spin states. At β → 0 they dissolve back into the
Ambient — the high-entropy limit where all paths are equally weighted.

**The snap event.** As β rises through the threshold β*, the MGE undergoes a
spontaneous **phase transition** — a *snap* — from exploratory (soft) to
crystallised (hard) weighting:

$$\beta^* = \frac{3}{8} \ln\!\frac{1}{1-\rho}$$

where ρ is the edge density of the interaction graph. Below β* the system is in
the H¹ regime — diffuse, exploring, statistically correctable. At β* it crosses
into H⁰ — crystallised, deterministic, classical. The snap event is TWIST failure:
the quantum dimension $d_{1/2}(\beta) = 2\cos(\pi\beta)$ reaches zero at
$\beta^* = \tfrac{1}{2}$ (the BKT transition in the SU(2)_q family).

**Auto-annealing.** The Forge ISA does not require an external annealing schedule.
The G₂ geometry of the interaction tensor self-organises: geometric frustration
spikes the energy $E_k$ during chaotic exploration, causing Boltzmann freeze-out;
at convergence the frustration dissolves and routing relaxes back to uniform.

**The β-ladder.** The snap threshold β* acts as a universal phase boundary:

| β | $\alpha$-connection | Phase | ISA state |
|---|---------------------|-------|-----------|
| $\beta \to 0$ | $\alpha = +1$ ($e$-flat) | Maximum entropy | The Ambient |
| $0 < \beta < \beta^*$ | $0 < \alpha < 1$ | Exploratory | H¹ / Forge (below snap) |
| $\beta = \beta^*$ | $\alpha = 0$ (Levi-Civita) | BKT / curvature maximum | Snap boundary |
| $\beta > \beta^*$ | $-1 < \alpha < 0$ | Crystallising | H⁰ / Origami approach |
| $\beta \to \infty$ | $\alpha = -1$ ($m$-flat) | Classical / tropical | H⁰ / Origami |

---

## The Meld ISA: β = it

The **Wick rotation** $\beta \to it$ leaves the real axis entirely and enters the
complex plane:

$$e^{-\beta E_k} \xrightarrow{\;\beta = it\;} e^{-itE_k}$$

This is the Schrödinger equation. Real Boltzmann weights become complex amplitudes;
statistical mechanics becomes quantum mechanics; the Forge ISA becomes the
**Meld ISA** ([Paper 454](https://doi.org/10.5281/zenodo.20773563)).

The Wick rotation is not an analogy — it is an exact algebraic substitution in the
MGE. Every Forge ISA programme has a Meld version obtained by replacing β with it.
The MGE becomes a unitary evolution operator; the partition function becomes the
path integral; the snap threshold β* becomes the boundary between thermal and
quantum fluctuation dominance.

**What the Wick rotation does to each opcode:**

| Opcode | Forge (real β) | Meld (β = it) |
|--------|----------------|---------------|
| ORBIT | Gibbs fan-out; soft copy | Unitary fan-out; QFT mode splitting |
| LABEL | Gibbs projection; soft measurement | Born rule measurement |
| TWIST | Thermal phase $e^{-\beta\theta}$ | Quantum phase $e^{-it\theta}$; Berry phase |
| FLIP | Real time-reversal / partition trace | Anti-unitary time-reversal; Kramers; quantum trace |
| BIND | Thermal recoupling | Unitary $F$-matrix; non-Abelian anyon braiding |

**The T-gate is the Meld-only opcode.** The T-gate — the gate that promotes
Clifford circuits to universal quantum computation — cannot be expressed as a real
Gibbs weight at any β. Its phase $e^{i\pi/4}$ is what the Wick rotation
$\beta \to it$ introduces and the real axis cannot supply. In ISA terms, the
T-gate is a TWIST opcode carrying a complex phase invisible to the Forge regime.

**Clifford vs magic: a phase ladder.** The Clifford group uses only phases that
are 4th roots of unity — $\{1, i, -1, -i\}$, multiples of $e^{i\pi/2}$. These
are classically simulable (Gottesman-Knill). The T-gate introduces $e^{i\pi/4}$,
an 8th root of unity: outside the Clifford phase group, hence *magic*. The
general principle is that phases $e^{i\pi k/2^n}$ — rational multiples of π at
finer and finer fractions — climb a ladder of increasing magic content. Irrational
phases (e.g. $e^{i\theta}$, $\theta/\pi \notin \mathbb{Q}$) sit at the top: they
cannot be built from any finite gate set and are never reached by a finite circuit.
Universal quantum computation needs only one step up this ladder — from 4th to 8th
roots of unity — which is what the T-gate provides.

BIND at the octonion / $G_2$ rung is a *stronger* structure needed for
**topological quantum computation** — fault-tolerant universality via Fibonacci
anyons and non-Abelian braiding. This is the 731-ISA extension, not standard
qubit universality. Building an octonionic quantum computer would require
physical hardware that braids non-Abelian anyons — a technology that does not yet
exist in any laboratory. The two levels are:

| Level | Gates | BIND rung | Universality | Fault tolerance |
| --- | --- | --- | --- | --- |
| Standard QC | Clifford + T | SU(2), $j=1/2$ (associative) | Yes (BQP) | Requires error correction |
| Topological QC | Clifford + Fibonacci braid | $G_2$ / octonion (non-associative) | Yes (BQP) | Built-in (anyon braiding) |

The 731-ISA reaches the second level. Standard Meld ISA suffices for the first.

---

## The Harmonic ISA: β → 0

The **Harmonic ISA** is the β → 0 limit of the MGE — the smooth, maximum-entropy
manifold from which all three operative ISAs are carved. Unlike the operative ISAs,
it does not execute programmes by composing local opcodes. Instead it computes by
**global relaxation to harmonic representatives**: given a differential form, find
the unique element of its cohomology class that satisfies $\Delta \omega = 0$.
This is a definite computation with definite outputs — it is an ISA, but of a
different kind.

**The Harmonic ISA opcodes:**

| Opcode | Harmonic (β → 0) incarnation |
| --- | --- |
| ORBIT | Hodge decomposition: $\omega = d\alpha + d^{*}\beta + \gamma$ |
| LABEL | Projection onto harmonic subspace ($\ker \Delta$) |
| TWIST | Exterior derivative $d$ (raises form degree) |
| FLIP | Hodge star $\star$ (degree reversal; discrete ↔ smooth duality) |
| BIND | Wedge product $\wedge$ (associative cup product in cohomology) |

The output of a Harmonic ISA programme is always a **harmonic form** — the
canonical, unique representative of a cohomology class. The H^k cohomology
groups that the operative ISAs traverse as a complexity ladder are *defined* by
the Harmonic ISA: H^k = ker(d) / im(d), and the Harmonic ISA selects the
distinguished element of each class.

**What makes it different from the operative ISAs:**

The three operative ISAs share an execution model: local opcodes, sequential
composition, finite-dimensional state, β as a fixed parameter. The Harmonic ISA
breaks each of these:

- Opcodes act *globally* on the whole manifold (differential operators, not gates)
- Execution is *relaxation*, not sequential composition
- State space is infinite-dimensional (smooth function space)
- β is not a parameter — it is zero; the continuum limit has been taken

This is why the Harmonic ISA feels different: it is the *physics* from which the
operative ISAs emerge as discrete shadows, not a programme you step through.

**Why the three operative ISAs need it:**

- The Origami ISA is the **tropical crystal precipitated from the Harmonic ISA**:
  β → ∞ freezes the smooth harmonic measure to a tropical argmax.
- The Forge ISA is the **thermodynamic engine between harmonic and crystalline**:
  finite β interpolates between the two.
- The Meld ISA is a **Wick slice through the Harmonic ISA**: β = it picks out the
  quantum-mechanical structure latent in the smooth manifold.

**What computes in the Harmonic regime:**

- Hodge theory — the H^k cohomology of which the Forge/Origami ladder is the
  discretisation
- Optimal transport and Sinkhorn scaling — Forge programmes approaching the
  Harmonic ISA as regularisation → 0
- Diffusion models and score matching — operate near β → 0, sharpening
  iteratively toward discrete outputs
- LP and SDP relaxations — Harmonic-level continuous relaxations of Origami
  (discrete) problems

The Harmonic ISA does not yet have a dedicated paper. It is named and defined
here as the smooth β → 0 limit of the MGE and the fourth member of the ISA
family — distinct in kind from the operative three, but an ISA nonetheless.

---

## The full picture

The four ISAs live in the **complex β-plane** — a single
structure indexed by β ∈ ℂ ([Paper 543](https://doi.org/10.5281/zenodo.17981393)):

```
                Im(β)
                  ↑
                  │         Meld ISA  (β = it: quantum, unitary, ℂ amplitudes)
                  │        /
                  │       / Wick rotation
                  │      /
  ─────────────┬──┼──────────────────────────────────→ Re(β)
               │  │
        The    │  0     Forge ISA        Origami ISA
        Ambient      ←──────────────────────────────→
               β→0    (0 < β < ∞)       (β → ∞, tropical)
```

Each prime p adds a **p-adic axis** into the β-plane, carrying the p-adic ISA
(U-MGE over ℤ_p, NTT as QFT, Hensel lifting as optimisation). The full
**adèlic β-plane** has one real axis and one p-adic axis per prime:

| β | Arithmetic | ISA | Key operation |
| --- | --- | --- | --- |
| $\beta \to \infty$ | Tropical $(\max,+)$ | Origami | Argmax; discrete logic |
| $0 < \beta < \infty$ | Gibbs ($\mathbb{R}_{>0}$) | Forge | Snap at $\beta^*$; annealing |
| $\beta = it$ | Complex ($\mathbb{C}$) | Meld | Unitary; T-gate; interference |
| $\beta \to 0$ | Uniform; Hodge | *Harmonic ISA* | Hodge decomposition; harmonic representatives |
| $\beta \in \mathbb{Q}_p$ | p-adic ($\mathbb{Z}_p$) | U-MGE / p-adic ISA | NTT = QFT; Hensel = VQE |
| $\beta \in \mathbb{A}_\mathbb{Q}$ | Adèlic ($\mathbb{A}$) | Adèlic ISA | All primes simultaneously |

**Which ISA should I use?**

*Operative ISAs* (local opcodes, sequential composition, finite state):

- **Origami** — discrete, combinatorial, zero temperature. Protein structure
  (Ramachandran), nuclear spectroscopy, classical algorithms.
- **Forge** — probabilistic, thermodynamic, finite temperature. Annealing,
  belief propagation, kinetic proofreading. Snap at β* separates H¹ from H⁰.
- **Meld** — quantum, unitary. QFT, anyons, Shor's algorithm, magic state
  distillation. T-gate for universality; 731-ISA for topological QC.
- **p-adic ISA** — exact integer arithmetic, ultrametric geometry. Lattice-based
  cryptography (NTT), p-adic VQE (Hensel lifting), p-adic Grover.

*Harmonic ISA* (global relaxation, infinite-dimensional state):

- **Harmonic** — continuous optimisation, smooth geometry. Hodge decomposition,
  diffusion models, optimal transport, LP/SDP relaxations. The manifold from
  which the operative ISAs precipitate.

The 731-ISA extends the diagram along a third axis — *associativity* — adding
the BIND opcode and reaching the 𝕆-rung. See
[The Non-Associative Frontier](./non-associative-frontier.md).

**Ostrowski's theorem** guarantees completeness: the only completions of ℚ are
ℝ and ℚ_p. The adèlic product ℝ × ∏_p ℚ_p contains every possible β. The ISA
trilogy plus the p-adic ISAs form a *complete* set of arithmetic modes — there
is no other place for β to live.

---

## Where each regime appears

| Domain | Origami (β → ∞) | Forge (0 < β < ∞) | Meld (β = it) | Harmonic (β → 0) |
|--------|----------------|------------------|---------------|---------------------|
| Computation | Classical logic; discrete optimisation | Probabilistic inference; annealing | Quantum circuits; BQP | Continuous optimisation; gradient flow |
| Physics | Spectroscopy; nuclear structure | Statistical mechanics; phase transitions | QFT; anyons; Berry phase | Hodge theory; smooth field theory |
| Biology | Protein structure (Ramachandran) | Kinetic proofreading; chaperones | Photosynthetic coherence (FMO) | Protein energy landscape geometry |
| Finance | Arbitrage-free pricing (H¹ = 0) | Risk hedging at finite volatility | — | Continuous-time stochastic calculus |
| Information | Tropical codes; max-plus automata | Gibbs sampling; belief propagation | Stabiliser QEC; magic state distillation | Diffusion models; optimal transport |

---

## Key papers

- **[The Forge ISA](https://doi.org/10.5281/zenodo.20694527)** (Paper 419) — snap event; vorton architecture; thermodynamic computation; β-ladder
- **[The Meld ISA](https://doi.org/10.5281/zenodo.20773563)** (Paper 454) — Wick rotation; Clifford = Meld without BIND; Shor as Origami/Meld/Origami programme; T-gate as BIND
- **[The Origami ISA](https://doi.org/10.5281/zenodo.19916429)** (Paper 258) — the classical β → ∞ ISA; opcode definitions
- **[Planck's Constant in Disguise](https://doi.org/10.5281/zenodo.20752384)** (Paper 443) — six equations from six fields are the same MGE at different β; the fastest entry point
- **[The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526)** (Paper 420) — H⁰/H¹/H² as β regimes; TWIST failure as phase boundary; β* snap threshold

*See also:* [BKT Transition / TWIST Failure](../reference/glossary.md#bkt-transition--twist-failure) ·
[Maslov-Gibbs Einsum](../reference/glossary.md#maslov-gibbs-einsum-mge) · [The Opcodes](../reference/opcodes.md)

*For number theorists and algebraic geometers:*
[The Langlands Perspective](./langlands.md) — the adèlic β-plane from the Langlands angle;
motivic L-functions as Harmonic ISA, automorphic forms as Meld ISA.
