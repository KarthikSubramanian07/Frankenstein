// Frankenstein site motion. Vanilla JS, transform/opacity animations, everything pauses off-screen.
(function () {
  "use strict";
  var reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  var finePointer = window.matchMedia("(hover: hover) and (pointer: fine)").matches;
  var $ = function (s, r) { return (r || document).querySelector(s); };
  var $$ = function (s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); };
  var sleep = function (ms) { return new Promise(function (r) { setTimeout(r, ms); }); };

  // ── reveal on scroll ──────────────────────────────────────────────
  var revealIO = new IntersectionObserver(function (entries) {
    entries.forEach(function (e) {
      if (!e.isIntersecting) return;
      e.target.classList.add("in");
      revealIO.unobserve(e.target);
      e.target.dispatchEvent(new CustomEvent("revealed"));
    });
  }, { threshold: 0.18, rootMargin: "0px 0px -6% 0px" });
  $$("[data-reveal], [data-step]").forEach(function (el) { revealIO.observe(el); });

  // run fn once when el scrolls into view
  function onView(el, fn, threshold) {
    if (!el) return;
    var io = new IntersectionObserver(function (es) {
      if (es.some(function (e) { return e.isIntersecting; })) { io.disconnect(); fn(); }
    }, { threshold: threshold || 0.4 });
    io.observe(el);
  }
  // track visibility (for loops that should pause)
  function visibility(el) {
    var state = { on: false, wake: null };
    new IntersectionObserver(function (es) {
      state.on = es[0].isIntersecting;
      if (state.on && state.wake) { state.wake(); state.wake = null; }
    }, { threshold: 0.15 }).observe(el);
    state.wait = function () {
      if (state.on && !document.hidden) return Promise.resolve();
      return new Promise(function (r) { state.wake = r; });
    };
    document.addEventListener("visibilitychange", function () {
      if (!document.hidden && state.on && state.wake) { state.wake(); state.wake = null; }
    });
    return state;
  }

  // ── counters ──────────────────────────────────────────────────────
  function count(el) {
    var to = parseFloat(el.dataset.to), dec = parseInt(el.dataset.dec || (el.dataset.to.indexOf(".") > -1 ? el.dataset.to.split(".")[1].length : 0), 10);
    if (reduce) { el.textContent = to.toFixed(dec); return; }
    var t0 = performance.now(), dur = to > 100 ? 1600 : 1200;
    (function tick(t) {
      var p = Math.min(1, (t - t0) / dur), e = 1 - Math.pow(1 - p, 4);
      el.textContent = (to * e).toFixed(dec);
      if (p < 1) requestAnimationFrame(tick);
    })(t0);
  }
  $$(".count").forEach(function (el) { onView(el, function () { count(el); }, 0.6); });

  // ── pipeline rail progress ────────────────────────────────────────
  var pipe = $("#pipe");
  if (pipe && !reduce) {
    var ticking = false;
    var update = function () {
      ticking = false;
      var r = pipe.getBoundingClientRect(), vh = window.innerHeight;
      var p = Math.max(0, Math.min(1, (vh * 0.62 - r.top) / r.height));
      pipe.style.setProperty("--p", p.toFixed(4));
    };
    window.addEventListener("scroll", function () { if (!ticking) { ticking = true; requestAnimationFrame(update); } }, { passive: true });
    update();
  } else if (pipe) { pipe.style.setProperty("--p", 1); }

  // ── step 1: type the C ────────────────────────────────────────────
  var typeEl = $("[data-type]");
  if (typeEl) {
    var nodes = [], walker = document.createTreeWalker(typeEl, NodeFilter.SHOW_TEXT);
    while (walker.nextNode()) nodes.push({ n: walker.currentNode, t: walker.currentNode.nodeValue });
    if (!reduce) {
      nodes.forEach(function (o) { o.n.nodeValue = ""; });
      var codeEl = typeEl.querySelector("code");
      var cur = document.createElement("span"); cur.className = "cur"; codeEl.appendChild(cur);
      typeEl.closest("[data-step]").addEventListener("revealed", function () {
        var i = 0, j = 0;
        (function step() {
          if (i >= nodes.length) return;
          var o = nodes[i], chunk = o.t.charAt(j) === " " ? 2 : 1;
          j = Math.min(o.t.length, j + chunk);
          o.n.nodeValue = o.t.slice(0, j);
          (o.n.parentNode === codeEl ? o.n : o.n.parentNode).after(cur); // cursor follows the text, outside any colour span
          if (j >= o.t.length) { i++; j = 0; }
          setTimeout(step, o.t.charAt(j - 1) === "\n" ? 90 : 16);
        })();
      });
    }
  }

  // ── machine data (real bench function fn_08000230, objdump halfwords) ──
  var ROWS = [
    ["0000", "4b04", "ldr r3, [pc, #16]"],
    ["0002", "681a", "ldr r2, [r3, #0]"],
    ["0004", "4804", "ldr r0, [pc, #16]"],
    ["0006", "4350", "muls r0, r2"],
    ["0008", "4a04", "ldr r2, [pc, #16]"],
    ["000a", "1880", "adds r0, r0, r2"],
    ["000c", "6018", "str r0, [r3, #0]"],
    ["000e", "0040", "lsls r0, r0, #1"],
    ["0010", "0c40", "lsrs r0, r0, #17"],
    ["0012", "4770", "bx lr"]
  ];
  var WRONG = { 5: ["1810", "adds r0, r2, r0"], 8: ["0c00", "lsrs r0, r0, #16"] };
  var HEX = "0123456789abcdef";
  var rnd = function () { return HEX[(Math.random() * 16) | 0] + HEX[(Math.random() * 16) | 0]; };

  // ── step 4: byte grid ─────────────────────────────────────────────
  var bytes = $(".bytes");
  if (bytes) {
    ROWS.slice(0, 8).forEach(function (r) {
      [r[1].slice(0, 2), r[1].slice(2)].forEach(function (b) { var s = document.createElement("span"); s.textContent = b; bytes.appendChild(s); });
    });
    bytes.closest("[data-step]").addEventListener("revealed", function () {
      $$("span", bytes).forEach(function (s, k) { setTimeout(function () { s.classList.add("ok"); }, reduce ? 0 : 300 + k * 90); });
    });
  }

  // ── hero machine ──────────────────────────────────────────────────
  var machine = $("#machine");
  if (machine) {
    var list = $(".m-rows", machine), status = $(".m-status", machine), stamp = $(".m-stamp", machine), attempt = $(".m-attempt b", machine);
    var rows = ROWS.map(function (r) {
      var li = document.createElement("li"); li.className = "m-row";
      li.innerHTML = '<span class="m-off">' + r[0] + '</span><span class="tiles tgt"><span class="tile"></span><span class="tile"></span></span><span class="m-asm"></span><span class="tiles cand"><span class="tile"></span><span class="tile"></span></span><span class="m-mark"></span>';
      list.appendChild(li);
      return { li: li, t: $$(".tgt .tile", li), c: $$(".cand .tile", li), asm: $(".m-asm", li), mark: $(".m-mark", li), data: r };
    });
    var setStatus = function (state, text) { status.dataset.state = state; status.innerHTML = "<b>" + text + "</b>"; };
    var flip = async function (tile, final, scr) {
      tile.classList.remove("blank");
      for (var k = 0; k <= scr; k++) {
        tile.classList.remove("flip"); void tile.offsetWidth; tile.classList.add("flip");
        await sleep(80);
        tile.textContent = k < scr ? rnd() : final;
        await sleep(80);
      }
    };
    var setRow = function (row, hex, asm, cls) {
      row.c[0].textContent = hex.slice(0, 2); row.c[1].textContent = hex.slice(2);
      row.asm.textContent = asm; row.li.className = "m-row" + (cls ? " " + cls : "");
      row.mark.textContent = cls === "bad" ? "≠" : cls === "ok" ? "✓" : "";
    };
    var finalState = function () {
      rows.forEach(function (row) {
        var h = row.data[1];
        row.t[0].textContent = h.slice(0, 2); row.t[1].textContent = h.slice(2);
        setRow(row, h, row.data[2], "ok");
      });
      attempt.textContent = "2"; setStatus("ok", "MATCH ✓ 100%"); stamp.classList.add("on");
    };
    var blankAll = function () {
      rows.forEach(function (row) {
        row.t.concat(row.c).forEach(function (t) { t.textContent = "··"; t.classList.add("blank"); });
        row.asm.textContent = ""; row.li.className = "m-row"; row.mark.textContent = "";
      });
    };

    if (reduce) { finalState(); }
    else {
      var vis = visibility(machine);
      (async function loop() {
        for (;;) {
          await vis.wait();
          blankAll(); stamp.classList.remove("on", "off"); attempt.textContent = "1"; setStatus("idle", "Idle");
          await sleep(500);
          setStatus("load", "Reading ROM");
          await Promise.all(rows.map(function (row, i) {
            return sleep(i * 70).then(function () {
              row.asm.textContent = row.data[2];
              return Promise.all([flip(row.t[0], row.data[1].slice(0, 2), 2), flip(row.t[1], row.data[1].slice(2), 3)]);
            });
          }));
          await sleep(350);
          setStatus("load", "Compiling C");
          await Promise.all(rows.map(function (row, i) {
            var h = WRONG[i] ? WRONG[i][0] : row.data[1];
            return sleep(i * 70).then(function () { return Promise.all([flip(row.c[0], h.slice(0, 2), 2), flip(row.c[1], h.slice(2), 3)]); });
          }));
          await sleep(250);
          for (var i = 0; i < rows.length; i++) {
            var w = WRONG[i];
            setRow(rows[i], w ? w[0] : rows[i].data[1], w ? "got " + w[1] : rows[i].data[2], w ? "bad" : "ok");
            await sleep(60);
          }
          setStatus("bad", "PARTIAL · diff at +0x000a");
          await sleep(2200);
          await vis.wait();
          attempt.textContent = "2"; setStatus("load", "Retrying");
          var fixes = Object.keys(WRONG).map(function (k) {
            var row = rows[k];
            row.li.className = "m-row"; row.mark.textContent = ""; row.asm.textContent = row.data[2];
            return Promise.all([flip(row.c[0], row.data[1].slice(0, 2), 3), flip(row.c[1], row.data[1].slice(2), 4)]);
          });
          await Promise.all(fixes);
          for (var j = 0; j < rows.length; j++) { rows[j].li.className = "m-row"; }
          await sleep(120);
          for (var m = 0; m < rows.length; m++) { setRow(rows[m], rows[m].data[1], rows[m].data[2], "ok"); await sleep(55); }
          setStatus("ok", "MATCH ✓ 100%");
          stamp.classList.add("on");
          await sleep(3600);
          stamp.classList.add("off");
          await sleep(500);
        }
      })();
    }
  }

  // ── liar caught ───────────────────────────────────────────────────
  var scene = $("#liarScene");
  if (scene) {
    var play = function () { scene.classList.remove("play"); void scene.offsetWidth; scene.classList.add("play"); };
    onView(scene, play, 0.55);
    var rb = $("[data-replay]"); if (rb) rb.addEventListener("click", play);
  }

  // ── play to recover: static that heals region by region ───────────
  var screen = $(".screen");
  if (screen) {
    var c = document.createElement("canvas"); c.width = c.height = 64;
    var ctx = c.getContext("2d"), img = ctx.createImageData(64, 64);
    for (var p = 0; p < img.data.length; p += 4) {
      var v = (Math.random() * 255) | 0, tint = Math.random() < 0.06;
      img.data[p] = tint ? 154 : v; img.data[p + 1] = tint ? 154 : v; img.data[p + 2] = tint ? 255 : v; img.data[p + 3] = 255;
    }
    ctx.putImageData(img, 0, 0);
    screen.style.setProperty("--noise", "url(" + c.toDataURL() + ")");
    var tiles = $$(".static i", screen), logs = $$("[data-heal-log]"), looking = $("[data-looking]");
    var NAMES = ["status bar", "weapon", "walls and floor", "the face?"];
    var heal = function (k) {
      tiles.forEach(function (t) { if (+t.dataset.heal === k) t.classList.add("healed"); });
      logs.forEach(function (l) { if (+l.dataset.healLog === k) l.classList.add("done"); });
    };
    if (reduce) { [0, 1, 2, 3].forEach(heal); looking.textContent = "the face?"; }
    else {
      var pv = visibility(screen);
      (async function loop() {
        for (;;) {
          await pv.wait();
          await sleep(700);
          for (var k = 0; k < 4; k++) {
            looking.textContent = NAMES[k];
            await sleep(900);
            await pv.wait();
            heal(k);
            await sleep(700);
          }
          await sleep(3800);
          tiles.forEach(function (t) { t.classList.remove("healed"); });
          logs.forEach(function (l) { l.classList.remove("done"); });
          looking.textContent = NAMES[0];
          await sleep(900);
        }
      })();
    }
  }

  // ── tilt on role cards ────────────────────────────────────────────
  if (finePointer && !reduce) {
    $$("[data-tilt]").forEach(function (card) {
      var raf = 0;
      card.addEventListener("pointermove", function (e) {
        if (!card.classList.contains("in")) return;
        var r = card.getBoundingClientRect(), x = (e.clientX - r.left) / r.width - 0.5, y = (e.clientY - r.top) / r.height - 0.5;
        cancelAnimationFrame(raf);
        raf = requestAnimationFrame(function () {
          card.style.transform = "translateY(-8px) rotateX(" + (-y * 9).toFixed(2) + "deg) rotateY(" + (x * 11).toFixed(2) + "deg)";
        });
      });
      card.addEventListener("pointerleave", function () { cancelAnimationFrame(raf); card.style.transform = ""; });
    });
  }
})();
