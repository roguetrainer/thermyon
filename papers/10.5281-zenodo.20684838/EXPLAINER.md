---
layout: default
title: "Hodge Theory is the Smooth Limit of the Origami ISA"
parent: Explainers
nav_exclude: false
tags: [hodge-theory, origami-isa, tropical, information-geometry, fisher-metric, natural-gradient, spectral-gap, slam, trs, mge, harmonic-forms, framework]
portfolio: F|C
---

## The Smooth Version of the Eight-Algorithm Story

*Plain-language explainer for [doi:10.5281/zenodo.20684838](https://doi.org/10.5281/zenodo.20684838) (#417)*

*Note: this is a framework / perspective paper. The central identification is a definition whose value lies in unification; three conjectures are stated and supported but not yet proved.*

---

## The central idea in one sentence

The Hodge decomposition of differential forms on a smooth manifold is the continuous analogue of the Origami ISA opcode decomposition — and the TRS programme's "rotate in the Lie group instead of doing gradient descent" is the geometric content of following geodesics in the Fisher information metric on the algorithm's state space.

---

## The Hodge-ISA correspondence (a definition, not a theorem)

On any smooth Riemannian manifold, every differential form decomposes uniquely into three parts:

$$\omega = \underbrace{d\alpha}_{\text{exact}} + \underbrace{\delta\beta}_{\text{coexact}} + \underbrace{\gamma_{\mathrm{harm}}}_{\text{harmonic}}$$

This maps to the ISA opcodes:

| Smooth Hodge | Origami ISA opcode | What it does |
|---|---|---|
| Exterior derivative $d$ | SPLIT | Creates the exact part |
| Adjoint $\delta = d^*$ | SPLAT | Handles the coexact part |
| Green's operator $G = \Delta^{-1}\Pi^\perp$ | FLOP | Removes the harmonic $H^1$ residual |
| Hodge star $\star$ | FLIP | Duality between $k$-forms and $(n{-}k)$-forms |
| Gauge transformation | TWIST | Changes representative within a cohomology class |

The exact and coexact parts are handled for free by SPLIT and SPLAT. Only the **harmonic part** — which is $H^1$ — requires FLOP corrections. This is why $H^1 = 0$ is the performance condition of [Paper 415](https://doi.org/10.5281/zenodo.20684509).

**Important:** FLOP corresponds to the Green's operator (pseudo-inverse of the Hodge Laplacian $\Delta$), *not* to the coboundary $\delta^1$. The coboundary cannot kill harmonic classes; the Green's operator can.

---

## New design principle

**Project before correcting.** Apply SPLIT and SPLAT first to eliminate the exact and coexact components. Then FLOP only the harmonic residual. Applying FLOP to components that SPLIT/SPLAT could handle wastes correction steps.

---

## The information-geometric framing (a working hypothesis)

The Gibbs distribution $P_\beta(\text{state}) \propto e^{-\beta \|H^1(\text{state})\|}$ makes the algorithm's state space into a Riemannian manifold $M_P$ via the Fisher information metric. Natural gradient descent (Amari 1998) on this manifold — rather than ordinary gradient descent in Euclidean space — is the geometric version of "rotating in the Lie group" proposed by the TRS (Topological Resonance Synthesis) programme.

This is precise for symmetric cases (elastic hashing on $S^1$, SLAM on $\mathrm{SE}(3)$). For generic problems the isometry group of the Fisher metric may be trivial, so the Lie group interpretation is an approximation.

---

## Three conjectures (unproved)

**(1) Spectral gap conjecture:** The critical temperature $\beta^*(\rho)$ — below which the algorithm stays efficient — equals the inverse spectral gap of the Hodge Laplacian on $M_P$:

$$\beta^*(\rho) = \frac{1}{\lambda_1(M_P, \rho)}$$

For elastic hashing ($M_P = S^1$), a heuristic derivation connects this to Glauber dynamics mixing times and recovers the empirically observed formula $\beta^* = \frac{3}{8}\ln(1/(1-\rho))$. A rigorous proof is in progress (experiment x417a).

**(2) Complexity conjecture:** The number of FLOP corrections required by geodesic execution is bounded by $\dim H^1(M_P)$, computable from the Euler characteristic via Poincaré-Hopf. For max-flow this bounds the cycle rank of the graph — *not* the number of Ford-Fulkerson augmenting paths, which also depends on edge capacities.

**(3) Geodesic SLAM:** On-manifold pose updates on $\mathrm{SE}(3)$ (as in the invariant EKF literature) should outperform Euclidean composition. Note: $\mathrm{SE}(3)$ has no bi-invariant metric; the claim applies to left-invariant metrics. Rigorous convergence comparison is future work.

---

## The tropical connection

The MGE (Maslov-Gibbs Einsum) programme identified the tropical semiring $(\mathbb{R} \cup \{\infty\}, \min, +)$ as the right structure for discrete optimisation. This paper identifies what that means in Hodge-theoretic terms: the tropical limit ($\beta \to \infty$) of the Gibbs distribution selects the **harmonic representative** — the minimum-norm element of its $H^1$ cohomology class. The discrete algorithms of Paper 415 are the $\beta \to \infty$ (tropical) shadows of smooth Hodge flows.

---

## What to read next

- [H¹ = 0 is the Performance Condition](https://doi.org/10.5281/zenodo.20684509) (#415) — the discrete version; the eight algorithms and their sheaves
- [The Origami Calculus](https://doi.org/10.5281/zenodo.20474914) (#349) — the ISA foundations
- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) (#325) — where the β* formula first appeared

*For the full technical treatment, see [doi:10.5281/zenodo.20684838](https://doi.org/10.5281/zenodo.20684838)*
