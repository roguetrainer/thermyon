---
layout: default
title: "The Unhedgeability Theorem: Sheaf Cohomology of Interaction Diagrams and the Topology of Financial Risk"
parent: Explainers
nav_exclude: true
tags: [sheaf-cohomology, economics, gauge-theory, origami-isa, interest-rates, systemic-risk]
portfolio: G|B
---

## The Unhedgeability Theorem

*Plain-language explainer for [doi:10.5281/zenodo.20635479](https://doi.org/10.5281/zenodo.20635479) (#396)*

---

## The central idea in one sentence

Some financial risks cannot be hedged with bilateral instruments no matter how many you hold — not because the market is incomplete in practice, but because the risk is a topological obstruction (a non-trivial $H^1$ cohomology class) that simply does not live on the edges of the contract graph that bilateral instruments cover.

---

## The simplest possible version: three currencies

Forget credit risk, options, and stochastic calculus for a moment. Take three currencies — say GBP, USD, and EUR — and their three spot exchange rates: GBP→USD, USD→EUR, and EUR→GBP.

Multiply the three rates around the loop. In an arbitrage-free market, you get exactly 1: converting GBP to USD to EUR and back to GBP returns your original pound. If the product is not 1, there is a triangular arbitrage — free money sitting on the triangle, not on any single edge.

This is the whole idea in miniature. Each spot rate is **local** data — it lives on one edge of the currency graph. Whether the three rates are *mutually consistent* is not local data; it is a property of the **triangle**, and no single exchange rate can tell you about it. The triangular-arbitrage check is a tiny example of a **cohomology class**: the failure of local data (edges) to assemble into a globally consistent picture (faces).

Traders have computed this check by hand for as long as there have been three currencies. The paper's contribution is not the check itself — it is showing that this check, the HJM convexity adjustment, basis risk, CDO correlation risk, and a number of other "complex" risk factors are all literally the *same* mathematical object: an $H^1$ class of a sheaf on an interaction diagram. Once you see that, you get a theorem for free, not just a checklist.

---

## $H^0$, $H^1$, $H^2$: the three levels

The paper builds this out of **sheaf cohomology** — a tool from algebraic topology for asking whether local data assembles into a global whole. On a graph of financial instruments (vertices) and bilateral exposures (edges):

- **$H^0$ — bilateral risk.** Local data at a single vertex: a spot rate, a forward price, a credit spread. Always consistent on its own; this is what a forward, a future, or a vanilla swap prices off.
- **$H^1$ — triangular risk.** The first obstruction to assembling bilateral data into a single globally consistent pricing scheme across a *triangle* of exposures. This is where convexity, basis risk, volatility smile, and CDO correlation risk live.
- **$H^2$ — systemic risk.** A secondary obstruction over a *tetrahedron* of triangles: whether the triangular inconsistencies themselves cohere. This level is developed in the companion paper on systemic risk (below).

$H^0$ is always solvable — you can always mark a single instrument. $H^1$ is the first place a genuine, irreducible obstruction can appear.

---

## The interest rate case, worked in full

The paper proves this concretely for the term structure. Let $P(t,T)$ be the discount factor sheaf on the time axis: the price today of $1 delivered at $T$, restricting from $[t,T]$ down to $[t,s]$ via $P(t,s) = P(t,T)/P(s,T)$.

**In a deterministic world**, this restriction is exact — $P(t,s)\cdot P(s,T) = P(t,T)$ on every triangle $(t,s,T)$ — so $H^1 = 0$. There is no convexity risk.

**Once rates are stochastic**, Itô's lemma changes the answer. Writing $s_{[t,T]} = \log P(t,T)$ as a 0-cochain, its coboundary on the triangle $(t,s,T)$ works out to

$$(\delta^0 s)_{t,s,T} = \tfrac{1}{2}\int_t^s\!\int_s^T \sigma(t,u)\sigma(t,v)\,du\,dv \;\neq\; 0,$$

and this is exactly the Heath–Jarrow–Morton convexity adjustment $A(t,T)=\sigma(t,T)\int_t^T\sigma(t,u)\,du$. The HJM no-arbitrage condition on the drift — the standard textbook restriction every HJM model must satisfy — turns out to be exactly the vanishing of the corresponding $H^2$ obstruction. Both halves of the classical HJM machinery are cohomological statements about the same sheaf, derived from nothing but Itô's lemma and the Čech complex.

---

## The theorem itself

**Unhedgeability Theorem.** A risk factor is hedgeable with a finite portfolio of bilateral instruments (forwards, futures, vanilla swaps) if and only if its Čech cohomology class is trivial in $H^1(\Gamma, \mathcal{F})$.

A bilateral instrument covers one *edge* of the interaction diagram. A portfolio of any number of bilateral instruments still only covers edges — a subgraph of the 1-skeleton. The $H^1$ obstruction lives on the *triangles*, which no collection of edges can ever reach. This is why convexity risk, basis risk, smile/skew risk, and CDO correlation risk are not merely difficult to hedge in practice — they are topologically invisible to bilateral instruments, full stop.

| Risk type | Class | Instruments | Examples |
| --- | --- | --- | --- |
| Bilateral risk | $H^0$ | Forwards, swaps | Spot rates, DV01 |
| Triangular risk | $H^1$ | Options, swaptions, CDOs | Convexity, basis, smile |
| Systemic risk | $H^2$ | CCPs, central banks | Contagion, cascade |

This is not a regulatory classification or a market-completeness argument. It is a theorem about the Čech complex, and it holds for any sheaf on any interaction diagram.

---

## What the Origami ISA buys here — and what it does not

The Origami ISA opcodes (SPLIT, SPLAT, FLIP, FLOP, TWIST) have an exact identification with the Čech cohomology operations on the pricing sheaf: SPLIT is the coboundary map $\delta^0$, SPLAT is fibre integration back down to $H^0$, and the Pentagon identity $\delta^1\circ\delta^0=0$ is the no-arbitrage condition. This gives the theorem a clean, basis-independent, computational vocabulary.

It is worth being honest about what that vocabulary is doing in the worked example above, because the same opcode names carry much heavier computational weight elsewhere. In the spin-foam case — the non-abelian, representation-theoretic instance of the same machinery, where the $H^1$ obstruction is a genuine Wigner–Racah 6j symbol — SPLIT/SPLAT compose into circuits that *evaluate* 6j and 15j amplitudes that have no closed form otherwise (see the companion paper on spin foams as Origami, below). The financial gauge group here, $(\mathbb{R}_{>0},\times)$, is abelian, and the two-instrument HJM example above never needed group representation theory, Clebsch–Gordan coefficients, or recoupling combinatorics at any point.

In that example, SPLIT and SPLAT *classify* a quantity that Itô's lemma already derived — the convexity adjustment is computed by ordinary stochastic calculus first, and the cohomological language is applied afterward to obtain the Unhedgeability Theorem for free. That is a real result: a topological necessity statement that stochastic calculus alone does not hand you. But on a single triangle, it is not a new way of *computing* the convexity adjustment — the sheaf-cohomology language and the Itô-calculus language carry exactly the same information. Whether the same opcodes give a genuine computational advantage on a larger network — many counterparties, many overlapping triangular exposures, where locating the unhedgeable residual by composing local consistency checks edge by edge might beat re-deriving global consistency by hand — is an open question, taken up but not yet settled in the companion paper on systemic risk.

---

## The bridge to systemic risk

The same construction extends one level up: whether different institutions' $H^1$ risks are mutually consistent is itself an $H^2$ question, and $H^2 \neq 0$ is where shocks amplify into cascades rather than being absorbed. That is the subject of the companion paper below — this paper proves the $H^0$/$H^1$ theorem for a single institution's pricing sheaf; the $H^2$, system-wide story is a separate result with its own (separately scrutinised) claims.

---

## What to read next

- [Systemic Risk as $H^2$](https://doi.org/10.5281/zenodo.20642908) — *the companion paper: cohomological stress testing, the SIFI theorem, 2008 as an $H^2$ event*

- [The Topology of Risk: A Primer](https://doi.org/10.5281/zenodo.20642983) — *tutorial for practitioners with no prior topology: three-bank running example, $H^0$/$H^1$/$H^2$ from first principles*

- [Term Structure Bundles on the Pacioli Manifold](https://doi.org/10.5281/zenodo.20244445) — *interest rates as temporal connections; the discount factor sheaf in the gauge-theory language*

- [Spin Foams as Origami: Loop Quantum Gravity from the ISA Perspective](https://doi.org/10.5281/zenodo.20680634) — *the non-abelian instance of the same opcodes, where the $H^1$ obstruction really is the 6j symbol, and SPLIT/SPLAT do genuine computational work evaluating it*

- [The Origami ISA as Nature's Universal Computer](https://doi.org/10.5281/zenodo.20543454) — *the five opcodes across twenty orders of magnitude*

---

*For the full technical treatment, see [doi:10.5281/zenodo.20635479](https://doi.org/10.5281/zenodo.20635479).*
