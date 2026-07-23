---
layout: default
title: "AI & Machine Learning"
parent: Applications
nav_order: 9
description: "How the HotLogiQ framework connects to AI and machine learning: the β-temperature unification, 4-point networks, LLM geometry, differentiable Shapley values, agentic consensus, and the HPC stale-data problem."
tags: [ai, machine-learning, transformer, attention, shapley, llm, boltzmann, hopfield, bilinear, agentic, hpc, temperature]
portfolio: A
---

# AI & Machine Learning
{: .no_toc }

*The softmax temperature, Hopfield networks, matrix multiplication, and agent
voting are all the same mathematical object viewed from different angles.*
{: .fs-5 .fw-300 }

---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## The entry point: β is the softmax temperature

The softmax temperature is not an ML trick. It is the inverse temperature β
from statistical mechanics — the same dial that controls Boltzmann
distributions, Ising models, simulated annealing, and tropical arithmetic. The
ML engineer writes softmax(x/T). The statistical physicist writes exp(−βE).
The Bayesian writes exp(−βE) normalised over hypotheses. They are all the same
expression at different β:

| β regime | Limit | Computation |
|----------|-------|-------------|
| β → 0 | High temperature / max entropy | Uniform distribution; maximum uncertainty |
| β finite, real | Boltzmann / Gibbs | Probabilistic AI; statistical mechanics |
| β → ∞ | Low temperature / argmax | Tropical arithmetic; winner-takes-all |
| β ∈ ℂ | PT-symmetric / gain-loss | Hot quantum; Raven ISA |

Every hard decision threshold in ML (softmax argmax, ReLU activation, top-k
sampling) is the β→∞ limit of a smooth soft threshold. The interesting
computation happens at finite β — near the **β\* snap point** where the system
transitions between regimes.

**Paper:** [β in Disguise](https://doi.org/10.5281/zenodo.20752384) —
six famous equations from six fields (softmax, Boltzmann, Black-Scholes, Schrödinger,
Fourier, Ising) shown to be the same equation at different β. No prerequisites.

---

## The transformer as an ISA programme

The scaled dot-product attention mechanism of the transformer is a Forge ISA
programme operating in the H¹ regime:

```
ORBIT  : token similarity QKᵀ/√d — inner product on token manifold
TWIST  : softmax(·) — Berry phase; non-trivial distribution over tokens
MERGE  : weighted value aggregation Σⱼ aᵢⱼ vⱼ — contextualised representation
ORBIT  : multi-head projection via W^Q, W^K, W^V — h parallel Grassmannian points
MERGE  : Concat(heads) · W^O — head aggregation back to d_model
LABEL  : attention entropy H(aᵢ) — the ISA β* eigenvalue at each query position
```

The **Vaswani 1/√d_head normalisation** is not empirical tuning — it is the β*
calibration that keeps attention in the H¹ Forge regime (not collapsed to
argmax H⁰, not diffuse uniform H²). This is the same saddle-point optimum as
the Metropolis 0.234 acceptance rate and the MGE soft router.

The **induction head phase transition** (Olsson et al. 2022) — a sharp loss
drop at ~10⁸ training tokens when certain attention heads snap from diffuse
multi-token attention to sharp single-token attending — is a β* snap directly
observable in transformer training dynamics. Attention heads transition from
H¹ (functional, diffuse) to H⁰ (induction head, sharp retrieval).

The attention mechanism also sits on the **Grassmannian**: each of the h heads
projects token embeddings into a d_head-dimensional subspace of d_model-space —
a point on Gr(d_head, d_model). Training is gradient descent on the product
Grassmannian Gr(d_head, d_model)^h. The optimal attention configuration for a
given task is a Schubert variety in this product.

**Zoo entry:** [ML01 — Transformer Self-Attention](/isa-zoo/ml01-attention-mechanism)

**Papers:** [OPU and AlphaFold](https://doi.org/10.5281/zenodo.21360838) ·
[Information Geometry ISA](https://doi.org/10.5281/zenodo.PENDING)

---

## 4-point networks: beyond matrix multiplication

Matrix multiplication computes 2-point correlations: (Ax)ᵢ = Σⱼ Aᵢⱼ xⱼ.
This is an inner product — a sum over *pairs* of indices. A **bilinear layer**
computes 4-point correlations: yᵢ = Σⱼₖₗ Tᵢⱼₖₗ xⱼ xₖ xₗ, summing over
*quadruples* of indices.

**The experimental result (x627a):** on tasks with genuine 4-point ground truth
(degree-4 polynomial targets), a bilinear network is **1,830× more accurate**
than a matched-parameter MLP. The bilinear layer directly computes the tensor
contraction that the task requires; the MLP must learn to approximate it
through many layers of 2-point operations.

**Why 4 points?** The ISA framework identifies 4-point interactions with the
BIND opcode (δ: A→A⊗A, Frobenius comultiplication). Matrix multiplication is
a 2-point ORBIT; tensor contraction is a 4-point BIND. The categorical claim:
*any problem whose ground truth involves two entangled pairs of variables
requires BIND and cannot be efficiently expressed using only ORBIT + MERGE.*

**The task-conditional lesson:** the 4-point advantage is task-dependent.

| Task structure | Natural architecture | Advantage |
|---------------|---------------------|-----------|
| 2-point (MNIST, linear) | MLP (ORBIT + MERGE) | MLP wins |
| 4-point (relational, degree-4) | Bilinear (BIND) | 1,830× |
| 4-point multi-agent | Bilinear belief pooling (H² BIND) | Claim of Paper 629 |

The ISA provides a diagnostic: compute the Weyl c₂ index of the task's
function class. If c₂ > δ*, the task has genuine H² structure and benefits
from BIND-based architectures.

**Papers:** [The 4-Point Network](https://doi.org/10.5281/zenodo.21480272) ·
[Agentic Consensus via Bilinear Belief Pooling](https://doi.org/10.5281/zenodo.21480276)

---

## Different layers, different temperatures

A DNN is not thermodynamically homogeneous. Evidence from mechanistic
interpretability:

- **Early layers** (near input): high attention entropy H(aᵢ) ≈ log(n),
  diffuse attending to syntactic neighbours — high β⁻¹ (hot, disordered)
- **Middle layers**: intermediate entropy — β near β*, functional H¹ regime
- **Late layers / induction heads**: entropy near 0, sharp attending — β→∞
  (cold, ordered)
- **Residual stream**: each layer's residual addition is a small perturbation
  — a Langevin step at that layer's effective temperature

This is the **layerwise β profile** of the network. The framework predicts:

1. **Critical layers** are those operating near β* (the snap threshold between
   H⁰ and H¹). These are the layers that most benefit from careful tuning;
   they are also the layers where small weight changes cause qualitative
   behavioural shifts — the layers mechanistic interpretability finds most
   "interesting."

2. **β* snaps during training** are phase transitions in the network's
   effective temperature profile. Grokking (the delayed generalisation
   phenomenon) is plausibly a β* snap: the network is stuck in a local H⁰
   minimum (memorisation, β→∞) and suddenly snaps to an H¹ generalising
   solution when the temperature profile shifts.

3. **Quantisation** is a β→∞ deformation: INT8/FP4 quantisation pushes the
   effective temperature of each layer toward zero (discretises the continuous
   distribution). The ISA framework predicts that layers operating near β*
   are *most sensitive* to quantisation; layers already in H⁰ (induction
   heads, sharp attending) are insensitive.

**This suggests a research programme:** measure the layerwise β profile of a
trained network; identify β*-critical layers; apply mixed-precision
quantisation that preserves full precision only at β*-critical layers.

**Papers:** [In Praise of Soft Thresholds](https://doi.org/10.5281/zenodo.21373468) ·
[Gibbs GEMM](https://doi.org/10.5281/zenodo.PENDING) (notes only)

---

## LLM geometry: the topology of trained networks

A large language model is a sequence of linear maps on a high-dimensional
manifold. The HotLogiQ perspective asks: what is the **topological type** of
the representation manifold at each layer?

Three distinct research threads:

### Geometric skeleton of the model

The weight matrices of a trained LLM lie on low-dimensional submanifolds of
the full parameter space. The Grassmannian structure of multi-head attention
(each head = a point on Gr(d_head, d_model)) gives a natural language for
this: the **effective dimension** of a layer is the rank of its attention
weight Grassmannian under the Schubert cell decomposition.

**Compression via geometric skeleton:** instead of rank-decomposing weight
matrices (LoRA), identify the Schubert stratum of each attention head. Heads
in the same stratum have structurally identical function; one representative
suffices. This is a topologically-guided pruning rather than a
numerically-guided one.

### Cohomological obstructions to compression

Not all compression is safe. The H^k framework predicts:
- H⁰ structure (tropical/sharp attention) can be compressed without loss
  (it is already discrete)
- H¹ structure (diffuse functional attention) can be approximated but not
  eliminated without changing behaviour
- H² structure (entangled cross-layer circuits) cannot be compressed at
  all without destroying the computation — it requires the full BIND depth

The Weyl c₂ index of a circuit measures which tier it lives in. A layer with
c₂ > δ* is doing genuinely H² computation and should not be quantised or
pruned. This gives a **theoretically-grounded compression certificate**.

### Topology of the loss landscape

The loss landscape of a DNN is a Morse function on parameter space. Its
critical points are saddle points (where gradient vanishes but Hessian is
indefinite). The ISA framework connects:
- **β* snaps** during training = passage through a Morse critical point
- **Grokking** = β* snap from H⁰ (memorisation manifold) to H¹ (generalisation manifold)
- **Loss spikes** in large-batch training = brief excursion through H² territory

**Papers:** [Information Geometry ISA](https://doi.org/10.5281/zenodo.PENDING) ·
[Gibbs GEMM](https://doi.org/10.5281/zenodo.PENDING)

---

## Differentiable Shapley values

**The problem:** standard Shapley values require evaluating 2^N coalitions —
exponential in the number of players. SHAP (Lundberg 2017) approximates this
via game-theoretic sampling. Integrated Gradients (Sundararajan 2017) replaces
the combinatorial sum with a path integral, but only works for differentiable
models.

**The HotLogiQ solution:** the **thermal Shapley value** φᵢ(β).

The key idea: replace the binary coalition characteristic function v(S) ∈
{0,1} with the Gibbs ensemble Z(S,β) = Σ exp(−βE_S). At β→∞ this recovers
standard Shapley (hard coalitions); at finite β it gives a smooth
differentiable attribution that:
1. Is defined even for non-differentiable models (agent-based models,
   supply chains, stock-flow consistent macro models)
2. Has a well-defined derivative ∂φᵢ/∂β — the **thermal sensitivity** of
   attribution
3. Has a tropical limit (β→∞): attribution collapses onto the single
   bottleneck player with the largest gradient — the Shapley value of the
   tropical game

**The new diagnostic — latent bottlenecks:** a sector with large |∂φᵢ/∂β|
is a **latent bottleneck** — it appears unimportant in liquid conditions but
becomes catastrophically dominant as the system tightens. Standard Shapley
(β=∞ implicitly) and sensitivity analysis (linearised at current β) are both
blind to latent bottlenecks. They are detectable only by tracing φᵢ(β) across
the cooling schedule — the MGE audit.

**Connection to the SHAP repo:** the
[shap-explainability](https://github.com/roguetrainer/shap-explainability)
repository demonstrates practical SHAP on tabular (finance/loan approval) and
NLP (LLM sentiment) tasks. The thermal Shapley value is the theoretically
grounded extension of this practical work.

**Paper:** [Thermal Attribution](https://doi.org/10.5281/zenodo.20236870) —
notes only; target: Journal of Economic Theory / Games and Economic Behavior

---

## The HPC stale-data problem

**The bottleneck:** in large-scale distributed matrix computation (transformer
training, MoE routing, HPC simulation), the standard assumption is that all
blocks of a computation must finish before the result is used. In practice,
slow stragglers (network latency, load imbalance) force the fast workers to
idle. The straggler problem wastes 30-50% of compute in typical large-scale
training runs.

**The HotLogiQ solution (Patent 15):** relax the synchronisation constraint.
Instead of waiting for all blocks, **combine fresh and stale data using
thermodynamics.** The MGE provides the routing rule:

- A **fresh** block (computed at time t) has weight exp(−β · 0) = 1
- A **stale** block (computed at time t−τ, age τ) has weight exp(−β · τ)
- The combined result is the Gibbs-weighted average: Z = Σ exp(−β τᵢ) · blockᵢ / Σ exp(−β τᵢ)

At β→∞: only fresh blocks are used (standard synchronous computation).
At β→0: all blocks equally weighted (embarrassingly parallel, fully asynchronous).
At finite β: optimal trade-off — recent blocks dominate, but stale blocks
contribute proportionally to their recency.

**The β* operating point** is the snap threshold where the staleness penalty
exactly equals the waiting cost. Below β*: use the stale block now (the
approximation error is smaller than the waiting cost). Above β*: wait for
fresh data. This is a self-tuning scheduler — the system naturally operates
near β* without explicit configuration.

**Connection to Gibbs GEMM (Paper 400):** the same principle applied to
tile-level matrix multiplication. Each tile of C = A·B can be approximated
from a Gibbs-sampled partial result; the H¹ cohomological certificate confirms
whether the approximation is within ε of exact without computing the exact result.

**Paper:** [Gibbs GEMM](https://doi.org/10.5281/zenodo.PENDING)

---

## Agentic consensus and voting

### The 4-point structure of collective intelligence

When N agents each hold a belief state xᵢ ∈ ℝᴺ, a question about a
*relationship between relationships* — e.g. "do agents i and j agree about
the relationship between agents k and l?" — is a 4-point interaction:

```
f(xᵢ, xⱼ, xₖ, xₗ) = (xᵢ ⊗ xⱼ) · T · (xₖ ⊗ xₗ)
```

This cannot be expressed as a sum of pairwise interactions — it requires the
BIND opcode (H² coupling between Markov blankets). Matrix multiplication is
constitutionally unable to represent it.

The claim of [Agentic Consensus](https://doi.org/10.5281/zenodo.21480276): consensus in multi-agent inference is a 4-point problem.
Standard attention-based aggregation (pairwise ORBIT) systematically
underestimates disagreement between agents whose beliefs are structured by
relationships between relationships.

### Hot knowledge: the β-deformation of belief

[Knowledge as a Cohomological Object](https://doi.org/10.5281/zenodo.21480274)
proposes that knowledge itself has H^k structure:

| Degree | Knowledge type | Operation | Failure mode |
|--------|---------------|-----------|--------------|
| H⁰ | Facts (tropical) | Lookup / retrieval | Hallucination (wrong fact) |
| H¹ | Beliefs (probabilistic) | Bayesian update / TWIST | Miscalibration |
| H² | Meta-beliefs (holographic) | BIND across agents | Groupthink / coherent error |

An agent that operates only at H⁰ hallucinates — it retrieves the
nearest-neighbour fact without uncertainty. An agent at H¹ maintains calibrated
uncertainty. An agent at H² tracks *correlations between its own uncertainty
estimates* — the meta-belief level that enables genuine epistemic humility and
productive disagreement.

**The Hopfield connection:** the Hopfield network (1982) is an H⁰ associative
memory — it stores patterns as energy minima (β→∞ fixed points). Modern
Hopfield networks (Ramsauer 2020) are H¹: the energy function uses a softmax
rather than a sign function, allowing continuous-valued, exponentially large
storage. The ISA framework extends this to H²: a Hopfield network with BIND
coupling between memory slots stores *relationships between patterns*, not
just patterns.

### In praise of errors: β* and productive disagreement

At β→∞ (zero temperature), agents in a system converge to consensus — they
all point at the same energy minimum. This eliminates errors but also
eliminates the diversity that makes ensembles useful.

At finite β, agents maintain productive disagreement. The **optimal β* for
an ensemble** is the temperature at which the ensemble's collective accuracy
is maximised — the point where individual errors are uncorrelated (diversity)
without being random (noise). This is the same β* snap that governs induction
head formation in transformers, the Metropolis acceptance rate in MCMC, and
the phase transition in kinetic proofreading.

**The design principle:** don't force agent consensus. Instead, set β* such
that agents occupy different Schubert strata of the belief Grassmannian —
diverse enough to disagree, structured enough to combine.

**Papers:**
[Knowledge as a Cohomological Object](https://doi.org/10.5281/zenodo.21480274) ·
[Agentic Consensus](https://doi.org/10.5281/zenodo.21480276) ·
[β-Rank Family](https://doi.org/10.5281/zenodo.21479920)

---

## Hopfield, Ising, Boltzmann, Hubbard

The classical neural network models of the 1980s–90s all have natural ISA interpretations:

| Model | ISA tier | β regime | Connection |
|-------|----------|----------|------------|
| Hopfield (1982) | H⁰ | β→∞ | Tropical associative memory; patterns = ORBIT fixed points |
| Modern Hopfield (Ramsauer 2020) | H¹ | β finite | Softmax energy; continuous capacity; attention = one Hopfield step |
| Boltzmann Machine | H¹ | β finite | Gibbs sampling = Forge ISA annealing; CD-k = MGE β-step |
| G₂ Boltzmann Machine | H² | β near β* | G₂ couplings replace pairwise; non-associative learning prior |
| Ising model | H⁰/H¹ | any | Exact MGE: Ising partition function = tropical polynomial at β→∞ |
| Hubbard model | H¹→H⁰ | β = U/t | Mott transition = β* snap from H¹ delocalised to H⁰ localised |

**The [G₂ Boltzmann Machine](https://doi.org/10.5281/zenodo.20319577)** is the most novel: replacing the
pairwise J_ij coupling with the G₂ 3-form φ_ijk gives a machine that learns
three-way correlations directly. Contrastive divergence becomes a G₂-equivariant
gradient step. The Fano plane incidence structure provides an exact error-detection
code for the learning rule.

**The Ising-tropical connection:** the Ising partition function
Z(β) = Σ_σ exp(−βH(σ)) is an ordinary polynomial in {exp(−βJ_ij)} at finite
β. As β→∞, the polynomial becomes a tropical polynomial (+ becomes max, · becomes
+) and Z(∞) = max_σ (−H(σ)) — the ground state energy. The MGE is this
deformation made explicit and controllable.

**Papers:**
[G₂ Boltzmann Machine](https://doi.org/10.5281/zenodo.20319577) ·
[MCMC as H^k Ladder](https://doi.org/10.5281/zenodo.PENDING) ·
[Universal Bonding Theory](https://doi.org/10.5281/zenodo.21277821) (Hubbard/Mott)

---

## MCMC as the H^k ladder

Markov chain Monte Carlo methods form a natural tier ladder:

| Method | H^k tier | β | Key feature |
|--------|----------|---|-------------|
| Metropolis-Hastings | H⁰ | β fixed | Hard accept/reject; 0.234 optimal rate = β* |
| Langevin MCMC | H¹ | β finite | Gradient information; geometric phase; continuous |
| HMC (Hamiltonian) | H¹/H² | β = iτ | Hamiltonian dynamics; Berry phase in trajectory |
| NUTS | H² | β → β* | Adaptive step = SNAP; self-tuning to β* |
| Simulated annealing | H⁰→H¹→H⁰ | β(t) | β schedule = MGE cooling; SNAP at β* |

The **0.234 optimal acceptance rate** for Metropolis-Hastings is the β* of
the sampling monad — the same saddle-point optimum as the Vaswani 1/√d_head
and the MGE soft router. All three are instances of the same variational
principle: maximise information throughput at the snap threshold.

**Paper:** [MCMC as H^k Ladder](https://doi.org/10.5281/zenodo.PENDING)

---

## Rankings, recommendations, and the β-rank family

The **[β-rank family](https://doi.org/10.5281/zenodo.21479920)** unifies pairwise ranking algorithms under
a single β-deformation:

| β limit | Algorithm | Semiring | Use case |
|---------|-----------|----------|----------|
| β → ∞ | TropicalRank | (max, +) | Winner-takes-all; tournament bracket |
| β = 1 | ForgeRank = HodgeRank | (Σ, ×) | Pairwise preference aggregation |
| β = i | MeldRank = Quantum HodgeRank | (ℂ, ×) | Quantum preference; interference |
| β ∈ ℂ | RavenRank | PT-symmetric | Ranking with gain/loss asymmetry |

**HodgeRank** (Jiang et al. 2011) decomposes a pairwise comparison matrix into
gradient (consistent rankings) + curl (inconsistent cycles) + harmonic (neither)
components via Hodge decomposition on the comparison graph. The ISA identifies
this as a Forge ISA programme: ORBIT (comparison graph) + TWIST (Hodge Laplacian)
+ LABEL (gradient/curl/harmonic eigenvalues).

**Survey Propagation = ForgeRank for SAT:** the message-passing algorithm that
solves hard random SAT instances near the satisfiability threshold is the
ForgeRank algorithm applied to the factor graph of the SAT instance. The
satisfiability threshold = β* of the ranking semiring.

**Papers:** [β-Rank Family](https://doi.org/10.5281/zenodo.21479920) ·
[PT-Symmetric Combinatorics](https://doi.org/10.5281/zenodo.21480493)

---

---

*See also:* [The β-plane](/docs/theory/forge-meld) ·
[Processing Units](/docs/theory/processing-units) ·
[ML01 — Transformer Attention](/isa-zoo/ml01-attention-mechanism) ·
[IG01 — EM Algorithm](/isa-zoo/ig01-em-algorithm) ·
[In Praise of Soft Thresholds](https://doi.org/10.5281/zenodo.21373468)
