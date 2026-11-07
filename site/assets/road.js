/* Road to 100%: the climb, rate, cost, proof, both tiers and the 568-cell road, from two static files:
   /data/union.json (an exact copy of crew/exports/union/UNION.json) and /data/road.json (stage/server/road.mjs).
   Recovered = in union.json, nothing else. Close = best attempt >= 90%, not accepted, never counted.
   Mount: <div data-road></div>. Animates once when scrolled into view. Refresh: site/tools/sync_union.sh. */
(function () {
  "use strict";
  var mounts = document.querySelectorAll("[data-road]");
  if (!mounts.length) return;
  var reduce = matchMedia("(prefers-reduced-motion: reduce)").matches;
  var j = function (u) { return fetch(u, { cache: "no-cache" }).then(function (r) { if (!r.ok) throw r.status; return r.json(); }); };
  Promise.all([j("/data/union.json"), j("/data/road.json")]).then(function (d) {
    mounts.forEach(function (m) { build(m, d[0], d[1]); });
  }).catch(function () { mounts.forEach(function (m) { m.hidden = true; }); });

  var fmt = function (n) { return n.toLocaleString("en-US"); };
  var esc = function (s) { return String(s).replace(/[&<>"]/g, function (c) { return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]; }); };
  var BANDS = [["up to 120 B", 0, 120], ["121 to 300 B", 121, 300], ["301 to 1,000 B", 301, 1000], ["over 1,000 B", 1001, Infinity]];

  function build(m, u, r) {
    var tz = r.tz || "America/Los_Angeles";
    var clock = new Intl.DateTimeFormat("en-US", { hour: "2-digit", minute: "2-digit", hourCycle: "h23", timeZone: tz });
    var T = function (iso) { return clock.format(new Date(iso)); };
    var proven = new Set(u.rows.map(function (x) { return x.fn; }));
    var close = new Set((r.close && r.close.fns || []).filter(function (f) { return !proven.has(f); }));
    // the climb: first proof time of each union function (road.json), only for functions union.json has
    var climb = r.climb.filter(function (c) { return proven.has(c.fn); }).map(function (c) { return Date.parse(c.ts); }).sort(function (a, b) { return a - b; });
    var n = u.functions, of = u.of;
    var t0 = Date.parse(r.totals.first_run_start), last = climb[climb.length - 1];
    var perHour = climb.length && last > t0 ? climb.length / ((last - t0) / 3.6e6) : null;
    var costPer = n ? r.totals.cost_usd / n : null;
    var bands = BANDS.map(function (b) { return { l: b[0], lo: b[1], hi: b[2], got: 0, tot: 0 }; });
    r.cells.forEach(function (c) { var b = bands.find(function (x) { return c[1] >= x.lo && c[1] <= x.hi; }); b.tot++; if (proven.has(c[0])) b.got++; });

    m.classList.add("road");
    m.innerHTML =
      '<header class="rd-h"><p class="hand rd-kicker">the first afternoon</p>' +
      '<h3>The first afternoon.</h3><p class="rd-sub">Unique Doom functions recovered and proven, run by run. From ' + T(r.day_start) + " to " + (last ? T(new Date(last).toISOString()) : "now") + " (Pacific).</p></header>" +
      '<div class="rd-top"><figure class="rd-chart"><svg viewBox="0 0 800 340" preserveAspectRatio="none" role="img" aria-label="' + n + ' unique Doom functions proven over the afternoon, rising run by run"></svg>' +
      '<figcaption>' + r.runs.length + " runs, each tick is one run starting. Only functions in the re-verified union are counted.</figcaption></figure>" +
      '<div class="rd-stats">' +
      '<div class="rd-st"><b>' + (perHour ? Math.round(perHour) : "--") + "</b><span>functions an hour</span><small>first run " + T(r.totals.first_run_start) + " to latest proof " + (last ? T(new Date(last).toISOString()) : "--") + "</small></div>" +
      '<div class="rd-st"><b>$' + (costPer ? costPer.toFixed(2) : "--") + "</b><span>per function</span><small>$" + r.totals.cost_usd.toFixed(2) + " of Muse across " + r.totals.runs + " runs ÷ " + n + "</small></div>" +
      '<div class="rd-q"><div><b class="ok">' + r.totals.fakes_accepted + "</b><span>fakes accepted</span></div><div><b>" + r.totals.fakes_rejected + "</b><span>fakes rejected</span></div><div><b class=\"no\">" + r.totals.lies_caught + "</b><span>lies caught</span></div></div>" +
      '<p class="rd-ver">✓ every function byte-identical, ' + (u.reverified_by_referee ? "verified on a second machine" : "not re-verified yet") + "</p>" +
      '<p class="rd-proof"><svg viewBox="0 0 28 34" width="22" height="27" aria-hidden="true"><path d="M2 1h18l6 6v26H2z" fill="none" stroke="currentColor" stroke-width="2"/><path d="M7 7h12v10H7z" fill="currentColor" opacity=".35"/><path d="M6 25h3M11 25h3M16 25h3M21 25h2" stroke="currentColor" stroke-width="3"/></svg>' +
      "<span>Doom already runs on agent-written code. <b>SHA-1 identical.</b><code>" + esc((u.target_rom_sha1 || "").slice(0, 12)) + "…</code></span></p>" +
      "</div></div>" +
      '<div class="rd-tier"><div class="rd-bar"><i class="ok"></i><i class="cl"></i></div>' +
      '<p class="rd-t1"><i class="k ok"></i>proven exact: <b class="rd-n">0</b> / ' + of + " functions <em>·</em> <b>" + u.pct_bytes.toFixed(2) + "%</b> of the code bytes <small>" + fmt(u.bytes) + " of " + fmt(u.of_bytes) + "</small></p>" +
      '<p class="rd-t2"><i class="k cl"></i>close, not proven: <b>' + close.size + "</b> at ≥90% best match <small>close = best attempt ≥90% byte-match, not accepted, not counted</small></p></div>" +
      '<div class="rd-road"><p class="rd-legend"><span>the road · ' + r.cells.length + ' functions in ROM address order, wider = bigger</span><span><i class="k ok"></i>recovered and proven <i class="k cl"></i>close, not proven <i class="k og"></i>still original, next on the road</span></p><div class="rd-cells"></div></div>' +
      '<div class="rd-bands">' + bands.map(function (b) {
        return '<div><p><span>' + b.l + "</span><span><b>" + b.got + "</b> / " + b.tot + '</span></p><span class="rd-bb"><i data-w="' + (100 * b.got / b.tot).toFixed(2) + '"></i></span></div>';
      }).join("") + "</div>" +
      '<p class="rd-tag">Every function proven. SHA-1 identical. The road to 100% is run by run.</p>';

    // cells: width grows with sqrt(size); state classes applied when revealed
    var box = m.querySelector(".rd-cells"), cells = [];
    r.cells.forEach(function (c) {
      var i = document.createElement("i");
      i.style.flexGrow = Math.sqrt(Math.max(1, c[1])).toFixed(2);
      i.style.flexBasis = (Math.sqrt(Math.max(1, c[1])) * 0.55).toFixed(2) + "px";
      i.title = c[0] + " · " + c[1] + " B";
      box.appendChild(i);
      cells.push([i, proven.has(c[0]) ? "ok" : close.has(c[0]) ? "cl" : ""]);
    });

    // chart
    var svg = m.querySelector(".rd-chart svg"), W = 800, H = 340, P = { l: 44, r: 16, t: 20, b: 34 };
    var x0 = Date.parse(r.day_start), ends = r.runs.map(function (x) { return x.end ? Date.parse(x.end) : 0; });
    var lastRun = Math.max.apply(null, [last || x0].concat(ends)), x1 = lastRun + (lastRun - x0) * 0.03;
    var step = climb.length > 200 ? 100 : climb.length > 80 ? 25 : 10, yMax = Math.max(step * 2, Math.ceil(climb.length * 1.18 / step) * step);
    var X = function (t) { return P.l + (t - x0) / (x1 - x0) * (W - P.l - P.r); }, Y = function (c) { return H - P.b - c / yMax * (H - P.t - P.b); };
    var g = "";
    for (var y = 0; y <= yMax; y += step) g += '<line class="gr" x1="' + P.l + '" x2="' + (W - P.r) + '" y1="' + Y(y) + '" y2="' + Y(y) + '"/><text class="ax" x="' + (P.l - 8) + '" y="' + (Y(y) + 4) + '" text-anchor="end">' + y + "</text>";
    for (var t = Math.ceil(x0 / 3.6e6) * 3.6e6; t <= x1; t += 3.6e6) if (X(t) - X(x0) > 70) g += '<text class="ax" x="' + X(t) + '" y="' + (H - 10) + '" text-anchor="middle">' + T(new Date(t).toISOString()) + "</text>";
    g += '<text class="ax" x="' + P.l + '" y="' + (H - 10) + '">' + T(r.day_start) + " kickoff</text>";
    r.runs.forEach(function (x) { if (x.start) { var rx = X(Date.parse(x.start)); g += '<line class="rn" x1="' + rx + '" x2="' + rx + '" y1="' + (H - P.b) + '" y2="' + (H - P.b + 7) + '"/>'; } });
    var d = "M" + X(x0) + "," + Y(0);
    climb.forEach(function (tt, i) { d += "H" + X(tt).toFixed(1) + "V" + Y(i + 1).toFixed(1); });
    d += "H" + X(lastRun).toFixed(1);
    var lx = X(last || x0), ly = Y(climb.length);
    svg.innerHTML = g + '<path class="ar" d="' + d + "V" + Y(0) + "H" + X(x0) + 'Z"/><path class="ln" pathLength="1" d="' + d + '"/>' +
      '<circle class="rg" cx="' + lx + '" cy="' + ly + '" r="6"/><circle class="dt" cx="' + lx + '" cy="' + ly + '" r="5"/>' +
      '<text class="nw" x="' + (lx - 12) + '" y="' + (ly - 14) + '" text-anchor="end"><tspan class="bg">' + climb.length + "</tspan> still climbing</text>";

    var go = function () {
      m.classList.add("on");
      var nEl = m.querySelector(".rd-n");
      m.querySelector(".rd-bar .ok").style.width = (100 * n / of) + "%";
      m.querySelector(".rd-bar .cl").style.width = (100 * close.size / of) + "%";
      m.querySelectorAll(".rd-bb i").forEach(function (i) { i.style.width = i.dataset.w + "%"; });
      if (reduce) { nEl.textContent = n; cells.forEach(function (c) { if (c[1]) c[0].className = c[1]; }); return; }
      var k = 0;
      cells.forEach(function (c, idx) { if (c[1]) { c[0].style.transitionDelay = (idx * 2.2) + "ms"; c[0].className = c[1]; } });
      var t0a = performance.now();
      (function tick(tn) { var p = Math.min(1, (tn - t0a) / 1400); nEl.textContent = Math.round(n * (1 - Math.pow(1 - p, 3))); if (p < 1) requestAnimationFrame(tick); })(t0a);
      void k;
    };
    if (!("IntersectionObserver" in window)) return go();
    var io = new IntersectionObserver(function (es) { es.forEach(function (e) { if (e.isIntersecting) { io.disconnect(); go(); } }); }, { threshold: 0.2 });
    io.observe(m);
  }
})();
