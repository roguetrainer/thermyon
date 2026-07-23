---
layout: default
title: "Magic has a periodic table"
parent: Applications
nav_order: 1
nav_exclude: true
description: "Quantum non-classicality is not binary — it has orbits, valences, and dark states. The structure of magic mirrors the periodic table of elements."
tags: [magic, wigner, orbits, valence, dark-magic, resource-theory, quantum-foundations]
portfolio: F
---

# Magic has a periodic table
{: .no_toc }

*Quantum non-classicality — "magic" — is not a binary property. It has internal
structure: orbits under the Clifford group, valences that mirror chemical
valence, and a class of "dark" states that are genuinely non-classical but
invisible to the standard Wigner-function measure.*
{: .fs-5 .fw-300 }

---

## The claim

**Magic is not binary.** Standard quantum resource theory divides states into
two classes: stabiliser states (no magic, classically simulable) and everything
else. We show this is the wrong classification. The correct picture has at least
three tiers:

1. **Stabiliser states** — zero magic; Wigner function non-negative; classically
   simulable by Gottesman-Knill.
2. **Dark magic states** — non-zero Wigner negativity by the sum-of-negatives
   measure, but *total variation* TV = 1 (normalisation of the absolute Wigner
   function equals 1). These states look non-classical to the Wigner measure but
   are still simulable. They are invisible to the standard mana (log TV) measure
   because mana = 0 for them too.
3. **Genuine magic states** — TV > 1; non-negative mana; cannot be simulated
   classically. These are the states that actually fuel universal quantum
   computation.

The existence of states that are Wigner-negative but non-resource was noted by
Veitch et al. (2012), who called them **bound magic states** by analogy with
bound entanglement. What was not recorded is what to *do* with them: the mana
monotone (Veitch 2014) is blind to bound magic because it enforces the
normalisation axiom Σ W(u) = 1, which makes mana = 0 for the entire class.
Our contribution is the **TV discriminant** — lifting that axiom and using the
unnormalised total variation TV = Σ\|W(u)\| as the resource measure. This
separates bound magic (TV = 1, mana = 0, but Wigner-negative) from genuine
magic (TV > 1, mana > 0) and from stabiliser states (TV = 1, Wigner-positive).
The Wigner mass cos²(π/8) and its N-independence are also unrecorded.

**Magic has orbits.** Under the Clifford group (the natural symmetry group of
stabiliser quantum mechanics), the space of two-qubit unitaries breaks into
exactly **nine orbits**: one stabiliser class, six dark magic classes, and two
genuine magic classes. The orbit structure is the periodic table of magic. Two
states in the same orbit are interconvertible by free (Clifford) operations;
two states in different orbits are not.

**Magic has valences.** The number of T-gates required to prepare a magic state
from a stabiliser state — its *T-count* — plays the role of valence in chemistry.
States with T-count 1 are like hydrogen; states requiring many T-gates are the
heavy elements. The orbit structure organises states by their valence in a way
that the raw Wigner function does not.

---

## Why it matters

**For quantum computing:** magic state distillation — the process of purifying
noisy magic states into clean ones — is the dominant overhead in fault-tolerant
quantum computation. If dark magic states are being mistakenly treated as
genuine magic, distillation protocols waste resources on states that cannot fuel
computation. The three-tier classification tells you which states are worth
distilling.

**For resource theory:** the standard framework (mana as the magic monotone,
Wigner function as the witness) is incomplete. Dark magic is a resource that
mana cannot see. This means there are states that are strictly harder to
prepare than stabiliser states, but that contribute nothing to computational
power — a kind of "junk resource" with no analogue in prior theory.

**For physics:** the orbit structure under the Clifford group is the
quantum-information analogue of the periodic table — a discrete classification
of all possible quantum states by their symmetry and resource content. Just as
the periodic table emerged from group theory (Mendeleev's intuition formalised
by quantum mechanics), the magic periodic table emerges from representation
theory applied to the Clifford group.

---

## The evidence

| Paper | What it shows |
| --- | --- |
| [Paper 365](https://doi.org/10.5281/zenodo.20543454) | Fano orbit types: the 9 CZ-orbit classes of two-qubit states; T-gate dressing maps between them |
| [Paper 366](https://doi.org/10.5281/zenodo.20543454) | Magic typing: Pareto frontier of T-count vs Wigner negativity; CS gate as genuine magic |
| [Paper 467](https://doi.org/10.5281/zenodo.21219694) | Magic orbits: 9 SWAP-classes via T-gate dressing of 7 CZ-type bases; inter-class fidelity = 1/2 |
| [Paper 469](https://doi.org/10.5281/zenodo.21219698) | ISA completeness: 9 classes proved (1 stabiliser + 6 dark + 2 genuine); TV = 1 iff stabiliser |
| [Paper 470](https://doi.org/10.5281/zenodo.21219700) | Complete magic resource theory: TV as the correct discriminant; N-measure fails for dark magic; the three-tier taxonomy in full |

**Key experiments:**

- **x469a–d** — all four completeness experiments passed; Theorem 1 (9-class
  structure) proved; stabiliser-check verified (±1, ±i eigenvalues)
- **x470a–d** — TV discriminant validated; dark magic confirmed distinct from
  genuine magic; cos²(π/8) identified as the Wigner mass threshold

**Priority note:** The discriminant Σ W(u) < 1 (total variation = 1 for dark
magic), the identification of cos²(π/8) as the Wigner mass, and the
N-independence of the classification are, as far as we know, unrecorded in the
prior literature as of June 2026. The relevant prior work to cite as background
is Veitch (2012), Gross (2006), Bravyi-Kitaev (2005), and Veitch (2014).

---

## The Grassmannian picture

The orbit/TV classification above is **discrete**: states are sorted into nine
orbits by their Clifford-group equivalence class, and the TV threshold is a
sharp binary cut. A complementary **continuous** picture emerged from the
Grassmannian arc (Papers 563, 568, 570, 574, 577, 578, July 2026).

Every quantum state defines a subspace of occupied modes — a point on the
Grassmannian Gr(2^k, 2^n). The **Grassmannian angle**

$$
\theta_G = \arccos(\sigma_0)
$$

measures the geodesic distance from that point to the nearest stabiliser
reference (the leading Schmidt singular value σ₀). It is a continuous,
basis-independent complexity metric.

**The β\* snap at θ_G ≈ 20°** is the continuous analogue of the TV > 1
threshold. Below it, a single dominant stabiliser configuration accounts for
more than 88% of the state weight (σ₀² > 0.88) and classical simulation is
efficient. Above it, no single stabiliser configuration dominates and the state
requires genuine multi-reference treatment — it is computationally magic in the
resource-theory sense.

This gives a unified two-axis picture:

| Property | Stabiliser | Dark magic | Genuine magic |
| --- | --- | --- | --- |
| TV, θ_G | TV = 1, θ_G ≈ 0 | TV = 1, θ_G < 20° | TV > 1, θ_G > 20° |
| Wigner function | Non-negative | Negative | Negative |
| Classically simulable | Yes | Yes | No |
| Geometry | Stabiliser fixed point | Inside β\* ball | Outside β\* ball |

The nine Clifford orbits map onto this geometry: inter-orbit fidelity = 1/2 is
a statement about Fubini-Study distance on the Grassmannian. Dark magic orbits
(six of the nine) lie inside the β\* snap radius; the two genuine magic orbits
lie outside it.

The Grassmannian picture also explains **why distillation works**: magic state
distillation is gradient descent on the Grassmannian toward the genuine magic
region (θ_G > 20°). Dark magic states — sitting inside the β\* ball —
cannot be distilled into genuine magic by Clifford operations alone, because
they are geodesically closer to the stabiliser fixed point than to the genuine
magic region.

---

## What would falsify it

The dark magic claim is falsified if:

- A classical simulation algorithm is found that efficiently simulates all TV = 1
  states *and* all states with Wigner-negative entries but TV = 1 — which would
  mean dark magic is not a distinct resource class, merely a subclass of
  stabiliser states with a different representation.
- The 9-orbit count is wrong — if a finer Clifford-group analysis reveals
  additional classes, or merges classes we have separated.

The three-tier structure is *not* falsified by finding that dark magic states
are hard to prepare — hardness of preparation is orthogonal to simulability of
circuits that use them.

---

## Open questions

- **Can dark magic be distilled into genuine magic?** If so, the three tiers
  are not fully separated as resources — dark magic would be a degraded form of
  genuine magic, not a distinct class.
- **What is the dark magic threshold in higher dimensions?** The nine-orbit
  result is for two-qubit systems (dimension 4). Does the tier structure
  generalise cleanly to n qubits, or does the number of tiers grow?
- **Is there a physical process that preferentially produces dark magic?**
  If so, it could be a systematic error source in near-term quantum devices
  that current benchmarking (which uses mana) cannot detect.
- **Does the magic periodic table have a group-theoretic derivation** analogous
  to the chemical periodic table from SO(3) representation theory? The orbit
  structure suggests yes, but the proof is not yet written.

---

*See also:* [Magic States](../glossary.md#magic-states) in the Glossary ·
[Paper 470 resource theory](https://doi.org/10.5281/zenodo.21219700) ·
[The ISA Completeness theorem](https://doi.org/10.5281/zenodo.21219698)
