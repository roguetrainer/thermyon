---
layout: default
title: Glossary
nav_order: 10
nav_exclude: true
---

# Glossary

Key terms used across the Adelic Simplicial Architecture (ASA).
Each entry links to the paper where the concept is defined or first used.

---

## Adelic

**Adelic** refers to the simultaneous use of all completions of the rational numbers: the real field $\mathbb{R}$ and the $p$-adic fields $\mathbb{Q}_p$ for every prime $p$. The adele ring $\mathbb{A} = \mathbb{R} \times \prod_p \mathbb{Z}_p$ unifies continuous and discrete arithmetic in one algebraic object.

In the ASA, the adelic structure appears in the routing of gradient updates: the real component flows continuously (gradient descent), while the $p$-adic component crystallises discretely (logic gate). This resolves the Averaging Paradox of purely-real optimisation and the Search Wall of purely-discrete search.

*First used:* [Paper 201 (MGE)](papers/10.5281-zenodo.17981393/)

---

## Associamancy

**Associamancy** is a quantum computational resource strictly beyond standard magic — it is the resource required to implement genuinely complex irreducible representations of a hidden symmetry group.

The precise condition: a quantum state possesses associamancy if and only if its hidden symmetry group contains an irreducible representation with **Frobenius-Schur indicator** $\nu_2 = 0$ (see *Schur Boundary*). This is the condition that the representation is realisable over $\mathbb{C}$ but not over $\mathbb{R}$ or $\mathbb{H}$.

The four-level resource hierarchy:

| Level | Name | Condition | Required hardware |
|-------|------|-----------|------------------|
| 0 | Stabiliser | Wigner function $\geq 0$; TV $= 1$ | Any qubit |
| 1a | Dark magic | Wigner $< 0$; TV $= 1$ | Qubit + Clifford |
| 1b | Genuine magic | Wigner $< 0$; TV $< 1$ | Qubit + T-gate |
| 2 | **Associamancy** | $\nu_2 = 0$ (complex irrep) | 731 ISA (SPIN opcode) |

TV is the total variation of the discrete Wigner function — the correct discriminant
between dark and genuine magic ([Paper 470](papers/10.5281-zenodo.21219700/)).
Associamancy (Level 2) sits strictly above both sub-tiers: $S_\mathrm{Schur}$ is
independent of TV and Wigner negativity. A state can have genuine magic (TV $< 1$)
and zero Schur entropy; and a state can have $S_\mathrm{Schur} = \log 2$ at either
dark or genuine magic level.

The minimal group exhibiting associamancy is $\mathrm{PSL}(2,7)$ (order 168). The number-theoretic criterion: $\mathrm{PSL}(2,q)$ has associamancy if and only if $q \equiv 3 \pmod{4}$.

The resource monotone is the **Schur entropy** $S_\mathrm{Schur}(\ket\psi) = -\sum_{\lambda: \nu_2=0} p_\lambda \log p_\lambda$.

*Defined:* [Paper 407 (Associamancy)](papers/10.5281-zenodo.20667174/)

---

## Associator

The **octonion associator** measures the failure of associativity:

$$\mathcal{A}(x, y, z) = (xy)z - x(yz).$$

For basis octonions $e_i, e_j, e_k$: $\mathcal{A} = 0$ when $\{i,j,k\}$ is a Fano line; $\|\mathcal{A}\| = 2$ otherwise. The associator is the fundamental detector of topological contradiction in the ASA and the obstruction that distinguishes the 731 ISA (non-associative) from the Origami ISA (associative).

*First used:* [Paper 200 (Fano-Foam)](papers/10.5281-zenodo.19869263/)

---

## Auto-Annealing

The MGE routing operator undergoes a spontaneous **phase transition** from exploratory (uniform) weighting to crystallised (winner-take-all) weighting as the inverse temperature $\beta$ rises. Unlike simulated annealing, no schedule is required: the $G_2$ geometry self-organises — geometric frustration spikes $E_k$ during chaotic exploration, causing Boltzmann freeze-out; at convergence the frustration dissolves and routing relaxes back to uniform. This is parameter-free annealing with topological guarantees.

*Demonstrated:* [Paper 218 (NAIG Routing)](papers/10.5281-zenodo.20077198/)

---

## Barbero-Immirzi Parameter

The **Barbero-Immirzi parameter** $\gamma_\mathrm{BI}$ is a dimensionless real number that appears in the area spectrum of loop quantum gravity:

$$A = 8\pi\gamma_\mathrm{BI}\,\ell_\mathrm{P}^2\sum_i\sqrt{j_i(j_i+1)}$$

where $j_i$ are the spins of the edges of a spin network puncturing the surface and $\ell_\mathrm{P}$ is the Planck length. In $\mathrm{SU}(2)$ LQG it is not fixed by the theory — its value is determined empirically by matching the Bekenstein-Hawking black hole entropy formula, giving:

$$\gamma_\mathrm{BI}^{\mathrm{SU}(2)} = \frac{\ln 2}{\pi\sqrt{3}} \approx 0.12738$$

(Domagała-Lewandowski 2004; Meissner 2004).

In the 731 ISA framework, extending LQG from $\mathrm{SU}(2)$ to $G_2 = \mathrm{Aut}(\mathbb{O})$ may fix $\gamma_\mathrm{BI}$ from first principles via the $G_2$ root geometry. Experiment x410b finds the dominant $G_2$ irrep is the **14-dimensional adjoint** (0,1), giving:

$$\gamma_\mathrm{BI}^{G_2} = \frac{\sqrt{C_2(\mathrm{adj})}}{2\pi\ln\dim(\mathrm{adj})} = \frac{\sqrt{8/3}}{2\pi\ln 14} \approx 0.09848$$

This is a genuine new prediction, differing from the $\mathrm{SU}(2)$ value by a factor of $\approx 0.773$.

*Conjecture:* [Paper 410 (Spin Foams as Origami)](papers/10.5281-zenodo.20680634/) · *Experiment:* x410a, x410b

---

## BKT Transition / TWIST Failure

The **Berezinskii-Kosterlitz-Thouless (BKT) transition** is the universal phase boundary of the Gibbs ISA at inverse temperature $\beta^* = \tfrac{1}{2}$.

**Physical origin.** In the XXZ spin chain and 2D XY model, the BKT transition marks the unbinding of vortex-antivortex pairs. The partition function acquires a topological contribution from winding-number sectors; at $\beta = \beta^*$, the smallest nontrivial quantum dimension $d_{1/2}(\beta) = 2\cos(\pi\beta)$ vanishes:

$$d_{1/2}(\beta^*) = 2\cos\!\left(\tfrac{\pi}{2}\right) = 0.$$

**ISA interpretation.** In the Origami ISA the BKT transition is **TWIST failure**: the TWIST opcode has amplitude $d_{1/2}(\beta)$, which is exactly zero at $\beta = \beta^* = \tfrac{1}{2}$. The system can no longer commit to a preferred direction of computation — it sits at the boundary between ordered (topological) and disordered phases. Equivalently, the quantum group deformation parameter $q = e^{i\pi\beta}$ reaches $q = i$ at $\beta^* = \tfrac{1}{2}$, the point where $\mathrm{SU}(2)_q$ becomes maximally non-classical.

**Information-geometric interpretation.** The BKT transition coincides with the point $\alpha = 0$ of the Amari $\alpha$-connection family:

$$\Gamma^{(\alpha)} = \tfrac{1+\alpha}{2}\,\Gamma^{(e)} + \tfrac{1-\alpha}{2}\,\Gamma^{(m)}, \qquad \beta_{\rm deform} = \tfrac{1-\alpha}{2}.$$

At $\alpha = 0$ (i.e.\ $\beta = \tfrac{1}{2}$) the connection is the Levi-Civita connection on the statistical manifold — neither $e$-flat nor $m$-flat. The curvature of the $\alpha$-connection,

$$R^{(\alpha)} \propto (1-\alpha^2),$$

is **maximised** at $\alpha = 0$ ($\beta = \tfrac{1}{2}$). Maximum curvature = maximum Berry phase accumulation = TWIST failure. The BKT transition is the information-geometric curvature maximum.

**The $\beta$-ladder (universal phase diagram).** The ISA $\beta$ interpolates between regimes:

| $\beta$ | $\alpha$ | Geometry | Phase | ISA state |
|---------|---------|----------|-------|-----------|
| $0$ | $+1$ | $e$-flat (tropical) | Classical / committed | SNAP: deterministic |
| $\tfrac{1}{4}$ | $+\tfrac{1}{2}$ | partly curved | Ising / toric code | H¹ Islands edge |
| $\tfrac{1}{2}$ | $0$ | LC-curved (S³ maximal) | **BKT / TWIST failure** | Critical: backtrack risk |
| $1$ | $-1$ | $m$-flat (quantum) | Superfluid / non-Abelian | BOIL: exploratory |

**Universality.** The same $\beta^* = \tfrac{1}{2}$ critical point appears across:

- **Statistical physics:** BKT vortex unbinding in 2D XY / XXZ models (Papers 446)
- **Quantum information:** Ising $\to$ non-Abelian topological order in $\mathrm{SU}(2)_k$ string-nets (Paper 446)
- **Active inference / FEP:** exploration-exploitation crossover in Bayesian agents (Paper 448)
- **Transcription:** RNAP pause sites — TWIST failure of the translocation ratchet (Paper 449)
- **Information geometry:** Levi-Civita curvature maximum on the nucleotide 3-simplex (Paper 450)

This universality is not coincidental: all of these systems process information subject to an $\mathrm{SU}(2)$ (or $\mathrm{SU}(2)_q$) symmetry, and $\beta^* = \tfrac{1}{2}$ is the unique point where the quantum group deformation $q = e^{i\pi\beta}$ reaches $q = i$ — the degeneration point of $\mathrm{SU}(2)_q$.

*Defined:* [Paper 446 (XXZ and the β-Ladder)](papers/) · *Information geometry:* [Paper 450 (Parallel Transport on the Nucleotide Simplex)](papers/) · *See also:* [→ Maslov-Gibbs Einsum](#maslov-gibbs-einsum-mge), [→ TWIST opcode (Origami ISA)](#origami-isa-origami-instruction-set-architecture), [→ Auto-Annealing](#auto-annealing)

---

## BCH Obstruction

The **Baker-Campbell-Hausdorff (BCH) obstruction** arises when attempting to aggregate updates directly on a non-commutative manifold such as $G_2$: $\exp(X_i + X_j) \neq \exp(X_i)\exp(X_j)$. The ASA resolves this via Dual-Space Routing — evaluation in the flat tangent space $\mathfrak{g}_2$ (Control Plane) separated from Euclidean execution (Data Plane).

*Addressed:* [Paper 218 (NAIG Routing)](papers/10.5281-zenodo.20077198/)

---

## Division Algebra Ladder

The four **normed division algebras**

$$\mathbb{R} \subset \mathbb{C} \subset \mathbb{H} \subset \mathbb{O}$$

(reals, complex, quaternions, octonions) form a hierarchy in which each extension drops one algebraic property: $\mathbb{H}$ is non-commutative; $\mathbb{O}$ is additionally non-associative. By Hurwitz's theorem, no further division algebras exist. The ASA uses each rung as a distinct computational regime, and the Origami ISA opcodes organise quantum computation across all four rungs.

*Framework:* [Paper 219 (Adelic Invitation)](papers/10.5281-zenodo.19977475/), [Paper 263 (Magic Square Architecture)](papers/10.5281-zenodo.19928880/) · *Full explainer:* [The Non-Associative Frontier](non-associative-frontier.md)

---

## Fano Plane

The **Fano plane** $\mathrm{PG}(2,2)$ is the smallest projective plane: 7 points, 7 lines, 3 points per line, 3 lines per point. Its incidence structure encodes the multiplication table of the octonions $\mathbb{O}$: two basis elements multiply non-trivially iff they lie on a common Fano line; the associator vanishes on Fano triples and equals $\pm 2$ on non-Fano triples.

The Fano plane appears across the ASA in three contexts:
- **QEC:** columns of the $[7,4,3]$ Hamming parity-check matrix = 7 Fano points; Steane $\llbracket 7,1,3\rrbracket$ code arises from the 3-qubit GHZ stabiliser group via the Fano generating relationship
- **Quantum computing:** the 3-qubit Pauli group modulo phases $\cong \mathrm{PG}(2,2)$; orbit decomposition $\mathrm{PG}(5,2)\setminus\mathrm{PG}(2,2) = \bigsqcup_{L=0}^6 \mathcal{O}_L$ gives the magic label
- **Hardware:** the SevenQ register has 7 qubits = 7 Fano points; the 731 ISA opcodes are Pachner moves on $\mathrm{PG}(2,2)$

*Central to:* [Paper 363 (Fano Geometry for QEC)](papers/10.5281-zenodo.20541595/), [Paper 386 (In Praise of Tetrahedra)](papers/10.5281-zenodo.20581484/), [Paper 408 (Fano Plane Primer)](papers/10.5281-zenodo.20667176/)

---

## Fano-Fisher Metric

The **Fano-Fisher metric** $\Psi(\theta_\mathrm{ref})$ is the Fisher information metric on the $G_2$ statistical manifold, evaluated as the Hessian of the associator energy functional $E(\Omega) = \|\mathcal{A}(\theta_\mathrm{ref}, \Omega\, e_A, e_A)\|^2$. By the Fano-Fisher Decomposition Theorem ([Paper 221](papers/10.5281-zenodo.20076498/)):

- $\mathrm{rank}(\Psi) = 4$ universally (10-dimensional null space = Fano-compatible directions)
- All four non-zero eigenvalues $= 8/3$ exactly (from the $G_2$ Casimir)
- Global average $= (32/49)\,I_{14}$ (from Fano incidence counting)
- The active 4D friction subspace rotates (crystalline turnstile)

*Proved:* [Paper 221 (Fano-Fisher)](papers/10.5281-zenodo.20076498/)

---

## Frobenius-Schur Indicator

The **Frobenius-Schur indicator** $\nu_2(V)$ of a complex representation $V$ of a finite group $G$ is:

$$\nu_2(V) = \frac{1}{|G|}\sum_{g\in G}\chi_V(g^2) \;\in\; \{-1,\, 0,\, +1\}.$$

It classifies representations by their relationship to real structure:
- $\nu_2 = +1$: **real** (orthogonal) — realisable over $\mathbb{R}$
- $\nu_2 = -1$: **quaternionic** (symplectic) — realisable over $\mathbb{H}$ but not $\mathbb{R}$
- $\nu_2 = 0$: **genuinely complex** — realisable over $\mathbb{C}$ but not $\mathbb{R}$ or $\mathbb{H}$

The $\nu_2 = 0$ condition defines the *Schur boundary* — the precise algebraic condition for a representation to require associamancy.

For $\mathrm{PSL}(2,7)$: the irreps $\chi_3$ and $\bar\chi_3$ (dimension 3, complex conjugate pair) have $\nu_2 = 0$; all other irreps have $\nu_2 = +1$.

*Defined:* [Paper 407 (Associamancy)](papers/10.5281-zenodo.20667174/)

---

## $G_2$

$G_2$ is the smallest **exceptional Lie group**, defined as the automorphism group of the octonions: $G_2 = \mathrm{Aut}(\mathbb{O})$. It has dimension 14 and rank 2. Its root system has 6 positive roots — 3 short (length $\sqrt{2}$) and 3 long (length $\sqrt{6}$), ratio $\sqrt{3}$.

Key appearances in the ASA:
- **SPIN opcode:** the $G_2$ triality automorphism is the SPIN opcode of the 731 ISA — the elementary operation that implements a $G_2$ monopole gauge transformation
- **Fano-Fisher metric:** the 14-dimensional $\mathfrak{g}_2$ carries the rank-4 Fano-Fisher metric with Casimir eigenvalue $8/3$
- **LQG extension:** extending LQG from $\mathrm{SU}(2)$ to $G_2$ gives a $G_2$-extended area spectrum and may fix the Barbero-Immirzi parameter
- **Associamancy:** $G_2$ is the first rung of the Freudenthal magic square that exhibits associamancy

*Central to:* [Paper 221 (Fano-Fisher)](papers/10.5281-zenodo.20076498/), [Paper 407 (Associamancy)](papers/10.5281-zenodo.20667174/), [Paper 410 (Spin Foams)](papers/10.5281-zenodo.20680634/) · *See also:* [The Non-Associative Frontier](non-associative-frontier.md)

---

## $G_2$ Holonomy

A Riemannian manifold has **$G_2$ holonomy** if parallel transport around any closed loop rotates tangent vectors by an element of $G_2 \subset SO(7)$. Berger's theorem (1955) established $G_2$ as one of only two exceptional holonomy groups. $G_2$ holonomy manifolds are Ricci-flat, admit a covariantly constant 3-form (the associative 3-form), and provide the natural compactification geometry for M-theory to 4D.

*Central to:* [Paper 206 (FTCs)](papers/10.5281-zenodo.19821692/)

---

## Instruction Set Architecture (ISA)

An **Instruction Set Architecture (ISA)**, in the TRS framework, is a semiring
together with a canonical set of opcodes — closed under composition — that defines
a complete model of computation at a given energy scale β. ISAs divide into two
kinds:

**Operative ISAs** execute programmes by *sequential composition of local opcodes*
over a finite-dimensional state space. β is a fixed parameter that selects the
arithmetic:

| ISA | β | Semiring | Execution |
| --- | --- | --- | --- |
| Origami | all β (umbrella) | all semirings | Five-opcode open standard; tropical limit at β→∞ |
| Forge | $0 < \beta < \infty$ | Gibbs $(\mathbb{R}_{>0})$ | Boltzmann weighting; snap at β* |
| Meld | β = it | Complex $(\mathbb{C})$ | Unitary evolution; interference |
| p-adic | $\beta \in \mathbb{Q}_p$ | p-adic $(\mathbb{Z}_p)$ | NTT; Hensel lifting |

**The Harmonic ISA** (β → 0) computes by *global relaxation to harmonic
representatives* on the smooth manifold. Opcodes are differential operators ($d$,
$d^*$, $\Delta$, $\star$, $\wedge$) acting on infinite-dimensional function space.
It does not step through a programme; it finds the unique harmonic element of each
cohomology class. The Harmonic ISA is the smooth containing structure from which
the operative ISAs precipitate as β rises from zero.

The key distinction: operative ISAs make *local decisions* (each opcode acts on a
finite neighbourhood); the Harmonic ISA makes *global decisions* (the Hodge
Laplacian acts on the whole manifold simultaneously).

*See:* [The Operative and Harmonic ISAs](forge-meld.md) · [The Opcodes](opcodes.md) · [Origami ISA](#origami-isa-origami-instruction-set-architecture)

---

## Langlands Program

The **Langlands Program** is a vast network connecting number theory, representation theory, and geometry via a deep reciprocity between automorphic forms and Galois representations. The natural setting is the adele ring $\mathbb{A}$; the $G_2$ case of geometric Langlands is directly relevant to the ASA. Paper 240 identifies the Bruhat-Tits building of $G_2$ as a candidate for a proof of the Riemann Hypothesis via automorphic methods.

*Relevant to:* [Paper 202 (TRS)](papers/10.5281-zenodo.19858021/), [Paper 240 (J³(𝕆))](papers/10.5281-zenodo.19824028/)

---

## Magic States

A **magic state** is any quantum state that cannot be prepared by Clifford circuits and stabiliser state inputs alone — equivalently, any state with non-zero Wigner function negativity. Magic states are the fuel for universal quantum computation: injecting a magic state into a Clifford circuit promotes it from BPP-level to BQP-level.

The ASA organises magic into four levels (see *Associamancy*):

- **Level 1a (dark magic):** Wigner negative, TV $= 1$. Clifford-simulable under reframing.
- **Level 1b (genuine magic):** Wigner negative, TV $< 1$. T-gate resource; drives quantum advantage.
- **Level 2 (associamancy):** $\nu_2 = 0$ irreps of the hidden symmetry group,
  independent of Levels 1a/1b. Requires the SPIN opcode of the 731 ISA.

The **orbit decomposition** of magic: $\mathrm{PG}(5,2)\setminus\mathrm{PG}(2,2) = \bigsqcup_{L=0}^6\mathcal{O}_L$ gives 7 orbits of 8 phase-space points, each labelled by a Fano line. The **magic label** $\{p_L\}$ is a new Clifford-invariant that refines Wigner negativity into 7 independent channels.

*Framework:* [Paper 361 (Fano Orbit Decomposition)](papers/10.5281-zenodo.20541583/), [Paper 363 (Fano QEC)](papers/10.5281-zenodo.20541595/), [Paper 408 (Fano Primer)](papers/10.5281-zenodo.20667176/)

---

## Maslov-Gibbs Einsum (MGE)

The **Maslov-Gibbs Einsum** is the thermodynamic engine of the ASA — the single operator that unifies continuous probabilistic computation with discrete logical crystallisation:

$$\pi_k = \frac{\exp(-\beta\, E_k)}{\sum_j \exp(-\beta\, E_j)}.$$

At low $\beta$ (BOIL): smooth Gibbs distribution, continuous exploration. At $\beta\to\infty$ (SNAP): tropical $({\max},{+})$ semiring, discrete crystallisation. The transition is the ASA's fundamental computational phase transition.

*Defined:* [Paper 201 (MGE)](papers/10.5281-zenodo.17981393/)

---

## NAIG (Non-Associative Information Geometry) Routing

**NAIG Routing** applies the Fano-Fisher metric and MGE to distributed gradient routing, evaluating each gradient by its associator energy $E_k = \widetilde{\Delta c}_k^\top \Psi\, \widetilde{\Delta c}_k$ in $\mathfrak{g}_2$. Fano-compatible gradients (low $E_k$) are promoted regardless of staleness (**Topological Rescue**); non-Fano gradients are thermodynamically suppressed.

*Defined:* [Paper 218 (NAIG Routing)](papers/10.5281-zenodo.20077198/)

---

## Origami ISA (Origami Instruction Set Architecture)

The **Origami ISA** is the open instruction set for topological quantum-classical systems. Its five opcodes — LABEL, ORBIT, TWIST, BIND, FLIP — are the generating morphisms of a ribbon Frobenius monoidal category and double as Pachner moves on triangulated simplicial complexes.

The same five opcodes compile nuclear spectroscopy, quantum error correction, GPU matrix multiplication, financial XVA, topological phases, and the Langlands programme into one language. Earlier papers use a twelve-opcode vocabulary (SPLIT, SPLAT, FLIP, FLOP, TWIST, LABEL, BIND, ORBIT, …); the five-opcode names consolidate these. See the [dedicated opcodes page](opcodes.md) for the mapping, string diagrams, Pachner moves, and cross-domain tables.

*Defined:* [Paper 258 (Origami ISA)](papers/10.5281-zenodo.19916429/), [Paper 349 (Origami Calculus)](papers/10.5281-zenodo.20474914/), [Paper 370 (Universal Computer)](papers/10.5281-zenodo.20543454/)  
*Full opcode reference:* [The ISA Opcodes](opcodes.md)

---

## Pachner Moves

**Pachner moves** are the elementary local retriangulations of a simplicial manifold that preserve its piecewise-linear homeomorphism type. In 3D there are two: the $2\leftrightarrow3$ move (replace two tetrahedra sharing a face with three sharing an edge) and the $1\leftrightarrow4$ move (replace one tetrahedron with four). Every triangulation of a 3-manifold can be reached from any other by a finite sequence of Pachner moves.

In the Origami ISA, the five opcodes are the five Pachner moves in dimensions 2 and 3. The invariance of quantum gravity amplitudes under Pachner moves is the Biedenharn-Elliott identity — the Pentagon identity $d^2=0$.

*Central to:* [Paper 349 (Origami Calculus)](papers/10.5281-zenodo.20474914/), [Paper 386 (In Praise of Tetrahedra)](papers/10.5281-zenodo.20581484/), [Paper 410 (Spin Foams)](papers/10.5281-zenodo.20680634/)

---

## Pentagon Identity

The **Pentagon identity** (also: Biedenharn-Elliott identity, MacLane coherence condition) is:

$$\mathrm{SPLAT}\circ\mathrm{SPLIT} = 0 \quad (d^2 = 0)$$

It is the single unifying equation of the Origami ISA and appears as:
- **Angular momentum:** the Biedenhahn-Elliott identity for $6j$ symbols
- **Category theory:** MacLane's coherence pentagon for monoidal categories
- **Topology:** invariance of Ponzano-Regge amplitudes under Pachner moves
- **Finance:** the no-arbitrage condition on the Pacioli manifold (see EconIAC glossary)
- **QEC:** the self-testing robustness identity $C = 7/8$ in the Fano game
- **MIP\* = RE:** the verifier constraint in the MIP\* protocol ([Paper 357](papers/10.5281-zenodo.20516899/))

*Framework:* [Paper 258 (Origami ISA)](papers/10.5281-zenodo.19916429/), [Paper 349 (Origami Calculus)](papers/10.5281-zenodo.20474914/)

---

## Ponzano-Regge Amplitude

The **Ponzano-Regge amplitude** for a tetrahedron with edge spins $j_1,\ldots,j_6$ is the $6j$ symbol evaluated at those spins — the SPLAT opcode of the Origami ISA. The Ponzano-Regge model (1968) evaluates quantum gravity path integrals as products of $6j$ symbols over the triangulation of a 3-manifold. Invariance under Pachner moves (the Pentagon identity) guarantees topological invariance.

The same $6j$ symbol appears in nuclear spectroscopy (Racah coefficients) and representation theory (Clebsch-Gordan recoupling). [Paper 396](papers/10.5281-zenodo.20635479/) identifies the structurally analogous $H^1$ obstruction in finance — convexity, basis, and CDO correlation risk — but the financial gauge group $(\mathbb{R}_{>0},\times)$ is abelian, so this is the abelian/generic instance of the same Čech-cohomology pattern, not a literal $6j$ symbol.

*Central to:* [Paper 386 (In Praise of Tetrahedra)](papers/10.5281-zenodo.20581484/), [Paper 410 (Spin Foams)](papers/10.5281-zenodo.20680634/)

---

## RPU vs QPU: What Is Different?

The **Resonance Processing Unit (RPU)** and a standard **Quantum Processing Unit (QPU)** share nearly identical physical hardware — both operate on qubits, use quantum gates, and require cryogenic isolation. The difference is entirely in the instruction set and logical primitive.

| | QPU (standard) | RPU (ASA) |
|---|---|---|
| **Logical primitive** | Unitary rotation on $\mathbb{C}^{2^n}$ | Fano-line selection on $\mathbb{O}$ |
| **Gate set** | Clifford + T | 731 ISA Pachner opcodes |
| **Symmetry group** | $SU(2^n)$ (grows with qubits) | $G_2$ (fixed, 14-dimensional) |
| **Classical limit** | Bit string | Fano crystal (base-7) |

*Defined:* [Paper 205 (RPU)](papers/10.5281-zenodo.19743800/)

---

## Schur Boundary

The **Schur boundary** is the precise algebraic condition separating Levels 1a/1b
(dark and genuine magic) from Level 2 (associamancy). A quantum state crosses the
Schur boundary when its hidden symmetry group contains an irrep with Frobenius-Schur
indicator $\nu_2 = 0$.

Three equivalent characterisations (Paper 407):
1. **Algebraic:** $\nu_2(V_\lambda) = 0$ for some irrep $V_\lambda$
2. **Cohomological:** the obstruction class $[\alpha] \neq 0 \in H^2(G,U(1))$
3. **Number-theoretic:** for $G = \mathrm{PSL}(2,q)$, the boundary is crossed iff $q \equiv 3 \pmod{4}$ — the condition that makes the quadratic Gauss sum $\tau(q) = i\sqrt{q}$ purely imaginary

*Defined:* [Paper 407 (Associamancy)](papers/10.5281-zenodo.20667174/)

---

## SevenQ and TriQ

The **SevenQ** is the 7-qubit canonical register for the 731 ISA, with the 7 qubits corresponding to the 7 points of the Fano plane $\mathrm{PG}(2,2)$. It is the minimal hardware to implement the SPIN opcode and to solve the non-abelian StateHSP for $\mathrm{PSL}(2,7)$. The $G_2$ vertex amplitude of an LQG tetrahedron can be computed on the SevenQ in $O(1)$ depth.

The **TriQ** is the 3-qudit register (qudits of dimension $d=3$) — the minimal hardware for qudit stabiliser learning at $d=3$ and the abelian StateHSP. Three TriQ registers suffice for $n$ logical qutrits.

*Defined:* [Paper 385 (SQU TriQ and SevenQ)](papers/10.5281-zenodo.20581486/)

---

## Simplicial

**Simplicial** refers to the use of simplicial complexes — triangles, tetrahedra, and their generalisations — as the combinatorial skeleton of the architecture. Pachner moves (local simplicial retriangulations) are the ISA opcodes. The simplicial structure makes the topology of computation discrete and exact.

*Central to:* [Paper 349 (Origami Calculus)](papers/10.5281-zenodo.20474914/), [Paper 258 (Origami ISA)](papers/10.5281-zenodo.19916429/)

---

## Spin Foam

A **spin foam** is a combinatorial 2-complex (vertices, edges, faces) with representations of a Lie group assigned to faces and intertwiners assigned to edges, used to define quantum gravity amplitudes as a sum over histories. In the Origami ISA, every spin foam model is a SPLIT$\to$SPLAT pipeline: SPLIT assigns representations to edges, SPLAT evaluates the vertex amplitude ($6j$ or $15j$ symbol).

Classical LQG spin foams use $\mathrm{SU}(2)$ or $\mathrm{SL}(2,\mathbb{C})$ — both associative. The 731 ISA extends spin foams to $G_2$, adding Fano colour to edges and the SPIN opcode as the elementary $G_2$ gauge transformation.

*Defined:* [Paper 410 (Spin Foams as Origami)](papers/10.5281-zenodo.20680634/)

---

## State Hidden Subgroup Problem (StateHSP)

The **State Hidden Subgroup Problem** (Hinsche, Eisert & Carrasco 2026) asks: given copies of a quantum state $\ket\psi$ invariant under an unknown subgroup $H \leq G$, identify $H$ via quantum measurements.

In the Origami ISA:
- **Abelian StateHSP:** the character POVM is the SPLAT opcode; the hidden subgroup is $H^0$ of the symmetry sheaf; the algorithm is the SPLIT$\to$SPLAT pipeline ([Paper 404](papers/10.5281-zenodo.20667167/))
- **Non-abelian StateHSP for $G = \mathrm{PSL}(2,7)$:** requires the SPIN opcode of the 731 ISA; no associative hardware can solve it exactly ([Paper 405](papers/10.5281-zenodo.20667170/))

*Defined:* [Paper 404 (StateHSP: SPLAT as Fourier Sampling)](papers/10.5281-zenodo.20667167/), [Paper 405 (Non-Abelian StateHSP)](papers/10.5281-zenodo.20667170/)

---

## Steane Code / Quantum Error Correction (QEC)

The **$\llbracket 7,1,3\rrbracket$ Steane code** encodes 1 logical qubit in 7 physical qubits with code distance 3. Its parity-check matrix has columns equal to the 7 points of the Fano plane $\mathrm{PG}(2,2)$. The 3-qubit GHZ stabiliser group **generates** the Steane code parity-check matrix — a three-way identification:

$$(\mathbb{Z}_2)^3\setminus\{0\} = \mathrm{GF}(2)^3\setminus\{0\} = \text{7 Fano points} = \text{cols of }[7,4,3]\text{ Hamming PCM}$$

This generating relationship (proved in [Paper 363](papers/10.5281-zenodo.20541595/)) connects 3-qubit GHZ entanglement to 7-qubit error correction via the Fano geometry.

*Central to:* [Paper 363 (Fano QEC)](papers/10.5281-zenodo.20541595/), [Paper 408 (Fano Primer)](papers/10.5281-zenodo.20667176/)

---

## The 731 / 331 / V31 Naming Convention

**731** = 7 points, 3 per line, 1 associator per non-Fano triple. The Fano plane $\mathrm{PG}(2,2)$ and the 731 ISA.
**331** = 3 imaginary units, 3D cross product, 1 (trivially zero) associator. The quaternionic rung.
**V31** = umbrella for both, with $v \in \{3,7\}$ indexing the rung.

*Central to:* [Paper 258 (Origami ISA)](papers/10.5281-zenodo.19916429/)

---

## Topological Rescue

**Topological Rescue** is the phenomenon in which NAIG assigns high routing weight to a highly stale gradient because its drift is Fano-compatible ($E_k = 0$), overriding any temporal penalty.

*Demonstrated:* [Paper 218 (NAIG Routing)](papers/10.5281-zenodo.20077198/)

---

## Topological Resonance Synthesis (TRS)

**TRS** is the β-deformation computational framework built on the MGE. It uses Lie groups as the "tape" of a generalised Turing machine: the Chladni resonance patterns on the group manifold encode the computational state, and the topology of those nodal lines — their H⁰/H¹/H² structure — is the skeleton of the calculation. The MGE makes that skeleton differentiable: discrete combinatorial models become smooth functions of the temperature parameter β.

- **Topological** — the H⁰/H¹/H² Betti structure of the resonance nodal lines
- **Resonance** — the Chladni eigenmodes on the Lie group manifold; also Wigner-Racah angular momentum resonances
- **Synthesis** — the ISA as a compiler that synthesises across the classical/statistical/quantum regimes via β

TRS is one layer of the ASA. The full hierarchy is:

| Layer | Name | What it is |
|-------|------|-----------|
| 1 | **MGE** | The core operation — the Maslov-Gibbs Einsum |
| 2 | **TRS** | The β-deformation framework built on MGE |
| 3 | **ISA trilogy** | Origami (β→∞) / Forge (0<β<∞) / Meld (β=it) — the compiler layer |
| 4 | **H^k ladder** | H⁰/H¹/H² complexity and cohomology classification of what the ISAs compute |
| 5 | **ASA** | The full research programme: all of the above plus all applications |

*Defined:* [Paper 202 (TRS)](papers/10.5281-zenodo.19858021/) · *See also:* [→ MGE](#maslov-gibbs-einsum-mge), [→ Origami ISA](#origami-isa-origami-instruction-set-architecture)

---

## Triality

**Triality** is the order-3 outer automorphism of $\mathrm{Spin}(8)$ that cyclically permutes its three 8-dimensional irreducible representations:

$$8_v \;\xrightarrow{\;\sigma\;}\; 8_s \;\xrightarrow{\;\sigma\;}\; 8_c \;\xrightarrow{\;\sigma\;}\; 8_v$$

where $8_v$ is the vector representation and $8_s$, $8_c$ are the two half-spinor representations. Triality is unique to $\mathrm{Spin}(8)$: no other Spin group has an outer automorphism of order 3. It is made visible by the octonions via the trilinear form:

$$t(x, \psi, \phi) = \mathrm{Re}(x \cdot (\psi\phi))$$

which is invariant under simultaneous $\mathrm{Spin}(8)$ action on all three slots.

**$G_2$ as the triality-fixed subgroup.** The subgroup of $\mathrm{Spin}(8)$ that fixes a chosen triality decomposition is exactly $G_2 = \mathrm{Aut}(\mathbb{O})$:

$$G_2 = \mathrm{Fix}(\text{triality in } \mathrm{Spin}(8))$$

This is why $G_2$ is the symmetry group of any computation that respects the Fano geometry: it is the group of symmetries that survive when one slot of the triality form is held fixed.

**The inclusion tower.**
$$\mathrm{PSL}(2,7) \;\hookrightarrow\; G_2 \;\hookrightarrow\; \mathrm{Spin}(8)$$
where $\mathrm{PSL}(2,7) = \mathrm{Aut}(\mathrm{PG}(2,2))$ is the automorphism group of the Fano plane (order 168) and the minimal group whose non-abelian StateHSP requires triality.

**Triality in the 731 ISA.** The SPIN opcode *is* triality: it is the generator of the $\mathbb{Z}_3$ triality action restricted to $G_2$, implemented on the SevenQ as one of the 56 order-3 elements of $\mathrm{PSL}(2,7)$ (verified: x411b). As a Fano-point permutation, SPIN costs 12 CNOTs exactly. The phase component ($i\sqrt{7}/2$ in the $\chi_3$ representation) is not a root of unity and requires native $G_2$-symmetric hardware or Solovay-Kitaev approximation.

**The TriQ register and triality.** The TriQ (3 qudits of dimension $d=3$) instantiates the three *slots* of the triality form at the minimal prime-power level. The three qudits correspond to $8_v$, $8_s$, $8_c$ restricted to the smallest non-trivial discrete setting.

**Why Clifford algebra hides triality.** In $\mathrm{Cl}(8,0)$, the vector space $V$ is singled out as primary by construction, breaking the triality symmetry. The Origami ISA (regime 2) inherits this asymmetry: it can implement $\mathrm{SU}(2)$ and $\mathrm{SL}(2,\mathbb{C})$ gates but not the triality outer automorphism. The 731 ISA (regime 3) restores triality via the SPIN opcode. This is the precise sense in which the 731 ISA is strictly more powerful than the Origami ISA: it is *triality-complete*.

*Defined:* [Paper 410 (Spin Foams as Origami)](papers/10.5281-zenodo.20680634/), [Paper 407 (Associamancy)](papers/10.5281-zenodo.20667174/), [Paper 408 (Fano Primer)](papers/10.5281-zenodo.20667176/)

---

## Triality-Complete

A gate set or instruction set is **triality-complete** if it contains the SPIN opcode — the generator of the order-3 outer automorphism of $\mathrm{Spin}(8)$ restricted to $G_2 = \mathrm{Fix}(\text{triality})$ — giving access to all three 8-dimensional representations of $\mathrm{Spin}(8)$ on equal footing.

**The 731 ISA is triality-complete. The Origami ISA (regime 2) is not.**

Triality-completeness is to the 731 ISA what universality is to standard gate sets: it names the property that distinguishes the more powerful system from the less powerful one. A gate set is universal if it can approximate any unitary; it is triality-complete if it can implement the triality outer automorphism exactly (or to arbitrary precision via the SPIN opcode).

The distinction matters because:

- Any gate set built from $\mathrm{SU}(2)$ or $\mathrm{SL}(2,\mathbb{C})$ is triality-*blind*: it privileges the vector representation $8_v$ of $\mathrm{Spin}(8)$ and cannot access the half-spinor representations $8_s$ and $8_c$ symmetrically.
- A triality-complete gate set can solve problems (e.g.\ the non-abelian StateHSP for $\mathrm{PSL}(2,7)$) that require the genuinely complex $\chi_3$ representation, whose character involves $i\sqrt{7}/2$ — a phase inaccessible to any cyclotomic gate set.
- $G_2$ holonomic gates (Berry phases in the discrete Weyl group $W(G_2) \cong D_6$, order 12) are topologically protected; holonomic gates from triality-blind sets are not.

**Relationship to associamancy.** A gate set reaches Level 2 (associamancy) if and only if it is triality-complete. The Schur boundary — the set of representations with Frobenius-Schur indicator $\nu_2 = 0$ — is exactly the boundary between triality-blind and triality-complete operation. See [→ Associamancy](#associamancy), [→ Schur Boundary](#schur-boundary), [→ Triality](#triality).

*Defined:* [Paper 407 (Associamancy)](papers/10.5281-zenodo.20667174/), [Paper 408 (Fano Primer)](papers/10.5281-zenodo.20667176/), [Paper 411 (Pulse Sequences)](papers/10.5281-zenodo.20680609/), [Paper 412 (Typed DSL)](papers/10.5281-zenodo.20681513/)

---

## G-Walk

**G-Walk** names the closed orbit walks that implement orbit computing on a molecular state space. The name carries three meanings simultaneously:

- **Group** — the site symmetry group $G$ of the metal centre (e.g.\ $O_h$ for an octahedral iron centre, $T_d$ for tetrahedral) defines the orbit structure. The irreducible representations of $G$ label the discrete orbit slots.
- **Graph** — execution is a walk on the Cayley graph of $G$: each ISA opcode moves the system one step along an edge of that graph. The ORBIT opcode closes the walk and reads the orbit label.
- **Galois** — the original name for this research programme before renaming; the Galois group of the crystal-field polynomial determines which symmetry operations are physically realised. Galois chemistry, orbit theory, and G-Walk chemistry all refer to the same mathematical framework.

In G-Walk chemistry, the state of a metal complex is an orbit occupancy vector $\mathbf{v} \in \mathbb{Z}^k$ (e.g.\ $(v_{t_{2g}}, v_{e_g})$ for an octahedral $d^n$ system), and G-Walk is the walk on the orbit graph induced by ligand-field perturbations. G-Walk chemistry achieves 20/20 on spin-crossover benchmarks where DFT achieves 14/20, because it operates natively in the tropical semiring — the correct algebraic structure for the strong-crystal-field limit.

*See also:* [→ Orbit Computing](#orbit-computing) for the general paradigm; [→ Tropical Limit / Crystallisation](#tropical-limit--crystallisation) for the connection to tropical algebraic geometry.

*Defined:* [Paper 488 (G-Walk Chemistry)](papers/10.5281-zenodo.21224107/), [Paper 491 (Tropical DFT)](papers/10.5281-zenodo.21224113/), [Paper 487 (Valence as Orbit Occupancy)](papers/10.5281-zenodo.21219722/)

---

## Orbit Computing

**Orbit computing** is a proposed fourth paradigm of computation in which:

- **State** is a G-orbit occupancy vector $\mathbf{v} \in \mathbb{Z}^k$, where $G$ is the site symmetry group of the physical substrate (a molecule);
- **Transitions** are G-orbit walks implemented by the five ISA opcodes (LABEL, ORBIT, TWIST, BIND, FLIP);
- **Output** is the discrete orbit label returned by the ORBIT opcode.

The four paradigms and their distinguishing features:

| Paradigm | State | Temperature | Error model |
|----------|-------|-------------|-------------|
| Classical | Bit string | 300 K | Thermal bit-flip |
| Quantum-gate | Qubit superposition | ~15 mK | Decoherence of amplitudes |
| Quantum-annealing | Ising configuration | ~15 mK | Coupling-constant drift |
| **Orbit (proposed)** | G-orbit occupancy vector | 300 K | None (structural immunity) |

**Why "proposed":** Orbit computing is Turing-complete — it is not a new *model of computation* in the Church-Turing sense. The paradigm claim rests on a different set of axes: physical substrate (molecular symmetry group, not transistors or qubits), native problem class (G-orbit problems are hard to encode as bits or superpositions), and error model (structural decoherence immunity: the orbit label is a nuclear-geometry invariant, stable against electronic decoherence). Until synthetic orbit computers — as opposed to naturally occurring enzyme active sites — have been experimentally demonstrated and programmed, "proposed fourth paradigm" is the accurate description.

**Structural Decoherence Immunity.** The orbit label is determined by nuclear geometry (set by the protein or ligand scaffold), not by the electronic wavefunction. Electronic decoherence scrambles the wavefunction *within* an orbit but cannot change *which orbit* is occupied without supplying energy $\Delta \gg kT$. This is why nitrogenase fixes nitrogen at 300 K with zero engineered error correction: the Fano orbit structure of the FeMo-cofactor is enforced by the protein scaffold.

Biology discovered orbit computing 3.8 billion years ago. Every enzyme is a fixed-function orbit computer. The ISA provides the instruction set; the synthetic chemist is the chip fabricator.

*See also:* [→ G-Walk](#g-walk) for the molecular chemistry specialisation; [→ Origami ISA](#origami-isa-origami-instruction-set-architecture) for the opcode definitions.

*Defined:* [Paper 489 (Orbit Computing)](papers/10.5281-zenodo.21224109/), [Paper 487 (Valence as Orbit Occupancy)](papers/10.5281-zenodo.21219722/)

---

## Tropical Limit / Crystallisation

As $\beta \to \infty$ in the MGE, the softmax collapses to the **tropical** $(\max,+)$ semiring: the BOIL phase explores continuously; the SNAP phase crystallises to a discrete logical output.

*Defined:* [Paper 201 (MGE)](papers/10.5281-zenodo.17981393/)
