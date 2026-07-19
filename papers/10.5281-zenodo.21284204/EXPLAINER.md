---
layout: default
title: "Your factor model is 66° wrong"
parent: Explainers
nav_exclude: true
tags: [finance, grassmannian, factor-models, systematic-risk, cointegration, model-risk, 2008-crisis, gaussian-copula, h-k-ladder, trs-framework, economics]
portfolio: B
---

## Your factor model is 66° wrong

*Plain-language explainer for [doi:10.5281/zenodo.21284204](https://doi.org/10.5281/zenodo.21284204) (#580)*

---

## The central observation

Every $k$-factor risk model — CAPM, Fama-French, Barra, APT — picks $k$ directions in the space of asset returns and says: "these are the systematic risks." The $k$ directions span a $k$-dimensional subspace of the $n$-dimensional return space.

The space of all possible $k$-dimensional subspaces of $\mathbb{R}^n$ is the **Grassmannian** $\mathrm{Gr}(k, n)$. Every factor model is a **point** on this manifold.

The Grassmannian has a natural metric — the **Fubini-Study distance** — that measures the angle between two subspaces. Two factor models define two points on $\mathrm{Gr}(k, n)$, and the Fubini-Study distance between them is a computable, basis-independent number between 0° and 90°:

- **0°**: the two models identify identical systematic risks
- **90°**: the models are orthogonal — they share no systematic risk exposure at all

This gives something the financial industry has never had: **a metric for model risk**.

---

## What the Grassmannian angle measures

Given two loading matrices $B_1, B_2$ (each $n \times k$, orthonormal columns), the Fubini-Study distance is:

$$
d_\mathrm{FS}(V, W) = \arccos\!\bigl(\sigma_{\max}(B_1^T B_2)\bigr)
$$

where $\sigma_{\max}$ is the largest singular value of the $k \times k$ inner product matrix. This is the **leading principal angle** — the smallest angle between any unit vector in $V$ and any unit vector in $W$.

This number is:
- **Computable**: one SVD, available in any linear algebra library
- **Basis-independent**: rotating either loading matrix doesn't change it
- **Interpretable**: it is literally an angle between risk directions

The model risk of using model $B$ instead of the truth is $d_\mathrm{FS}(p_B, p_\mathrm{true})$. If your model is 45° away from reality, you are capturing at most $\cos^2(45°) = 50\%$ of the systematic variance in the direction of largest overlap.

---

## The 2008 diagnosis: 66°

The Gaussian copula (Li 2000) was the dominant pricing model for CDOs before 2008. It parametrises joint default risk with a single correlation parameter — a **rank-1 model**, corresponding to a point in $\mathrm{Gr}(1, n)$.

The actual 2008 crisis covariance structure required at minimum **three** independent systematic factors:
1. A **market factor** (broad equity decline)
2. A **funding factor** (interbank liquidity stress)
3. A **credit factor** (structured-product spread widening)

The paper computes the Fubini-Study distance from the Gaussian copula's rank-1 subspace to the nearest rank-3 approximation of the crisis covariance:

$$
d_\mathrm{FS}(p_\mathrm{copula},\; p_\mathrm{true}^{(k=3)}) \approx 66°
$$

66°. The model used by the entire industry was modelling a risk direction more than halfway to **orthogonal** from reality. No institution or regulator computed this number before the crisis. This paper argues they should compute it every quarter.

---

## Three applications

### 1. The factor zoo

There are over 400 proposed risk factors in the academic literature (Hou-Xue-Zhang 2020). The Grassmannian gives a principled deduplication: cluster all proposed factors on $\mathrm{Gr}(1, n)$ using $d_\mathrm{FS}$ as the distance metric. Factors within $\theta < 15°$ of each other are effectively the same risk direction; the number of genuinely distinct clusters is the true factor count.

Experiment x580a finds 7–12 genuine clusters in US equity factors — consistent with theory (Kozak-Nagel-Santosh 2020), and far fewer than the 400+ named factors suggest.

### 2. Cointegration as Grassmannian geometry

A vector error-correction model (VECM) has a cointegrating matrix $\beta$ whose column space $p_\beta \in \mathrm{Gr}(k, n)$ is the long-run attractor of $n$ integrated time series. A **structural break** — a currency peg breaking, a basis trade unwinding — is a discontinuous jump of $p_\beta$ on the Grassmannian.

The paper defines a **Grassmannian snap test**: flag a structural break when

$$d_\mathrm{FS}(p_\beta(t),\; p_\beta(t-1)) > \theta^*$$

where $\theta^*$ is calibrated from the null distribution. Experiment x580b validates this against four known breaks: Lehman 2008, European sovereign 2011, CHF de-pegging 2015, UK gilt crisis 2022. The snap test correctly identifies all four.

The Johansen cointegration test is, in this language, an estimator of $\cos^2(d_\mathrm{FS})$ — the Grassmannian restatement makes its geometric meaning explicit.

### 3. Subspace velocity as a leading crisis indicator

Define the **subspace velocity**:

$$\theta_G(t) = d_\mathrm{FS}(p_t,\; p_{t-1})$$

This is the speed at which the factor structure is rotating on $\mathrm{Gr}(k, n)$, estimated from rolling PCA in successive windows. High $\theta_G$ signals that the dominant risk directions are changing rapidly.

Experiment x580c (S&P 500 sector returns 2004–2010) finds that $\theta_G(t)$ begins rising in **2007 Q3** — four quarters before the Lehman collapse — and peaks in 2008 Q4. VIX and credit spreads give no comparable advance signal. The covariance structure rotates before it snaps; $\theta_G$ measures the rotation.

---

## The H^k hierarchy in finance

The paper connects the Grassmannian geometry to the ISA opcode hierarchy:

| ISA tier | Opcode | Finance meaning | Grassmannian object |
| --- | --- | --- | --- |
| H⁰ | ORBIT | Stable factor structure; regime | Fixed point $p \in \mathrm{Gr}(k,n)$ |
| H¹ | TWIST | Factor rotation; model risk accumulates | Path $\gamma$ on $\mathrm{Gr}(k,n)$ |
| H² | BIND | Systemic snap; no smooth recovery | Holonomy of loop; $\theta_G \to 90°$ |

The 2008 crisis is an H² event: the factor subspace jumped discontinuously to near-orthogonal, and no smooth deformation connected the pre-crisis and crisis factor structures. The 66° distance is the metric complement to the topological obstruction identified in [#397](https://doi.org/10.5281/zenodo.20657009).

The same three tiers describe molecular bonding ([#570](https://doi.org/10.5281/zenodo.21277821)), quantum error correction ([#577](https://doi.org/10.5281/zenodo.21284199)), and nuclear structure ([#575](https://doi.org/10.5281/zenodo.21279217)). Finance joins the same geometric family.

---

## Practical implications

**For portfolio managers**: compute $\theta_G(t)$ alongside VaR and tracking error. A sustained increase warns that your factor model is drifting from reality before the crisis hits.

**For risk managers**: model risk capital should scale with $d_\mathrm{FS}(p_\mathrm{model}, p_\mathrm{estimated})$. A model 10° from the estimated true subspace needs less capital than one 45° away.

**For regulators**: if twenty systemically important institutions all have factor subspaces within 10° of each other, a shock to that shared direction is a systemic event. Grassmannian overlap across SIFIs is a natural stress test input.

---

## What this paper does not claim

The 66° diagnosis assumes a three-factor true structure for the 2008 crisis. If the true number of crisis factors was higher than three, the actual distance was larger — the estimate is a lower bound. The subspace velocity $\theta_G(t)$ as a leading indicator is validated on one crisis episode (2004–2010); whether it leads reliably across different crisis types is an open empirical question requiring longer data.

---

*See also:*

- [Universal Chemical Bonding](https://doi.org/10.5281/zenodo.21277821) (#570) — $\theta_G$ as the chemistry analogue of subspace velocity
- [QEC as Grassmannian Parallel Transport](https://doi.org/10.5281/zenodo.21284199) (#577) — the same Fubini-Study metric in quantum error correction
- [Systemic Risk and H² Obstructions](https://doi.org/10.5281/zenodo.20657009) (#397) — the topological precursor to this paper

*For the full technical treatment, see [doi:10.5281/zenodo.21284204](https://doi.org/10.5281/zenodo.21284204)*
