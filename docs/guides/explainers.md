---
layout: default
title: Explainers
nav_order: 5
has_children: true
---

Plain-language guides to every paper — no prior mathematics required. Filter by theme below.

For a thematic overview of the non-associative work (division algebra ladder, Freudenthal-Tits magic square, 731-ISA), see [The Non-Associative Frontier](../theory/non-associative-frontier.md).

<div id="asa-filter-bar" style="margin: 1.5rem 0 1rem;">
  <span style="font-size: 0.85rem; font-weight: 600; margin-right: 0.5rem;">Portfolio:</span>
  <button class="asa-btn active" data-filter="portfolio" data-value="all">All</button>
  <button class="asa-btn" data-filter="portfolio" data-value="A">A — Core Engine</button>
  <button class="asa-btn" data-filter="portfolio" data-value="B">B — Foundations</button>
  <button class="asa-btn" data-filter="portfolio" data-value="C">C — Hardware &amp; AI</button>
  <button class="asa-btn" data-filter="portfolio" data-value="D">D — Protocols</button>
  <button class="asa-btn" data-filter="portfolio" data-value="E">E — Grand Challenges</button>
  <button class="asa-btn" data-filter="portfolio" data-value="F">F — Quantum Foundations</button>
  <button class="asa-btn" data-filter="portfolio" data-value="G">G — Economics &amp; Complex Systems</button>
</div>

<div id="asa-filter-bar-tags" style="margin: 0 0 1.5rem;">
  <span style="font-size: 0.85rem; font-weight: 600; margin-right: 0.5rem;">Tag:</span>
  <button class="asa-btn active" data-filter="tag" data-value="all">All</button>
  <button class="asa-btn" data-filter="tag" data-value="ai-ml">AI / ML</button>
  <button class="asa-btn" data-filter="tag" data-value="calculus">Calculus</button>
  <button class="asa-btn" data-filter="tag" data-value="cryptography">Cryptography</button>
  <button class="asa-btn" data-filter="tag" data-value="fano">Fano</button>
  <button class="asa-btn" data-filter="tag" data-value="g2">G₂</button>
  <button class="asa-btn" data-filter="tag" data-value="hardware">Hardware</button>
  <button class="asa-btn" data-filter="tag" data-value="number-theory">Number Theory</button>
  <button class="asa-btn" data-filter="tag" data-value="octonions">Octonions</button>
  <button class="asa-btn" data-filter="tag" data-value="optimisation">Optimisation</button>
  <button class="asa-btn" data-filter="tag" data-value="qec">QEC</button>
  <button class="asa-btn" data-filter="tag" data-value="quantum-foundations">Quantum Foundations</button>
  <button class="asa-btn" data-filter="tag" data-value="economics">Economics</button>
  <button class="asa-btn" data-filter="tag" data-value="thermodynamics">Thermodynamics</button>
  <button class="asa-btn" data-filter="tag" data-value="agent-based-models">Agent-Based Models</button>
</div>

<p id="asa-count" style="font-size: 0.8rem; color: #666; margin-bottom: 1rem;"></p>

<div id="asa-grid"></div>

<style>
.asa-btn {
  display: inline-block;
  margin: 0.15rem 0.2rem;
  padding: 0.2rem 0.65rem;
  font-size: 0.8rem;
  border: 1px solid #aaa;
  border-radius: 3px;
  background: #f5f5f5;
  cursor: pointer;
  transition: background 0.15s, border-color 0.15s;
}
.asa-btn:hover { background: #e0e0e0; }
.asa-btn.active { background: #1f6feb; border-color: #1f6feb; color: #fff; }

#asa-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 1rem;
}

.asa-card {
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0.9rem 1rem;
  background: #fff;
  transition: box-shadow 0.15s;
}
.asa-card:hover { box-shadow: 0 2px 8px rgba(0,0,0,0.12); }
.asa-card a { text-decoration: none; color: #1f6feb; font-weight: 600; }
.asa-card a:hover { text-decoration: underline; }
.asa-card .asa-num { font-size: 0.75rem; color: #888; margin-bottom: 0.2rem; }
.asa-card .asa-tags { margin-top: 0.5rem; }
.asa-tag {
  display: inline-block;
  font-size: 0.7rem;
  background: #eef2ff;
  border: 1px solid #c7d2fe;
  border-radius: 3px;
  padding: 0.05rem 0.35rem;
  margin: 0.1rem 0.1rem 0 0;
  color: #3730a3;
}
.asa-portfolio {
  display: inline-block;
  font-size: 0.7rem;
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
  border-radius: 3px;
  padding: 0.05rem 0.35rem;
  margin: 0.1rem 0.1rem 0 0;
  color: #166534;
}
</style>

<script>
(function() {
  var papers = {{ site.data.papers | jsonify }};
  var activePortfolio = "all";
  var activeTag = "all";

  var PORTFOLIO_LABELS = {
    "A": "A — Core Engine",
    "B": "B — Foundations",
    "C": "C — Hardware & AI",
    "D": "D — Protocols",
    "E": "E — Grand Challenges",
    "F": "F — Quantum Foundations",
    "G": "G — Economics & Complex Systems"
  };

  function baseurl(path) {
    return "{{ site.baseurl }}" + path;
  }

  function toArray(val, sep) {
    if (!val) return [];
    if (Array.isArray(val)) return val;
    return String(val).split(sep).map(function(s) { return s.trim(); }).filter(Boolean);
  }

  function render() {
    var visible = papers.filter(function(p) {
      var ex = p.explainer;
      if (!ex || ex === "False" || ex === false) return false;
      var portfolios = toArray(p.portfolios, "|");
      var tags = toArray(p.tags, "|");
      var portfolioOk = activePortfolio === "all" || portfolios.indexOf(activePortfolio) !== -1;
      var tagOk = activeTag === "all" || tags.indexOf(activeTag) !== -1;
      return portfolioOk && tagOk;
    });

    visible.sort(function(a, b) { return Number(a.number) - Number(b.number); });

    var grid = document.getElementById("asa-grid");
    var count = document.getElementById("asa-count");
    count.textContent = visible.length + " paper" + (visible.length !== 1 ? "s" : "");

    grid.innerHTML = visible.map(function(p) {
      var tags = toArray(p.tags, "|").map(function(t) {
        return '<span class="asa-tag">' + t + '</span>';
      }).join("");
      var portfolios = toArray(p.portfolios, "|").map(function(pf) {
        return '<span class="asa-portfolio">' + (PORTFOLIO_LABELS[pf] || pf) + '</span>';
      }).join("");
      var href = baseurl("/papers/" + p.slug + "/EXPLAINER");
      return '<div class="asa-card">'
        + '<div class="asa-num">#' + p.number + ' &nbsp;·&nbsp; <a href="https://doi.org/' + p.doi + '" target="_blank">' + p.doi + '</a></div>'
        + '<div><a href="' + href + '">' + p.title + '</a></div>'
        + '<div class="asa-tags">' + portfolios + tags + '</div>'
        + '</div>';
    }).join("");
  }

  function bindButtons(containerId, filterKey) {
    var container = document.getElementById(containerId);
    if (!container) return;
    container.addEventListener("click", function(e) {
      var btn = e.target.closest(".asa-btn");
      if (!btn || btn.dataset.filter !== filterKey) return;
      container.querySelectorAll(".asa-btn").forEach(function(b) { b.classList.remove("active"); });
      btn.classList.add("active");
      if (filterKey === "portfolio") activePortfolio = btn.dataset.value;
      else activeTag = btn.dataset.value;
      render();
    });
  }

  bindButtons("asa-filter-bar", "portfolio");
  bindButtons("asa-filter-bar-tags", "tag");
  render();
})();
</script>
