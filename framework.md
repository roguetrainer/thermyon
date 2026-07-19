---
layout: default
title: Framework
nav_order: 10
nav_exclude: true
description: "How the layers of the Thermyon framework fit together: MGE, Origami ISA, H^k ladder."
---

{% include isa-nav.html %}

# The Thermyon Framework
{: .no_toc }

*A map of how the pieces fit together.*
{: .fs-5 .fw-300 }

---

The framework grew in layers. They are not synonyms.

| Layer | Name | What it is | Key papers |
|-------|------|------------|------------|
| 1 | **MGE** | Maslov–Gibbs Einsum: the core differentiable operation | 201 |
| 2 | **β-deformation** | β as coordinate; classical/statistical/quantum as one family | 443, 454, 543 |
| 3 | **Origami ISA** | Five opcodes; the open instruction set standard | 258, 455, 631 |
| 4 | **H^k ladder** | Cohomological complexity classification | 420, 469, 595 |
| 5 | **Thermyon** | The full programme: all layers plus all domain applications | — |

The [Pillars](pillars.md) page gives the four load-bearing ideas in detail.
The [Opcodes](opcodes.md) page gives the full technical reference for the five opcodes.
The [β-plane](forge-meld.md) page gives the geometry of the β-deformation.

{% include isa-nav.html %}
