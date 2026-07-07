---
layout: default
title: "Nuclear reactions are orbit programmes"
parent: Explainers
nav_exclude: false
tags: [nuclear-physics, shell-model, magic-numbers, cno-cycle, r-process, tropical-geometry, origami-isa, g-walk, nucleosynthesis, kilonova, gw170817, trs-framework]
portfolio: A
---

## Nuclear reactions are orbit programmes

*Plain-language explainer for [doi:10.5281/zenodo.21249152](https://doi.org/10.5281/zenodo.21249152) (#548)*

---

## The central idea in one sentence

Every elementary nuclear reaction — fusion, fission, beta-decay, capture, isomerism — is one of five ISA opcodes acting on a nucleon orbit-occupancy register, and the three most important structural facts in nuclear astrophysics (magic numbers, the CNO bottleneck, r-process abundance peaks) follow from orbit-occupancy bookkeeping alone, with zero free parameters.

---

## What the standard picture gives you

The nuclear shell model (Mayer and Jensen, 1949) organises nucleons into single-particle energy levels split by spin-orbit coupling. Fill the levels from the bottom up; wherever there is a large gap, the nucleus is especially stable. The nucleon numbers at those gaps are the *magic numbers* 2, 8, 20, 28, 50, 82, 126 — explaining why ${}^{4}$He, ${}^{16}$O, ${}^{40}$Ca, ${}^{208}$Pb are unusually stable, why they are especially abundant in the universe, and why the r-process pauses at them during neutron-star mergers.

The shell model needs two fitted parameters (the spin-orbit coupling constants) to get the level ordering right. It does not by itself explain *why* those particular numbers are magic — it reads them off a fitted level diagram. Lattice QCD, the only systematic first-principles approach to nuclear structure, cannot currently predict magic numbers at all.

---

## The orbit-occupancy description

Represent the state of a nucleus as an *orbit-occupancy vector* $\mathbf{v} = (\nu_1, \nu_2, \ldots, \nu_k)$, where $\nu_i$ is the number of nucleons in the $i$-th shell-model level. Elementary nuclear reactions become ISA opcodes on $\mathbf{v}$:

| Opcode | Nuclear reaction | Example |
|--------|-----------------|---------|
| FLIP   | Neutron/proton capture | $(Z,N) + n \to (Z, N{+}1) + \gamma$ |
| FLOP   | Beta-decay | ${}^{13}$N $\to$ ${}^{13}$C $+ e^+ + \nu_e$ |
| SPLAT  | Fusion | ${}^2$H $+$ ${}^3$H $\to$ ${}^4$He $+ n$ |
| SPLIT  | Fission / alpha-emission | ${}^{235}$U $+ n \to {}^{141}$Ba $+ {}^{92}$Kr $+ 3n$ |
| TWIST  | Nuclear isomerism | ${}^{99m}$Tc $\to$ ${}^{99}$Tc $+ \gamma$ |
| ORBIT  | Closed reaction cycle | CNO cycle; pp-chain |

A nuclear reaction sequence is an ISA programme. The CNO cycle that powers the Sun is: SPLAT, FLOP, SPLAT, SPLAT, FLOP, SPLAT·SPLIT — a six-opcode ORBIT programme that regenerates ${}^{12}$C and releases net energy.

---

## Why magic numbers are tropical vertices

In the Maslov–Gibbs Einsum framework, the Gibbs distribution $\pi_k(\beta) = e^{-\beta E_k}/Z(\beta)$ at $\beta \to \infty$ (zero temperature) concentrates entirely on the ground state. For an orbit-occupancy register, the ground state is the configuration where every level up to the lowest large gap is filled — an orbit-complete configuration at a large energy gap. That is precisely the definition of a magic number.

The magic numbers are therefore *tropical vertices* of the orbit-occupancy register: the configurations that minimise the free energy in the $\beta \to \infty$ limit. No fitted parameters — just the gap structure, which follows from the Pauli exclusion principle and the ordering of single-particle levels.

All seven magic numbers (2, 8, 20, 28, 50, 82, 126) are correctly identified this way (experiment x548a, 7/7).

---

## The CNO bottleneck from the log-rate criterion

The CNO cycle has six steps. Four are proton-capture (SPLAT) reactions with different S-factors $S_0$ (nuclear matrix elements at stellar energies) and Coulomb barriers. The rate of each step is:

$$\log \langle \sigma v \rangle \propto \log S_0 - 3\left(\frac{E_G}{4(kT)^2}\right)^{1/3}$$

where $E_G = (\pi \alpha Z_1 Z_2)^2 \cdot 2\mu c^2$ is the Gamow energy. The bottleneck step is whichever SPLAT has the smallest log-rate.

The ${}^{14}$N$(p,\gamma){}^{15}$O step (Step 4) has $Z_2 = 7$ rather than $Z_2 = 6$, giving a Gamow exponent about 45 units more negative than the other steps. This Coulomb suppression — invisible if you only compare S-factors — makes Step 4 the bottleneck by a factor of $\sim 10^3$. The orbit-occupancy description identifies this correctly (experiment x548b) without any nuclear structure calculation, using only $Z$, $A$, and the measured S-factor.

---

## r-process peaks as tropical fixed points

The rapid neutron-capture process (r-process) builds heavy elements in neutron star mergers by repeated FLIP (neutron capture) followed by FLOP (beta-decay). At magic neutron numbers $N = 50, 82, 126$, the next FLIP requires opening a new shell — a large energy gap — so neutron-capture cross-sections drop by $10$–$10^3\times$. Material piles up at the magic-$N$ waiting point until FLOP can proceed.

The pile-up produces the observed r-process abundance peaks at $A \approx 80, 130, 195$. In the MGE framework, the peak *location* is a tropical fixed point of the FLIP/FLOP dynamics — determined entirely by orbit-occupancy, zero parameters. The peak *width* is set by the inverse temperature $\beta$ at r-process conditions.

Predictions: $N=50 \to A=80$ ($\Delta A = 0$), $N=82 \to A=130$ ($\Delta A = 0$), $N=126 \to A=196$ ($\Delta A = 1$). All three correct (experiment x548c, 3/3).

The lanthanide-rich ejecta that made the kilonova AT2017gfo (the optical counterpart of GW170817) glow red for days is the fingerprint of the $N=82$ tropical fixed point playing out in real time in a neutron star merger, 130 million light-years away, confirmed by gravitational-wave astronomy in 2017.

---

## Is the ISA description more fundamental than the shell model?

In one sense, no: the shell model is the microscopic theory, and the ISA orbit description is derived from it. In another — more important — sense, yes.

The shell model predicts magic numbers by reading off the gaps in a fitted level diagram. The ISA description explains *why* those configurations are special: they are tropical vertices of the orbit-occupancy register. The explanation requires no parameters and no wavefunctions — only the existence of a gap and the Pauli exclusion principle that forbids two nucleons from occupying the same orbit.

This is the same relationship as between G-walk chemistry and DFT:

| Level | Microscopic theory | ISA / orbit description | More fundamental for |
|-------|--------------------|------------------------|----------------------|
| Chemistry | DFT (Kohn-Sham equations, fitted functional) | G-walk chemistry (orbit occupancy) | Spin-state transitions, catalytic cycles |
| Nuclear | Shell model (fitted spin-orbit coupling) | G-walk nucleonics (orbit occupancy) | Magic numbers, nucleosynthesis peaks |
| Particle | QCD / Feynman diagrams | Amplituhedron / ISA programme | Scattering amplitude structure |

At each level, the orbit description strips away the wavefunction machinery and identifies the structural reason for the phenomenon. It is exact for the class of properties that orbit-occupancy determines — and for those properties, it is more predictive than the microscopic theory because it has fewer parameters.

The quark model tells you what nucleons are made of. G-walk nucleonics tells you why nuclei with certain nucleon numbers are magic, why the CNO cycle has a bottleneck, and why the universe has a peak of heavy elements at $A=130$. Both are right. They answer different questions.

---

## What this paper does not claim

**Not a replacement for nuclear structure theory.** Binding energies, scattering lengths, electromagnetic moments, and sub-shell structure require the shell model, ab initio nuclear theory, or lattice QCD. G-walk nucleonics describes which orbit is occupied, not the wavefunction within the orbit.

**Not a source of reaction cross-sections.** The astrophysical S-factor must be measured (at LUNA or similar underground laboratories) or computed from nuclear structure theory. The log-rate criterion uses $S_0$ as an input.

**Not a predictor of absolute r-process yields.** Peak locations are zero-parameter predictions; peak heights (absolute abundances) require r-process network calculations with astrophysical conditions ($Y_e$, entropy, expansion timescale).

---

*See also:* [doi:10.5281/zenodo.21224107](https://doi.org/10.5281/zenodo.21224107) (G-Walk Chemistry — the same framework one level up, for electrons) · [doi:10.5281/zenodo.21224111](https://doi.org/10.5281/zenodo.21224111) (G-Walk Protein Design — orbit occupancy for metalloprotein active sites) · [doi:10.5281/zenodo.20721743](https://doi.org/10.5281/zenodo.20721743) (The $H^k$ Complexity Ladder — the cohomological framework underlying the tropical fixed-point classification)
