---
layout: default
title: "Portfolio F — Quantum Foundations"
parent: Portfolios
nav_order: 6
---

# Portfolio F — Quantum Foundations

**Primary audience:** Quantum information theorists, quantum foundations researchers, quantum logicians

---

## ASA for Quantum Information Theorists

Portfolio F is the quantum foundations portfolio: it asks what the non-associativity of the octonions implies for the logical and causal structure of quantum mechanics itself. These papers are not about building a quantum computer — they are about what quantum mechanics *is*, and whether the Fano geometry reveals something fundamental about the structure of physical reality.

The three papers in this portfolio each take a well-known quantum paradox and show that it admits a precise, quantitative reformulation as a statement about the octonion associator. In each case, the paradox is not merely *illustrated* by the geometry — the geometry provides the *proof structure*.

---

### The Spacelike Associator Paradox (Paper 268)

Standard quantum mechanics imposes a strict rule: spacelike-separated measurements must commute. The no-signalling theorem follows from this. But what does non-associativity imply for spacelike separation?

Paper 268 constructs a scenario with three sequential quantum channels $\mathcal{E}_1, \mathcal{E}_2, \mathcal{E}_3$ where the composition $(\mathcal{E}_1 \circ \mathcal{E}_2) \circ \mathcal{E}_3 \neq \mathcal{E}_1 \circ (\mathcal{E}_2 \circ \mathcal{E}_3)$ — a non-associative channel composition — and shows that this forces a *causal firewall*: the measurement back-action from $\mathcal{E}_2$ cannot be localised to a single spacetime region. The associator $\mathcal{A}(\mathcal{E}_1, \mathcal{E}_2, \mathcal{E}_3)$ is a quantitative measure of the causal ambiguity. The paper argues that the $G_2$ vacuum — the set of channel triples with $\mathcal{A} = 0$ — is the set of causally well-defined quantum processes, and that departures from the $G_2$ vacuum correspond to physically impossible or acausal operations.

---

### Hardy's Paradox and the Fano Associator (Paper 269)

Hardy's paradox (1992) is a proof of quantum contextuality without inequalities: a simple thought experiment with two particles and four measurements that produces a logical contradiction if you assume the measurement outcomes have definite pre-existing values. Hardy's paradox is stronger than Bell's theorem in the sense that it requires no statistical averaging — a single run of the experiment is sufficient to produce the contradiction.

Paper 269 shows that Hardy's paradox is exactly equivalent to a Fano non-associativity condition. Specifically: the four Hardy measurements can be labelled by four of the seven Fano points, and the logical contradiction in Hardy's argument corresponds precisely to the non-vanishing of the associator on the triple $\{e_i, e_j, e_k\}$ where $\{i, j, k\}$ is a non-Fano triple. The Fano-compatible measurement triples (associator = 0) are exactly the ones that admit a local hidden variable model; the non-Fano triples are exactly those that do not. Hardy's paradox is, in this sense, a measurement of the $G_2$ vacuum structure of nature.

---

### The Fano Monogamy Paradox (Paper 270)

Quantum entanglement is *monogamous*: if particles $A$ and $B$ are maximally entangled, then neither can be entangled with a third particle $C$. This monogamy of entanglement is a fundamental constraint with direct applications to quantum key distribution (eavesdroppers cannot be entangled with both Alice's and Bob's systems).

Paper 270 shows that entanglement monogamy is a consequence of the Fano exclusion principle: a Fano-compatible triple $\{e_i, e_j, e_k\}$ satisfies $\mathcal{A} = 0$, which means the three-body correlator factorises — the tripartite state is not irreducibly three-way entangled. A non-Fano triple has $\|\mathcal{A}\| = 2$, which implies a *non-factorisable* three-body correlation — the **Fano Monogamy Paradox**: three systems that are pairwise maximally entangled in non-Fano configurations produce an irreducible three-body entanglement that violates standard bipartite monogamy bounds. The Fano plane is, on this view, the geometric enforcer of quantum monogamy.

---

### Connections to the rest of the ASA

These three paradoxes are not isolated curiosities. They connect directly to:

- **Portfolio C (QEC):** The Steane $[[7,1,3]]$ code's stabilisers are Fano lines. The Spacelike Associator Paradox implies that any QEC code built from non-Fano stabilisers will have a causal ambiguity in its error correction procedure — a new constraint on code design.
- **Portfolio D (Cryptography):** The Fano Monogamy Paradox provides a geometric security proof for V31-QKD (Paper 208): eavesdroppers cannot form a non-Fano triple with both Alice and Bob without leaving an associator signature.
- **Portfolio A (MGE/TRS):** The causal firewall of the Spacelike Associator Paradox is the quantum-mechanical analogue of the BCH obstruction (non-associative channel composition cannot be aggregated). The MGE resolves this in the classical-computational setting; a quantum version of the MGE is an open problem.

---

## Papers

| # | Paper |
|---|-------|
| [268](../papers/10.5281-zenodo.20058013/) | The Spacelike Associator Paradox: Sequential Quantum Channels, Non-Associative Measurement Back-Action, and the Causal Firewall of the $G_2$ Vacuum |
| [269](../papers/10.5281-zenodo.20058083/) | Hardy's Paradox and the Fano Associator: A Geometric Diagnosis of Quantum Contextuality |
| [270](../papers/10.5281-zenodo.20058092/) | The Fano Monogamy Paradox: Irreducible Three-Body Entanglement and the Tripartite Hardy Impossible Event |

---

## Key Glossary Terms

[Associator](../glossary/#associator) · [Fano Plane](../glossary/#fano-plane) · [$G_2$](../glossary/#g_2) · [Steane Code / QEC](../glossary/#steane-code--quantum-error-correction-qec) · [BCH Obstruction](../glossary/#bch-obstruction)
