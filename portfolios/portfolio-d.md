---
layout: default
title: "Portfolio D — Protocols"
parent: Portfolios
nav_order: 4
---

# Portfolio D — Protocols

**Primary audience:** Cryptographers, security engineers, quantum networking researchers

---

## ASA for Cryptographers

Portfolio D applies the non-associative geometry of the ASA to cryptographic protocol design. The central insight is that non-associativity — normally treated as an obstacle in algebra — is a *cryptographic resource*: a sequence of non-associative operations is order-dependent in a way that cannot be compressed or reordered without destroying the result.

### The Post-Quantum Opportunity

Standard public-key cryptography (RSA, ECC) relies on algebraic hardness over *associative* structures — integer multiplication, elliptic curve group addition. These are broken by Shor's algorithm on a sufficiently large quantum computer, because Shor exploits the Fourier analysis of abelian groups. The Magmoidal Cipher is immune to this attack: octonion multiplication forms a *magma*, not a group. There is no Fourier transform over a magma, and no quantum algorithm analogous to Shor's is known.

### The Magmoidal Cipher (Paper 208)

**Sequence-Dependent Cryptography** introduces the Magmoidal Cipher, grounded in the non-associativity of octonion multiplication. A secret is encoded as a sequence of Fano-line selections: because the octonion product $(e_{i_1} e_{i_2}) e_{i_3}$ depends irreducibly on the *order* of operations — not just the set $\{i_1, i_2, i_3\}$ — an adversary who intercepts the output but not the sequence has no algebraic shortcut to the key. The associator $\mathcal{A}(e_i, e_j, e_k) = (e_i e_j)e_k - e_i(e_j e_k)$ vanishes on Fano lines and equals $\pm 2$ elsewhere, giving a natural binary hard/easy distinction that the cipher exploits.

Three constructions are developed:

**Verifiable Delay Functions (VDFs).** A sequence of $n$ non-associative Fano multiplications takes exactly $n$ steps — there is no parallel shortcut because each step depends on the result of the previous one. This gives a cryptographic time-lock with a publicly verifiable proof of elapsed computation, immune to parallelisation even on quantum hardware.

**V31-QKD (Fano Quantum Key Distribution).** A quantum key distribution protocol using the 31 non-Fano triples of $\mathrm{PG}(2,2)$ as its alphabet. Eavesdropping disturbs the associator signature in a detectable way: any measurement collapsing a superposition of Fano/non-Fano states leaves a geometric fingerprint $\|\mathcal{A}\| \in \{0, 2\}$. For quantum networking engineers: V31-QKD is designed for integration with quantum repeater networks and is compatible with the $G_2$ fibre bundle structure of the Fibrational Tensor Codes (Paper 206, Portfolio C), suggesting a unified framework for quantum communication and quantum error correction over the same geometric substrate.

**Asymmetric Sequential Locks.** A public key is a Fano-compatible sequence (associator = 0 at every step); the private key is the full non-associative generating sequence. Verification is $O(n)$; forgery requires finding a sequence with the correct Fano shadow, which is conjectured hard (no polynomial-time algorithm is known classically or quantumly).

### Connections to Portfolio F

The Fano Monogamy Paradox (Paper 270, Portfolio F) provides a geometric security foundation for V31-QKD: it proves that an eavesdropper cannot be simultaneously Fano-entangled with both Alice and Bob without leaving a detectable associator signature, giving a no-cloning-style security proof grounded in octonion geometry rather than Hilbert space axioms.

---

## Papers

| # | Paper |
|---|-------|
| [208](../papers/10.5281-zenodo.19826357/) | Sequence-Dependent Cryptography (The Magmoidal Cipher): Verifiable Delay Functions, V31-QKD, and Asymmetric Sequential Locks via Non-Associative Fano-Geometry |

---

## Key Glossary Terms

[Fano Plane](../glossary/#fano-plane) · [Associator](../glossary/#associator) · [$G_2$](../glossary/#g_2) · [Division Algebra Ladder](../glossary/#division-algebra-ladder) · [Steane Code / QEC](../glossary/#steane-code--quantum-error-correction-qec)
