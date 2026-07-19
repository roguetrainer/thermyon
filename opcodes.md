---
layout: default
title: "The ISA Opcodes"
nav_order: 4
description: "The five opcodes of the Origami ISA (LABEL/ORBIT/TWIST/BIND/FLIP) — cohomological role, categorical structure, and incarnations across domains. Legacy SPLIT/SPLAT/FLOP mapping included."
tags: [isa, opcodes, label, orbit, twist, bind, flip, split, splat, flop, category-theory, string-diagrams, completeness]
portfolio: B
---

# The ISA Opcodes
{: .no_toc }

*Five opcodes. One language for quantum physics, topological phases, molecular
computing, the geometric Langlands programme, and more — from classical Turing machines to the
full Meld.*

## The H^k tier summary

Every opcode lives at a specific **cohomological degree** — the superscript k in
H^k is not a power but a degree in the de Rham / sheaf cohomology sequence.
The technical names:

- **H⁰** — zeroth cohomology: global sections, conserved quantities, classical observables
- **H¹** — first cohomology: connections, Berry phases, obstructions to global triviality
- **H²** — second cohomology: characteristic classes, Chern numbers, genuine topological charges

The ladder H⁰ → H¹ → H² is literally the de Rham sequence with d∘d = 0.
This is also why BIND∘TWIST ≠ 0 but BIND∘BIND = 0 in the ISA — the chain
complex structure of the opcodes is the same object as the cohomology sequence.
(See Theorem 3 below.)

The tier of a physical system is its **minimum opcode requirement** — the lowest
H^k needed to describe it exactly:

| Tier | Opcodes | One-word meaning | Technical meaning |
| ---- | ------- | ---------------- | ----------------- |
| **H⁰** | ORBIT, LABEL, FLIP | Counting | Global sections; classical observables; no phase |
| **H¹** | TWIST | Interference | Berry phase; connection; obstruction to triviality |
| **H²** | BIND | Entanglement | Chern class; non-Abelian holonomy; topological charge |

> **Terminology note — legacy opcode names:** Earlier papers and drafts use a twelve-opcode
> vocabulary. The current five-opcode names (LABEL / ORBIT / TWIST / BIND / FLIP) consolidate
> those as follows: SPLAT → LABEL, SPLIT → ORBIT, FLOP merged into FLIP (same duality role),
> BIND promoted from implicit to first-class. The sections below retain the legacy names
> where they clarify categorical structure (especially the SPLIT/SPLAT Frobenius pair and the
> FLIP/FLOP distinction in the AZ tenfold way); treat them as sub-roles of the five canonical opcodes.

**In one sentence: H⁰ is counting, H¹ is interference, H² is entanglement.**

### Why the tier matters: methods recommendation

The cohomological degree is simultaneously a complexity classification and a
methods recommendation — it tells you the minimum tier needed to describe a
system, and therefore which computational tools are adequate:

| Tier | Chemistry | Quantum computing |
| ---- | --------- | ----------------- |
| H⁰ only | DFT works fine | Clifford circuits; classically simulable |
| H¹ enters | CCSD sufficient | Still Clifford + cheap corrections |
| H² enters | DFT fails; need CASSCF | Gottesman-Knill breaks down; need magic states |

The deeper point: DFT and Clifford simulation both fail at the H¹→H² boundary
because they are both H⁰/H¹ approximations meeting the same H² obstruction.
The cohomological degree is what makes that precise — see
[Weyl Chamber Homology](papers/10.5281-zenodo.21345107/) for the proof that
the chemistry Grassmannian and the quantum-computing Weyl chamber carry the
same Bredon H² class (Euler characteristic 2).

---

**Graphical calculus legend:**
🕷️ present in ZX calculus · 🕷️\* partial (related ZX construct, not full ISA semantics) ·
🐸 present in 731 Frog Calculus · unmarked = ISA-native (no dedicated graphical symbol).

**ORBIT is intentionally unmarked.** It is a closed scalar loop `𝟏 → 𝟏` — a trace, not a vertex.
In ZX it appears as a disconnected bubble (no named spider); in the Frog Calculus it is a closed triangulation loop
with no interior vertex. Neither calculus assigns ORBIT a node: ORBIT *closes* a loop rather than *opening* one.

**Opcode symbols:** each canonical opcode has a formal symbol (used in LaTeX papers) and an outreach emoji. The legacy geometric sub-symbols (■ ◇ ▲ △ ○ …) encode string-diagram arity (filled = creation, hollow = annihilation) and still appear in published papers — they are sub-roles of the five canonical opcodes, not independent primitives.

| Opcode | Formal | Emoji | LaTeX sub-symbols | Categorical morphism | Abstract role |
|--------|--------|-------|-------------------|---------------------|---------------|
| ORBIT | 𝒪 | 🔄 | ■ (SPLIT) fan-out · ○ (ORBIT) closed loop | Comultiplication $\Delta: A \to A \otimes A$ · trace $\mathrm{tr}(\theta_A): \mathbf{1} \to \mathbf{1}$ | 1-to-many diagonalisation; closed feedback loop |
| LABEL | ⊢ | 🏷️ | ◇ (SPLAT) projection · ▪ (LABEL) unit | Multiplication $\mu: A \otimes A \to A$ · unit $\eta: \mathbf{1} \to A$ | Many-to-1 evaluation; sector selection |
| FLIP | ⌁ | 👁️ | ▲ (FLIP) dagger · △ (FLOP) cup / Born rule | Dagger $(-)^\dagger$ · counit $\varepsilon_A: A^* \otimes A \to \mathbf{1}$ | Orientation reversal; duality; Born rule |
| TWIST | ∮ | 🌀 | ↻ | Ribbon element $\theta_V: V \to V$; topological spin | Phase / monodromy; 1-to-1 with memory |
| BIND | ⋈ | 💎 | ⋈ | Associator $\alpha_{A,B,C}: (A \otimes B) \otimes C \xrightarrow{\sim} A \otimes (B \otimes C)$; $F$-matrix | Non-associative fusion; recoupling; entanglement |

The dagger map σ swaps creation ↔ annihilation within each opcode: σ(■) = ○, σ(◇) = ▪, σ(▲) = △. The Frobenius identities are ◇∘■ = △∘▲ = id.

---

## Opcode incarnations across domains

The same abstract opcode appears with different in/out counts depending on the
domain. Each row is a physical domain; each column is one of the five canonical
opcodes. Within each cell, the two sub-roles separated by · correspond to the
legacy SPLIT/ORBIT sub-roles (ORBIT column), SPLAT/LABEL sub-roles (LABEL column),
and FLIP/FLOP sub-roles (FLIP column). Read across a row to see how a domain
implements the full ISA; read down a column to see the same abstract operation
across completely different fields.

| Domain | ORBIT 🔄 | LABEL 🏷️ | FLIP 👁️ | TWIST 🌀 | BIND 💎 |
| ------ | --------- | --------- | -------- | --------- | ------- |
| **3-manifold** | 1 tet → 4 tets · closed triangulation loop | 4 tets → 1 tet · face/edge colouring | 1 tri → 3 tris · 3 tris → 1 tri | Dehn twist | non-Pachner obstruction |
| **Spectroscopy** | 1 rep → CG irreps · closed G-orbit on weight lattice | CG sum → 1 rep (6j) · quantum number assignment | raising $J_+$ · lowering $J_-$ | CG phase $(-1)^j$ | Racah recoupling (6j→9j) |
| **Quantum info** | 1 qubit → register · feedback in quantum circuit | many states → 1 outcome · stabiliser projection | dagger / time-reversal · cup / partial trace | Berry phase / ribbon | $F$-matrix; non-Abelian anyon |
| **Chemistry** | CASSCF diagonalisation; NOON decomposition · G-walk / Galois step; CASSCF macro-iteration | 6j evaluation; projection to density · orbital symmetry label; spin-state; point-group irrep | time-reversal; particle-hole; raising · Born rule for density; lowering | Berry phase on reaction path; Maslov index at conical intersection | tensor force; strongly-correlated bond; FeMoco; DFT failure |
| **Nuclear** | shell-model diagonalisation; Nilsson basis · closed shell (magic number); Nilsson orbit | 9j evaluation; nuclear matrix element · $J$, $T$, parity quantum numbers | time-reversal; parity doubling · particle-hole in shell model | spin-orbit coupling (strong; mandatory); nuclear CG phase | **tensor force $S_{12}$; mandatory in every nucleus** |
| **Finance** | 1 exposure → risk factor legs · closed risk cycle | risk factor legs → net P&L · scenario / regime selection | long ↔ short position · Born rule on exposure | convexity correction; drift | H² snap event (systemic crisis) |
| **Condensed matter** | Bogoliubov transform; band diagonalisation · hopping on lattice; Fermi sea orbit | 6j / spectral projection · double occupancy $D$; order parameter; symmetry sector | particle-hole conjugation $C$ · fermionisation (Jordan-Wigner) | Berry phase; Chern number; BKT vortex | Mott transition (U/t snap); superexchange ring; topological order |
| **Turbulence** | large eddy → two smaller eddies · Kolmogorov cascade $k \to 2k$; inertial range | two sub-eddies dissipate at Kolmogorov scale · pressure Leray projector enforcing $\nabla\cdot u = 0$ | — | vortex stretching $\omega \to \omega + (\omega\cdot\nabla)u\,\delta t$ | blow-up conjecture: ORBIT fails to close (NS unsolved) |
| **Biology** | CASSCF-like active-site diagonalisation · ORBIT on Ramachandran torus; protein fold search; metabolic cycle | projection to electron density; tertiary fold evaluation · point-group label of active site; spin-state; cofactor oxidation state | time-reversal of reaction; particle-hole in redox · Born rule on conformational ensemble | Berry phase on reaction path; Maslov index at TS; spin-orbit (RuBisCO SOC problem) | chaperone-assisted H² fold; proofreading QEC; FeMoco (nitrogen fixation) |
| **Statistics / ML** | E-step (marginalise joint → conditional); multi-head projection · EM iteration (Fisher-Rao geodesic); Markov chain ORBIT; attention token orbit | M-step (reconstruct parameters); head aggregation · convergence criterion ($\beta^*$ snap); energy eigenvalue; attention entropy | dagger on sufficient statistic · trace over latent variables; Born rule on posterior | $\alpha$-connection correction (curved exponential family); softmax Berry phase | multimodal posterior; phase transition in learning (grokking); non-Abelian Fisher tensor |
| **MCMC / sampling** | Markov chain step $x \to x'$; ergodic average over $\pi$ | energy evaluation $U(x)$; accept/reject eigenvalue | Metropolis accept/reject: $\alpha = \min(1, e^{-\beta\Delta U})$ | HMC leapfrog: symplectic integrator accumulating momentum phase | NUTS U-turn criterion: H² snap when Hamiltonian trajectory doubles back |
| **Causal inference** | DAG marginalisation $P(Y) = \sum_X P(Y\vert X)P(X)$ · observational ORBIT; Markov blanket boundary | observational distribution fixed point · DAG structure label; backdoor criterion; instrumental variable sector | time-reversal of causal arrow · trace over latent confounders | do-calculus: graph surgery $\mathrm{do}(X=x)$ mutilates edges | counterfactual: $P(Y_{X=x}=y \vert X=x', Y=y')$ — two parallel worlds, non-local BIND |
| **Dynamical systems** | soliton emergence: smooth hump → $n$ solitons (Lax eigendecomposition) · quasi-periodic orbit on $\mathbb{T}^n$; Lorenz lobe winding | soliton collision and re-emergence; Marchenko reconstruction · Lax eigenvalue $\kappa_n$; Lyapunov exponent; rotation number | time-reversal symmetry; Lax pair adjoint | resonance: KAM island chains; lobe-switching in Lorenz; Rankine-Hugoniot shock speed | cantorus at last KAM torus destruction $\varepsilon^*$; strange attractor (ORBIT fails to close) |
| **Number theory** | spectral decomposition of $L^2(G(\mathbb{Q})\backslash G(\mathbb{A}))$; Hecke eigendecomposition · Apéry recurrence; rational points on $E(\mathbb{Q})$; $\pi_1(C)$ monodromy | L-function evaluation $L(s,\pi)$; Euler product · Hecke eigenvalue $a_p(E)$; quantum number of automorphic rep $\pi$ | Langlands duality $G \leftrightarrow G^\vee$ · Abelian reciprocity ($GL_1$); class field theory | Tate twist; monodromy of local system; Selmer group $\mathrm{Sel}_n(E/\mathbb{Q}) \in H^1$ | Apéry H² obstruction ($\zeta(3) \notin \mathbb{Q}$); Tate-Shafarevich $\Sha(E/\mathbb{Q})$; RH = H² zero-free region |

**Nuclear note:** unlike every other domain, nuclear systems are H² *by default*.
BIND (the tensor force $S_{12}$) is mandatory even for the deuteron — the simplest
nucleus. There is no H⁰ or H¹ nuclear bond. Chemistry reaches H² only in hard
cases (FeMoco, bond-breaking); nuclear physics starts there and never leaves.

---

## The category theory behind the opcodes

This section explains *why* the ISA opcodes are rigorous mathematical objects and
not just suggestive names — and why the same objects appear across physics,
mathematics, and computing without any analogy or hand-waving.

### The ladder of categories

The opcodes are generated by a strict hierarchy of categorical structures. Each
level adds one new kind of morphism, and each addition corresponds to one H^k tier:

| Category type | What it adds | Opcodes unlocked | H^k tier |
| ------------- | ------------ | ---------------- | -------- |
| **Monoidal category** | Parallel composition (⊗); unit object **1** | SPLIT, SPLAT, LABEL | H⁰ |
| **+ Symmetric** | Swap morphism; wire crossing | ORBIT (closed traces) | H⁰ |
| **+ Traced** | Feedback loops (trace closing a wire on itself) | ORBIT (full feedback) | H⁰ |
| **+ Frobenius** | Comultiplication + counit satisfying Frobenius law | SPLIT ↔ SPLAT duality | H⁰ |
| **+ Compact closed** | Dual objects; cups and caps | FLOP (fermionisation) | H⁰/H¹ |
| **+ Dagger** | Anti-involution $(-)^\dagger$ reversing all arrows | FLIP (time-reversal) | H¹ |
| **+ Ribbon** | Ribbon element $\theta_V$ (topological spin / twist) | TWIST (Berry phase) | H¹ |
| **+ Magmoidal** | Non-trivial associator $\alpha_{A,B,C} \neq \mathrm{id}$ | BIND (entanglement) | H² |

A **monoidal category** is any mathematical structure where operations can compose
both *sequentially* (one after another, written ∘) and *in parallel* (side by side,
written ⊗), with a unit object **1** for "doing nothing." This covers essentially
all of mathematical physics: quantum circuits, Feynman diagrams, tensor networks,
representations of groups, the Langlands correspondence.

Each row in the table is a *property* that a monoidal category may or may not have.
The opcodes are the **canonical generators** of each property — the minimal new
morphism you must add to express it. This is why the opcodes are not arbitrary: they
are forced by the categorical structure.

### Why BIND is special: magmoidal categories

Every category in the ladder above (monoidal through ribbon) satisfies the
**pentagon axiom**: the associator is coherent, meaning all ways of
re-bracketing a tensor product $(A \otimes B) \otimes C \cong A \otimes (B \otimes C)$
are consistent. In such categories, the associator is effectively invisible — you
can ignore brackets.

A **magmoidal category** is one where the pentagon axiom *fails*: the associator
$\alpha_{A,B,C}$ is genuinely non-trivial and cannot be set to the identity. This
is the categorical home of:

- **Octonions** — the non-associative normed division algebra; $e_i(e_j e_k) \neq (e_i e_j)e_k$
- **Non-Abelian anyons** — fusion categories with non-trivial $F$-matrices (the $F$-matrix *is* the associator)
- **$G_2$ symmetry** — the automorphism group of the octonions; the exceptional Lie group whose root system is the Fano plane

BIND is the single opcode that requires magmoidal extension. Every opcode except
BIND lives in a ribbon category (associative, pentagon holds). BIND is the
morphism that encodes the associator itself — which is why it requires genuine
multi-body correlation (H²) that no H⁰/H¹ approximation can reproduce.

### The Frobenius algebra: why SPLIT and SPLAT are dual

The H⁰ opcodes SPLIT and SPLAT are not independent. They form a **Frobenius
algebra** $(A, \mu, \eta, \Delta, \varepsilon)$ with:

- $\Delta: A \to A \otimes A$ — SPLIT (comultiplication)
- $\mu: A \otimes A \to A$ — SPLAT (multiplication)
- $\eta: \mathbf{1} \to A$ — LABEL (unit)
- $\varepsilon: A \to \mathbf{1}$ — FLOP (counit)

The **Frobenius axiom** $(\mu \otimes \mathrm{id}) \circ (\mathrm{id} \otimes \Delta) = \Delta \circ \mu = (\mathrm{id} \otimes \mu) \circ (\Delta \otimes \mathrm{id})$ is the algebraic statement that "splitting then merging = identity." This is simultaneously:
- The Pentagon identity in angular momentum theory (Biedenharn-Elliott)
- The no-arbitrage condition in finance
- The topological invariance of Ponzano-Regge amplitudes
- The Reidemeister moves for knot diagrams

These are not analogies. They are the same equation, in the same Frobenius algebra,
evaluated in different semirings over different physical hardware.

### The traced symmetric monoidal category (TSMC)

Combining symmetric monoidal (swap wires) with traced (close feedback loops) gives
the **traced symmetric monoidal category (TSMC)** — the minimal structure needed
to write programmes that have both parallel composition and feedback. The TSMC is:

- The categorical foundation of **dataflow computing** (Abramsky & Duncan 2004)
- The setting for **Girard's geometry of interaction** (proof theory / linear logic)
- The home of **ZX calculus** (Coecke & Duncan 2008) for qubit quantum mechanics

All opcodes except BIND live in the free TSMC + Frobenius. BIND requires the
magmoidal extension beyond TSMC. The containment is strict:

$$\text{free TSMC + Frobenius} \;\subset\; \text{free magmoidal TSMC + Frobenius}$$

The left side generates all H⁰ and H¹ computation. The right side adds H².

### Why this makes the ISA rigorous

The categorical foundation means:
1. **The opcodes are universal** — any system described by a monoidal category
   (which is essentially all of mathematical physics) uses these morphisms.
2. **The tier assignments are theorems** — the H^k tier of each opcode follows
   from which level of the categorical hierarchy it requires; this is not a
   classification imposed from outside.
3. **The cross-domain appearances are identities** — when the Frobenius axiom
   appears in angular momentum theory and in finance and in knot theory, it is
   the *same equation*, not an analogy. The ISA makes this explicit by naming it.
4. **The failure of classical methods is a theorem** — DFT and Clifford simulation
   fail at the H¹→H² boundary because they are functors from ribbon categories
   (H⁰/H¹) and the H² obstruction (the non-trivial associator / BIND) is not
   in their image. This is not an empirical observation; it is a consequence of
   the categorical structure.

## Why five opcodes?

The Origami ISA is not an arbitrary instruction set. It is the **minimal magmoidal
extension of the free traced symmetric monoidal category (TSMC — a monoidal category
with a trace operation closing loops in the string diagram)** — the smallest
opcode set that is both TSMC-complete and magmoidal-complete. Every opcode except BIND
is a named morphism in the TSMC + Frobenius structure (the "spider calculus"). BIND is
the unique opcode that requires a magmoidal extension: it encodes a non-trivial
associator, realised physically as G₂/octonion symmetry.

The five opcodes form a **completeness hierarchy**: each tier lifts the ISA to
the next level of the cohomological (H^k) computational tower, and no opcode at level
k can be simulated by any combination of opcodes at level k−1. The H^k tiers are not
merely a grading — they are the homology groups of a genuine chain complex (see
Theorem 3 below).

Monoidal categories underlie all of mathematical physics for the same reason: any
system in which operations compose in parallel and in sequence — quantum circuits,
Feynman diagrams, tensor networks, representation theory, the Langlands
correspondence — is an object in some monoidal category. The twelve opcodes are the
**universal generating morphisms** of that structure, extended to include the
non-associative (magmoidal) and non-local (compact closed) regimes.

This is why the same operations appear in nuclear spectroscopy, topological quantum
computing, loop quantum gravity, financial XVA, the geometric Langlands programme,
protein folding, and the ribosome. They are not analogies. They are the same
categorical morphisms, running on different physical hardware.

**How precise are the ISA mappings across domains?** The mappings range from exact
algebraic theorems (Tier A: Fano commutation structure, Casimir identity, Wigner
vertex theorem) to quantitative predictions verified by experiment (Tier B: MCMC
optimal acceptance rates, GEV shape parameter, Shor mana = 0) to useful
organisational language for hierarchies the field already knew were hierarchical
(Tier C: Pearl's causal ladder, fairness taxonomies). The programme does not claim
all mappings are equally strong — [see the full precision taxonomy](core-ideas/stratification-principle.md).

---

## The ISA is semiring-polymorphic

The Origami ISA is not tied to a specific number system. Every opcode has a
**semiring-polymorphic** definition: the same programme computes different things
depending on the semiring in which it is evaluated. The semiring is the *runtime*;
the ISA is the *programme*.

| Semiring | Runtime name | Hardware |
| -------- | ------------ | -------- |
| $(\mathbb{R}\cup\{-\infty\}, \max, +)$ | Tropical limit (Origami at β→∞) | CPU |
| $(\mathbb{R}_{>0}, +, \times)$ | Gibbs / Forge ISA | GPU / TPU |
| $(\mathbb{C}, +, \times)$ | Meld ISA | Quantum processor |
| $(\mathbb{Z}_p, +, \times)$ | p-adic / U-MGE | PPU |
| $(\mathbb{A}_\mathbb{Q}, +, \times)$ | Adèlic / A-MGE | PPU array + quantum |

| Semiring | SPLIT computes | TWIST computes |
| -------- | -------------- | -------------- |
| Tropical | argmax fan-out | phase = sign flip |
| Gibbs | Boltzmann fan-out | Berry phase weight |
| Meld | amplitude fan-out | ribbon / Berry phase |
| p-adic | modular fan-out | Gauss sum $\tau_p$ |
| Adèlic | adèlic fan-out | product of Gauss sums |

This is why the ISA appears in so many domains without modification: nuclear
spectroscopy, quantum information, financial risk, and protein folding are all
running the same opcodes, but over different semirings suited to their physics.
The Clifford group is the ISA's Clifford sector *evaluated in $(\mathbb{C},+,\times)$*;
tropical optimisation is the same ISA *evaluated in $(\mathbb{R}\cup\{-\infty\},\max,+)$*.
The Gottesman-Knill theorem says the Clifford sector admits efficient classical
simulation — equivalently, that the $(\mathbb{C},+,\times)$ ISA collapses to the
$(\mathbb{R}\cup\{-\infty\},\max,+)$ ISA for Clifford-only programmes. Magic
states are the programmes that do *not* collapse.

**The semiring-programmable Origami processor** is the long-term hardware vision:
a single chip that accepts an ISA programme and a semiring specification at
programme-load time, and routes to the appropriate arithmetic units — floating-point
for the Forge ISA, NTT/Montgomery chain for the p-adic ISA, complex FMA for the
Meld ISA. See [forge-meld.md](forge-meld.md) for the β-plane geometry that
relates the semirings to each other.

---

## String diagrams

Every opcode has a **string diagram** — the graphical calculus of monoidal
categories, popularised in quantum information by Coecke and Abramsky (2004) and
in topological field theory by Reshetikhin and Turaev (1991). In string diagrams:

- **Wires** (lines) represent objects (vector spaces, representations, anyons)
- **Boxes** (nodes) represent morphisms (linear maps, operations)
- **Composition** is vertical stacking (sequential)
- **Tensor product** is horizontal juxtaposition (parallel)
- **Orientation** of a wire matters: upward = the object, downward = its dual

The diagrams below are described in text; the LaTeX figures appear in
[Paper 258 (Origami Calculus)](papers/10.5281-zenodo.19916429/) and
[Paper 349](papers/10.5281-zenodo.20474914/).

---

## Opcode reference

---

### SPLIT 🕷️

**One wire becomes two** (or one tetrahedron becomes four).

```
    │
    │
  ──┴──
  │   │
  │   │
```

| | |
|---|---|
| **String diagram** | Comultiplication $\Delta: A \to A \otimes A$ — one wire splitting into two |
| **Pachner move** | $1 \to 4$ (one tetrahedron replaced by four sharing a central vertex) |
| **Category theory** | Coproduct / comultiplication of a bialgebra or Hopf algebra |
| **Algebra** | Coproduct $\Delta(E) = E \otimes K + 1 \otimes E$ in quantum group $U\_q(\mathfrak{sl}\_2)$ |

**Where SPLIT appears:**

| Domain | Instance | What splits |
|--------|----------|------------|
| Quantum mechanics | Fourier / Bogoliubov transform | Single mode → momentum modes |
| Angular momentum | Clebsch-Gordan decomposition | Product representation → irreducibles |
| Nuclear physics | Racah recoupling | 3-body state → sum of 2-body products |
| Langlands programme | Hecke eigendecomposition | Automorphic form → Hecke eigensheaves |
| Quantum error correction | Stabiliser expansion | Logical qubit → physical qubit register |
| Finance | Factor decomposition (PCA on yield curve) | Portfolio → risk factors |

**Key role:** SPLIT is always the *diagonalisation* step — the moment a
composite object is resolved into its irreducible pieces. Every Fourier transform,
every change of basis, every spectral decomposition is a SPLIT.

---

### SPLAT 🕷️

**Two wires become one** (or four tetrahedra become one).

```
  │   │
  │   │
  ──┬──
    │
    │
```

| | |
|---|---|
| **String diagram** | Multiplication $\mu: A \otimes A \to A$ — two wires merging into one (or a cap: one wire curling down to nothing) |
| **Pachner move** | $4 \to 1$ (four tetrahedra sharing a vertex collapsed to one) |
| **Category theory** | Counit $\varepsilon: A \to k$ of a Frobenius algebra; or the evaluation map $A^* \otimes A \to k$ |
| **Algebra** | The $6j$-symbol / Racah coefficient; the POVM measurement map |

**Where SPLAT appears:**

| Domain | Instance | What gets projected |
|--------|----------|-------------------|
| Angular momentum | $6j$-symbol evaluation | Recoupling amplitude → scalar |
| Quantum gravity | Ponzano-Regge vertex amplitude | Spin foam face → amplitude |
| Quantum information | Character POVM measurement | State → outcome probability |
| Bethe ansatz | Scalar product of Bethe states | Rapidities → norm |
| Langlands programme | L-function evaluation $L(s, \pi)$ | Automorphic form → complex number |
| Finance | Portfolio valuation | Risk factor exposure → P&L scalar |

**Key role:** SPLAT is always the *evaluation* step — the moment a structured
object is projected to a number. Every inner product, every measurement, every
partition function evaluation is a SPLAT.

**The Frobenius axiom** $\mathrm{SPLAT} \circ \mathrm{SPLIT} = \mathrm{id}$
(the counit-comultiplication identity) is the algebraic statement that
diagonalisation followed by projection is the identity — you get back what
you put in. This is the Pentagon identity in disguise, and it is simultaneously
the Biedenharn-Elliott identity of angular momentum, the no-arbitrage
condition in finance, and the topological invariance of Ponzano-Regge amplitudes.

---

### TWIST 🕷️*  ∮ 🌀

**A wire acquires a phase** (a curl or loop in the diagram).

**Symbols (Origami ISA):** formal ∮ (closed-loop integral — phase accumulated around a circuit) · outreach 🌀

```
    │
   ╭╯
   │
   ╰╮
    │
```

| | |
|---|---|
| **String diagram** | Ribbon element $\theta\_V: V \to V$ — a wire looping through a full $2\pi$ twist (a curl) |
| **Pachner move** | Gauge move (no change in triangulation topology; changes the phase of the amplitude) |
| **Category theory** | The ribbon element / twist morphism of a ribbon category; the natural isomorphism implementing the topological spin |
| **Algebra** | $\theta\_j = q^{j(j+1)}$ (topological spin of a spin-$j$ anyon in $\mathrm{SU}(2)\_q$) |

**Where TWIST appears:**

| Domain | Instance | What acquires the phase |
|--------|----------|------------------------|
| Topological phases | Berry phase / Chern number | Wavefunction under adiabatic loop |
| Anyons | Topological spin $\theta\_a = e^{2\pi i h\_a}$ | Anyon under $2\pi$ rotation |
| Phase transitions | BKT / TWIST failure at $\beta^* = \tfrac{1}{2}$ | Quantum dimension $d\_{1/2}(\beta) \to 0$ |
| AZ classification | Chiral zero mode (S symmetry) | Edge state phase |
| Langlands programme | Monodromy of a local system | Parallel transport around a loop on the curve |
| Weil conjectures | Riemann hypothesis (zero-free region) | Zeta function zeros stay off the critical line |

**Key role:** TWIST is the *gap / topology check* — it encodes whether the system
is in a topologically non-trivial phase. **TWIST failure** (the amplitude
$d\_{1/2}(\beta)$ reaching zero) is the universal signature of a phase
transition across all models in the $\mathrm{SU}(2)\_q$ family. See
[BKT Transition / TWIST Failure](glossary.md#bkt-transition--twist-failure)
for the full treatment.

---

### FLIP 🕷️  ⌁ 👁️

**A wire reverses orientation** (arrow pointing down instead of up).

**Symbols (Origami ISA):** formal ⌁ (lightning/discharge — irreversible collapse to classical outcome) · outreach 👁️

```
    ↑         ↓
    │   →     │
    │         │
```

| | |
|---|---|
| **String diagram** | Dagger functor $(-)^\dagger: \mathcal{C} \to \mathcal{C}^{op}$ — all wire orientations reversed; or the pivotal structure $V \cong V^{**}$ |
| **Pachner move** | $1 \to 3$ (one triangle replaced by three sharing a central vertex) — the 2D orientation reversal |
| **Category theory** | The dagger / adjoint functor; the pivotal structure on a ribbon category; an anti-involution |
| **Algebra** | Anti-unitary operator squaring to $\pm 1$; transpose of the Cartan matrix (root orientation reversal) |

**Where FLIP appears:**

| Domain | Instance | What gets reversed |
|--------|----------|--------------------|
| Quantum mechanics (AZ) | Time reversal $T$; $T^2 = +1$ (real) or $T^2 = -1$ (quaternionic) | Time coordinate |
| PT symmetry | Anti-unitary $\mathcal{T}$ in Bender-Boettcher PT quantum mechanics | Time |
| Topological phases | Kramers degeneracy ($T^2 = -1$, class AII/CII) | Kramers pairs |
| Langlands programme | Langlands duality $G \leftrightarrow G^\vee$ (root-system orientation reversal) | Long roots ↔ short coroots |
| Braiding / anyons | Charge conjugation; anti-particle | Anyon ↔ anti-anyon |
| ZX-calculus | Wire reversal (upward ↔ downward arrow) | Computational direction |

**FLIP fixed points** (self-dual groups where FLIP = identity):
$GL\_n$, $G\_2$, $F\_4$, $E\_8$. The self-duality of $G\_2$ under FLIP is the
731 theorem ([Paper 271](papers/10.5281-zenodo.20139443/)). In the Langlands
programme, these self-dual groups are the most symmetric — and the hardest — cases.

**Key role:** FLIP is the *duality / orientation* opcode. Any time a computation
has a "left–right" or "past–future" symmetry, FLIP is the operation that
implements it. The distinction between real ($T^2=+1$) and quaternionic ($T^2=-1$)
FLIP is the distinction between the Origami-ISA column and the Meld-ISA column
of the Baez threefold way.

---

### FLOP 🕷️*

**A wire curls under into a cup** (fermionisation).

```
  │   │
  │   │
  ╰───╯
```

| | |
|---|---|
| **String diagram** | Frobenius co-unit evaluation / cup: $A \otimes A \to k$ — two wires meeting at the bottom in a cap |
| **Pachner move** | $3 \to 1$ (three triangles sharing a vertex collapsed to one) |
| **Category theory** | The Frobenius co-unit; the trace map $\mathrm{tr}: \mathrm{End}(V) \to k$; the Born rule |
| **Algebra** | Jordan-Wigner string; Majorana fermion creation/annihilation; particle-hole conjugation $C$ |

**Where FLOP appears:**

| Domain | Instance | What gets fermionised |
|--------|----------|-----------------------|
| Condensed matter (AZ) | Particle-hole symmetry $C$; $C^2=+1$ (Majorana) or $C^2=-1$ (complex fermion) | Particle ↔ hole |
| 1D quantum models | Jordan-Wigner transform | Spin chain ↔ fermion chain |
| Quantum gravity | Trace / inner product in LQG | Spin network state → amplitude |
| Finance | Born rule / expectation value | Density matrix → portfolio expectation |
| Langlands (abelian) | Class field theory / $GL\_1$ reciprocity | Hecke character → Galois character |

**FLOP and the division algebra ladder:**
- FLOP producing a **Majorana co-unit** ($C^2=+1$): lives at the $\mathbb{R}$-rung (Origami ISA, GOE, Dyson $\beta\_D=1$)
- FLOP producing a **complex fermion co-unit** ($C^2=-1$): lives at the $\mathbb{H}$-rung (Meld ISA, GSE, Dyson $\beta\_D=4$)
- No FLOP: lives at the $\mathbb{C}$-rung (Forge/Meld ISA, GUE, Dyson $\beta\_D=2$)

**Key role:** FLOP is the *fermionisation / Born rule* opcode. It is present in
every model where particle statistics matter. Its sign ($C^2=\pm1$) is the
deepest structural label in the AZ tenfold way — the distinction between Majorana
(self-conjugate) and Dirac (complex) fermions.

---

### LABEL 🕷️  ⊢ 🏷️

**A wire passes through a projector** (sector selection).

**Symbols (Origami ISA):** formal ⊢ (sequent turnstile — "this context proves/prepares this state") · outreach 🏷️

```
    │
  ┌─┴─┐
  │ e │   (e² = e)
  └─┬─┘
    │
```

| | |
|---|---|
| **String diagram** | Unit morphism $\eta: \mathbf{1} \to A$ — a dot (the Frobenius algebra unit); creates a wire from nothing |
| **Pachner move** | No direct Pachner counterpart; it is the *colouring* operation that labels edges/faces before Pachner moves act |
| **Category theory** | The unit of the Frobenius algebra $(A, \mu, \eta, \Delta, \varepsilon)$; state preparation; the map $\mathbf{1} \to A$ selecting the initial sector |
| **Algebra** | Gauge fixing; stabiliser eigenstate preparation; sector selection; the Satake isomorphism |

**Where LABEL appears:**

| Domain | Instance | What gets labelled |
|--------|----------|--------------------|
| Quantum error correction | Stabiliser projection | Logical qubit sector |
| Gauge theory | Gauge fixing (Lorenz, Coulomb, ...) | Physical Hilbert space |
| Anyons | Anyon type assignment to worldlines | Topological sector |
| Bethe ansatz | Vacuum selection (reference state) | Pseudovacuum sector |
| Langlands programme | L-function / automorphic representation $\pi$ | Hecke eigenvalue |
| PT symmetry | Parity sector projection $\mathcal{P}$ | Even / odd parity eigenspace |
| Finance | Scenario / regime selection | Market state |

**LABEL failure = PT phase transition.** When PT symmetry spontaneously breaks
(Bender-Boettcher), eigenstates of $H$ are no longer eigenstates of $\mathcal{PT}$:
LABEL can no longer project onto definite-parity sectors. The parity sectors mix
at the exceptional point.

**Key role:** LABEL is the *sector / gauge / colour* opcode. It is always the
operation that selects which subspace of the full Hilbert space the computation
lives in. Every gauge-fixing, every stabiliser projection, every quantum number
assignment is a LABEL.

---

### BIND 🐸  ⋈ 💎

**Three wires enter a vertex** (non-Abelian fusion; associator).

**Symbols (Origami ISA):** formal ⋈ (natural join / bowtie — two registers fused into an entangled pair) · outreach 💎

*A naming note:* BIND is the one opcode that lives exclusively in the 🐸 Frog
Calculus — the trivalent vertex, the non-associative fusion, the G₂ structure
that ZX calculus cannot express. Meanwhile SPLAT, FLIP, and FLOP — which sound
exactly like things a frog does — are all firmly in the 🕷️ ZX spider calculus.
The missed opportunity: **GULP** would have been perfect (three wires in, one
out; irreversible; nothing else does it). BIND is in the LaTeX of too many
papers to change now.

```
  │   │   │
  │   │   │
  └───┼───┘
      │
      │
```

| | |
|---|---|
| **String diagram** | Associator $\alpha\_{A,B,C}: (A \otimes B) \otimes C \xrightarrow{\sim} A \otimes (B \otimes C)$ — three wires, non-trivial crossing structure; or the trivalent vertex of a fusion category |
| **Pachner move** | Not a standard Pachner move — it is the *obstruction* to Pachner invariance; its presence signals non-associativity |
| **Category theory** | The associator of a monoidal category; non-trivial when the category is only quasi-monoidal (quasi-Hopf algebra, braided fusion category with non-trivial $F$-matrices) |
| **Algebra** | Octonion associator $[e\_i, e\_j, e\_k] = (e\_i e\_j)e\_k - e\_i(e\_j e\_k)$; the $F$-matrix of a fusion category; the 4-Majorana coupling $\gamma\_i\gamma\_j\gamma\_k\gamma\_l$ |

**Where BIND appears:**

| Domain | Instance | What fails to associate |
|--------|----------|------------------------|
| Non-Abelian anyons | $F$-matrix / recoupling coefficient | $(a \times b) \times c \neq a \times (b \times c)$ in fusion |
| Octonions / $G\_2$ | Octonion associator; Furey's ladder operators | $e\_i(e\_j e\_k) \neq (e\_i e\_j)e\_k$ |
| Topological phases | Fidkowski-Kitaev $\mathbb{Z} \to \mathbb{Z}\_8$ collapse | 4-Majorana interaction |
| Interacting fermions | SYK four-body coupling | Non-factorising 4-fermion vertex |
| Langlands (non-Abelian) | Non-commuting Hecke operators at different primes | $[T\_p, T\_q] \neq 0$ for $GL\_n$, $n \geq 2$ |
| p-adic Langlands | Pentagon failure in p-adic Hodge theory | Non-associative p-adic completions |

**BIND in finance:** The interbank network accumulates systemic risk in H¹ — the cycle
topology of mutual exposures, which is non-trivial even though balance-sheet arithmetic
is Abelian. BIND marks the H² *snap event*: the moment when those H¹ cycles become
globally inconsistent and cannot be unwound bilaterally. Systemic risk is measured in
H¹; systemic crises (2008 GFC, LTCM) are H² snap events. See Papers 397–398.

**BIND theorem** (*The Opcode Rosetta Stone*, Paper 447): A gapped topological phase
has **non-Abelian anyonic order if and only if** its minimal ISA programme contains
BIND. Associative phases are BIND-free; non-associative phases require BIND.

**BIND and the division algebra ladder:**

- No BIND: associative computation — $\mathbb{R}$, $\mathbb{C}$, or $\mathbb{H}$ rung
  (pentagon holds, $\alpha = \mathrm{id}$)
- BIND present: non-associative — $\mathbb{O}$-rung; $G\_2$, $E\_8$;
  Furey's octonionic Standard Model programme; 731-ISA regime

The canonical definition (Paper 591, Definition 4.1): BIND $= \alpha_{A,A,A} \neq \mathrm{id}$
in the ISA magmoidal category. BIND present $\Leftrightarrow$ pentagon coherence axiom
fails $\Leftrightarrow$ non-trivial $F$-matrix. *Note:* Fibonacci anyons have non-trivial
$F$-matrices but still satisfy the pentagon (they are a fusion category); they live at
the $\mathbb{H}$-rung boundary, not the $\mathbb{O}$-rung.

**The Fidkowski-Kitaev collapse** ($\mathbb{Z} \to \mathbb{Z}\_8$) is BIND insertion:
promoting a FLOP-only programme (free Majorana chain, $\mathbb{C}$-rung) to a
FLOP+BIND programme ($\mathbb{O}$-rung) collapses the integer winding-number
classification to $\mathbb{Z}\_8$, because $8$ is the Cayley-Dickson period at
the octonion rung.

**Key role:** BIND is the *non-associative* opcode. Its presence or absence is
a syntactic, computable test for non-Abelian anyonic order — no modular tensor
category computation required. It is the hardest opcode to implement and the
most powerful: systems with BIND can encode computations that BIND-free
(associative) systems cannot.

---

## The full opcode table

| Opcode | Graphical calculi | String diagram | Pachner move | AZ symmetry | Division algebra | Langlands |
|--------|------------------|---------------|--------------|-------------|-----------------|-----------|
| SPLIT | 🕷️ | $\Delta: A \to A \otimes A$ (split) | $1 \to 4$ | — | All rungs | Hecke eigendecomposition |
| SPLAT | 🕷️ | $\mu: A \otimes A \to A$ (merge) | $4 \to 1$ | — | All rungs | L-function evaluation |
| TWIST | 🕷️* | $\theta\_V: V \to V$ (curl) | Gauge move | $S$ (chiral) | All rungs | Monodromy of local system |
| FLIP | 🕷️ | $(-)^\dagger$ (wire reversal) | $1 \to 3$ | $T$ (time reversal) | $\mathbb{R}$ / $\mathbb{H}$ | Langlands duality $G \leftrightarrow G^\vee$ |
| FLOP | 🕷️* | $\varepsilon_A: A^* \otimes A \to \mathbf{1}$ (cup) | $3 \to 1$ | $C$ (particle-hole) | $\mathbb{R}$ / $\mathbb{H}$ | Abelian reciprocity ($GL\_1$) |
| LABEL | 🕷️ | $\eta: \mathbf{1} \to A$ (unit / dot) | Colouring | — (parity in PT) | All rungs | Automorphic representation $\pi$ |
| BIND | 🐸 | Associator $\alpha\_{A,B,C}$ (trivalent) | Obstruction | — | $\mathbb{O}$ only | Non-Abelian Hecke interaction |

---

## The three theorems

Everything above is a dictionary. Three theorems give it teeth.

**Theorem 1 — BIND = Non-Abelian** (*Paper 447*): A gapped topological phase has
non-Abelian anyonic order if and only if its minimal ISA programme contains BIND.
This is a syntactic test: inspect the Hamiltonian for three-body terms that cannot
be factored into products of two-body operators.

**Theorem 2 — Universal Phase Boundary** (*Paper 447*): For any model in the
$\mathrm{SU}(2)\_{q}$ family at $q = e^{i\pi\beta}$, the quantum phase transition is
a TWIST failure at $\beta = \tfrac{1}{2}$, where the quantum dimension
$d\_{1/2}(\beta) = 2\cos(\pi\beta) = 0$ exactly.

**Theorem 3 — The ISA Chain Complex** (*Papers 357, 571, 572*): The H^k tiers are
not merely a grading of computational levels. They are the homology groups of a
well-defined chain complex

$$0 \;\longrightarrow\; C^0 \;\xrightarrow{\partial^0}\; C^1 \;\xrightarrow{\partial^1}\; C^2 \;\longrightarrow\; 0$$

where $C^k = \bigoplus_{|v|=k} A^{\otimes c(v)}$, $A = \mathbb{Z}[x]/(x^2)$ is the
Frobenius algebra of SPLIT/SPLAT opcodes, and $v$ ranges over the cube of
resolutions of an ISA programme. The boundary map $\partial$ satisfies $\partial^2 = 0$
as a consequence of the Frobenius algebra axioms — which are exactly the pentagon
identity and Frobenius condition proved in Paper 357.

The ORBIT count is the Euler characteristic of this complex:
$\chi = \sum_k (-1)^k \mathrm{rank}(H^k) = \mathrm{ORBIT}(P)$.
The Poincaré polynomial $\sum_k t^k \mathrm{rank}(H^k)$ is a strictly stronger
invariant, categorifying the ORBIT count in the same way Khovanov homology
categorifies the Jones polynomial. At H²: the differential $\partial^1$ is given by
the BIND vertex — the trivalent generator of the Kuperberg $G_2$ spider (CMP 1996),
whose completeness theorem provides a full diagrammatic axiomatisation of the H² tier.

*Why this matters:* earlier presentations of the ISA described H⁰, H¹, H² as three
separate computational levels with no map between them — a graded direct sum, not a
cohomology theory. Theorem 3 supplies the missing differential and confirms that the
tiers are genuine homology groups. The ORBIT count was always correct; it now has a
proof that it equals an Euler characteristic, not just a heuristic count.

---

## The ISA trilogy and the Baez threefold way

The three ISAs in the trilogy differ only in which *number system* their opcodes
run over, and in the value of the inverse-temperature parameter $\beta$:

| ISA | $\beta$ | Arithmetic | Dyson $\beta\_D$ | Random matrix | AZ classes |
|-----|---------|-----------|-----------------|---------------|-----------|
| Origami | $\beta \to \infty$ | Tropical $(\max,+)$ | $1$ (GOE) | Time-reversal symmetric | AI, BDI, D, CI, DIII |
| Forge | $0 < \beta < \infty$ | Real Gibbs | $2$ (GUE) | No time reversal | A, AIII |
| Meld | $\beta = it$ | Complex amplitudes | $4$ (GSE) | Kramers-degenerate | AII, CII, C, CI |

The opcodes are the same in all three; only the number system and $\beta$ change.
As $\beta \to \infty$ the Gibbs softmax collapses to a tropical argmax — discrete,
classical computation. At finite $\beta$ it is a smooth Gibbs distribution — the
Forge ISA. The Wick rotation $\beta \to it$ turns real Boltzmann weights into
complex amplitudes — quantum mechanics, the Meld ISA.

Behind all three sits **the Ambient** — the smooth $\beta \to 0$ limit in which the
Gibbs measure is uniform, every path equally weighted, no decisions made. The Ambient
is not an ISA; it is the smooth containing manifold from which the three ISAs are
carved: the Origami is the tropical crystal precipitated from it as $\beta \to \infty$,
the Forge is the thermodynamic engine between the Ambient and the crystal, and the
Meld is a Wick slice through it.

This is Baez's threefold way (2013): exactly three associative normed division
algebras (Hurwitz's theorem), exactly three consistent quantum-mechanical
inner-product structures, exactly three Dyson $\beta\_D$ values, exactly three ISA
columns.

**For a full treatment of $\beta$, the snap threshold, the Wick rotation, and the
Ambient:** see [The Forge and Meld ISAs](forge-meld.md).

The **731-ISA** extends beyond all three to the $\mathbb{O}$ (octonion) rung,
adding BIND and SPIN. See [The Non-Associative Frontier](non-associative-frontier.md).

---

## The named ISAs

The opcode set is fixed. What varies is the *regime* — which β-value, which
physical domain, which specialisation of the abstract opcodes is in play.
Each named ISA is a specific point (or arc) in the β-plane, with a characteristic
physical content, a set of patron thinkers, and a distinct informal name chosen
for what it *feels* like to work in that regime.

| Informal name | Formal name | β location | H^k reach | Patron(s) | Hook | IMAGINE count | Algebra | Graphical calculus |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **Origami** | Origami ISA | all β (umbrella) | H⁰–H² | Weyl, Racah | Five-opcode open standard; tropical at β→∞, quantum at β=it | 1 | ℂ | ZX (spiders, undirected) |
| **Forge** | Forge ISA | 0 < β < ∞ (real Gibbs) | H⁰–H² | Boltzmann, Gibbs | Free-energy routing; MGE soft threshold; snap at β* | 1 | ℂ | ZX (weighted) |
| **Raven** | Raven ISA | β ≈ β* (physiological) | H⁰–H² | Hopfield, Ninio | Biological proofreading; enzyme catalysis; kinetic QEC | 1 | ℂ | ZX (weighted) |
| **Knot** | Knot ISA | β → ∞ (imaginary oscillators) | H⁰–H² | Kauffman, Spencer-Brown | Q-calculus; three imaginary marks; Jones polynomial | 3 | ℍ (Q₈) | Directed ZX (oriented wires) |
| **Frog** | Frog ISA | β → ∞ (exceptional) | H⁰–H³ | Kauffman (731 Calculus) | Seven imaginary marks; Fano multiplication; non-associative | 7 | 𝕆 (Moufang loop) | 731 Frog Calculus (4-legged tetrahedra + ribbon-legs) |
| **Motive** | Motive ISA | all β (abstract parent) | H⁰–H³ | Carnot, Bender | ERASE = second law; PT exceptional point; five primitive opcodes | — | — | Laws of Form |
| **Hum** | Hum ISA | β = it/ℏ (imaginary) | H³ | Lamb, Bethe | QFT vacuum; EMIT is the one new primitive; amplituhedron as ORBIT | — | — | Feynman / amplituhedron |
| **Rising Sea** | Rising Sea ISA | full ℂ_β plane | all | Grothendieck | β-plane fibration of all ISAs; Noether from Aut(P_Motive) | — | — | — |
| **Pentagon** | Pentagon ISA | abstract (coherence) | — | Baez, Mac Lane | Monoidal coherence theorem; five sides = five opcodes | — | — | — |

**Reading the table:**

The IMAGINE-count column follows the **Hurwitz tower**: the only normed division
algebras are ℝ (0 imaginary units), ℂ (1), ℍ (3), and 𝕆 (7). The ISA trilogy
(Origami/Forge/Raven) all live at the ℂ level — one imaginary direction, associative.
The Knot ISA extends to ℍ (three imaginary marks, Q-calculus, Jones polynomial).
The Frog ISA extends to 𝕆 (seven imaginary marks, O-calculus, non-associative
Moufang loop, G₂ exceptional geometry). No ISA beyond Frog is possible: the
Hurwitz theorem ends at 𝕆.

The **graphical calculus column** tracks the ZX hierarchy (from Paper 207):
standard ZX (undirected spiders) works at ℂ; **Directed ZX** (oriented wires,
still spiders) is needed at ℍ because quaternion multiplication is non-commutative
— the Spider Theorem still holds but only if wire direction is respected; the
**731 Frog Calculus** is needed at 𝕆 because the Spider Theorem fails entirely
(associativity is gone). Frogs replace spiders: each frog has exactly 4 legs
(the 4 faces of a tetrahedron), each leg is a ribbon-leg carrying 3 Fano colours
(the 3 vertices of that triangular face). The Fano colour triple specifies which
octonion product eₐ · eᵦ = ±eᵧ fires at each face-weld. No leg may carry more
than 4 connections because a 5-valent spider would silently invoke associativity.

- **Motive ISA** is the abstract parent: its five opcodes {MARK, CROSS, IMAGINE, FLOW,
  ERASE} are what remains when you strip every physical specialisation away.
  Origami, Forge, and Raven are all restrictions of Motive to particular β-values and
  opcode subsets. The name comes from Carnot's *puissance motrice* (motive power) —
  the force that drives thermodynamic computation — and echoes Grothendieck's *motives*
  (universal cohomological avatars), intentionally.

- **Hum ISA** extends Motive by one opcode (EMIT) and rotates β to the imaginary
  axis. Willis Lamb named the regime: he called the Lamb shift "the unmistakable hum
  of empty space." EMIT is the vertex at which a particle couples to a field mode;
  without it, the vacuum is silent.

- **Rising Sea ISA** is the categorical envelope: it shows that every named ISA is
  a *fibre* of a single Grothendieck fibration p: E → ℂ_β over the complex
  β-plane. The phrase comes from Grothendieck's own description of his mathematical
  style — patient, structural, letting the sea rise until the hard problems float.

- **Pentagon ISA** is the coherence machine: it proves that the Motive PROP is
  well-defined (confluent, terminating rewriting system) and that the pentagon
  identity holds strictly. Five sides, five opcodes — an unexpected coincidence
  that Baez would appreciate.

### The containment diagram

```
                          Rising Sea ISA
                    (full ℂ_β fibration; Grothendieck)
                               │
               ┌───────────────┼───────────────┐
               │               │               │
         Motive ISA        Pentagon ISA     (future ISAs)
      (abstract parent;   (coherence proof)
       Carnot / Bender)
               │
      ┌────────┼──────────┐
      │        │          │
  Forge ISA  Raven ISA  Hum ISA          Knot ISA    Frog ISA
  (real β)  (physio β)  (β = it/ℏ)      (ℍ, Q₈)    (𝕆, G₂)
      │                                      │           │
  Origami ISA                         3 IMAGINEs   7 IMAGINEs
  (β → ∞, ℂ)                         (Jones poly) (Fano plane)

Graphical calculus:  ZX spiders (ℂ) → Directed ZX (ℍ) → 731 Frogs (𝕆)
```

The Knot and Frog ISAs are siblings at β→∞ that differ from Origami/Forge/Raven
by their number of active IMAGINE directions: 1 (ℂ), 3 (ℍ), or 7 (𝕆).
The Hurwitz theorem closes the tower at 7 — no eighth imaginary direction is possible
in a normed division algebra.

The horizontal axis inside each ISA is the H^k degree — opcodes at H⁰, H¹, H², H³.
The vertical axis is the β-plane location.
The three operative ISAs (Origami/Forge/Raven) live on the real β-axis;
Hum lives on the imaginary axis; Rising Sea covers the whole plane.

---

## Relationship to other graphical calculi

The ISA opcodes did not emerge from nowhere. Two graphical calculi were the direct predecessors.

**ZX calculus** (Coecke and Duncan, 2008) is a complete graphical language for qubit
quantum mechanics built from two spider generators (Z and X) obeying the Frobenius
equations. It covers SPLIT, SPLAT, FLIP, and LABEL fully, and handles TWIST partially
(phase gates exist in ZX but the full ribbon/topological twist — Berry phase, anyonic
spin, BKT transition — is not expressible). FLOP is partially present as the compact
structure (cups and caps) but the fermion-statistics interpretation ($C^2 = \pm 1$)
is outside ZX's scope. BIND is entirely absent: ZX is strictly associative.

**The 731 Frog Calculus** extends ZX to the non-associative regime by adding the
*frog vertex* — a trivalent node with a non-trivial associator, realised physically
as $G_2$/octonion symmetry. The frog vertex is exactly the BIND opcode. The two
foundational papers are:

- [The 731 Frog Calculus, Part 1](https://doi.org/10.5281/zenodo.19713350) (Paper 207) — three-dimensional spin foams, magmoidal category theory, and non-associative topology
- [The 731 Frog Calculus, Part 2](https://doi.org/10.5281/zenodo.20139448) (Paper 281) — two-dimensional frog diagrams, ribbon-leg syntax, and $G_2$ spin foam rewriting rules

The containment is strict:

$$\text{ZX calculus} \;\subset\; \text{731 Frog Calculus} \;\subset\; \text{Origami ISA}$$

ZX lives at H¹ (Clifford/stabiliser regime, $\mathbb{C}$-rung of the division algebra
ladder). The Frog Calculus adds the H² BIND opcode ($\mathbb{O}$-rung). The full
Origami ISA extends both to all physical domains — spectroscopy, molecular computing,
financial risk, climate economics — running the same categorical morphisms on
different hardware.

---

## Further reading

**The ISA foundations:**

- **[The Origami ISA: Eight Derivations of a Universal Instruction Set](https://doi.org/10.5281/zenodo.20774076)** (Paper 455) — eight independent routes all forced to the same opcodes; why this gate set is universal at a deeper level than Solovay-Kitaev
- **[The Origami Calculus](https://doi.org/10.5281/zenodo.20474914)** (Paper 349) — the diagrammatic framework grounded in the Ponzano–Regge tetrahedron; the mathematical home of the opcode symbols ■ ◇ ▲ △ ↻
- **[The Magmoidal Origami ISA](https://doi.org/10.5281/zenodo.19916429)** (Paper 258) — original definition; FLIP/FLOP/SPLIT/SPLAT/TWIST/SPIN; the symbol logic (filled = creation, hollow = annihilation; 4-sided = stellar move, 3-sided = bistellar move)
- **[The Opcode Rosetta Stone](https://doi.org/10.5281/zenodo.20761260)** (Paper 447) — the same seven opcodes identified across twelve exactly-solvable models (Ising, Heisenberg, Kitaev, XXZ, Hubbard, Bethe ansatz, ...); universal ISA dictionary

**The graphical calculi:**

- **[The 731 Frog Calculus, Part 1](https://doi.org/10.5281/zenodo.19713350)** (Paper 207) — three-dimensional spin foams, magmoidal category theory, non-associative topology
- **[The 731 Frog Calculus, Part 2](https://doi.org/10.5281/zenodo.20139448)** (Paper 281) — two-dimensional frog diagrams, ribbon-leg syntax, $G_2$ rewriting rules

**The H^k computational tower:**

- **[The Forge and Meld ISAs](forge-meld.md)** — full treatment of β, the snap threshold β*, the Wick rotation β → it, vortons, and how the same opcodes run over tropical / Gibbs / complex arithmetic
- **[The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526)** (Paper 420) — H⁰ classical / H¹ Clifford / H² magic; TWIST failure as phase boundary; β* snap threshold
- **[BIND at the octonion rung](non-associative-frontier.md)** — the Non-Associative Frontier page; division algebra ladder ℝ→ℂ→ℍ→𝕆
- **[BKT Transition / TWIST Failure](glossary.md#bkt-transition--twist-failure)** — TWIST in depth; quantum dimension, $d_{1/2}(\beta)=0$ at $\beta=1/2$

**For number theorists and algebraic geometers:**

- **[The Langlands Perspective](langlands.md)** — how each opcode column in the
  tables above maps onto the Langlands programme: SPLIT = spectral decomposition
  of $L^2(G(\mathbb{Q})\backslash G(\mathbb{A}))$; TWIST = Tate twist / Hecke
  character; BIND = Rankin-Selberg convolution; FLOP = Arthur-Selberg trace
  formula. The Langlands correspondence as adèlic ISA semiring-polymorphism.
