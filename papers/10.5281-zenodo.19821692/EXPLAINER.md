---
layout: default
title: "Fibrational Tensor Codes (FTCs)"
parent: Explainers
nav_exclude: true
tags: [hardware-ai, qec, fano, g2]
---

# Fibrational Tensor Codes (FTCs): An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.19821692](https://doi.org/10.5281/zenodo.19821692) (#206)*

## Why do we care?

Standard Quantum Error Correction (QEC) is "spatial." To protect one piece of data, you spread it out across hundreds of qubits on a flat grid (a Surface Code). As you scale up, the grid gets bigger, the wiring gets more complex, and you eventually run out of room on the chip. This "spatial bloat" is a major barrier to building large-scale quantum computers.

This paper introduces **Fibrational Tensor Codes (FTCs)**, which move the burden of error correction from "Space" to "Gauge." Instead of spreading data across a physical grid, we wrap it inside a higher-dimensional mathematical structure called a **Fiber Bundle**. This allows us to create "Synthetic Qudits" that have built-in protection at the microscopic level. We use the internal symmetries of the Octonions ($G_2$) to create a topological shield that resides *inside* the qubit's state, rather than needing an external array of neighbours to watch over it.

## The controversial claim

This paper asserts that **non-associativity can be quarantined.** A major pushback from quantum theorists is that the Octonions are "non-associative," which would normally break the standard rules of quantum logic gates. This paper makes the radical claim that you can have your cake and eat it too: you can use the non-associative $G_2$ geometry to *protect* the data, while keeping the *logic gates* themselves strictly associative. We argue that non-associativity belongs in the "Berry Phase" (the envelope), not the "Gate Group" (the letter).

## Reasons not to be sceptical

- **The Division Algebra Ladder:** The codes are not arbitrary; they follow the strict **Cayley-Dickson hierarchy** ($\mathbb{R} \to \mathbb{C} \to \mathbb{H} \to \mathbb{O}$), ensuring they are grounded in the most fundamental structures of mathematics.
- **FQ4C Validation:** The "Quaternionic" version of this code ($[[4,2,2]]$) is a well-known, standard stabiliser code. This provides a "sanity check" baseline that proves the hierarchy is mathematically sound before we climb to the more exotic Octonionic tier.
- **Furey Spinor Alignment:** The 8-dimensional logical encoding is aligned with C. Furey's research on the Clifford algebra $Cl(0,7)$, linking our computer architecture to established models of particle physics.

## The technical core

The FTC architecture organises computation into two rungs. The **Quaternionic Rung (FQ4C)** uses 4 qubits to create a routing substrate that is non-commutative but fully associative. The **Octonionic Rung (FQ8C)** uses 7 qubits arranged in a Fano plane incidence structure. The key innovation is the $G_2$ **Fiber Bundle**: we use the continuous phase of the encoding map to "trap" errors. If noise attempts to flip a bit, it triggers an "Associator Anomaly" in the fiber, which we detect as a geometric phase shift rather than a discrete parity error.

## Risks and open problems

The primary risk is **Universality**. While we can prove that the FQ8C code protects 8 dimensions of data, we still need to prove that we can perform *all* possible quantum operations (a "Universal Gate Set") without ever leaving the protected $G_2$ manifold. If certain operations force the code to "unravel" its gauge protection, the architecture would be limited to specific types of calculations rather than general-purpose computing.

## What to read next

- [The Resonance Processing Unit (RPU)](https://doi.org/10.5281/zenodo.19743800) — *The hardware substrate where these Fiber Bundles are physically instantiated.*
- [Fibrational Lattice Surgery (FLS)](https://doi.org/10.5281/zenodo.19922441) — *Explains how to "stitch" these Tensor Codes together to build a larger computer.*
- [Non-Associative Quantum Error Correction](https://doi.org/10.5281/zenodo.20088536) — *The formal mathematical proof that these Jordan-algebraic codes actually work.*

*For the full technical treatment, see [doi:10.5281/zenodo.19821692](https://doi.org/10.5281/zenodo.19821692)*
