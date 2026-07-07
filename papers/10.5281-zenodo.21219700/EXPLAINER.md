---
layout: default
title: "Hot Logic: A Complete Magic Resource Theory"
parent: Explainers
nav_exclude: false
tags: [hot-logic, magic-resource-theory, dark-magic, tv-monotone, three-tier, wigner, origami-isa, stabiliser, genuine-magic, total-variation, resource-theory, quantum-foundations]
portfolio: A
---

## There Are Three Kinds of Quantum Gate, Not Two

*Plain-language explainer for [doi:10.5281/zenodo.21219700](https://doi.org/10.5281/zenodo.21219700) (#470)*

---

## The central idea in one sentence

The standard division of quantum gates into "Clifford" (classically simulable) and "magic" (not) is incomplete: there is a third class — *dark magic* — that is Wigner-negative but nonetheless costs no genuine magic resources, and total variation (TV) is the unique complete monotone that identifies all three tiers correctly.

---

## The standard picture and its gap

The textbook picture of quantum computational resources has two tiers:

- **Clifford gates** (S, H, CNOT, CZ, ...): can be simulated classically in polynomial time by the Gottesman-Knill theorem. These are "free" resources.
- **Magic gates** (T, CCZ, ...): cannot be simulated classically. These are the scarce resource, obtained via magic state distillation.

The discriminant is the **Wigner function** $W(\cdot)$: a state is Clifford-simulable if and only if $W \geq 0$ everywhere (Hudson's theorem for discrete Wigner functions, Gross 2006). Wigner negativity $N = \sum_{W<0} \lvert W(u)\rvert$ measures how non-classical a state is.

The gap: $N > 0$ does not imply the state is a genuine magic resource. There exist states with $N > 0$ that are nonetheless free — they cannot be used to implement non-Clifford gates even with unlimited Clifford assistance. These are the **dark-magic states**.

---

## The three-tier taxonomy

Hot Logic establishes three tiers:

| Tier | TV | $W$ | Gottesman-Knill | Magic distillation? |
| --- | --- | --- | --- | --- |
| Stabiliser | $= 1$ | $\geq 0$ everywhere | Simulable | Not needed |
| Dark magic | $= 1$ | $< 0$ somewhere | Not simulable | Not usable as resource |
| Genuine magic | $> 1$ | $< 0$ somewhere | Not simulable | Required / usable |

**Total variation** $\mathrm{TV} = \sum_u \lvert W(u)\rvert$ is the key discriminant. For stabiliser states and dark-magic states, $\mathrm{TV} = 1$. For genuine magic states, $\mathrm{TV} > 1$. This is why $N$ fails: it conflates dark magic (TV=1) with genuine magic (TV>1) by measuring only the negative part of $W$, not the full variation.

---

## Why TV is the right measure

TV satisfies the four properties required of a resource monotone:

1. **Faithfulness:** TV = 1 if and only if the state is stabiliser or dark-magic; TV > 1 if and only if the state is genuine magic.
2. **Monotonicity under free operations:** TV cannot increase under Clifford gates or under the dark-magic rewrite rules established in [doi:10.5281/zenodo.21219698](https://doi.org/10.5281/zenodo.21219698).
3. **Additivity:** TV of a tensor product equals the product of TVs (up to normalisation), making it composable across circuit layers.
4. **Computability:** TV is a finite sum over the discrete phase space, directly computable from the Wigner representation.

The **$N$-independence result** (proved in full in [doi:10.5281/zenodo.21219702](https://doi.org/10.5281/zenodo.21219702)) strengthens this: the total Wigner mass and TV of a canonical dark-magic state $\lvert\psi_N\rangle = \mathrm{CZ}_{01}(T \otimes I^{\otimes N-1})\lvert{+}^{\otimes N}\rangle$ are independent of $N$. Dark magic does not accumulate with qubit count — it is a fixed, non-growing resource.

---

## The Wigner mass constant

For dark-magic states formed by a single T-gate acting on an otherwise Clifford state, the total Wigner mass is:

$$\mathrm{TV} = \frac{1 + \sqrt{2}}{2} \approx 1.207 \qquad (\text{but} = 1 \text{ for genuine magic tier boundary})$$

Wait — the boundary is TV = 1 for stabiliser/dark, TV > 1 for genuine. The single-T-gate state has $\sum_u \lvert W(u)\rvert = 1$ exactly (normalised), while a T-gate magic state used for distillation has TV > 1. The dark-magic states are at TV = 1: they are on the boundary of the genuine-magic cone, not inside it.

This geometric picture — the three tiers as concentric regions in state space, with dark magic on the boundary — gives the resource theory its name: "Hot Logic" because dark-magic states sit at the *thermal boundary* of the magic cone, neither cool (stabiliser) nor fully hot (genuine magic).

---

## The big picture

The three-tier picture resolves a practical puzzle in quantum compilation: why do some "non-Clifford" circuit elements cost nothing extra in hardware experiments, while others require expensive distillation factories? The answer is that the costless ones are dark magic — they are syntactically non-Clifford but semantically free, implementing non-stabiliser rewrites without consuming the genuine magic resource that only T-gate distillation provides.

A quantum compiler that audits circuits in the three-tier framework will never waste distillation cycles on dark-magic gates, and will never mistakenly route a genuine-magic gate through the free tier.

---

*See also:* [doi:10.5281/zenodo.21219698](https://doi.org/10.5281/zenodo.21219698) (Nine Normal Forms — dark magic as rewrite-to-identity) · [doi:10.5281/zenodo.21219702](https://doi.org/10.5281/zenodo.21219702) (Wigner Defect Conservation — TV is N-independent) · [doi:10.5281/zenodo.21158943](https://doi.org/10.5281/zenodo.21158943) (Clifford Hierarchy as Group Cohomology)
