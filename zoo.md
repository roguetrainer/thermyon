---
layout: default
title: ISA Zoo
nav_order: 6
has_children: true
---

A catalogue of physical, chemical, biological, and mathematical processes
expressed as programmes in the Origami Instruction Set Architecture.

Each entry names the symmetry group, specifies the interpretation functor,
gives the explicit opcode sequence, and produces a computable output.
Entries marked **validated** have computed outputs confirmed against
experiment or established theory.

---

<div id="zoo-filters" style="margin: 1.5rem 0 0.75rem;">
  <span class="zoo-filter-label">Domain:</span>
  <button class="zoo-btn active" data-filter="domain" data-value="all">All</button>
  <button class="zoo-btn" data-filter="domain" data-value="Chemistry">Chemistry</button>
  <button class="zoo-btn" data-filter="domain" data-value="Biology">Biology</button>
  <button class="zoo-btn" data-filter="domain" data-value="Spectroscopy">Spectroscopy</button>
  <button class="zoo-btn" data-filter="domain" data-value="Nuclear Physics">Nuclear Physics</button>
  <button class="zoo-btn" data-filter="domain" data-value="Quantum Computing">Quantum Computing</button>
  <button class="zoo-btn" data-filter="domain" data-value="Condensed Matter">Condensed Matter</button>
  <button class="zoo-btn" data-filter="domain" data-value="Lattice Gauge Theory">Lattice Gauge</button>
  <button class="zoo-btn" data-filter="domain" data-value="Cryptography">Cryptography</button>
  <button class="zoo-btn" data-filter="domain" data-value="Finance">Finance</button>
  <button class="zoo-btn" data-filter="domain" data-value="Mathematics">Mathematics</button>
  <button class="zoo-btn" data-filter="domain" data-value="f-Element Chemistry">f-Elements</button>
</div>

<div id="zoo-filters-tier" style="margin: 0.4rem 0 0.4rem;">
  <span class="zoo-filter-label">Tier:</span>
  <button class="zoo-btn active" data-filter="tier" data-value="all">All</button>
  <button class="zoo-btn" data-filter="tier" data-value="H0">H⁰ — Tropical</button>
  <button class="zoo-btn" data-filter="tier" data-value="H1">H¹ — Clifford</button>
  <button class="zoo-btn" data-filter="tier" data-value="H2">H² — Magic</button>
</div>

<div id="zoo-filters-trilogy" style="margin: 0.4rem 0 0.4rem;">
  <span class="zoo-filter-label">ISA:</span>
  <button class="zoo-btn active" data-filter="trilogy" data-value="all">All</button>
  <button class="zoo-btn" data-filter="trilogy" data-value="Origami">Origami (β→∞)</button>
  <button class="zoo-btn" data-filter="trilogy" data-value="Forge">Forge (β≈β*)</button>
  <button class="zoo-btn" data-filter="trilogy" data-value="Meld">Meld (β→0)</button>
</div>

<div id="zoo-filters-status" style="margin: 0.4rem 0 1.25rem;">
  <span class="zoo-filter-label">Status:</span>
  <button class="zoo-btn active" data-filter="status" data-value="all">All</button>
  <button class="zoo-btn" data-filter="status" data-value="validated">Validated</button>
  <button class="zoo-btn" data-filter="status" data-value="conjectured">Conjectured</button>
  <button class="zoo-btn" data-filter="status" data-value="speculative">Speculative</button>
</div>

<p id="zoo-count" style="font-size:0.8rem;color:#666;margin-bottom:0.75rem;"></p>

<div id="zoo-table-wrap" style="overflow-x:auto;">
<table id="zoo-table">
  <thead>
    <tr>
      <th class="zoo-sortable" data-col="id">ID <span class="zoo-sort-icon">↕</span></th>
      <th class="zoo-sortable" data-col="name">Name <span class="zoo-sort-icon">↕</span></th>
      <th class="zoo-sortable" data-col="domain">Domain <span class="zoo-sort-icon">↕</span></th>
      <th class="zoo-sortable" data-col="group">Group</th>
      <th class="zoo-sortable" data-col="tier">Tier <span class="zoo-sort-icon">↕</span></th>
      <th class="zoo-sortable" data-col="trilogy">ISA <span class="zoo-sort-icon">↕</span></th>
      <th class="zoo-sortable" data-col="status">Status <span class="zoo-sort-icon">↕</span></th>
    </tr>
  </thead>
  <tbody id="zoo-body"></tbody>
</table>
</div>

<style>
.zoo-filter-label {
  font-size: 0.8rem;
  font-weight: 600;
  margin-right: 0.4rem;
  color: #555;
}
.zoo-btn {
  display: inline-block;
  margin: 0.1rem 0.15rem;
  padding: 0.18rem 0.55rem;
  font-size: 0.78rem;
  border: 1px solid #bbb;
  border-radius: 3px;
  background: #f5f5f5;
  cursor: pointer;
  transition: background 0.12s, border-color 0.12s;
}
.zoo-btn:hover { background: #e0e0e0; }
.zoo-btn.active { background: #1f6feb; border-color: #1f6feb; color: #fff; }

#zoo-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 0.85rem;
}
#zoo-table th, #zoo-table td {
  padding: 0.45rem 0.7rem;
  border-bottom: 1px solid #e0e0e0;
  text-align: left;
  white-space: nowrap;
}
#zoo-table th {
  background: #f8f8f8;
  font-weight: 600;
  font-size: 0.8rem;
  color: #333;
}
#zoo-table th.zoo-sortable { cursor: pointer; user-select: none; }
#zoo-table th.zoo-sortable:hover { background: #efefef; }
#zoo-table th.sort-asc .zoo-sort-icon::after { content: " ▲"; }
#zoo-table th.sort-desc .zoo-sort-icon::after { content: " ▼"; }
#zoo-table tr:hover td { background: #f5f8ff; }
#zoo-table td a { color: #1f6feb; text-decoration: none; font-weight: 500; }
#zoo-table td a:hover { text-decoration: underline; }

.zoo-tier {
  display: inline-block;
  font-size: 0.72rem;
  padding: 0.05rem 0.4rem;
  border-radius: 3px;
  font-weight: 600;
}
.zoo-tier-H0 { background: #f0fdf4; color: #166534; border: 1px solid #bbf7d0; }
.zoo-tier-H1 { background: #eff6ff; color: #1d4ed8; border: 1px solid #bfdbfe; }
.zoo-tier-H2 { background: #fdf4ff; color: #7e22ce; border: 1px solid #e9d5ff; }

.zoo-status {
  display: inline-block;
  font-size: 0.72rem;
  padding: 0.05rem 0.4rem;
  border-radius: 3px;
}
.zoo-status-validated   { background: #f0fdf4; color: #166534; border: 1px solid #bbf7d0; }
.zoo-status-conjectured { background: #fffbeb; color: #92400e; border: 1px solid #fde68a; }
.zoo-status-speculative { background: #fef2f2; color: #991b1b; border: 1px solid #fecaca; }

.zoo-trilogy {
  display: inline-block;
  font-size: 0.72rem;
  padding: 0.05rem 0.4rem;
  border-radius: 3px;
  background: #f8f8f8;
  border: 1px solid #ddd;
  color: #444;
}
</style>

<script>
(function() {
  var entries = [{"id": "C01", "name": "Nitrogen fixation E-state cycle", "domain": "Chemistry", "system": "FeMo-cofactor Fe7S9C", "group": "G2", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST BIND", "papers": "488", "doi": "10.5281/zenodo.21219712", "slug": "c01-nitrogen-fixation"}, {"id": "C02", "name": "Fe(II) spin crossover", "domain": "Chemistry", "system": "Fe(L)4(NCS)2 class", "group": "SU(2)", "tier": "H0", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT LABEL", "papers": "488", "doi": "10.5281/zenodo.21219712", "slug": "c02-spin-crossover"}, {"id": "C03", "name": "SCO gate engineering", "domain": "Chemistry", "system": "Any Fe(II) SCO complex", "group": "SU(2)", "tier": "H0", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT LABEL", "papers": "488", "doi": "10.5281/zenodo.21219712", "slug": "c03-sco-gate"}, {"id": "C04", "name": "RNR radical transfer", "domain": "Biology", "system": "Ribonucleotide reductase", "group": "SU(2)", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "490", "doi": "10.5281/zenodo.21219720", "slug": "c04-rnr-radical"}, {"id": "C05", "name": "PSII O-O bond formation", "domain": "Biology", "system": "Mn4CaO5 OEC", "group": "G2", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST BIND", "papers": "490", "doi": "10.5281/zenodo.21219720", "slug": "c05-psii-oo"}, {"id": "S01", "name": "Electronic spectroscopy (d-shell)", "domain": "Spectroscopy", "system": "Any TM complex", "group": "SU(2)", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP SPLIT SPLAT ORBIT", "papers": "487", "doi": "10.5281/zenodo.21219702", "slug": "s01-d-shell-spectroscopy"}, {"id": "S02", "name": "Tanabe-Sugano diagrams", "domain": "Spectroscopy", "system": "d^n in Oh", "group": "SU(2)", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP ORBIT", "papers": "491", "doi": "10.5281/zenodo.21219700", "slug": "s02-tanabe-sugano"}, {"id": "S03", "name": "EPR of FeMoco", "domain": "Spectroscopy", "system": "Fe7S9C S=3/2", "group": "SU(2)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP TWIST ORBIT", "papers": "318", "doi": "", "slug": "s03-femoco-epr"}, {"id": "S04", "name": "FMO exciton dynamics", "domain": "Spectroscopy", "system": "7-BChl Fano complex", "group": "G2", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST BIND", "papers": "319", "doi": "10.5281/zenodo.21249153", "slug": "s04-fmo-exciton"}, {"id": "S05", "name": "Nuclear gamma spectroscopy", "domain": "Spectroscopy", "system": "28Si and 48Ca", "group": "SU(2)", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP SPLIT SPLAT ORBIT", "papers": "348", "doi": "", "slug": "s05-nuclear-gamma"}, {"id": "Q01", "name": "Shor's algorithm", "domain": "Quantum Computing", "system": "Period-finding in Z_N", "group": "GL(1)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST FLIP FLOP", "papers": "472", "doi": "10.5281/zenodo.21219704", "slug": "q01-shor"}, {"id": "Q02", "name": "Grover's algorithm", "domain": "Quantum Computing", "system": "Unstructured search", "group": "SU(2)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST FLIP", "papers": "473", "doi": "10.5281/zenodo.21219706", "slug": "q02-grover"}, {"id": "Q03", "name": "Steane 7-qubit code", "domain": "Quantum Computing", "system": "7-qubit Hamming QEC", "group": "PSL(2.7)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST BIND", "papers": "325", "doi": "", "slug": "q03-steane"}, {"id": "Q04", "name": "Toric code", "domain": "Quantum Computing", "system": "2D surface code", "group": "Z2 x Z2", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "446", "doi": "", "slug": "q04-toric-code"}, {"id": "F05", "name": "Pacioli double-entry bookkeeping", "domain": "Finance", "system": "Balance sheet algebra", "group": "Z", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT SPLIT SPLAT", "papers": "396", "doi": "10.5281/zenodo.21158947", "slug": "f05-pacioli"}, {"id": "M01", "name": "Pentagon identity", "domain": "Mathematics", "system": "Rep(G) associator", "group": "Any", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP SPLIT SPLAT", "papers": "357", "doi": "", "slug": "m01-pentagon"}, {"id": "M02", "name": "Frobenius axiom", "domain": "Mathematics", "system": "Frobenius algebra", "group": "Any", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "SPLIT SPLAT", "papers": "357", "doi": "", "slug": "m02-frobenius"}, {"id": "M03", "name": "Fano plane GHZ correlations", "domain": "Mathematics", "system": "PG(2.2)", "group": "PSL(2.7)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST BIND", "papers": "357", "doi": "", "slug": "m03-fano-ghz"}, {"id": "M04", "name": "G2 excluded volume", "domain": "Mathematics", "system": "Non-associative sector", "group": "G2", "tier": "H2", "trilogy": "Meld", "status": "validated", "opcodes": "BIND", "papers": "357", "doi": "", "slug": "m04-g2-excluded"}, {"id": "N01", "name": "Nuclear magic numbers", "domain": "Nuclear Physics", "system": "Shell model Mayer-Jensen", "group": "SU(2)", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT SPLIT SPLAT", "papers": "340", "doi": "", "slug": "n01-magic-numbers"}, {"id": "N02", "name": "Nuclear shape phase transitions", "domain": "Nuclear Physics", "system": "134Ba and 152Sm region", "group": "SU(1.1)", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "522", "doi": "", "slug": "n02-shape-transitions"}, {"id": "N04", "name": "Pandya transformation", "domain": "Nuclear Physics", "system": "1g9/2 seniority sector", "group": "SU(2)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "FLIP FLOP", "papers": "348", "doi": "", "slug": "n04-pandya"}, {"id": "B04", "name": "Ribosomal decoding", "domain": "Biology", "system": "70S A-site", "group": "SU(2)", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "324", "doi": "", "slug": "b04-ribosome"}, {"id": "L01", "name": "SU(3) Wilson plaquette", "domain": "Lattice Gauge Theory", "system": "QCD lattice", "group": "SU(3)", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "523", "doi": "", "slug": "l01-wilson-plaquette"}, {"id": "L02", "name": "Deconfinement transition", "domain": "Lattice Gauge Theory", "system": "Polyakov loop", "group": "SU(3)", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "523", "doi": "", "slug": "l02-deconfinement"}, {"id": "L05", "name": "Schwinger model", "domain": "Lattice Gauge Theory", "system": "U(1) in 1+1D", "group": "U(1)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "523", "doi": "", "slug": "l05-schwinger"}, {"id": "K01", "name": "RSA-2048 encryption", "domain": "Cryptography", "system": "Z_N* period-finding", "group": "GL(1)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST FLIP FLOP", "papers": "525", "doi": "", "slug": "k01-rsa"}, {"id": "K03", "name": "SHA-3 / Keccak hash", "domain": "Cryptography", "system": "F2^1600 sponge", "group": "F2", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT SPLIT SPLAT", "papers": "525", "doi": "", "slug": "k03-sha3"}, {"id": "K04", "name": "ECDSA / EdDSA", "domain": "Cryptography", "system": "E(Fp) elliptic curve DL", "group": "GL(1)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "ORBIT TWIST", "papers": "525", "doi": "", "slug": "k04-ecdsa"}, {"id": "SC01", "name": "BCS superconductor", "domain": "Condensed Matter", "system": "3D metal Cooper pairs", "group": "U(1)", "tier": "H1", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST SPLIT SPLAT", "papers": "526", "doi": "", "slug": "sc01-bcs"}, {"id": "SC02", "name": "Abrikosov vortex lattice", "domain": "Condensed Matter", "system": "Type II SC mixed phase", "group": "U(1)", "tier": "H2", "trilogy": "Forge", "status": "validated", "opcodes": "ORBIT TWIST BIND", "papers": "526", "doi": "", "slug": "sc02-abrikosov"}, {"id": "FE01", "name": "Dy3+ single-molecule magnet", "domain": "f-Element Chemistry", "system": "4f SMM axial CF", "group": "SU(2)", "tier": "H1", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP ORBIT TWIST", "papers": "527", "doi": "", "slug": "fe01-dy-smm"}, {"id": "FE04", "name": "Dieke diagram benchmark", "domain": "f-Element Chemistry", "system": "12 Ln3+ ions", "group": "SU(2)", "tier": "H0", "trilogy": "Origami", "status": "validated", "opcodes": "FLOP SPLIT SPLAT ORBIT", "papers": "527", "doi": "", "slug": "fe04-dieke"}];
  var active = { domain: "all", tier: "all", trilogy: "all", status: "all" };
  var sortCol = "id";
  var sortDir = 1;

  function baseurl(path) { return "{{ site.baseurl }}" + path; }

  function tierLabel(t) {
    var map = { H0: "H⁰", H1: "H¹", H2: "H²" };
    return map[t] || t;
  }

  function render() {
    var visible = entries.filter(function(e) {
      if (!e || !e.id) return false;
      return (active.domain  === "all" || e.domain  === active.domain)
          && (active.tier    === "all" || e.tier    === active.tier)
          && (active.trilogy === "all" || e.trilogy === active.trilogy)
          && (active.status  === "all" || e.status  === active.status);
    });

    visible.sort(function(a, b) {
      var av = String(a[sortCol] || "").toLowerCase();
      var bv = String(b[sortCol] || "").toLowerCase();
      if (av < bv) return -sortDir;
      if (av > bv) return  sortDir;
      return 0;
    });

    var tbody = document.getElementById("zoo-body");
    var count = document.getElementById("zoo-count");
    if (!tbody || !count) return;
    count.textContent = visible.length + " entr" + (visible.length !== 1 ? "ies" : "y");

    tbody.innerHTML = visible.map(function(e) {
      var href = baseurl("/isa-zoo/" + e.slug);
      var tierCls = "zoo-tier zoo-tier-" + e.tier;
      var stCls   = "zoo-status zoo-status-" + e.status;
      return "<tr>"
        + "<td><code>" + e.id + "</code></td>"
        + "<td><a href='" + href + "'>" + e.name + "</a></td>"
        + "<td>" + e.domain + "</td>"
        + "<td><code>" + e.group + "</code></td>"
        + "<td><span class='" + tierCls + "'>" + tierLabel(e.tier) + "</span></td>"
        + "<td><span class='zoo-trilogy'>" + e.trilogy + "</span></td>"
        + "<td><span class='" + stCls + "'>" + e.status + "</span></td>"
        + "</tr>";
    }).join("");
  }

  function init() {
    // Filter buttons
    ["zoo-filters","zoo-filters-tier","zoo-filters-trilogy","zoo-filters-status"].forEach(function(barId) {
      var bar = document.getElementById(barId);
      if (!bar) return;
      bar.addEventListener("click", function(e) {
        var btn = e.target.closest(".zoo-btn");
        if (!btn) return;
        bar.querySelectorAll(".zoo-btn").forEach(function(b) { b.classList.remove("active"); });
        btn.classList.add("active");
        active[btn.dataset.filter] = btn.dataset.value;
        render();
      });
    });

    // Sortable column headers
    document.querySelectorAll("th.zoo-sortable").forEach(function(th) {
      th.addEventListener("click", function() {
        var col = th.dataset.col;
        if (sortCol === col) { sortDir = -sortDir; }
        else { sortCol = col; sortDir = 1; }
        document.querySelectorAll("th.zoo-sortable").forEach(function(h) {
          h.classList.remove("sort-asc","sort-desc");
        });
        th.classList.add(sortDir === 1 ? "sort-asc" : "sort-desc");
        render();
      });
    });

    render();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
</script>
