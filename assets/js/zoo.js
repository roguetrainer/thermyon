var active = { domain: "all", tier: "all", trilogy: "all", status: "all" };
var sortCol = "id";
var sortDir = 1;
var BASEURL = "/adelic-simplicial-architecture";

function tierLabel(t) {
  var map = { H0: "H⁰", H1: "H¹", H2: "H²" };
  return map[t] || t;
}

function zooRender() {
  var entries = window.ZOO_ENTRIES || [];
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
  if (!tbody) return;
  if (count) count.textContent = visible.length + " entr" + (visible.length !== 1 ? "ies" : "y");
  var rows = "";
  for (var i = 0; i < visible.length; i++) {
    var e = visible[i];
    var href = BASEURL + "/isa-zoo/" + e.slug;
    var tierCls = "zoo-tier zoo-tier-" + e.tier;
    var stCls   = "zoo-status zoo-status-" + e.status;
    rows += "<tr>"
      + "<td><code>" + e.id + "</code></td>"
      + "<td><a href='" + href + "'>" + e.name + "</a></td>"
      + "<td>" + e.domain + "</td>"
      + "<td><code>" + e.group + "</code></td>"
      + "<td><span class='" + tierCls + "'>" + tierLabel(e.tier) + "</span></td>"
      + "<td><span class='zoo-trilogy'>" + e.trilogy + "</span></td>"
      + "<td><span class='" + stCls + "'>" + e.status + "</span></td>"
      + "</tr>";
  }
  tbody.innerHTML = rows;
}

function zooInit() {
  var bars = ["zoo-filters","zoo-filters-tier","zoo-filters-trilogy","zoo-filters-status"];
  bars.forEach(function(barId) {
    var bar = document.getElementById(barId);
    if (!bar) return;
    bar.addEventListener("click", function(ev) {
      var btn = ev.target;
      while (btn && !btn.classList.contains("zoo-btn")) btn = btn.parentElement;
      if (!btn) return;
      bar.querySelectorAll(".zoo-btn").forEach(function(b) { b.classList.remove("active"); });
      btn.classList.add("active");
      active[btn.getAttribute("data-filter")] = btn.getAttribute("data-value");
      zooRender();
    });
  });
  document.querySelectorAll("th.zoo-sortable").forEach(function(th) {
    th.addEventListener("click", function() {
      var col = th.getAttribute("data-col");
      if (sortCol === col) { sortDir = -sortDir; }
      else { sortCol = col; sortDir = 1; }
      document.querySelectorAll("th.zoo-sortable").forEach(function(h) {
        h.classList.remove("sort-asc","sort-desc");
      });
      th.classList.add(sortDir === 1 ? "sort-asc" : "sort-desc");
      zooRender();
    });
  });
  zooRender();
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", zooInit);
} else {
  zooInit();
}
window.addEventListener("load", function() {
  var tbody = document.getElementById("zoo-body");
  if (tbody && !tbody.innerHTML) zooInit();
});
setTimeout(function() {
  var tbody = document.getElementById("zoo-body");
  if (tbody && !tbody.innerHTML) zooInit();
}, 300);
