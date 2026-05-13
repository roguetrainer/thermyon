# Fibrational Lattice Surgery (FLS): An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.19922441](https://doi.org/10.5281/zenodo.19922441) (#217)*

## Why do we care?

To build a useful quantum computer, you have to move data around. This usually involves "Code Switching" — taking a quantum state from a storage area (2D memory) and moving it into a processing area (3D execution). Currently, we do this using **Lattice Surgery**, which is a "brute-force" method where we measure the qubits at the boundary between the two codes. This measurement is "noisy" and often destroys the very data we are trying to move.

This paper introduces **Fibrational Lattice Surgery (FLS)**, or **LS2.0**. Instead of "cutting and stitching" codes using noisy measurements, we use a **Topological Zipper**. We treat the transition as a smooth, geometric "fold." By using the non-associative math of the $G_2$ Lie group, we can "zip" the 2D memory lattice into a 3D execution block unitarily. This means the data is never measured and never exposed to the noise that kills standard quantum transitions.

## The controversial claim

The paper asserts that **we can eliminate the need for "Magic State Distillation" factories.** In current quantum roadmaps, 90% of a computer's power is wasted on "distilling" rare, high-quality states needed for complex logic. This paper claims that by using $G_2$ **Catalytic Interpolation**, we can perform these complex operations natively in the "zipper" itself. A sceptic would say this violates the Eastin-Knill theorem (which says you can't have universal transversal gates), but we argue that $G_2$ self-duality provides a "loophole" that standard associative math doesn't see.

## Reasons not to be sceptical

- **iSWAP Implementation:** This isn't just theory. We prove that this "Topological Zipper" can be built using standard **iSWAP gates** — the exact type of microwave interaction already used in today's superconducting quantum processors (like those from IBM and Google).
- **Adiabatic Protection:** We demonstrate that the protocol maintains a "Protective Energy Gap" ($\Delta > 0$) during the entire transition, meaning the quantum data is physically shielded from the environment while it is being moved.
- **Boundary Denoising:** Our simulations show that by replacing measurements with geometric folds, we completely eradicate the "Interface Noise" that typically limits the size of quantum processors.

## The technical core

FLS replaces measurement-based gauge-fixing with **Catalytic Adiabatic Interpolation**. We map the 7-dimensional representation of $G_2$ to a hardware-controlled penalty. To move a state from the Steane $[[7,1,3]]$ code to the Reed-Muller $[[15,1,3]]$ code, we don't "switch" codes; we smoothly morph the Hamiltonian from one to the other. Because $G_2$ is self-dual, we can maintain the topological protection of the state even as the dimensions of the code change from 2D to 3D.

## Risks and open problems

The biggest risk is **Adiabatic Speed**. To keep the "Protective Gap" open, the "zipping" process must be done relatively slowly (adiabatically). If you zip too fast, the state "shatters" (decoherence); if you zip too slowly, the natural decay of the qubits kills the calculation. Finding the "Sweet Spot" — the maximum speed at which we can zip without losing the topological guarantee — is the primary engineering challenge for the first physical FLS prototypes.

## What to read next

- [The Resonance Processing Unit (RPU)](https://doi.org/10.5281/zenodo.19743800) — *The hardware substrate that uses this "zipper" to connect its processing cores.*
- [Geometric Interpretation of Code Switching](https://doi.org/10.5281/zenodo.19929360) — *Explains the $PG(2,2) \to PG(3,2)$ dimensional jump in more detail.*
- [Non-Associative Quantum Error Correction](https://doi.org/10.5281/zenodo.20088536) — *The formal proof that these "smooth morphs" are mathematically valid.*

*For the full technical treatment, see [doi:10.5281/zenodo.19922441](https://doi.org/10.5281/zenodo.19922441)*
