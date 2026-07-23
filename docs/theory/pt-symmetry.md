---
layout: default
title: "PT Symmetry & Exceptional Points"
parent: Theory
nav_order: 3
description: "For physicists already fluent in PT-symmetric quantum mechanics: how exceptional points, PT phase transitions, and eigenvalue braiding connect to the H^k tier ladder, PiTch number, and the computational structure of non-Hermitian systems."
tags: [pt-symmetry, exceptional-points, non-hermitian, berry-phase, gain-loss, pitch-number, pitch, hpu]
portfolio: A
---

# PT Symmetry & Exceptional Points
{: .no_toc }

*The exceptional point is not a pathology to avoid — it is the computational resource.*
{: .fs-5 .fw-300 }

---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## The exceptional point as resource

The exceptional point is not a pathology to avoid. It is the computational
resource. The PT phase transition — that sharp boundary between real and
complex-conjugate eigenvalue pairs first identified by Bender and Boettcher
(1998) — is a tier boundary in a general classification of physical
computation. The new invariant that captures this structure is the
**PiTch number**: the total algebraic weight of all exceptional points enclosed
or crossed by a path in parameter space. The PiTch number is to non-Hermitian
dynamics what T-count is to fault-tolerant quantum computing.

---

## What you already know, reframed

If you work on PT-symmetric systems, you already have the full picture in your
hands. The H^k tier ladder gives it a name.

### The three regimes

| Physical regime | What you know | ISA tier |
|----------------|---------------|----------|
| PT-unbroken (real eigenvalues) | Berry phase accumulation, coherent interference, eigenvalue repulsion without crossing | **H¹** |
| PT phase transition | Eigenvalues collide; eigenvectors coalesce; Jordan block forms | **H¹ ↔ H² boundary (β\*₁₂)** |
| PT-broken (complex-conjugate pairs) | Gain-loss dynamics; exponential amplification/decay; dissipation dominant | **H²** |

The **H¹ tier** is the home of coherent, unitary-like dynamics — Berry phase,
adiabatic transport, interference. The gain-loss parameter is present but
small; the system lives in the PT-unbroken phase; eigenvalues are real and
well-separated.

The **H² tier** is the home of dissipation-dominated dynamics — complex
eigenvalues, gain/loss rates that matter, the broken phase. The system has
crossed the PT phase transition.

The **β\*₁₂ snap threshold** is the exceptional point locus. It is the precise
location where the system changes computational character — not just a
spectral curiosity but a tier boundary, the same mathematical object as the
snap threshold in every other system the HotLogiQ framework describes (the
Mott transition, the induction head phase transition in transformers, the
kinetic proofreading threshold in DNA replication).

### The β-plane picture

Standard quantum mechanics lives on the imaginary β axis: β = iω, where ω is
the real frequency. PT-symmetric systems live slightly off it, in the interior
of the complex β-plane. The EP locus — the surface in parameter space where
eigenvalues coalesce — is the tier boundary β\*₁₂ in complex β-space.

Different addresses in the complex β-plane correspond to different physical
regimes:

| β location | Physical regime |
|------------|----------------|
| β → ∞ (real) | Classical; tropical arithmetic; winner-takes-all |
| β = it (imaginary) | Standard quantum mechanics; unitary evolution |
| β slightly off imaginary axis | PT-symmetric; eigenvalues remain real while gain-loss is small |
| β on the EP locus (β\*₁₂) | Exceptional point; tier boundary |
| β on negative real axis | Laser dynamics; exponential gain |

The PT phase transition is not a special feature of non-Hermitian physics. It
is the β-plane story told in a particular experimental context: photonic
waveguides with balanced gain and loss, microwave resonators, mechanical
oscillators with position-dependent damping. The tier structure is universal;
the substrate is what varies.

**See also:** [The β-plane](/docs/theory/forge-meld)

---

## PiTch number: the new invariant

### Definition

Let γ be a closed path in the parameter space of a non-Hermitian Hamiltonian
H(λ). Define:

**S(γ) = Σ (order of EP − 1) over all EPs enclosed or crossed by γ**

For an n-th order EP (where n eigenvalues coalesce and n eigenvectors
merge into a single Jordan block), the contribution to S is n − 1.

### The pattern for low-order EPs

The three things that physicists already know — monodromy group, Berry phase,
Kato exponent — are not three separate phenomena. They are three faces of a
single invariant:

| n (EP order) | S | Monodromy | Phase per loop | Kato exponent | Permutation |
|---|---|-----------|------------|----------|-----------|
| 2 | 1 | ℤ₂ | π | 1/2 | (01) — transposition |
| 3 | 2 | ℤ₃ | 2π/3 | 1/3 | (012) — 3-cycle |
| 4 | 3 | ℤ₄ | π/2 | 1/4 | (0123) — 4-cycle |
| n | n−1 | ℤₙ | 2π/n | 1/n | n-cycle |

**Reading the table:** one loop around an n-th order EP permutes the
eigenvalue sheets by an n-cycle in ℤₙ, accumulates a Berry phase of 2π/n,
and gives Kato eigenvalue splitting proportional to ε^{1/n} near the EP.
These three facts were known separately. PiTch number unifies them: the single
integer S = n−1 determines all three.

**Two loops around a 4th order EP** give permutation (0 2)(1 3) — the
order-2 element of ℤ₄, not the identity. The full group structure is directly
observable by tracking which eigenvalue sheet returns to which starting value
after each loop. This is an experiment you can do with a two-port microwave
resonator or a coupled-waveguide setup.

### What winding number misses

The winding number of a path around a region of parameter space is a
topological invariant, but it is too coarse for the full eigenvalue braiding
structure. Consider two distinct situations:

- **Situation A:** one 3rd order EP enclosed by γ. Monodromy = ℤ₃. PiTch number S = 2.
- **Situation B:** three separate 2nd order EPs enclosed by γ. Monodromy = S₃ (symmetric group on 3 elements). PiTch number S = 3.

Both situations have the same winding number = 1. But S = 2 ≠ 3, and ℤ₃ ≠ S₃ as
groups — ℤ₃ is abelian (cyclic), S₃ is non-abelian. The observable consequence:
the eigenvalue braiding is a cyclic permutation in situation A and potentially
a non-cyclic permutation in situation B. Any measurement that encodes information
in the eigenvalue ordering can distinguish them; winding number cannot.

PiTch number is not a complete invariant in general (two paths can have the same S
but different permutation groups), but it is a strictly finer invariant than
winding number, and for cyclic EPs it is complete.

---

## Numerical evidence

Experiments x678a, x678b, and x678c verify the PiTch number table for 2nd, 3rd,
and 4th order EPs in a family of non-Hermitian random matrices:

| n | S | Monodromy | Phase/loop | Kato exp | Experiment |
|---|---|-----------|------------|----------|------------|
| 2 | 1 | ℤ₂ | π | 1/2 | x678a PASS 6/6 |
| 3 | 2 | ℤ₃ | 2π/3 | 1/3 | x678b PASS 6/6 |
| 4 | 3 | ℤ₄ | π/2 | 1/4 | x678c PASS 6/6 |

Each experiment: (i) constructs an n-th order EP via fine-tuned complex
deformation of a Hermitian starting matrix; (ii) tracks eigenvalue sheets
numerically around a closed loop in parameter space; (iii) reads off
monodromy permutation, accumulated phase, and power-law splitting exponent
and compares to the PiTch number prediction. All 18 tests pass.

**Experiment x678d** addresses Bender's original system H = p² + x²(ix)^ε
via an effective 2×2 PT model at each level pair. Result: S = 0 throughout
ε ≥ 0 (all pairs in the H¹ tier); the PiTch threshold appears at ε = 0.
This gives the 1998 real-spectrum result a topological certificate. [PASS 6/6]

---

## PiTch number as a computational resource

### The T-count analogy

In fault-tolerant quantum computing, the **T-count** of a circuit measures its
non-Clifford gate cost. Clifford gates are cheap (stabiliser states, easy to
simulate classically); T gates are expensive (they promote Clifford circuits
into the genuinely quantum regime). The T-count is the resource metric.

PiTch number plays the same role for non-Hermitian computation:

- **S = 0:** the path in parameter space never crosses or encloses an EP. The
  system stays in one tier throughout its evolution. It can be efficiently
  simulated within that tier — no tier promotion occurs.

- **S > 0:** the path crosses or encloses at least one EP. Tier transitions
  occur. These transitions are the resource for anomalous EP sensing (Kato
  splitting ε^{1/n}), eigenvalue braiding, and dissipation-enhanced
  computation.

The analogy is imperfect in one important direction: T-count measures a
*cost* (you want it low for efficient classical simulation); PiTch number
measures a *resource* (you want it non-zero to exploit EP-specific physics).
But the structural parallel holds — both are invariants that divide circuits
into computationally distinct classes.

### The five HPU substrate classes

The HPU (Hot Processing Unit) is the hardware class that deliberately
programmes with gain, loss, and complex β as first-class resources. Five
substrate families have been identified, each with a natural PiTch number
operating regime:

| Class | Substrate | S (PiTch) | Key feature |
|-------|-----------|-----------|-------------|
| HPU-P | PT-symmetric photonic | S ≥ 1 | EP crossing = SNAP↑ event |
| HPU-B | Bosonic cat qubit | S = 0 (controlled) | ERASE opcode; autonomous error correction |
| HPU-R | Radical-pair molecular | S = 0 or 1 | Spin selection; ERASE = triplet/singlet swap |
| HPU-C | Non-Hermitian circuit | S = 1 | SNAP↓ = non-Hermitian skin effect |
| HPU-E | EP sensor array | S = 0 (at the EP) | S = 0 sensing; maximally sensitive |

The HPU-E entry deserves attention. "PiTch number = 0 sensing" sounds paradoxical
— if S = 0, hasn't nothing happened? The point is subtler: the EP sensor
operates *at* the snap threshold β\*₁₂, poised exactly at the EP without
crossing it. The anomalous Kato splitting ε^{1/n} is maximal at the EP; the
S = 0 condition means the operating point is the EP itself, not a path that
encloses it. This is the computational analogue of sitting at a quantum
critical point and using the diverging susceptibility as a transducer.

**Result:** EP sensing — the observation that sensitivity to a perturbation δ
near an n-th order EP scales as δ^{1/n} rather than δ (the Hermitian result)
— is a PiTch number = 0 computation. It is the first demonstrated HPU algorithm.

---

## Open questions

The PiTch number framework opens several concrete research questions:

**Completeness.** Is PiTch number a complete invariant? Two paths with the same
S but different enclosed EP configurations can have different permutation
groups (ℤ₃ vs S₃ for S = 2, as above). A complete invariant would need to
encode not just the total count but the full braiding group of the enclosed
EP configuration. Is this the right object — the eigenvalue braid group — and
is it finitely computable from the spectrum?

**Transmission-matrix access.** In photonic and microwave experiments, the
directly accessible observable is the transmission matrix S(ω), not the
individual eigenvalue sheets. Can S be extracted from the transmission matrix
without full eigenvalue tracking? A positive answer would make PiTch number
experimentally accessible in any two-port scattering setup.

**Floquet systems.** Time-periodic PT-symmetric Hamiltonians H(t) = H(t+T)
have quasi-energies defined modulo ℏΩ. The Floquet Brillouin zone is a torus,
not a plane. Is there a PiTch number for the quasi-energy spectrum — a count of
EPs per Floquet zone — and does it have the same tier-boundary interpretation?

**Bender's original system.** H = p² + x²(ix)^ε is PT-symmetric for all ε
and passes through an EP structure as ε varies. The effective-model experiment
(x678d) confirms S = 0 throughout ε ≥ 0. Open question: the full PiTch number
structure of the multi-sheet EP locus at irrational ε.

---

## Papers

**Foundation — parameter space and tier structure**

- [PT Symmetry in Unexpected Places](https://doi.org/10.5281/zenodo.21480284) (`PtSurvey`) —
  survey across chemistry, QEC, ranking, biology, information geometry; EP = β\* snap theorem;
  Raven ISA; FEP-PT bridge; written for Carl Bender ·
  [Explainer](/papers/10.5281-zenodo.21480284/)

- [The Non-Hermitian ISA: PT Symmetry, Exceptional Points, and the 38-Fold Way](https://doi.org/10.5281/zenodo.21480491) (`NonHermIsa2`) —
  AZ symmetry classes in ISA language; LABEL failure = PT phase transition; EP at H¹/H² boundary ·
  [Explainer](/papers/10.5281-zenodo.21480491/)

- [The Adelic β-Plane](https://doi.org/10.5281/zenodo.21245459) (`AdelicBeta`) —
  unified parameter space; classical (β real), quantum (β = it), PT-symmetric (β ∈ ℂ near imaginary axis)

**The invariant**

- [PiTch: A Topological Invariant for PT-Symmetric Systems](https://doi.org/10.5281/zenodo.21509972) (`PiTch`) —
  **start here for the mathematics**; PiTch number S = n−1 for n-th order EP;
  Berry phase Φ = πS; ℤₙ monodromy; Bender-Boettcher S = 0 certificate; 24/24 checks ·
  [Explainer (1 page)](/papers/10.5281-zenodo.21509972/)

- [Mean-Field Breakdown, Exceptional Geometry, and H² Universality](https://doi.org/10.5281/zenodo.21427824) (`MeanFieldBreak`) —
  mean-field collapse at the H² threshold; exceptional points as universality boundary

**PT symmetry in algorithms and computation**

- [PT-Symmetric Lifting](https://doi.org/10.5281/zenodo.21480495) (`PtLifting`) —
  unified language for quantum algorithms via EP-free evolution; HSP and walk families;
  Conditions A/B/C for lifting ·
  [Explainer](/papers/10.5281-zenodo.21480495/)

- [PT-Exceptional-Point Search: Beyond the BBBV Bound](https://doi.org/10.5281/zenodo.21480499) (`PtEpSearch`) —
  EP sensing enhancement is real; postselection cancels the speedup exactly; what remains open ·
  [Explainer](/papers/10.5281-zenodo.21480499/)

- [PT-Symmetric Combinatorics](https://doi.org/10.5281/zenodo.21480493) (`PtCombinato`) —
  SAT/TSP/graph-colouring as PT-breaking; Beraha numbers = EP₂; PT-Hardness Conjecture

- [The β-Rank Family](https://doi.org/10.5281/zenodo.21479920) (`BetaRank`) —
  TropicalRank/ForgeRank/MeldRank/RavenRank as β-deformation of pairwise ranking;
  RavenRank = complex-β PT-symmetric ranking

**Hardware and substrate**

- [Raven on Existing Hardware](https://doi.org/10.5281/zenodo.21480501) (`RavenHardware`) —
  three routes to complex-β (Lindblad/Naimark/hybrid); 5-qubit Ising example; hardware roadmap 2026–2035 ·
  [Explainer](/papers/10.5281-zenodo.21480501/)

- [The Raven ISA: Enzymes as Molecular Programs](https://doi.org/10.5281/zenodo.21416925) (`RavenEnzyme`) —
  enzyme kinetics as PT-symmetric computation; SNAP↑/↓, ERASE, FLOW(β ∈ ℂ)

- [The Motive ISA](https://doi.org/10.5281/zenodo.21416909) (`MotiveIsa`) —
  five primitive opcodes for dissipative systems; ERASE = second law; abstract parent of Raven

- [HPU Architecture](https://doi.org/10.5281/zenodo.21500669) —
  EP sensors as HPU-E substrate; routes to room-temperature dissipative computation

**Connections to other domains**

- [G₂ Snap Thresholds](https://doi.org/10.5281/zenodo.21401321) (`G2SnapThresh`) —
  why 3-, 5-, and 7-qubit codes are canonical; G₂ geometry of the snap threshold

- [The Maslov Moment](https://doi.org/10.5281/zenodo.21480503) (`MaslovMoment`) —
  financial phase transitions; spinodal = EP₂; 2008 crisis as min-plus snap

---

## What to read first

{: .note }
> **If you work on EP sensing:**
> Start with [HPU Architecture](https://doi.org/10.5281/zenodo.21500669).
> Section 3 introduces PiTch number = 0 sensing directly, with the
> ε^{1/n} sensitivity table and the HPU-E substrate. The ISA formalism is
> introduced only as needed.

{: .note }
> **If you want the mathematics:**
> Start with [PiTch: A Topological Invariant for PT-Symmetric Systems](https://doi.org/10.5281/zenodo.21509972).
> It derives the PiTch number, proves the Berry-phase formula Φ = πS, and
> verifies the ℤₙ monodromy for n = 2, 3, 4. Then
> [PT Symmetry in Unexpected Places](https://doi.org/10.5281/zenodo.21480284)
> for the full H¹/H² tier identification and ISA context.

{: .note }
> **If you want the big picture:**
> Start with [The β-plane](https://doi.org/10.5281/zenodo.21245459).
> It places PT physics in the context of the full HotLogiQ framework — showing
> where PT systems live relative to classical (β real), quantum (β imaginary),
> and other exotic regimes — and explains why the EP locus is a tier boundary
> rather than a spectral accident.

---

*See also: [Processing Units](/docs/theory/processing-units) — the HPU is the
hardware class built around PiTch number as a resource ·
[The β-plane](/docs/theory/forge-meld) — the full complex β parameter space ·
[The Non-Associative Frontier](/docs/theory/non-associative-frontier) — the
complementary H² structure (G₂ geometry) that sits alongside PT symmetry in
the H² tier*
