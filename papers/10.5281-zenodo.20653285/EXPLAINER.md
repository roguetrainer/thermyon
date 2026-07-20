---
layout: default
title: "Tipping Points Are Topological"
parent: Explainers
nav_exclude: true
tags: [climate, tipping-points, sheaf-cohomology, social-cost-carbon, h1, econiac, economics]
portfolio: G
---

## Why the Social Cost of Carbon is Six Times Higher Than We Think

*Plain-language explainer for [doi:10.5281/zenodo.20653285](https://doi.org/10.5281/zenodo.20653285) (#403)*

---

## The central idea in one sentence

Standard climate economics treats each tipping element (Arctic ice, Amazon rainforest, West Antarctic ice sheet, …) independently; this paper proves that once you account for the triangular interactions between them, the social cost of carbon jumps from ~$51/tonne to ~$316/tonne.

---

## The problem with "bilateral" climate models

Current integrated assessment models (IAMs) compute the damage from climate change by asking: how much does each tipping element cost if it tips? They add up the answers. This is the $H^0$ (bilateral) approach.

But tipping elements interact. The Amazon tipping makes Sahel droughts more likely. Arctic ice loss accelerates Greenland melting. West Antarctic ice and permafrost feedbacks are coupled. The $H^1$ (triangular) approach asks: can the bilateral damages be assembled into a globally consistent picture, or do the triangular interactions create irresolvable contradictions?

---

## The mathematical finding

The paper applies sheaf cohomology — a tool for asking whether locally consistent data can be assembled globally — to the network of climate tipping elements.

The $H^1$ signal turns positive at $T^* \approx 1.8°C$ of warming — between the Paris Agreement targets of 1.5°C and 2.0°C. At this temperature, the triangular couplings between tipping elements become load-bearing: you cannot price the risks bilaterally and get a consistent answer. The correction factor is approximately $6\times$:

| Approach | Social cost of carbon |
|---|---|
| Bilateral ($H^0$, standard IAMs) | ~$51/tonne |
| $H^1$-corrected (triangular interactions) | ~$316/tonne |

---

## Why this matters for policy

The Paris Agreement targets were set without accounting for $H^1$ effects. The analysis suggests 1.5°C is closer to the true topological tipping threshold than policymakers may realise — and that the economic case for aggressive mitigation is much stronger than bilateral models indicate.

---

## What to read next

- [The Topology of Risk](https://doi.org/10.5281/zenodo.20642983) (#398) — the primer on H⁰/H¹/H² without prerequisites
- [Systemic Risk as H²](https://doi.org/10.5281/zenodo.20642908) (#397) — the financial crisis as the same mathematics

*For the full technical treatment, see [doi:10.5281/zenodo.20653285](https://doi.org/10.5281/zenodo.20653285)*
