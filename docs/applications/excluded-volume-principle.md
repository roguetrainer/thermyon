---
layout: default
title: "The Pauli exclusion principle is a theorem"
parent: Applications
nav_order: 10
nav_exclude: true
description: "Fermion antisymmetry is not a postulate. It follows from a single geometric fact: non-isotropic pairs in a symplectic polar space cannot share an isotropic flat. This is the Excluded Volume Principle."
tags: [evp, pauli, exclusion, symplectic, fano, periodic-table, nuclear-shell, geometry, gpep, chladni, heusler]
portfolio: E
---

# The Pauli exclusion principle is a theorem
{: .no_toc }

*Fermion antisymmetry is not an axiom of quantum mechanics. It is a consequence
of a geometric fact about symplectic polar spaces: two states that are
non-isotropic with respect to each other cannot simultaneously occupy the same
isotropic flat. This is the Excluded Volume Principle — and the periodic table,
the nuclear shell model, and the stability of matter all follow from it.*
{: .fs-5 .fw-300 }

---

## The claim

**The Pauli Exclusion Principle (PEP) is a theorem, not a postulate.**

The standard textbook treatment introduces PEP as an empirical rule: no two
fermions can share the same quantum state. It is postulated, not derived. Spin
statistics is then separately postulated (spin-½ particles are antisymmetric
under exchange). These two postulates are independent in the standard treatment.

The ISA framework derives both from a single geometric fact.

**The Excluded Volume Principle (EVP):** In the symplectic polar space
$W(2n-1, 2)$ — the phase space of an $n$-qubit system over $\mathrm{GF}(2)$
— two states $u, v$ are called *isotropic* with respect to each other if
$\langle u, v \rangle = 0$ under the symplectic form. Two states that are
*non-isotropic* ($\langle u, v \rangle = 1$) cannot simultaneously occupy
the same isotropic flat (maximal isotropic subspace). This is not a rule
imposed on the geometry — it is a theorem about the structure of $W(2n-1, 2)$.

**The Geometric Pauli Exclusion Principle (GPEP):** The nodal surfaces of
electron orbitals in 3D — the $s$, $p$, $d$, $f$ orbital shapes that Heusler's
haptic models make tangible — are the isotropic submanifolds of the symplectic
structure on the hydrogen-atom configuration space. Two electrons cannot
simultaneously occupy the same nodal-surface configuration because:

1. Different $(n, \ell, m)$ states are non-isotropic with respect to each other.
2. Non-isotropic pairs are excluded from the same isotropic flat by the EVP.
3. Therefore no two electrons with the same $(n, \ell, m, \mathrm{spin})$ can
   coexist — which is exactly the PEP.

The GPEP is not a separate principle from the EVP. It is the EVP instantiated
in spherical geometry, with the symplectic structure on $S^2$ replacing the
abstract $W(2n-1,2)$ structure. One principle, two languages.

---

## Why this matters

**It unifies what was disjointed.** Quantum chemistry has accumulated a
collection of empirical rules — PEP, Hund's rules, the Aufbau principle,
Taube's electron-transfer rules, the Woodward-Hoffmann orbital symmetry rules
— that are taught as separate facts, sometimes with partial justifications but
never from a single foundation. The EVP provides that foundation:

| Rule | EVP derivation |
| --- | --- |
| Pauli exclusion | Non-isotropic pairs excluded from same isotropic flat (EVP directly) |
| Hund's rule (max spin) | Maximum-spin state = maximum number of non-isotropic pairs = largest ORBIT; always preferred by EVP |
| Aufbau principle | Fill isotropic flats from lowest to highest action integral $\varphi_\ell$; ORBIT closure at each shell |
| Woodward-Hoffmann | Thermal/photochemical allowed = parity of ORBIT count across HOMO/LUMO crossing; EVP on the reaction ORBIT |
| Taube electron transfer | Inner-sphere (direct ORBIT overlap) vs outer-sphere (TWIST without ORBIT contact) |
| 4s before 3d anomaly | $\varphi_{4,0} < \varphi_{3,2}$: zero-TWIST-cost s-orbital outcompetes TWIST-penalised d-orbital |

None of these is ad hoc once the EVP is the foundation. They are all statements
about ORBIT closure and isotropic flat occupation in $W(2n-1, 2)$.

**It explains the shape of the periodic table.** The block structure of the
periodic table — s-block (2 elements/period), p-block (6), d-block (10),
f-block (14) — is the count of non-isotropic pairs in the relevant symplectic
space at each $H^k$ level:

| Block | $\ell$ | Orbitals | States | $H^k$ tier | Symplectic dimension |
| --- | --- | --- | --- | --- | --- |
| s | 0 | 1 | 2 | $H^0$ (ORBIT only) | $W(1,2)$ |
| p | 1 | 3 | 6 | $H^1$ (TWIST) | $W(3,2)$ |
| d | 2 | 5 | 10 | $H^1$ (TWIST, higher) | $W(5,2)$ |
| f | 3 | 7 | 14 | $H^2$ (BIND / Fano) | $W(7,2) \supset \mathrm{PG}(2,2)$ |

The f-block has exactly 14 states because $W(7,2)$ contains the Fano plane
$\mathrm{PG}(2,2)$ as its maximal isotropic substructure, and the 7 f-orbitals
$(m = -3, \ldots, +3)$ are the 7 points of the Fano plane as the 7-dimensional
irreducible representation of $G_2$. The f-block is the Fano sector of the
periodic table.

**It unifies atomic and nuclear shell models.** Heusler demonstrates that the
same nodal-surface counting that gives atomic quantum numbers $(n, \ell, m)$
also gives the nuclear shell quantum numbers. The ISA explanation: both atoms
and nuclei are ORBIT-counting problems in the same $W(2n-1,2)$ symplectic
space; only the action integrals $\varphi_\ell$ differ (Coulomb potential
for atoms, Woods-Saxon for nuclei). The nuclear magic numbers
$(2, 8, 20, 28, 50, 82, 126)$ are the ORBIT closure points for nucleons,
shifted relative to atomic magic numbers $(2, 10, 18, 36, \ldots)$ by the
spin-orbit TWIST term $\ell \cdot s$, which costs a Berry phase that rearranges
the $\varphi_\ell$ ordering above the $\ell = 2$ shell.

---

## The evidence

| Paper | What it shows |
| --- | --- |
| [Paper 375](../papers/) | EVP = PEP: formal theorem; Jordan-Wigner as explicit construction of the EVP isomorphism; fermion antisymmetry as consequence of symplectic non-isotropy |
| [Paper 487](https://doi.org/10.5281/zenodo.21219722) | Valence as orbit occupancy: Aufbau, Hund, Taube as ISA theorems (72/73 = 98.6% on benchmark) |
| [Paper 488](https://doi.org/10.5281/zenodo.21219720) | G-walk Chemistry: d-electron orbit occupancy predicts spin state; 90% accuracy without DFT |
| [Paper 490](https://doi.org/10.5281/zenodo.21219724) | Galois Protein Design: metal-site orbit structure determines enzymatic selectivity |
| [Paper 491](https://doi.org/10.5281/zenodo.21224113) | Galois Chemistry = Tropical DFT: spin-state crossing = tropical singularity; derivative discontinuity = TWIST opcode |
| x344 | Geometric PEP verified computationally: non-isotropic pairs in $W(5,2)$ correctly reproduce PEP for 3-qubit states |

**Key insight from Heusler (IOP 2018):** The 3D-printed nodal-surface models
demonstrate that quantum numbers are purely *topological* — they are homotopy
invariants of the nodal surface, not properties of the wave-function amplitude.
This is the GPEP: the topology of the nodal surface (number of open vs closed
nodal planes) determines the orbit label, and the EVP determines which
combinations are allowed. Heusler's models are physical GPEP demonstrators,
though he does not use that language.

---

## The connection to Paper 551 (adelic atom)

The Sommerfeld action integrals $\varphi_\ell = 2\pi(\ell + \tfrac{3}{4})$
in the Thomas-Fermi atom are the action integrals of the *isotropic orbits*
in the TF phase space. The $\tfrac{3}{4}$ Maslov correction is the Berry phase
(TWIST at $H^1$) accumulated when an isotropic orbit completes one cycle in the
symplectic structure. The FS8 aperiodicity condition — that $|\varphi_\ell''|
\ge c_0 > 0$ for all $\ell$ — is the statement that no two isotropic orbits are
degenerate: the EVP applied to the continuous TF phase space. The adelic
extension (Conjecture 1 of Paper 551) is the EVP extended $p$-adically: no two
adelic isotropic orbits are degenerate at any prime. The Riemann Hypothesis
(conditional on the spectral correspondence of Paper 551, Problem 2) is thus
the adelic EVP for the TF atom.

---

## What would falsify it

- **PEP violated without EVP violated**: a fermion system found to violate
  the Pauli exclusion principle but whose configuration space geometry satisfies
  the symplectic non-isotropy condition. This would separate PEP from EVP.

- **A classification of quantum numbers not derivable from nodal topology**: an
  observable quantum system whose states cannot be labelled by isotropic flat
  dimension in any symplectic space of reasonable dimension — which would mean
  the GPEP is not universal.

- **Hund's rule exceptions not explained by ORBIT cost**: there are known
  exceptions to Hund's rule (e.g. Cr, Cu anomalous configurations). If these
  cannot be explained by modified $\varphi_\ell$ ordering (TWIST cost
  reordering the isotropic flats) but require genuinely new principles, the EVP
  derivation is incomplete.

---

## Open questions

- **Bosons and the EVP:** bosons violate PEP (they prefer the same state, not
  exclude it). In the EVP picture, bosons are *isotropic* pairs — they
  can share an isotropic flat. Is there a unified EVP treatment of both bosons
  (isotropic, bunching) and fermions (non-isotropic, exclusion) as the two
  sectors of the same symplectic geometry?

- **Fractional statistics (anyons):** anyons in 2+1 dimensions have statistics
  intermediate between bosons and fermions. Is there a corresponding
  "fractional isotropy" in a symplectic space over $\mathrm{GF}(p)$ for $p > 2$?
  The Fano plane is $\mathrm{PG}(2,2)$ — over $\mathrm{GF}(2)$; the analogue
  over $\mathrm{GF}(3)$ or $\mathrm{GF}(p)$ might encode anyonic statistics.

- **Why $\mathrm{GF}(2)$?** The EVP uses the symplectic space over $\mathrm{GF}(2)$,
  the simplest finite field. Is there a derivation from first principles — from
  the binary nature of spin, or from the two-element structure of measurement
  outcomes — that singles out $\mathrm{GF}(2)$?

---

*See also:*
[The Fano crystal is universal](fano-crystal.md) ·
[Every molecule runs a Galois programme](galois-chemistry.md) ·
[Paper 375 — The EVP = PEP Theorem](../papers/) ·
[Paper 487 — Valence as Orbit Occupancy](https://doi.org/10.5281/zenodo.21219722)
