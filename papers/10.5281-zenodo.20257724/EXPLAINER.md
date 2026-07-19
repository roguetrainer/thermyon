---
layout: default
title: "Valuation Adjustments as Curvature: XVA in Financial Gauge Theory"
parent: Explainers
nav_exclude: true
tags: [economics, gauge-theory, xva, cva, fva, sheaf-cohomology, triangular-risk, bilateral-risk, origami-isa]
portfolio: G|B
---

*Plain-language explainer for [doi:10.5281/zenodo.20257724](https://doi.org/10.5281/zenodo.20257724) (#299)*

## The central idea in one sentence

The XVA adjustments that banks make to derivative prices — CVA, DVA, FVA, KVA, MVA — are not ad hoc corrections but curvature components of the connection on the Pacioli manifold, and the condition that they do not double-count is the flatness condition of the combined connection.

## The XVA alphabet soup

Since the 2008 financial crisis, banks have introduced a bewildering array of valuation adjustments to the "clean" (risk-free) price of a derivative:

- **CVA** (Credit Valuation Adjustment): the cost of counterparty default risk — the possibility that the counterparty fails to pay when the trade is in-the-money.
- **DVA** (Debit Valuation Adjustment): the mirror image — the benefit from the possibility that you yourself default, reducing the value of your payment obligations.
- **FVA** (Funding Valuation Adjustment): the cost of funding the collateral posted on uncollateralised trades, or the benefit of receiving it.
- **KVA** (Capital Valuation Adjustment): the cost of holding regulatory capital against the trade's risk-weighted assets over its lifetime.
- **MVA** (Margin Valuation Adjustment): the cost of posting initial margin (IM) to a central counterparty or bilateral counterparty.

Together, these are **XVA** (the "X" stands for any of the above). XVA desks at major banks manage portfolios worth hundreds of millions of dollars. The adjustments interact: computing CVA requires knowing the funding cost (because collateral posting reduces credit exposure), and funding cost depends on capital requirements, which depend on CVA hedging activity.

The standard industry approach computes each XVA separately and adds them. This double-counts the interactions. The paper provides the correct treatment: XVA as the curvature of a single connection on the Pacioli manifold.

## Each adjustment is a curvature component

The Pacioli manifold, for a bilateral derivative trade, has three relevant directions:

- **Time** ($T$): the time axis, with discount connection $P(0,t)$.
- **Credit** ($C$): the counterparty's survival probability, with hazard rate connection $\lambda_C(t)$.
- **Funding** ($F$): the funding spread, with funding discount connection $B(0,t)$.

A combined connection $\mathcal{A}$ lives on the product of these three bundles: $(T, C, F)$-space. The curvature $\mathcal{F} = d\mathcal{A} + \mathcal{A} \wedge \mathcal{A}$ has components in each pair of directions:

$$\mathcal{F}_{TC} = \partial_T A_C - \partial_C A_T + [A_T, A_C] = \text{CVA density}$$
$$\mathcal{F}_{TD} = \partial_T A_D - \partial_D A_T + [A_T, A_D] = \text{DVA density}$$
$$\mathcal{F}_{TF} = \partial_T A_F - \partial_F A_T + [A_T, A_F] = \text{FVA density}$$
$$\mathcal{F}_{TK} = \partial_T A_K - \partial_K A_T + [A_T, A_K] = \text{KVA density}$$
$$\mathcal{F}_{TM} = \partial_T A_M - \partial_M A_T + [A_T, A_M] = \text{MVA density}$$

Each XVA adjustment is the integral of the corresponding curvature component over the trade's lifetime. The total XVA is the sum over all curvature components — a trace of the full curvature tensor integrated over the time direction.

## CVA as a Wilson loop integral

The Credit Valuation Adjustment for a derivative with expected exposure profile $\text{EE}(t)$ is:

$$\text{CVA} = (1 - R) \int_0^T \text{EE}(t) \cdot \lambda_C(t) \cdot S_C(t) \cdot P(0, t)\,dt,$$

where $R$ is the recovery rate, $\lambda_C(t)$ is the counterparty's hazard rate, $S_C(t) = e^{-\int_0^t \lambda_C(s)\,ds}$ is the survival probability, and $P(0,t)$ is the risk-free discount factor.

This is a **Wilson loop integral**: the integral of the curvature component $\mathcal{F}_{TC}$ over the surface bounded by the trade's lifetime in the $(T, C)$ plane, weighted by the expected exposure. The Wilson loop is gauge-invariant — it does not depend on how the gauge is chosen for $A_T$ or $A_C$ individually, only on the curvature that relates them.

This provides the geometric interpretation: CVA is not a model price; it is a topological quantity, the integral of a curvature form. Different models for the hazard rate curve $\lambda_C(t)$ correspond to different gauges for $A_C$, but the Wilson loop integral (CVA) is gauge-invariant and model-independent.

## The no-double-counting condition

The standard industry concern about XVA is double-counting: if the CVA desk hedges counterparty risk by buying CDS protection, the cost of that hedge shows up in the FVA calculation as a funding cost. Adding CVA and FVA separately double-counts this interaction.

In FGT, the no-double-counting condition is precisely the **flatness condition** on the combined connection $\mathcal{A}$: if $\mathcal{F} = 0$ on the full $(T, C, F, K, M)$-dimensional bundle, then the XVA adjustments sum without double-counting.

Flatness of the combined connection is the statement that all five adjustments are determined by the same underlying curvature tensor — they are components of a single object, not five independent objects to be summed. The double-counting problem arises from treating them as five independent numbers when they are really five components of one tensor.

The practical implication: XVA should be computed by first estimating the full connection $\mathcal{A}$ (the hazard rate, funding spread, capital charge, and margin curves), then computing $\mathcal{F}$, and then integrating $\mathcal{F}$ over each surface. This automatically avoids double-counting because the curvature components satisfy the Bianchi identity $d\mathcal{F} = 0$ — the integrability condition that ensures the components are consistent.

## FVA and path-dependence

Funding Valuation Adjustment is the most controversial XVA because it is explicitly **path-dependent**: the cost of funding a trade depends on how the trade was funded from initiation to maturity, not just on the final exposure.

In FGT, this is precisely the statement that the funding connection $A_F$ has non-zero curvature in the $(T, F)$ plane. The holonomy of $A_F$ around a closed loop — borrowing at time $t$ and repaying at time $T$ via two different funding routes — is non-trivial. This non-trivial holonomy is FVA.

The Modigliani-Miller theorem (1958) — that in perfect markets the financing decisions of a firm do not affect its value — is the statement that the funding connection is flat: $\mathcal{F}_{TF} = 0$, and hence FVA = 0. FVA is non-zero in practice because real markets are not perfect: balance-sheet constraints, collateral segregation, and regulatory capital requirements create non-zero curvature in the funding bundle.

## KVA and MVA as capital and margin curvature

KVA is the cost of regulatory capital over the trade's lifetime. Under Basel III/IV, the capital requirement for a derivative trade is proportional to its risk-weighted assets (RWA), which depend on the trade's exposure profile and the counterparty's credit rating. KVA is the present value of future capital charges:

$$\text{KVA} = r_K \cdot \int_0^T K(t) \cdot P(0, t)\,dt,$$

where $r_K$ is the cost of capital and $K(t)$ is the regulatory capital requirement at time $t$.

In FGT, $K(t)$ is determined by the curvature of the credit and market risk connections: regulatory capital is a function of exposure and credit quality, both of which are connection coefficients. KVA is therefore a second-order curvature effect — curvature of the capital connection induced by curvature in the credit and market connections.

MVA is the cost of posting initial margin. Under EMIR and UMR (Uncleared Margin Rules), bilateral trades above a notional threshold must exchange IM calculated using ISDA SIMM. SIMM is a sensitivity-based risk measure — it uses the Greeks of the derivative with respect to market risk factors. In FGT, SIMM is a curvature integral: it integrates the squared curvature of the market risk connections over the trade's risk factor exposure.

## The deeper reason: XVA as cohomology

This paper establishes that XVA adjustments are curvature of a connection on the Pacioli manifold. A subsequent paper ([Paper 399](https://doi.org/10.5281/zenodo.20645695)) shows the deeper reason *why* curvature is the right object: the SPLIT opcode of the Origami ISA is the Čech coboundary map, and XVA is the $H^1$ cohomology class of the credit/funding sheaf.

This reframes the gauge curvature picture as follows:

- **CVA, DVA, FVA, MVA** are triangular risk ($H^1$): they arise from the failure of bilateral credit/funding spreads to compose consistently around triangles of three counterparties. They are computable model-free from observable market prices of liquid triangular instruments — without any Gaussian copula.
- **Wrong-way risk** is systemic risk ($H^2$): it is the mutual inconsistency of the CVA, DVA, and FVA triangular risks in the XVA tetrahedron. It cannot be computed at the desk level regardless of model sophistication.
- **The Gaussian copula** — the industry standard since 2000 — is the $H^0$ approximation to the exact $H^1$ computation. This is why it systematically mispriced CDO tranches before 2008: it modelled an $H^1$ object as if it were $H^0$.

The flatness condition developed in this paper (the no-double-counting condition $\mathcal{F} = 0$) is the finance instance of the Pentagon identity $d^2 = 0$ that governs the full cohomological framework.

---

## What to read next

- [The Origami ISA as Financial Middleware](https://doi.org/10.5281/zenodo.20645695) — *SPLIT = coboundary map = model-free XVA; the Gaussian copula as $H^0$ approximation; Pentagon as runtime monitor.* **Read this next.**
- [The Unhedgeability Theorem](https://doi.org/10.5281/zenodo.20635479) — *CVA/FVA/MVA are triangular risk; wrong-way risk is systemic risk.*
- [Systemic Risk as $H^2$](https://doi.org/10.5281/zenodo.20642908) — *wrong-way risk as $H^2$; why desk-level models cannot compute it; the SIFI theorem.*
- [The Topology of Risk: A Primer](https://doi.org/10.5281/zenodo.20642983) — *plain-language introduction including the XVA classification table.*
- [Buckley (2026) — Credit Bundles](https://doi.org/10.5281/zenodo.20257596) — *survival probabilities as credit connections: the CVA geometry in detail.*
- [Buckley (2026) — Term Structure Bundles](https://doi.org/10.5281/zenodo.20244445) — *the risk-free time connection underlying all XVA calculations.*

*For the full technical treatment, see [doi:10.5281/zenodo.20257724](https://doi.org/10.5281/zenodo.20257724)*
