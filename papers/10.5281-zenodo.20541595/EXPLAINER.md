---
layout: default
title: "Fano Geometry as a Unifying Language for QEC"
parent: Explainers
nav_exclude: false
tags: [fano, qec, steane-code, ghz, hamming, origami-isa, stabiliser]
portfolio: C|F
---

## The Fano Plane is the Error-Correcting Code

*Plain-language explainer for [doi:10.5281/zenodo.20541595](https://doi.org/10.5281/zenodo.20541595) (#363)*

---

## The central idea in one sentence

The famous Steane $[[7,1,3]]$ quantum error-correcting code and the Fano plane are the same object — and the 3-qubit GHZ state generates one from the other.

---

## The puzzle

Quantum error correction requires encoding one logical qubit into many physical qubits so that errors can be detected and corrected. The Steane code does this with 7 physical qubits — the smallest topological quantum code. Its parity-check matrix (the matrix that detects errors) has a very specific pattern of 0s and 1s.

Meanwhile, the Fano plane is a purely geometric object: 7 points, 7 lines, exactly 3 points per line, every pair of points on exactly 1 line. It is the smallest projective plane, and it encodes the multiplication table of the octonions.

**Why do these two things have the same structure?**

---

## The answer: three identifications

This paper proves they are the same via a chain of three exact identifications:

$$(\mathbb{Z}_2)^3 \setminus \{0\} \;=\; \mathrm{GF}(2)^3 \setminus \{0\} \;=\; \text{7 Fano points} \;=\; \text{columns of the } [7,4,3] \text{ Hamming parity-check matrix}$$

The 7 non-zero binary strings of length 3 are simultaneously the 7 points of the Fano plane and the 7 columns of the parity-check matrix of the classical Hamming code — from which the Steane code is built by a standard CSS construction.

**The GHZ connection:** the stabiliser group of the 3-qubit GHZ state ($|000\rangle + |111\rangle$) generates the Steane code's parity-check matrix. Three entangled qubits create seven-qubit error correction automatically, via the Fano geometry.

---

## The self-testing result

The paper also proves that the Fano plane provides a **self-test** for quantum mechanics with robustness $C = 7/8$: if a device passes 7 out of 8 Fano-line correlation tests, its quantum state must be close to the GHZ state. This gives a device-independent certificate of quantum behaviour with no trust in the hardware.

---

## What to read next

- [The Fano Plane is the Right Way to Think About Qubits](https://doi.org/10.5281/zenodo.20667176) (#408) — the practitioner primer that builds on this result
- [In Praise of Tetrahedra](https://doi.org/10.5281/zenodo.20581484) (#386) — where the 6j symbol comes from

*For the full technical treatment, see [doi:10.5281/zenodo.20541595](https://doi.org/10.5281/zenodo.20541595)*
