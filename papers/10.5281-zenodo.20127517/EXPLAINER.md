# Conserved Computation: An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20127517](https://doi.org/10.5281/zenodo.20127517) (#286)*

## Why do we care?

Standard computers have a "reality gap" between the software we write and the physical hardware that runs it. We write a line of code (Syntax) and hope the electrons in the chip perfectly represent the logic (Semantics). But in the real world, heat, electrical noise, and quantum decoherence create "slop." This slop forces us to spend massive amounts of energy and time on error correction — checking the physical state against the logical rule.

This paper proves that by utilising a specific physical symmetry ($G_2$), we can build a computer where this gap disappears. It uses the laws of physics to lock the "doing" of the math to the "truth" of the math. If a system is perfectly symmetrical, the data inside it becomes a "conserved quantity" — just like energy or momentum — making it physically impossible for the hardware to drift into an incorrect logical state.

## The controversial claim

The central assertion is that **true computation must be a "Monadic Descent."** A sceptic would argue that computation is a flexible process of taking many different paths to an answer. This paper claims that such flexibility is actually "Gauge Freedom" — a fancy word for unnecessary noise. We argue that the most efficient computer is one that has zero freedom to be wrong. By tightening the geometric screws of the manifold until the "Wild West" of possible paths (the Kleisli category) perfectly matches the "Scoreboard" of hard facts (the Eilenberg-Moore category), we create an architecture that is natively self-correcting without needing external software checks.

## Reasons not to be sceptical

- **Noether's Theorem:** The work is grounded in the most successful principle in the history of physics: every continuous symmetry corresponds to a conserved quantity. We are simply applying this to informational states.
- **Langlands Self-Duality:** We leverage the fact that the $G_2$ Lie group is its own mirror image. This provides the mathematical proof that adding information (Split) and removing information (Splat) resolve to the same indestructible topological invariant.
- **Categorical Rigour:** The proof utilises the "Moment Map," a standard tool in symplectic geometry that has successfully modelled everything from planetary orbits to particle accelerators.

## The technical core

This paper formalises the relationship between continuous symmetry and discrete logic as a **Categorical Adjunction**. We model the computational state space as a non-associative manifold governed by the $G_2$ automorphism group. We demonstrate that the **Maslov-Gibbs Einsum (MGE)** acts as the "Monadic Descent" operator: as the inverse-temperature $\beta$ is driven to infinity, the comparison functor between free trajectories and invariant algebras becomes an equivalence. The physics of the system becomes "fully determined," meaning the continuous fluid of the quantum processor perfectly crystallises into the discrete logic of the Fano-crystal.

## Risks and open problems

The primary risk is the **Physical Realisation of $G_2$**. While the math proves that $G_2$ symmetry creates "Conserved Computation," finding or engineering a material that natively exhibits this symmetry (like a frustrated chiral magnet or a topological insulator) is an ongoing challenge for materials science. If the physical substrate only *approximates* $G_2$ symmetry, the "monadic descent" will be incomplete, and the hardware will still accumulate a small, non-zero amount of logical slop over time.

## What to read next

- [The Self-Dual $G_2$ Architecture](https://doi.org/10.5281/zenodo.20101634) — *Explains the specific "Mirror Square" identities used to build this hardware.*
- [Topological Resonance Synthesis (TRS)](https://doi.org/10.5281/zenodo.19858021) — *The engine that provides the continuous fluid for the monadic descent.*
- [The Resonance Processing Unit (RPU)](https://doi.org/10.5281/zenodo.19743800) — *The hardware blueprint designed to instantiate these symmetries.*

*For the full technical treatment, see [doi:10.5281/zenodo.20127517](https://doi.org/10.5281/zenodo.20127517)*
