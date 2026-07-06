---
layout: default
title: "The ISA Opcodes"
nav_order: 4
description: "The twelve opcodes of the Origami/Forge/Meld ISA: what each one does, its string diagram, its Pachner move, and where it appears across physics, mathematics, and economics."
tags: [isa, opcodes, flip, flop, split, splat, twist, label, bind, orbit, fork, superpose, entangle, meld, category-theory, string-diagrams, completeness]
portfolio: B
---

# The ISA Opcodes
{: .no_toc }

*Twelve operations. One language for quantum physics, topological phases, molecular
computing, the Langlands programme, and more — from classical Turing machines to the
full Meld.*

**Legend:** 🕷️ present in ZX calculus · 🕷️* partial (ZX has a related construct but not the full ISA semantics) · 🐸 present in the 731 Frog Calculus · unmarked = ISA-native

---

## Why twelve opcodes, and why these twelve?

The Origami ISA is not an arbitrary instruction set. It is the **minimal magmoidal
extension of the free traced symmetric monoidal category (TSMC)** — the smallest
opcode set that is both TSMC-complete and magmoidal-complete. Every opcode except BIND
is a named morphism in the TSMC + Frobenius structure (the "spider calculus"). BIND is
the unique opcode that requires a magmoidal extension: it encodes a non-trivial
associator, realised physically as G₂/octonion symmetry.

The twelve opcodes form a **completeness hierarchy**: each new opcode lifts the ISA to
the next level of the cohomological (H^k) computational tower, and no opcode at level
k can be simulated by any combination of opcodes at level k−1.

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

## The seven opcodes

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

### TWIST 🕷️*

**A wire acquires a phase** (a curl or loop in the diagram).

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

### FLIP 🕷️

**A wire reverses orientation** (arrow pointing down instead of up).

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

### LABEL 🕷️

**A wire passes through a projector** (sector selection).

```
    │
  ┌─┴─┐
  │ e │   (e² = e)
  └─┬─┘
    │
```

| | |
|---|---|
| **String diagram** | Idempotent / projector $e: A \to A$ with $e^2 = e$ — a box on a wire that squares to itself |
| **Pachner move** | No direct Pachner counterpart; it is the *colouring* operation that labels edges/faces before Pachner moves act |
| **Category theory** | The splitting of an idempotent; the augmentation map $\varepsilon: \mathcal{H} \to \mathbb{C}$ selecting the $+1$ eigenspace |
| **Algebra** | Gauge fixing; stabiliser projection; sector selection; the Satake isomorphism |

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

### BIND 🐸

**Three wires enter a vertex** (non-Abelian fusion; associator).

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

**BIND theorem** (*The Opcode Rosetta Stone*, Paper 447): A gapped topological phase
has **non-Abelian anyonic order if and only if** its minimal ISA programme contains
BIND. Associative phases are BIND-free; non-associative phases require BIND.

**BIND and the division algebra ladder:**
- No BIND: associative computation — $\mathbb{R}$, $\mathbb{C}$, or $\mathbb{H}$ rung
- BIND with Pentagon identity holding: quasi-associative — $\mathbb{O}$-rung (Fibonacci anyons, $G\_2$, $E\_8$)
- BIND with Pentagon identity **failing**: fully non-associative — 731-ISA regime; Furey's octonionic Standard Model programme

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
| SPLAT | 🕷️ | $\varepsilon: A \to k$ (cap/cup) | $4 \to 1$ | — | All rungs | L-function evaluation |
| TWIST | 🕷️* | $\theta\_V: V \to V$ (curl) | Gauge move | $S$ (chiral) | All rungs | Monodromy of local system |
| FLIP | 🕷️ | $(-)^\dagger$ (wire reversal) | $1 \to 3$ | $T$ (time reversal) | $\mathbb{R}$ / $\mathbb{H}$ | Langlands duality $G \leftrightarrow G^\vee$ |
| FLOP | 🕷️* | $\mathrm{tr}$ (cup) | $3 \to 1$ | $C$ (particle-hole) | $\mathbb{R}$ / $\mathbb{H}$ | Abelian reciprocity ($GL\_1$) |
| LABEL | 🕷️ | $e^2 = e$ (projector) | Colouring | — (parity in PT) | All rungs | Automorphic representation $\pi$ |
| BIND | 🐸 | Associator $\alpha\_{A,B,C}$ (trivalent) | Obstruction | — | $\mathbb{O}$ only | Non-Abelian Hecke interaction |

---

## The two theorems

Everything above is a dictionary. Two theorems give it teeth.

**Theorem 1 — BIND = Non-Abelian** (*Paper 447*): A gapped topological phase has
non-Abelian anyonic order if and only if its minimal ISA programme contains BIND.
This is a syntactic test: inspect the Hamiltonian for three-body terms that cannot
be factored into products of two-body operators.

**Theorem 2 — Universal Phase Boundary** (*Paper 447*): For any model in the
$\mathrm{SU}(2)\_{q}$ family at $q = e^{i\pi\beta}$, the quantum phase transition is
a TWIST failure at $\beta = \tfrac{1}{2}$, where the quantum dimension
$d\_{1/2}(\beta) = 2\cos(\pi\beta) = 0$ exactly.

---

## The ISA trilogy and the Baez threefold way

The three ISAs in the trilogy differ only in which *number system* their opcodes
run over:

| ISA | Arithmetic | Dyson $\beta\_D$ | Random matrix | AZ classes |
|-----|-----------|-----------------|---------------|-----------|
| Origami | $\mathbb{R}$ (reals) | $1$ (GOE) | Time-reversal symmetric | AI, BDI, D, CI, DIII |
| Forge | $\mathbb{C}$ (complex) | $2$ (GUE) | No time reversal | A, AIII |
| Meld | $\mathbb{H}$ (quaternions) | $4$ (GSE) | Kramers-degenerate | AII, CII, C, CI |

This is Baez's threefold way (2013): exactly three associative normed division
algebras (Hurwitz's theorem), exactly three consistent quantum-mechanical
inner-product structures, exactly three Dyson $\beta\_D$ values, exactly three ISA
columns. The opcodes are the same in all three; only the number system changes.

The **731-ISA** extends beyond all three to the $\mathbb{O}$ (octonion) rung,
adding BIND and SPIN. See [The Non-Associative Frontier](non-associative-frontier.md).

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

- **The opcodes defined:** [Paper 258 — The Magmoidal Origami ISA](papers/10.5281-zenodo.19916429/)
- **The opcodes across 12 models:** [Paper 447 — The Opcode Rosetta Stone](papers/) *(upload pending)*
- **AZ tenfold way as ISA opcode patterns:** [Paper 457 — The Thermal AZ Table](papers/) *(upload pending)*
- **BIND at the octonion rung:** [The Non-Associative Frontier](non-associative-frontier.md)
- **TWIST failure in depth:** [BKT Transition / TWIST Failure](glossary.md#bkt-transition--twist-failure)
- **The Langlands opcode map:** Paper 461 — *Langlands as ISA Programme* *(in preparation)*
