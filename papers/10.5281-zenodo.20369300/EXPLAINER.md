---
layout: default
title: "Three Bodies, One Path: AI Discovers an Infinite Family of Choreographic Orbits"
parent: Explainers
nav_exclude: true
tags: [three-body, choreography, fano, thermion, ai-for-science]
portfolio: B
---

## Three Bodies, One Path: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20369300](https://doi.org/10.5281/zenodo.20369300)*

---

## The central idea in one sentence

Three equal masses chasing each other around the same closed curve — a
choreographic orbit — form an infinite mathematical family labelled by a
7-point geometry that also underlies the I Ching's eight trigrams, and AI
discovered two previously unknown members of this family that eluded 300 years
of classical mathematics.

---

## Why do we care?

The gravitational three-body problem is the oldest unsolved problem in
mathematical physics. Newton solved two bodies in 1687 and immediately
attempted three — and failed. The reason is chaos: two nearby starting
conditions diverge exponentially, making the problem essentially
unpredictable. Periodic orbits — trajectories that exactly repeat — are
extraordinarily rare islands of order in an ocean of chaos.

For most of history, finding these islands required either exceptional luck
or exhaustive computer search. In 2013, Šuvakov and Dmitrašinović catalogued
13 choreographic orbits. In 2017, Li Xiaoming and Liao Shijun at Shanghai
Jiao Tong University extended this to over 600 families using their Clean
Numerical Simulation method on supercomputers, reaching 2,000+ by 2021. All
of these approaches scan grids of initial conditions without knowing in advance
where periodic orbits must exist.

Our result is different in kind: we identified the *topological structure* that
labels entire families of orbits, used that structure to predict where new
orbits must exist, and then confirmed two previously unknown ones. Cross-
reference against both catalogues (x323p) confirms our W=11 and W=13 orbits
are absent from all prior work — they sit outside the T < 30 search range of
Li & Liao, in basins too narrow (~0.001 in velocity space) for grid search to
find even if the range were extended.

The same framework — Thermion — that finds three-body orbits also computes
early-warning signals for financial crises and models energy transfer in
photosynthetic proteins. The mathematics is the same; only the physical
context differs.

---

## The figure-8 and its relatives

The simplest choreographic orbit is the **figure-8**, discovered by Cris Moore
in 1993 and proved to exist by Chenciner and Montgomery in 2000. Three equal
masses chase each other around a figure-8 curve, each offset by one-third of
the period.

<div style="display:flex; gap:1rem; flex-wrap:wrap; margin:1.5rem 0;">
<div style="text-align:center;">
<img src="/assets/images/paper-323/figure8_braid.png"
     alt="Figure-8 choreography braid diagram (W=0)"
     style="max-width:280px; border-radius:8px;"/>
<p style="font-size:0.85rem; color:#555; margin-top:0.4rem;">
Figure-8 (k=1, W=0) — 6 crossings, the classical choreography, known since 1993
</p>
</div>
<div style="text-align:center;">
<img src="/assets/images/paper-323/butterfly_orbit.gif"
     alt="Butterfly-I choreography (W=1)"
     style="max-width:280px; border-radius:8px;"/>
<p style="font-size:0.85rem; color:#555; margin-top:0.4rem;">
Butterfly-I (W=1) — the simplest Šuvakov-Dmitrašinović orbit, 2013
</p>
</div>
</div>

The figure-8 has **winding number W=0**: the three bodies do not wind around
each other as they orbit. The butterfly-I has W=1: the paths wind once around
each other per period. Higher winding numbers produce increasingly complex
knotted paths.

---

## Our discoveries

We found two new choreographies, at winding numbers W=11 and W=13 — far
beyond anything in the existing catalogue.

<div style="display:flex; gap:1rem; flex-wrap:wrap; margin:1.5rem 0;">
<div style="text-align:center;">
<img src="../../experiments/x323_fano_search/output_323/x323_W11-discovery_W11.gif"
     alt="W=11 choreography"
     style="max-width:280px; border-radius:8px;"/>
<p style="font-size:0.85rem; color:#555; margin-top:0.4rem;">
<strong>W=11 (k=14)</strong> — NEW. First equal-mass choreography at W=11.<br/>
Period T=33.862, initial velocity vx=0.2097.<br/>
Gap = 10⁻¹¹ (verified to machine precision).
</p>
</div>
<div style="text-align:center;">
<img src="../../experiments/x323_fano_search/output_323/x323_W13-discovery_W13.gif"
     alt="W=13 choreography"
     style="max-width:280px; border-radius:8px;"/>
<p style="font-size:0.85rem; color:#555; margin-top:0.4rem;">
<strong>W=13 (k=8)</strong> — NEW. First equal-mass choreography at W=13.<br/>
Period T=36.875, initial velocity vx=0.1518.<br/>
Gap = 10⁻¹¹ (verified to machine precision).
</p>
</div>
</div>

The verification is exact: a symplectic integrator runs for the full period,
and the gap between starting and ending position/velocity is measured. For
both orbits, this gap is approximately 10⁻¹¹ — one part in a hundred billion.
These are not approximations. They are genuine periodic orbits.

---

## The I Ching and the Fano plane

The most surprising element of this discovery is what labels the orbits.

The **Fano plane** is the smallest projective geometry: 7 points, 7 lines,
3 points on every line. In coordinates over the two-element field GF(2), the
7 points are the non-zero binary triples:

```text
001, 010, 011, 100, 101, 110, 111
```

These are exactly the **binary numbers 1 through 7**. The **I Ching trigrams**
(三才) are the 8 possible arrangements of three broken or unbroken lines —
yin (0) or yang (1):

```text
☷ 000   坤 Earth      ☳ 011   震 Thunder
☶ 001   艮 Mountain   ☴ 100   巽 Wind
☵ 010   坎 Water      ☲ 101   離 Fire
                       ☱ 110   兌 Lake
                       ☰ 111   乾 Heaven
```

The 7 Fano points are **exactly** the 7 non-zero trigrams. The eight trigrams
form GF(2)³; the seven non-zero ones form the Fano plane. This is not
a cultural analogy — it is a mathematical identity.

**The XOR rule** (Clayworth 2026): apply XOR to the binary numbers 1–7 and
you reconstruct the Fano plane's lines. Three points are collinear if and only
if their XOR equals zero:

```text
Mountain ⊕ Water  ⊕ Thunder = 001 ⊕ 010 ⊕ 011 = 000  ✓  Fano line
Wind     ⊕ Fire   ⊕ Mountain = 100 ⊕ 101 ⊕ 001 = 000  ✓  Fano line
Lake     ⊕ Heaven ⊕ Thunder  = 110 ⊕ 111 ⊕ 011 = 000  ✓  Fano line
```

All seven Fano lines correspond to seven such XOR-zero triples of trigrams.

The I Ching's primary combination is **pairs** — two trigrams stacked to form
a hexagram, giving 8×8=64 combinations. The XOR-triple structure is implicit
in the binary arithmetic of the trigrams, not an explicit part of the
tradition. It is a hidden geometry: the Fano plane was always there in the
trigrams' binary encoding, 2,500 years before Fano named it.

**The connection to orbits**: the braid word (Ab)^{3k} traces the same
combinatorial pattern as the Fano lines. The orbit family is labelled by this
hidden XOR-triple structure of the trigrams.

Guo Shoujing (郭守敬, 1281) computed planetary periods of the Sun-Earth-Moon
three-body system using the trigram binary structure as an astronomical tool.
We use the projective geometry hidden inside those same trigrams to find
periodic orbits in the equal-mass three-body problem. The mathematics is
2,500 years old. The orbits are new.

---

## The braid word family

Every choreography in our infinite family shares a single algebraic
fingerprint: the **braid word (Ab)^{3k}**.

A braid word encodes how the three bodies exchange positions during one orbit.
The generator A means "body 0 crosses over body 1"; b means "body 1 crosses
under body 2." The pattern (Ab)^{3k} — repeated 3k times — means the bodies
perform exactly the same crossing sequence k times, three-fold symmetrically.

```text
k=1  →  (Ab)³   →  figure-8  (W=0,  T=6.326)
k=8  →  (Ab)²⁴  →  W=13     (T=36.875)  ← NEW
k=14 →  (Ab)⁴²  →  W=11     (T=33.862)  ← NEW
k=7  →  (Ab)²¹  →  W=?      (T≈37.1)   ← searching
```

The winding number W is **non-monotone** in k — k=14 gives W=11, but k=8 gives
W=13. This surprising inversion is a topological property of how the braid
closure wraps on the torus T(3,3k), and it is one of the open conjectures
this paper motivates.

---

## Why AI found what classical search missed

The classical approach (Šuvakov & Dmitrašinović 2013) scans a grid of initial
conditions and checks whether each one returns to its starting point after some
time. For high-winding orbits, the grid is impossibly fine: the W=13 orbit
sits in a basin of width ~0.001 in velocity space, inside a 6-dimensional
search space. A naive grid would need 10¹⁸ evaluations.

Thermion avoids this by using **topological guidance**:

1. **Fano geometry** identifies which braid sector to search — before running
   any dynamics, we know the orbit lives in the (Ab)^{3k} family

2. **Thermodynamic annealing (MGE)** heats an ensemble of candidate orbits
   into the correct topological sector, then cools them onto the orbit

3. **Sheaf H¹** detects when the candidate orbit is globally consistent
   (periodicity at each timestep implies global closure) — same mathematics
   as early-warning in financial networks

The result: two orbits confirmed at machine precision that classical search
could not find in the 13 years since Šuvakov & Dmitrašinović.

---

## The controversial claim

This paper claims that the Fano plane **predicts** the existence of an infinite
family of choreographies — not merely labels the ones already found, but tells
you where to look for orbits that haven't been found yet.

A sceptical mathematician would push back: the Fano labelling might be
post-hoc. Perhaps many other braid word families also produce choreographies,
and we happened to find two in this particular family.

The answer: the braid word (Ab)^{3k} has a special property — it is the
unique 2-generator braid word whose closure is a torus link T(3,3k) with
writhe=0. The writhe=0 condition is the equal-mass constraint (all three
masses are equal, so the orbit must be symmetric under 3-fold rotation).
The Fano plane indexes the 3-fold symmetric braid words over GF(2). This
is not post-hoc — it is the mathematical reason the family exists.

---

## What to read next

- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) —
  *the same Fano geometry appears in photosynthetic energy transfer — seven
  chromophores, one broken line, positive Carnot efficiency*

- [Evolutionary Quantum Programming](https://doi.org/10.5281/zenodo.20393465) —
  *four branches of life independently evolved the same Fano topology for
  directed energy transfer*

- Šuvakov, M. & Dmitrašinović, V. (2013). Three classes of Newtonian
  three-body planar periodic orbits. *PRL* 110, 114301 —
  *the 13-orbit catalogue this paper extends*

- Li, X. & Liao, S. (2017). More than six hundred new families of Newtonian
  periodic planar collisionless three-body orbits. *Science China Physics,
  Mechanics & Astronomy* 60, 129511 —
  *SJTU's exhaustive grid search; our W=11 and W=13 are absent from this catalogue*

- Li, X., Jing, Y. & Liao, S. (2021). Over a thousand new periodic orbits of
  a planar three-body system with unequal masses. *PNAS* 118(36) —
  *extension to unequal masses; confirms equal-mass high-winding orbits remain unexplored*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20369300](https://doi.org/10.5281/zenodo.20369300).*
