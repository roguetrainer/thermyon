---
layout: default
title: "EconIAC: A Differentiable Economics Engine"
parent: Explainers
nav_exclude: true
tags: [econiac, economics, gauge-theory, sheaf-cohomology, h0, h1, h2, pacioli, overview]
portfolio: G
---

## MONIAC for the 21st Century

*Plain-language explainer for [doi:10.5281/zenodo.20679006](https://doi.org/10.5281/zenodo.20679006) (#409)*

---

## The central idea in one sentence

EconIAC is to the economy what MONIAC was in 1949 — a working physical model that enforces conservation laws — except it runs on mathematics (gauge theory, sheaf cohomology, automatic differentiation) instead of hydraulics.

---

## What MONIAC was

In 1949, the economist Bill Phillips built MONIAC: a hydraulic computer modelling the British economy as tanks, pipes, and valves. Coloured water represented money flows. Conservation was enforced physically — what flowed in had to flow out. It correctly predicted macroeconomic dynamics.

EconIAC does the same with modern mathematics:
- **Conservation** is enforced by the Pacioli identity (double-entry accounting = gauge invariance)
- **Flows** are connections on the Pacioli manifold
- **Arbitrage** is curvature (non-zero holonomy)
- **Systemic risk** is sheaf cohomology ($H^0 / H^1 / H^2$)
- **Gradients** are computed by JAX automatic differentiation

---

## What this paper is

Paper 409 is the overview and reading guide for the entire EconIAC programme — 19 published economics papers, mapped and explained. It answers:
- What is EconIAC and why does the mathematics matter?
- Which paper should I read first for my specific interest?
- What does the code do and how do I install it?

Four reader tracks are provided: gauge theory foundations, cohomological risk, climate applications, and financial derivatives.

---

## The three mathematical foundations

| Foundation | What it does | Key paper |
|---|---|---|
| Gauge theory | Conservation, arbitrage as curvature, exchange rates as parallel transport | Paper 291 |
| Thermodynamics | Bounded rationality as Gibbs distribution; differentiable Shapley values | Paper 289 |
| Sheaf cohomology | H⁰/H¹/H² risk hierarchy; 2008 crisis as topological event | Paper 397 |

---

## What to read next

- [The Topology of Risk](https://doi.org/10.5281/zenodo.20642983) (#398) — the cohomological risk primer, no prerequisites
- [A Primer on Economic Gauge Theory](https://doi.org/10.5281/zenodo.20259505) (#301) — the gauge theory foundations

*For the full technical treatment, see [doi:10.5281/zenodo.20679006](https://doi.org/10.5281/zenodo.20679006)*
