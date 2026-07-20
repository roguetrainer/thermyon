---
layout: default
title: "Tanabe-Sugano Diagrams Are Tropical Varieties"
parent: Explainers
nav_exclude: true
tags: [g-walk-chemistry, tropical-geometry, dft, density-functional-theory, tropical-degeneration, tanabe-sugano, derivative-discontinuity, newton-polytope, spin-crossover, tropical-variety, coordination-chemistry]
portfolio: A
---

## Quantum Chemistry Has a Classical Shadow — and That Shadow Is G-Walk

*Plain-language explainer for [doi:10.5281/zenodo.21224113](https://doi.org/10.5281/zenodo.21224113) (#491)*

---

## The central idea in one sentence

G-Walk chemistry is the classical limit of density functional theory: when the crystal-field splitting is large compared to thermal energy ($\varepsilon = kT/\Delta \to 0$), the smooth DFT energy functional degenerates onto a piecewise-linear function over the orbit occupancy vector, and every feature of that piecewise-linear function has a precise name in tropical algebraic geometry.

---

## Two theories that shouldn't agree so well

Density functional theory (DFT) is the workhorse of computational chemistry. It treats electrons as a continuous charge density $\rho(\mathbf{r})$, minimises the total energy $E[\rho]$ over all possible densities, and outputs bond lengths, reaction energies, and electronic spectra to high accuracy. It runs on supercomputers and can take hours to days per molecule.

G-Walk chemistry treats the same electrons as discrete objects sitting in symmetry orbits. It asks: which orbit slots are occupied? It does no integration, solves no differential equations, and runs in milliseconds. Yet for spin-crossover iron compounds — a benchmark where DFT is known to struggle — G-Walk achieves 20/20 correct spin-state assignments against DFT's 14/20.

This paper explains why. The two theories are not competing approximations to the same thing. They live on different mathematical structures — different *semirings* — and G-Walk is exactly what DFT becomes when one of those semirings degenerates into the other.

---

## Two semirings, one deformation

A *semiring* is a set with two operations that obey the usual rules of addition and multiplication but without requiring subtraction. Standard arithmetic uses the semiring $(\mathbb{R}, +, \times)$. There is another semiring, less familiar but equally valid, called the *tropical semiring*: $(\mathbb{R}, \min, +)$. In it, "addition" means taking the minimum and "multiplication" means ordinary addition.

The key fact: the tropical semiring is the limit of the standard semiring as an inverse temperature $\beta \to \infty$. The interpolating family is

$$a \oplus_\beta b = -\tfrac{1}{\beta}\ln\!\left(e^{-\beta a} + e^{-\beta b}\right)$$

At $\beta = 0$: $a \oplus_0 b \approx \frac{a+b}{2}$ (roughly standard addition). At $\beta \to \infty$: $a \oplus_\infty b = \min(a,b)$ exactly (tropical addition). The same deformation applies to the entire structure of DFT. The partition function

$$Z(\beta) = \sum_i e^{-\beta E_i}$$

at $\beta \to \infty$ collapses to $e^{-\beta E_0}$ — a single term, the ground state, selected by the tropical $\min$ operation. The full quantum sum becomes a winner-take-all selection.

In chemical terms: $\varepsilon = kT/\Delta$ is the ratio of thermal energy to orbital splitting energy. When $\varepsilon \ll 1$ — when the temperature is low relative to the crystal-field splitting — the system is frozen in its lowest-energy orbit configuration. The tropical limit is the exact description of this regime.

---

## What gets tropicalised

**The DFT energy landscape becomes piecewise-linear.** The total energy $E$ as a function of orbital occupancies $\{n_i\}$ is a smooth function over the standard semiring. Its tropical degeneration is a piecewise-linear function whose *vertices* — the corners where two or more linear pieces meet — are exactly the orbit-complete configurations: those where every orbit is either empty, half-filled, or fully filled. These are the stable configurations predicted by G-Walk chemistry's orbit stability theorem, which turns out to be the tropical Morse lemma: in a tropical landscape, the minimum is always achieved at a vertex of the Newton polytope, not in the interior.

**Tanabe-Sugano diagrams are tropical varieties.** A Tanabe-Sugano diagram is the standard tool of inorganic spectroscopy for a metal ion in a crystal field. It plots the energies of all electronic states of a $d^n$ configuration as a function of crystal-field strength $10Dq$. The diagram is famous for the sharp kinks — crossings — where two states exchange ground-state status as $10Dq$ increases.

In tropical geometry, a *tropical variety* is the set of parameter values where a piecewise-linear function is not differentiable — where two or more pieces agree in value. The Tanabe-Sugano kinks are tropical intersections. The smooth regions of the diagram are tropical faces, each dominated by a single orbit configuration. The boundaries are tropical edges, each corresponding to the TWIST opcode firing condition: the spin-crossover point where two configurations have equal energy, $\Delta/K = [S_H(S_H+1) - S_L(S_L+1)] / [n_\mathrm{eg}(H) - n_\mathrm{eg}(L)]$.

Tanabe-Sugano drew these diagrams in 1954 without the language of tropical geometry. They are tropical varieties; they just had not been described as such.

**The derivative discontinuity is a tropical singularity.** One of the most notorious failures of approximate DFT is the *derivative discontinuity*: the exact exchange-correlation potential has a sharp kink when the electron count crosses an integer, but all standard approximations (LDA, GGA, hybrid functionals) smear this kink into a smooth curve, systematically underestimating band gaps and misplacing orbital energies. In tropical language, the kink is a tropical singularity — the exact location where the ground-state orbit configuration changes discontinuously. Approximate DFT fails because it approximates the tropical singularity; G-Walk chemistry succeeds because it works *in* the tropical ring, where the singularity is the natural structure, not a problem to be smoothed.

---

## The β-deformation and the H^k ladder: two separate axes

It is worth being precise about two things that look similar but are not the same.

**The β-deformation** is the one-parameter interpolation between the tropical semiring ($\beta \to \infty$, G-Walk) and the standard semiring ($\beta \to 0$, DFT). β controls which *arithmetic* you use — winner-take-all tropical selection versus smooth quantum superposition. This is a single continuous axis.

**The H^k cohomological ladder** is a different classification: it describes the *topological complexity* of the solution. H⁰ = no cycles, no holonomy; H¹ = one-dimensional loops, interference, Berry phase; H² = two-dimensional topological obstruction; H³ and beyond = higher topological structure (WZW terms, higher gauge theory, the associator obstruction of non-associative geometry). The H^k ladder does not terminate at H² — it continues, and H³+ appears in quantum gravity and non-associative contexts that the current ISA framework is approaching but has not yet fully mapped.

The two axes are related but not identical. At a given β, the system can access cohomological structure up to the degree that the semiring at that β supports: the tropical semiring ($\beta \to \infty$) only resolves H⁰ structure; the Gibbs semiring (finite β) resolves H⁰ and H¹; the complex Meld semiring resolves H⁰, H¹, and H². But β does not *label* cohomological degree — it controls *which semiring* the computation runs over, and each semiring has a maximum cohomological resolution.

For G-Walk chemistry specifically:

- **Tropical limit ($\beta \to \infty$):** orbit occupancy vectors, discrete labels — this is the H⁰ component of the DFT solution. Exact where the crystal-field splitting dominates thermal fluctuations.
- **Linear response (finite large β):** first corrections beyond the tropical ground state — Racah C parameter, Jahn-Teller quenching — these are perturbations of the tropical variety, approximating the H¹ corrections that DFT includes smoothly.
- **Full DFT ($\beta \to 0$):** continuous electron density, all correlations — H⁰ + H¹ + H² structure all included, but at enormous computational cost and with approximation errors near tropical singularities.

The systematic corrections from 82% to 85% to 88.5% accuracy on the 61-compound benchmark correspond to including more of the H¹ linear-response corrections to the tropical ground state. This is the empirical evidence that G-Walk chemistry is not a heuristic but the correct tropical degeneration of the DFT energy functional — and that the β-deformation is the right bridge between them.

---

## Why G-Walk beats DFT in the strong-correlation regime

DFT is in principle exact (Hohenberg-Kohn theorem, 1964) but in practice approximate, because no one knows the exact exchange-correlation functional. The approximations fail worst precisely where the tropical structure is most important: near spin-crossover points (tropical edges), in strongly correlated $d$- and $f$-block compounds (tropical vertices), and at integer occupancies (tropical singularities). G-Walk chemistry does not approximate these features — it treats them as the fundamental objects. It fails where DFT is reliable: far from any tropical singularity, in covalently bonded organic molecules where $\varepsilon \gg 1$ and the tropical limit is irrelevant.

The two theories fail in complementary regimes because they live on complementary semirings. The correct framework for understanding both is tropical algebraic geometry applied to quantum chemistry — and the bridge between them is the MGE deformation at inverse temperature $\beta$.

---

## The big picture

Chemistry has long been understood through two lenses: the exact-in-principle quantum lens (DFT, wavefunction methods) and the empirical-but-practical classical lens (coordination chemistry, crystal field theory, Tanabe-Sugano diagrams). This paper shows that these two lenses are the $\beta \to 0$ and $\beta \to \infty$ endpoints of a single family, connected by the Maslov dequantization. The classical lens is not merely an approximation to the quantum lens — it is a different algebraic structure that is *more* accurate than DFT in the regime where DFT fails most badly.

The punchline: Tanabe-Sugano diagrams and the derivative discontinuity were waiting 70 years to be recognised as instances of tropical geometry. The connection explains both why G-Walk works and how to improve it systematically.

---

*See also:*
- [G-Walk Protein Design](https://doi.org/10.5281/zenodo.21224111) (#490) — the orbit occupancy vector as a protein design language
- [Metabolism as Computation](https://doi.org/10.5281/zenodo.21219724) (#509) — the same orbit opcodes applied to biochemical pathways
- [Planck's Constant in Disguise](https://doi.org/10.5281/zenodo.20752384) (#443) — the $\beta$-deformation semiring in its most general form
- [The H^k Complexity Ladder](https://doi.org/10.5281/zenodo.20773526) (#420) — the cohomological filtration underlying the $H^0/H^1/H^2$ tier picture
