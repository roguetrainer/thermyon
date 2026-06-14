---
layout: default
title: "Hodge Theory is the Smooth Limit of the Origami ISA"
parent: Explainers
nav_exclude: false
tags: [hodge-theory, origami-isa, tropical, information-geometry, fisher-metric, parallel-transport, natural-gradient, spectral-gap, index-theorem, slam, trs, mge, harmonic-forms]
portfolio: F|C
---

## The Optimal Algorithm Follows a Geodesic

*Plain-language explainer for [doi:10.5281/zenodo.20684838](https://doi.org/10.5281/zenodo.20684838) (#417)*

---

## The central idea in one sentence

Every discrete algorithm in the class of Paper 415 is the tropical shadow of a smooth Hodge-theoretic problem on a Riemannian manifold, and the optimal algorithm is the one that follows geodesics in the **Fisher information metric** on its state space — which is exactly what the TRS programme called "rotating in the Lie group."

---

## The Hodge decomposition

On any smooth Riemannian manifold, every differential form decomposes uniquely into three parts:

$$\omega = \underbrace{d\alpha}_{\text{exact}} + \underbrace{\delta\beta}_{\text{coexact}} + \underbrace{\gamma_{\mathrm{harm}}}_{\text{harmonic}}$$

The exact part ($d\alpha$) and coexact part ($\delta\beta$) can be handled for free. The **harmonic part** $\gamma_{\mathrm{harm}}$ is the irreducible obstruction — it is $H^1$, the part that cannot be killed by any local operation.

**The Hodge-ISA correspondence:**

| Smooth Hodge | Origami ISA opcode |
|---|---|
| Exterior derivative $d$ | SPLIT (creates exact part) |
| Adjoint $\delta = d^*$ | SPLAT (kills coexact part) |
| Hodge Laplacian $\Delta = d\delta + \delta d$ | FLOP (kills harmonic $H^1$) |
| Hodge star $\star$ | FLIP (duality) |
| Gauge transformation | TWIST |

**New design principle from this:** *project before correcting* — apply SPLIT and SPLAT first to kill the exact and coexact components, then FLOP only the harmonic residual. This reduces the average FLOP count for elastic hashing from $O(\log^2 m)$ toward $O(\log m)$.

---

## Parallel transport = the optimal algorithm

The optimal algorithm in any domain does not move in straight lines (gradient descent). It moves along **geodesics** in the curved Riemannian manifold of the algorithm's state space, equipped with the Fisher information metric.

The Fisher metric on the family of Gibbs distributions $P_\beta(\text{state}) \propto e^{-\beta \|H^1(\text{state})\|}$ makes the algorithm's state space into a curved manifold. The **natural gradient** (Amari 1998) — gradient descent in this curved metric — converges at $O(1/T)$ rather than $O(1/\sqrt{T})$ for ordinary gradient descent.

This is the precise content of the TRS programme's proposal to "rotate in the Lie group rather than descend the gradient": the Lie group is the isometry group of the Fisher metric, and the rotation is parallel transport along the geodesic toward the harmonic representative of $H^1$.

---

## SLAM: screw motions beat matrix composition

Standard SLAM (robot localisation and mapping) updates the robot's pose by composing rigid body transformations: $T_{t+1} = T_t \cdot \Delta T$. This is **not geodesic** in $\mathrm{SE}(3)$ (the Lie group of rigid body motions).

The geodesics in $\mathrm{SE}(3)$ are **screw motions** — simultaneous rotation and translation along the rotation axis (Chasles' theorem). Replacing matrix composition with screw-motion geodesic updates gives:

- Standard EKF-SLAM: $O(1/\sqrt{T})$ convergence for pose error
- Geodesic SLAM: $O(1/T)$ convergence — a quadratic improvement

---

## The spectral gap theorem

The critical temperature $\beta^*(\rho)$ — below which $H^1$ stays bounded — equals the inverse spectral gap of the Hodge Laplacian on the algorithm manifold:

$$\beta^*(\rho) = \frac{1}{\lambda_1(M_P, \rho)}$$

For elastic hashing ($M_P = S^1$, the circle), this gives:

$$\beta^*(\rho) = \frac{3}{8} \ln\!\left(\frac{1}{1-\rho}\right)$$

proved from first principles via the spectral gap of the constrained occupancy manifold on $S^1$. This recovers the empirical formula of Paper 415 and connects it to the Lichnerowicz-Obata theorem: high curvature (near-full table, $\rho \to 1$) means the manifold curves strongly, so the spectral gap is small and $\beta^*$ is large — aggressive corrections are needed.

---

## The index theorem as complexity bound

The number of FLOP corrections required by the *optimal* algorithm equals:

$$N_\mathrm{FLOP}(P) = \dim H^1(M_P) = 1 - \chi(M_P)$$

where $\chi(M_P)$ is the Euler characteristic of the algorithm manifold — computable from topology **without running the algorithm**:

| Algorithm | Euler characteristic | FLOP complexity |
|---|---|---|
| Elastic hashing | $\chi(S^1) = 0$ | 1 (one firebreak type) |
| Max-flow (genus $g$) | $2 - 2g$ | $g$ augmenting paths |
| SLAM ($n$ loops) | $2 - 2n$ | $n$ loop closures |
| TDA ($b_1 = k$) | $\chi(M)$ | $k$ death events |

For SLAM with $n$ detected loops: exactly $n$ loop closures are both necessary and sufficient, regardless of trajectory length.

---

## What to read next

- [H¹ = 0 is the Performance Condition](https://doi.org/10.5281/zenodo.20684509) (#415) — the discrete version; the eight algorithms
- [The Origami Calculus](https://doi.org/10.5281/zenodo.20474914) (#349) — the ISA foundations
- [The Topological Heat Engine](https://doi.org/10.5281/zenodo.20400638) (#325) — where β* first appeared

*For the full technical treatment, see [doi:10.5281/zenodo.20684838](https://doi.org/10.5281/zenodo.20684838)*
