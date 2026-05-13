---
layout: default
title: "The 731 Frog Calculus (Part 2)"
parent: Explainers
nav_exclude: false
---

# The 731 Frog Calculus (Part 2) — An Accessible Guide

*Plain-language explainer for [doi:10.5281/zenodo.20139448](https://doi.org/10.5281/zenodo.20139448) (#281)*

## Why do we care?

If you want to build a computer that uses 3D shapes to solve logic problems, you eventually have to draw a map of it. In standard computer science, we use "flowcharts" or "circuit diagrams" where lines represent information and nodes represent gates. In those systems, wires are just "strings" — you can stretch them, bend them, or slide them around without changing the answer.

But in the **731 Frog Calculus**, we are computing with the non-associative geometry of the Octonions. In this world, sliding a wire is a physical violation. If you try to draw a 731-circuit using standard "flat" rules, you will accidentally delete the very geometric constraints that make the processor work. This paper introduces the **2D Frog Diagram**: a strict visual syntax that ensures what you draw on paper (or in a compiler) perfectly matches the rigid 3D physics of the hardware.

## The controversial claim

The paper asserts that **the "Spider" notation used in current quantum computing is mathematically dangerous.** Standard quantum diagrams (the ZX-calculus) use "spiders" — nodes that can grow any number of legs. This paper claims these spiders are "topologically bloated" because they assume information can be merged and split without geometric penalty.

We replace these with **Tree-Frogs** — nodes that strictly have exactly four legs. By forbidding "any-number-of-legs spiders," we force the compiler to respect the physical boundaries of the 3D volume. If a programmer tries to draw an illegal connection, the calculus doesn't just "fail"; it forces the programmer to draw a **Poison Frog** (an Associator Defect) on the page, marking the exact spot where the logic has turned into geometric friction.

## Reasons not to be sceptical

- **The 35,000x compression:** This isn't just an art project. By using the "Ribbon-Leg" syntax defined here, simulations (Experiment 4) demonstrated a 35,000x reduction in the communication signal required to route AI gradients across a cluster.
- **Loop Quantum Gravity (LQG) Pedigree:** The diagrammatic rules aren't invented; they are a rigorous extension of the "Spin Foam" diagrams used by theoretical physicists like Alejandro Perez and Carlo Rovelli, upgraded to handle the non-associativity of $G_2$.
- **Formal Mnemonic:** The logic is distilled into a simple, hardware-enforced rule that prevents "associativity drift" during compilation: *"Four legs good. More than four legs bad."*

## The technical core

This paper replaces uncoloured 1D "wires" with **3-coloured Ribbon-Legs**. Because a 3D triangle has three vertices, its 2D representation must be a flat band (a ribbon) carrying three distinct Fano colours. At the point where two frogs join, they use a **3+1 Toe Joint**: three "toes" align the colours of the ribbon, while a fourth toe (the "nuptial pad") encodes the directed phase of the connection ($+1$ or $-1$). This ensures that the non-commutative and non-associative "chiral shear" of the 731-tier is preserved even when projected onto a flat 2D screen.

## Risks and open problems

The primary risk is **Visual Complexity**. Tracking 3-coloured ribbons and 4-toed joints is significantly more difficult for a human to do by hand than drawing simple lines. This places a heavy burden on the **Origami Compiler** to automate the drawing and optimisation of these diagrams. If the automated layout tools cannot handle the "geometric friction" of the Fano plane, the architecture may remain trapped in theoretical modelling rather than moving to a user-friendly IDE.

## What to read next

- [The 731 Frog Calculus (Part 1)](https://doi.org/10.5281/zenodo.19713350) — *The foundational 3D theory that these 2D diagrams represent.*
- [The Origami ISA](https://doi.org/10.5281/zenodo.19916429) — *Shows how these drawn frogs are converted into machine code opcodes (Split, Splat, Flip, Flop).*
- [Thermodynamic Routing of Stale Gradients](https://doi.org/10.5281/zenodo.20077198) — *A real-world application showing how these "Ribbon-Leg" rules solve the bottleneck of distributed AI.*

*For the full technical treatment, see [doi:10.5281/zenodo.20139448](https://doi.org/10.5281/zenodo.20139448)*
