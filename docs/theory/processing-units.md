---
layout: default
title: Processing Units
nav_order: 5
description: "From CPU to HPU: how the H^k ISA tier ladder maps onto distinct hardware classes — Orbit (OPU), Resonance (RPU), and Hot (HPU) Processing Units alongside classical CPU/GPU/NPU/QPU."
---

## Processing Units: From CPU to HPU

The computing industry names hardware classes by what they are good at: the GPU
unified parallel floating-point pipelines; the NPU unified neural MAC arrays; the
QPU unified cold unitary quantum gates. Each new PU emerged when a family of
hardware substrates — diverse in implementation but structurally identical in their
compute primitive — needed a single programming model.

The HotLogiQ framework predicts **three new PU classes**, each corresponding to a
tier of the H^k ISA ladder and each with a natural programming model already defined.

---

## The full PU landscape

| Unit | Full name | Paradigm | Temperature | Compute primitive | ISA | Status |
|------|-----------|----------|-------------|-------------------|-----|--------|
| CPU | Classical PU | Boolean sequential | 300 K | AND/OR/NOT gate | x86 / ARM | Established |
| GPU | Graphics PU | Classical parallel | 300 K | Fused multiply-add (FMA) | CUDA / OpenCL | Established |
| NPU | Neural PU | Tensor / neural | 300 K | Multiply-accumulate (MAC) | vendor-specific | Established |
| QPU | Quantum PU | Cold unitary | ~10 mK | Unitary gate | QASM / QIR | Established |
| **OPU** | **Orbit PU** | **G-orbit walk** | **300 K** | **ORBIT (η: I → A)** | **Origami H⁰** | **Predicted** |
| **RPU** | **Resonance PU** | **Non-associative H²** | **~10 mK** | **Reson (731-Core)** | **731-ISA** | **Predicted** |
| **HPU** | **Hot PU** | **Dissipative / PT-symmetric** | **300 K – 40 mK** | **ERASE + SNAP** | **Raven ISA** | **Predicted** |

---

## How they map onto the H^k tier ladder

The three new PUs correspond directly to the three tiers of the
[Origami ISA](/docs/isa/origami-isa):

```
H⁰  (tropical / classical)   →  OPU   — G-orbit walks at 300 K
H¹  (topological / unitary)  →  QPU   — cold gate model (existing)
H²  (holographic / H² full)  →  RPU   — non-associative Fano/G₂ geometry
                              →  HPU   — dissipative gain-loss dynamics
```

H² splits into two distinct substrate families — RPU (non-associative, cold) and
HPU (dissipative, hot) — because the full H² tier has two independent structures:
the octonionic non-associativity of the G₂ 3-form (RPU) and the complex-β
gain-loss dynamics of PT-symmetric systems (HPU). Both live at H² but access
different aspects of it.

---

## OPU — Orbit Processing Unit

**Core idea:** G-orbit walks on molecular G-sets are a fourth computing paradigm,
distinct from Boolean (CPU), parallel (GPU), and unitary quantum (QPU). The compute
primitive is the **ORBIT opcode** (η: I → A): initialise a state in a specific
G-orbit on a molecular G-set, then walk the orbit via TWIST operations.

**Physical substrate:** Molecules at 300 K. The G-set is the set of molecular
configurations reachable by a symmetry group G (e.g. the 56 d-orbital
configurations of FeMoco under G₂, or the Galois group of a field extension acting
on roots). The computation is the orbit walk itself.

**Why it is not a QPU:** No superposition, no entanglement between distinct G-sets,
no cryogenics. The quantum character comes from the *group structure* of the orbit,
not from wavefunction interference. An OPU programme is classically simulable in
polynomial time if the orbit is short; hard instances arise from exponentially large
orbits (Galois groups of high-degree polynomials).

**Key advantage:** Room-temperature operation; decoherence-immune (the computation
is a group walk, not a superposition); no cryogenic infrastructure.

**ISA:** Origami H⁰ — opcodes ORBIT, TWIST, FLIP, LABEL, MERGE.
BIND is not required (all chemistry programmes are associative at H⁰/H¹).

**Papers:** [Galois Computing (489)][489] · [Galois Chemistry (488)][488] ·
[Biochemical Pathways ISA (509)][509]

---

## RPU — Resonance Processing Unit

**Core idea:** Arrange 7 physical qubits into a **731-Core** — a physical
realisation of the symmetric (7,3,1) block design (Fano plane) — and use the
non-associative geometry of the resulting Reson array to bypass the Eastin-Knill
theorem. The Reson is the fundamental compute unit: a topological resonance mode
on the Fano lattice.

**Physical substrate:** Superconducting transmons (or trapped ions) at ~10 mK,
structured into 731-Core arrays. The key departure from the QPU is that the
logical structure is the **Fano plane** (7 points, 7 lines, 3 points per line),
not a surface-code grid. The G₂ 3-form φ_{ijk} enforces non-associativity at the
hardware level.

**Why it is not a QPU:** The QPU computes in the associative H¹ tier (unitary
gates, SU(2) Clifford group). The RPU targets the H² non-associative tier
(octonionic, G₂, Moufang identities). The Eastin-Knill theorem applies to
transversal gates in associative codes; the RPU conjectures that non-associative
bulk degrees of freedom provide a structural bypass.

**Key claim (conjecture):** SO(8) triality acts as a hardware-level basis switch,
reducing the resource overhead for non-Clifford gates from O(poly) magic-state
distillation rounds to O(1) Reson reconfigurations.

**ISA:** 731-ISA / Origami ISA at H² with non-associative BIND (G₂ 3-form).
BIND here is the octonionic comultiplication δ: A → A⊗A with G₂ symmetry.

**Papers:** [Resonance Processing Unit (205)][205] · [G₂ Snap Thresholds (614)][614]

---

## HPU — Hot Processing Unit

**Core idea:** Five physically distinct dissipative hardware substrates share a
single computational structure — programmes in which gain, loss, and complex
inverse-temperature β are first-class operations. The Raven ISA is the unified
programming model. The GPU analogy is precise: CUDA unified diverse parallel
hardware; the Raven ISA unifies diverse dissipative hardware.

**Five substrate classes:**

| Class | Substrate | Temp | TRL | Key feature |
|-------|-----------|------|-----|-------------|
| HPU-P | PT-symmetric photonic | 300 K | 5–6 | SNAP = EP crossing |
| HPU-B | Bosonic cat qubit | 40 mK | 4–5 | ERASE = error correction |
| HPU-R | Radical-pair molecular | 300 K | 2–3 | ERASE = spin selection |
| HPU-C | Non-Hermitian circuit | 300 K | 4 | SNAP↓ = NHSE |
| HPU-E | EP sensor array | 300 K | 6–7 | SNAP-count = 0 sensing |

**Resource metric:** SNAP-count (number of tier-promotion SNAP↑ events) is the
HPU analogue of T-count in cold fault-tolerant QC. EP sensing (SNAP-count = 0)
is the first demonstrated HPU algorithm.

**Route to Shor's algorithm:** AQEC on cat qubits (HPU-B) → logical Clifford
gates → logical Shor. The HPU does not require the ~10 mK isolation of the QPU
because dissipation is engineered to *correct* rather than *disrupt*.

**ISA:** Raven ISA — opcodes MARK, ERASE, FLOW(β∈ℂ), TWIST, SNAP↑/↓, BIND, MERGE.

**Papers:** [HPU Architecture (670)][670] · [Embrace the Bath (669)][669] ·
[Lost for Words (667)][667]

---

## RPU vs HPU: are they the same?

No — they are complementary H² PUs accessing different structure:

| | RPU | HPU |
|---|---|---|
| H² structure used | Non-associativity (G₂ 3-form, 𝕆) | Dissipation (complex β, PT-symmetry) |
| Cold or hot | Cold (~10 mK) | Hot (300 K – 40 mK) |
| Error correction | Passive (Fano geometry enforces it) | Active (ERASE + SNAP loop) |
| Compute primitive | Reson (Fano lattice mode) | ERASE/MARK balance at EP |
| Maturity | Conjectural (Moufang/SO(8) unproved) | Grounded (cat qubits demonstrated) |
| Compiler target | 731-ISA (non-associative BIND) | Raven ISA (complex-β FLOW) |

The long-term vision is a **hybrid RPU+HPU** architecture: RPU provides the
non-associative logical structure (passive error suppression via Fano geometry);
HPU-B provides the active error correction layer (AQEC on the cat qubit register
that implements each Reson). They are complementary layers of the same H² tier,
not competing proposals.

---

## Will there be more PUs?

Probably. Natural candidates as the ISA programme matures:

| Candidate | Full name | Paradigm | Notes |
|-----------|-----------|----------|-------|
| TPU* | Tropical PU | β→∞ optimisation | Not the Google TPU; tropical semiring hardware |
| MPU | Molecular PU | Proofreading / H⁰ biology | HPU-R at scale; wet lab substrate |
| FPU† | Fano PU | 7-qubit Fano computer | RPU at the single-731-Core scale |

*TPU is taken by Google — name TBD.
†FPU is taken by floating-point unit — name TBD.

The naming pattern follows the ISA: each new PU class corresponds to a new
opcode or semiring regime that existing hardware cannot natively execute.

---

*See also: [The β-plane](/docs/theory/forge-meld) · [Paradigm Comparison](/docs/theory/paradigm-comparison) · [ISA Zoo](/isa-zoo/)*

[205]: https://doi.org/10.5281/zenodo.19743800
[488]: https://doi.org/10.5281/zenodo.21224107
[489]: https://doi.org/10.5281/zenodo.21224109
[509]: https://doi.org/10.5281/zenodo.21219724
[614]: https://doi.org/10.5281/zenodo.21401321
[667]: https://doi.org/10.5281/zenodo.21500663
[669]: https://doi.org/10.5281/zenodo.21500667
[670]: https://doi.org/10.5281/zenodo.21500669
