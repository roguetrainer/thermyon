---
layout: default
title: "CA02 — Residue Theorem and Laurent Poles"
parent: ISA Zoo
nav_exclude: true
---

# CA02 — Residue Theorem and Laurent Poles

| Field | Value |
|-------|-------|
| **Domain** | Complex Analysis |
| **System** | Meromorphic functions on ℂ |
| **Group** | U(1) |
| **H^k tier** | H² |
| **ISA** | Origami (β → ∞) |
| **Status** | Validated |
| **Opcodes** | ORBIT · TWIST · BIND |
| **Papers** | Paper 543, Paper 477 |

---

## Physical system

A **meromorphic function** is holomorphic everywhere on a domain D except at
isolated **poles** — points where |f(z)| → ∞. Near a pole at z = z₀ of order m,
f has a **Laurent expansion**:

f(z) = a_{−m}/(z−z₀)^m + ··· + a_{−1}/(z−z₀) + a₀ + a₁(z−z₀) + ···

The coefficient a_{−1} is the **residue** of f at z₀. It is the only term that
contributes to the contour integral:

∮_C f(z) dz = 2πi Σ_{z_k inside C} Res(f, z_k)

This is the **residue theorem** — the central computational tool of complex
analysis, used to evaluate real integrals that would be intractable by elementary
means (∫₀^∞ sin x / x dx = π/2; ∫_{−∞}^{∞} dx/(1+x²) = π; and thousands more).

**The ISA reading:** the pole at z₀ is a BIND obstruction — a point where the
local ORBIT (analytic continuation) fails entirely. The residue a_{-1} is the H²
invariant: an integer (for simple poles of rational functions) or a complex number
that cannot be removed by any holomorphic change of variable. The residue theorem
says the contour integral = 2πi × (sum of BIND invariants inside C).

---

## Target category

**Mer(D)** — the category of meromorphic functions on D ⊂ ℂ. Objects: pairs
(D, f) where f is holomorphic on D \ {z₁, z₂, ...} with poles at z_k. Morphisms:
conformal maps between domains that pull poles back to poles. The divisor
div(f) = Σ ord(f, z_k) [z_k] (a formal sum of poles weighted by order) is the
H² class of f: it records the BIND content.

## Interpretation functor

F: C → Mer(D) defined by:

| Opcode | F(opcode) |
|--------|-----------|
| ORBIT  | Analytic continuation away from poles: the regular part of f is an ORBIT on D \ {poles}; the value f(z) is uniquely determined by continuation from any base point |
| TWIST  | Winding number of the contour C around each pole: n(C, z_k) ∈ ℤ; determines which poles contribute to the integral; the H¹ count |
| BIND   | Residue at each pole: Res(f, z_k) = a_{−1} in the Laurent expansion; the H² invariant; ∮_C f dz = 2πi Σ_k n(C,z_k) · Res(f,z_k) |

## ISA programme

```
LOCATE:  LABEL[{z_k} | poles of f, with orders m_k]  -- find poles (BIND locations)
LAURENT: BIND[Res(f,z_k) = a_{-1} | Laurent coeff]   -- compute residues (H2 invariants)
CONTOUR: ORBIT[C | closed contour in D]               -- choose integration contour
WIND:    TWIST[n(C,z_k) for each z_k]                -- winding numbers (H1 count)
RESIDUE: BIND[oint_C f dz = 2pi i sum n(C,z_k) Res(f,z_k)]  -- residue theorem
OUTPUT:  LABEL[I = 2pi i * (sum of BIND invariants)]  -- the integral value
```

## Computable output

The residue theorem converts contour integrals into algebra — it is one of the
most powerful computational tools in mathematics. Three canonical examples:

**Example 1 — Gaussian integral via residues:**
∫_{−∞}^{∞} dx/(1+x²) = π.
Close the contour in the upper half-plane; the only pole inside is at z = i
(simple pole of 1/(z²+1)); Res(1/(z²+1), i) = 1/(2i); result = 2πi · 1/(2i) = π.
Output: π. The BIND invariant Res = 1/(2i) gives the exact answer.

**Example 2 — Fourier transform of a Lorentzian:**
∫_{−∞}^{∞} e^{itx}/(x²+γ²) dx = (π/γ) e^{−γ|t|}.
Poles at ±iγ; close above for t > 0; BIND at z = iγ gives Res = e^{−γt}/(2iγ);
result = π e^{−γt}/γ. This is the spectral lineshape formula in NMR and optical
spectroscopy — a direct application of CA02 to physical measurement.

**Example 3 — Counting zeros and poles (argument principle):**
(1/2πi) ∮_C f'(z)/f(z) dz = N_zeros − N_poles inside C.
The logarithmic derivative f'/f has simple poles at zeros of f (residue +ord)
and poles of f (residue −ord). The winding number of f(C) around the origin
equals N_zeros − N_poles. This is the BIND content of f as a divisor: the
difference of positive and negative H² classes.

## The H² interpretation

A pole of order m at z₀ is not merely a singularity — it is a **BIND class of
degree m** in H²(ℂ\{z₀}, ℤ) ≅ ℤ. The residue theorem is the statement:

∮_C f(z) dz = 2πi ⟨[C], [div(f)]⟩

where ⟨·,·⟩ is the H¹ × H² pairing — the winding number of the contour (H¹)
paired with the divisor of the function (H²). This is precisely the TWIST × BIND
pairing that the ISA framework identifies as the fundamental structure of H² entry.

**Why is this H² and not H¹?** CA01 (Cauchy theorem) showed that *holes in the
domain* give H¹ generators — winding around a hole. CA02 shows that *poles of
the function* give H² generators — the residue at a pole. The distinction:

| Source | ISA tier | Generator | Measured by |
|--------|----------|-----------|-------------|
| Hole in domain D | H¹ TWIST | Winding number n(C, z₀) ∈ ℤ | ∮ dz/(z−z₀) |
| Pole of function f | H² BIND | Residue Res(f, z₀) ∈ ℂ | ∮ f dz / 2πi |
| Essential singularity | H² BIND (infinite order) | Picard: f takes every value | Casorati-Weierstrass |

The hole is a topological feature of the domain; the pole is an analytic feature
of the function. H¹ is about the space; H² is about the object living in the space.
This distinction is the ISA TWIST/BIND distinction in its purest form.

## Lee-Yang zeros and phase transitions

The deepest application connects CA02 to statistical physics and the β-plane
(Paper 543). The **Lee-Yang theorem** (1952): for a ferromagnet with Ising
interactions, the zeros of the grand partition function Z(z) as a function of
fugacity z = e^{βh} (h = magnetic field) lie on the unit circle |z| = 1 in the
complex z-plane. In the thermodynamic limit (N → ∞), these zeros accumulate on
the real axis at z = 1 (h = 0 at the critical point), and their density gives
the free energy's analytic structure.

In ISA language:
- Each Lee-Yang zero is a pole of log Z(z) — a BIND event in the complex
  fugacity plane
- The poles approaching the real axis (thermodynamic limit) are BIND classes
  condensing onto the physical axis
- The phase transition (spontaneous magnetisation) is the residue theorem applied
  at z = 1: the free energy is non-analytic because a BIND obstruction touches
  the real axis
- The order of the phase transition is the order of the pole: first-order = simple
  pole; continuous = branch cut (infinite-order pole, essential singularity)

**Every phase transition is a BIND event in the complex β-plane** — this is the
Lee-Yang theorem restated in ISA language. CA02 is the pure-mathematics version;
the β-plane rotation from complex z (Lee-Yang) to real β (thermodynamics) is the
Wick rotation of Paper 543 §1.

## Connection to the residue theorem in physics

The residue theorem underlies:

| Physical calculation | Poles | Residue = |
|---------------------|-------|-----------|
| Quantum propagator G(E) = 1/(E−H) | Energy eigenvalues | Projection onto eigenstate |
| S-matrix poles | Particle masses and decay widths | Coupling constants |
| Dispersion relations (Kramers-Kronig) | Poles in upper half-plane | Causality condition |
| Amplituhedron (G02) | Spurious poles | Zero (H² class that bounds) |
| Physical amplitude poles | Physical particles | S-matrix residues |

The amplituhedron (G02) is the Grassmannian version of this: spurious poles are
BIND classes that are boundaries (exact in H²), so their residues cancel. Physical
poles are genuine BIND classes (not boundaries), so their residues survive. CA02
and G02 are the same categorical structure — residue theorem — at high-school and
graduate-school levels respectively.

## Validation

- Cauchy residue theorem: Cauchy (1831). Foundational; proved rigorously.
- Gaussian integral ∫ dx/(1+x²) = π: verified by residues and by elementary
  substitution x = tan θ; results agree.
- Lorentzian Fourier transform: standard result in spectroscopy and signal
  processing; validated against NMR lineshape measurements.
- Lee-Yang theorem: Lee & Yang (1952). Proved for Ising ferromagnets with
  nearest-neighbour interactions; extended to general ferromagnets by Griffiths.

---

*Part of the [ISA Zoo](/adelic-simplicial-architecture/isa-zoo/). Categorical foundations: [Paper 591](https://doi.org/10.5281/zenodo.21309088).*
