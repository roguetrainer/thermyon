---
layout: default
title: "The Topological Active Space: Weak Lifting and C/T Skeleton Pre-Screening for CASSCF"
parent: Explainers
nav_exclude: true
tags: [topological-active-space, casscf, ct-skeleton, sceleton, noon, weak-lifting-theorem, alchemi, active-space-selection, multi-reference, quantum-chemistry, h-k-ladder, correlation-energy]
portfolio: A
---

## Letting the topology choose the active space

*Plain-language explainer for [doi:10.5281/zenodo.21300667](https://doi.org/10.5281/zenodo.21300667) (#588)*

---

## The central idea in one sentence

The C/T skeleton of a molecule — a graph that costs almost nothing to compute —
predicts which orbitals must be included in a CASSCF active space with
correlation r = −0.979 across all tested systems, replacing years of specialist
intuition with an automatic, parameter-free pre-screener.

---

## Background: the active space problem

CASSCF (Complete Active Space Self-Consistent Field) is one of the most
powerful methods in quantum chemistry. For systems where DFT fails —
transition-metal complexes, bond-breaking, biological electron transfer —
CASSCF gives chemically accurate results. Its weakness is that you have to
tell it which orbitals to treat carefully (the "active space"). Choose the
wrong orbitals and the answer is wrong. Choose too many and the calculation
becomes exponentially expensive.

Choosing the right active space is currently an art. Experienced computational
chemists use chemical intuition, trial and error, and tools like autoCAS or
AVAS. These tools work, but they require substantial expertise and are not
automatic.

---

## The C/T skeleton (sCeleTon)

Every electron pair in a molecule is either:

- **C-box** (Closed): the pair is frozen, localised on one atom or bond.
  NOONs near 2.0 (bonding) or 0.0 (antibonding). DFT is exact here.

- **T-arrow** (Twisted): the pair is active, delocalised, correlated.
  NOONs near 1.0. DFT fails here; CASSCF is needed.

The C/T skeleton is the graph of C-boxes and T-arrows for a molecule.
It is determined by the MP2 Natural Orbital Occupation Numbers (NOONs),
which are cheap — an MP2 calculation takes minutes on a laptop.

---

## The Weak Lifting Theorem

The paper proves that the T-arrows predicted by the C/T skeleton agree
with the orbitals that CASSCF would select if you ran it without guidance:

**Theorem (Weak Lifting).** The set of T-arrows in the C/T skeleton
is a subset of the CASSCF active space. The correlation between the
C/T skeleton active space size and the CASSCF active space size is
r = −0.979 across the benchmark set.

This means: build the C/T skeleton first (minutes), then run CASSCF
only on those orbitals (hours instead of days for large systems).

---

## The benchmark result

Tested across 10 diverse systems including transition-metal complexes,
organic radicals, and π-conjugated systems:

- C/T skeleton prediction: STRONG PASS 10/10
- Correlation with CASSCF: r = −0.979
- Speedup: 7× to 36× depending on system size

The method is not an approximation to CASSCF — it is a pre-screener
that guarantees the active space is at least as large as necessary,
with no false negatives (it never misses a required orbital).

---

## Where this sits in the roadmap

The C/T skeleton is Layer 0 of the [chemistry roadmap](../../chemistry-roadmap.md):
the topology layer that costs nothing and tells you everything about the
structure of the correlation problem before any serious computation begins.

The sCeleTon also provides the input to Layer 1 (θ_G and the Weyl coordinate)
and determines which pairs go to CCSD versus CASSCF in Layer 2.

---

## The software

[`alchemi`](https://github.com/roguetrainer/alchemi) implements the C/T skeleton
builder. Given a molecular geometry (xyz file or SMILES), it:

1. Runs a cheap MP2 calculation via PySCF
2. Extracts NOONs and classifies each pair as C or T
3. Recommends a CASSCF active space (orbital list + size)
4. Computes θ_G for each T-arrow pair

---

## Connection to the ISA framework

The C/T skeleton is the sCeleTon — the C-boxes are H⁰ (tropical fixed
points, ORBIT closes) and the T-arrows are H¹ or H² depending on the
Weyl c₂ coordinate. The MGE saddle point at β* determines the C/T
boundary: pairs above the saddle are C-boxes; pairs below are T-arrows.

The Weak Lifting Theorem is a theorem about the H^k stratification of
the CASSCF orbital space — it says the topological strata (C vs T) lift
correctly to the geometric strata (active vs frozen) in Gr(k,n).

---

*See also: [Chemistry Roadmap](../../chemistry-roadmap.md) (Layer 0 — Topology);
[Paper 596](https://doi.org/10.5281/zenodo.21309088) (Weyl DFT Accelerator, Layer 1).*
