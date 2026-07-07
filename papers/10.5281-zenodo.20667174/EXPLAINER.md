---
layout: default
title: "Associamancy: A Resource Theory of Non-Associative Quantum Magic"
parent: Explainers
nav_exclude: false
tags: [associamancy, schur-boundary, frobenius-schur, g2, triality, magic-states, resource-theory, quantum-foundations, dark-magic, tv-monotone]
portfolio: F|B
---

## The Fourth Level of Quantum Power

*Plain-language explainer for [doi:10.5281/zenodo.20667174](https://doi.org/10.5281/zenodo.20667174) (#407)*

---

## The central idea in one sentence

Quantum resources have four levels — stabiliser, dark magic, genuine magic, and *associamancy* — and standard quantum computing theory has only characterised the first three; this paper identifies the fourth, sitting strictly above all of them.

---

## The four levels

**Level 0 — Stabiliser states.** Wigner function non-negative everywhere. Classically simulable by the Gottesman-Knill theorem. TV = 1.

**Level 1a — Dark magic.** Wigner function negative somewhere, but total variation TV = 1. Wigner-negative but still Clifford-simulable under the right reframing. Established by [Paper 470](https://doi.org/10.5281/zenodo.21219700).

**Level 1b — Genuine magic.** Wigner negative and TV < 1. The T gate creates genuine magic; this is the resource that drives quantum computational advantage. Established in full by [Paper 469](https://doi.org/10.5281/zenodo.21219698) / [Paper 470](https://doi.org/10.5281/zenodo.21219700).

**Level 2 — Associamancy.** A state has associamancy if its hidden symmetry group contains an irreducible representation with Frobenius-Schur indicator ν₂ = 0 — the condition that the representation is *genuinely complex*, realisable over ℂ but not over ℝ or ℍ. This paper identifies and characterises Level 2.

The levels are strictly increasing: Level 2 implies Levels 1a or 1b, which imply Level 0; but none of the implications reverse. A state can have large genuine magic (TV ≪ 1) and zero Schur entropy, and a state can have Schur entropy log 2 at either dark or genuine magic level.

---

## The Schur boundary

The boundary between Levels 1 and 2 is the **Schur boundary**: the set of states whose hidden symmetry group first acquires an irrep with ν₂ = 0. Crossing it requires the SPIN opcode of the 731 ISA — the generator of G₂ triality. The Origami ISA (no SPIN) cannot create or detect associamancy.

The criterion is algebraically computable from the character table alone, in O(|G|) operations — no explicit representation matrices needed.

---

## Why ν₂ = 0 is the right condition

The Frobenius-Schur indicator of an irrep V_λ of a finite group G is:

$$\nu_2(V_\lambda) = \frac{1}{|G|}\sum_{g \in G} \chi_\lambda(g^2) \;\in\; \{-1, 0, +1\}$$

- ν₂ = +1: representation is *real* — can be realised over ℝ
- ν₂ = −1: representation is *quaternionic* — can be realised over ℍ  
- ν₂ = 0: representation is *genuinely complex* — V_λ ≇ V̄_λ; cannot be realised over any associative normed division algebra

The ν₂ = 0 condition is therefore the algebraic signature of irreducible non-associativity. A state with support on a ν₂ = 0 irrep carries information that is inaccessible to any associative gate set — including the full Clifford + T gate set of standard quantum computing.

---

## The minimal example: PSL(2,7)

The smallest finite group with a ν₂ = 0 irrep is PSL(2,7) — the 168-element symmetry group of the Fano plane. Its character table has six irreps: four real (ν₂ = +1) and one conjugate pair χ₃, χ̄₃ with ν₂ = 0.

The computation is exact: using the class fusion rule (7A ↔ 7B under squaring) and the character values χ₃ on the six conjugacy classes,

$$\nu_2(\chi_3) = \frac{1}{168}(3 - 21 + 0 + 42 + 24(\varphi + \bar\varphi)) = \frac{1}{168}(24 - 24) = 0$$

where φ + φ̄ = −1. Verified numerically to 10⁻¹⁶ precision.

The number-theoretic pattern: PSL(2,q) has associamancy if and only if q ≡ 3 (mod 4) — the same condition that makes the quadratic Gauss sum purely imaginary.

---

## Three equivalent characterisations

The Schur boundary has three equivalent descriptions, proved in the paper:

1. **Algebraic:** ν₂(V_λ) = 0 for some irrep of the hidden symmetry group
2. **Cohomological:** the obstruction class [α] ≠ 0 in H²(G, U(1)) — a non-trivial group 2-cocycle obstructing a real realisation
3. **Number-theoretic:** for G = PSL(2,q), associamancy holds iff q ≡ 3 (mod 4)

For PSL(2,7): H²(PSL(2,7), U(1)) ≅ ℤ₂; the non-trivial class is the associamancy obstruction, corresponding to the Schur multiplier (whose Schur cover is SL(2,7)).

---

## The resource monotone: Schur entropy

$$S_{\mathrm{Schur}}(\lvert\psi\rangle) = -\sum_{\lambda:\,\nu_2(\lambda)=0} p_\lambda \log p_\lambda$$

where p_λ = ‖Π_λ|ψ⟩‖² is the weight in the ν₂ = 0 sector.

- S_Schur = 0 iff the state has no associamancy (free state)
- S_Schur ≤ log 2 for PSL(2,7), maximised at equal weight across χ₃ and χ̄₃
- S_Schur is additive on tensor products
- **S_Schur is a valid resource monotone**: proved non-increasing under all Origami ISA (free) operations, because real gate matrices cannot map states into the ν₂ = 0 sector

S_Schur is independent of both Wigner negativity and TV: neither implies the other.

---

## The Freudenthal ladder (conjecture)

Associamancy sits at the G₂ rung of the Freudenthal magic square:

$$G_2 \;\subset\; F_4 \;\subset\; E_6 \;\subset\; E_7 \;\subset\; E_8$$

Each rung requires a strictly richer opcode set. The conjecture: computational power increases strictly at each step, witnessed by the non-abelian StateHSP for the corresponding exceptional group. PSL(2,7) ⊂ G₂ is the first rung and the focus of this paper; the conjecture remains open for higher rungs.

---

*See also:*

- [Non-Associative Hardware is Necessary](https://doi.org/10.5281/zenodo.20667170) (#405) — proof that associamancy requires different hardware; PSL(2,7) non-abelian StateHSP
- [Hot Logic: A Complete Magic Resource Theory](https://doi.org/10.5281/zenodo.21219700) (#470) — TV as the correct discriminant for dark vs genuine magic (Levels 1a/1b)
- [Nine Normal Forms of C₃ Circuits](https://doi.org/10.5281/zenodo.21219698) (#469) — 9-class normal form theorem: 1 stabiliser + 6 dark + 2 genuine
- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — practitioner primer

*For the full technical treatment, see [doi:10.5281/zenodo.20667174](https://doi.org/10.5281/zenodo.20667174)*
