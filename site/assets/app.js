// Frankenstein site motion. Vanilla JS for everything that must work; GSAP + ScrollTrigger (cdnjs) for
// scroll-scrubbed polish when it loads. Transform/opacity only; everything pauses off-screen; reduced motion
// gets the final states.
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
  $$("[data-reveal], .panel").forEach(function (el) { revealIO.observe(el); });
  $$(".panel").forEach(function (p, i) { p.style.setProperty("--n", i); });
  $$(".tags li").forEach(function (li, k) { li.style.setProperty("--k", k); });

  function onView(el, fn, threshold) {
    if (!el) return;
    var io = new IntersectionObserver(function (es) {
      if (es.some(function (e) { return e.isIntersecting; })) { io.disconnect(); fn(); }
    }, { threshold: threshold || 0.4 });
    io.observe(el);
  }
  function visibility(el) {
    var st = { on: false, wake: null };
    new IntersectionObserver(function (es) {
      st.on = es[0].isIntersecting;
      if (st.on && st.wake) { st.wake(); st.wake = null; }
    }, { threshold: 0.1 }).observe(el);
    document.addEventListener("visibilitychange", function () {
      if (!document.hidden && st.on && st.wake) { st.wake(); st.wake = null; }
    });
    st.wait = function () {
      if (st.on && !document.hidden) return Promise.resolve();
      return new Promise(function (r) { st.wake = r; });
    };
    return st;
  }

  // ── menu (small widths) ───────────────────────────────────────────
  var menu = $(".menu-btn"), nav = $(".nav");
  if (menu) {
    menu.addEventListener("click", function () {
      var open = nav.classList.toggle("open"); menu.setAttribute("aria-expanded", open ? "true" : "false");
    });
    $$(".nav-links a").forEach(function (a) { a.addEventListener("click", function () { nav.classList.remove("open"); menu.setAttribute("aria-expanded", "false"); }); });
    document.addEventListener("keydown", function (e) { if (e.key === "Escape" && nav.classList.contains("open")) { nav.classList.remove("open"); menu.setAttribute("aria-expanded", "false"); menu.focus(); } });
  }

  // ── counters ──────────────────────────────────────────────────────
  function count(el) {
    var to = parseFloat(el.dataset.to);
    var dec = el.dataset.dec ? parseInt(el.dataset.dec, 10) : (el.dataset.to.split(".")[1] || "").length;
    if (reduce) { el.textContent = to.toFixed(dec); return; }
    var t0 = performance.now(), dur = to > 100 ? 1700 : 1300;
    (function tick(t) {
      var p = Math.min(1, (t - t0) / dur), e = 1 - Math.pow(1 - p, 4);
      el.textContent = (to * e).toFixed(dec);
      if (p < 1) requestAnimationFrame(tick);
    })(t0);
  }
  $$(".count").forEach(function (el) { onView(el, function () { count(el); }, 0.6); });

  // ── hero: marbles rolling along the chute ────────────────────────
  var stage = $(".hero-stage");
  if (stage) {
    var holder = $(".marbles", stage), main = $("#trackMain"), lieP = $("#trackLie");
    var VBW = 1584, VBH = 672;
    var colors = ["#EDE6D2", "#CFE6B5", "#B9AEEA", "#F2E7C9", "#A7DCC4", "#E9E0C9"];
    var place = function (el, p) { el.style.transform = "translate(" + (p.x / VBW * holder.clientWidth) + "px," + (p.y / VBH * holder.clientHeight) + "px)"; };
    if (reduce) {
      [0.12, 0.38, 0.72, 0.9].forEach(function (f, k) {
        var m = document.createElement("i"); m.className = "marble"; m.style.setProperty("--c", colors[k]); m.style.opacity = 1;
        holder.appendChild(m); place(m, main.getPointAtLength(main.getTotalLength() * f));
      });
    } else {
      var lenMain = main.getTotalLength(), lenLie = lieP.getTotalLength(), forkAt = 0;
      // where the lie track leaves the main one (closest point to its start)
      var s0 = lieP.getPointAtLength(0), best = 1e9;
      for (var d = 0; d < lenMain; d += 4) { var q = main.getPointAtLength(d), dd = (q.x - s0.x) * (q.x - s0.x) + (q.y - s0.y) * (q.y - s0.y); if (dd < best) { best = dd; forkAt = d; } }
      var balls = [], N = 7, period = 9000, hv = visibility(stage);
      for (var k = 0; k < N; k++) {
        var m = document.createElement("i"); m.className = "marble";
        var liar = k === 3;
        m.style.setProperty("--c", liar ? "#F07264" : colors[k % colors.length]);
        holder.appendChild(m);
        balls.push({ el: m, offset: k / N, liar: liar });
      }
      var t0 = performance.now(), paused = 0, last = t0;
      var frame = function (now) {
        if (!hv.on || document.hidden) { paused += now - last; last = now; requestAnimationFrame(frame); return; }
        last = now;
        var t = (now - t0 - paused) / period;
        balls.forEach(function (b) {
          var f = (t + b.offset) % 1, d, p, o = 1;
          if (b.liar && f * lenMain > forkAt) {
            var g = Math.min(1, (f * lenMain - forkAt) / lenLie);
            p = lieP.getPointAtLength(g * lenLie);
            o = g > 0.92 ? Math.max(0, 1 - (g - 0.92) / 0.08 * 0.6) : 1;
          } else {
            d = f * lenMain; p = main.getPointAtLength(d);
            o = f < 0.04 ? f / 0.04 : f > 0.94 ? (1 - f) / 0.06 : 1;
          }
          place(b.el, p); b.el.style.opacity = o;
        });
        requestAnimationFrame(frame);
      };
      requestAnimationFrame(frame);
    }
  }

  // ── referee handheld: byte-match LCD (real bench function fn_08000230) ──
  var ROWS = [
    ["0000", "4b04", "ldr r3,[pc,#16]"], ["0002", "681a", "ldr r2,[r3,#0]"], ["0004", "4804", "ldr r0,[pc,#16]"],
    ["0006", "4350", "muls r0,r2"], ["0008", "4a04", "ldr r2,[pc,#16]"], ["000a", "1880", "adds r0,r0,r2"],
    ["000c", "6018", "str r0,[r3,#0]"], ["000e", "0040", "lsls r0,r0,#1"], ["0010", "0c40", "lsrs r0,r0,#17"], ["0012", "4770", "bx lr"]
  ];
  var WRONG = { 5: ["1810", "adds r0,r2,r0"], 8: ["0c00", "lsrs r0,r0,#16"] };
  var HEX = "0123456789abcdef", rnd = function () { return HEX[(Math.random() * 16) | 0] + HEX[(Math.random() * 16) | 0]; };
  var machine = $("#machine");
  if (machine) {
    var list = $(".lcd-rows", machine), status = $(".lcd-status", machine), stamp = $(".lcd-stamp", machine);
    var attempt = $(".lcd-attempt", machine), asmEl = $(".lcd-asm", machine);
    var rows = ROWS.map(function (r) {
      var li = document.createElement("li"); li.className = "lcd-row";
      li.innerHTML = "<span>" + r[0] + "</span><span class='t g'><span></span><span></span></span><span class='t c'><span></span><span></span></span><span class='m'></span>";
      list.appendChild(li);
      return { li: li, g: $$(".g span", li), c: $$(".c span", li), m: $(".m", li), data: r };
    });
    var setStatus = function (st, txt) { status.dataset.state = st; status.textContent = txt; };
    var flip = async function (tile, final, scr) {
      tile.classList.remove("blank");
      for (var k = 0; k <= scr; k++) {
        tile.classList.remove("flip"); void tile.offsetWidth; tile.classList.add("flip");
        await sleep(80); tile.textContent = k < scr ? rnd() : final; await sleep(80);
      }
    };
    var mark = function (row, hex, cls) {
      row.c[0].textContent = hex.slice(0, 2); row.c[1].textContent = hex.slice(2);
      row.li.className = "lcd-row" + (cls ? " " + cls : ""); row.m.textContent = cls === "bad" ? "X" : cls === "ok" ? "=" : "";
    };
    var final = function () {
      rows.forEach(function (r) { var h = r.data[1]; r.g[0].textContent = h.slice(0, 2); r.g[1].textContent = h.slice(2); mark(r, h, "ok"); });
      attempt.textContent = "TRY 2"; setStatus("ok", "MATCH"); stamp.classList.add("on");
    };
    if (reduce) final();
    else {
      var mv = visibility(machine);
      (async function loop() {
        for (;;) {
          await mv.wait();
          rows.forEach(function (r) { r.g.concat(r.c).forEach(function (t) { t.textContent = "--"; t.classList.add("blank"); }); r.li.className = "lcd-row"; r.m.textContent = ""; });
          stamp.classList.remove("on"); attempt.textContent = "TRY 1"; asmEl.textContent = ""; setStatus("idle", "WAKING UP");
          await sleep(600);
          setStatus("load", "READ ROM");
          await Promise.all(rows.map(function (r, i) { return sleep(i * 70).then(function () { return Promise.all([flip(r.g[0], r.data[1].slice(0, 2), 2), flip(r.g[1], r.data[1].slice(2), 3)]); }); }));
          setStatus("load", "COMPILE C");
          await Promise.all(rows.map(function (r, i) { var h = WRONG[i] ? WRONG[i][0] : r.data[1]; return sleep(i * 70).then(function () { return Promise.all([flip(r.c[0], h.slice(0, 2), 2), flip(r.c[1], h.slice(2), 3)]); }); }));
          for (var i = 0; i < rows.length; i++) { mark(rows[i], WRONG[i] ? WRONG[i][0] : rows[i].data[1], WRONG[i] ? "bad" : "ok"); await sleep(60); }
          setStatus("bad", "PARTIAL"); asmEl.textContent = "+0A " + WRONG[5][1];
          await sleep(2300); await mv.wait();
          attempt.textContent = "TRY 2"; setStatus("load", "RETRY"); asmEl.textContent = "";
          await Promise.all(Object.keys(WRONG).map(function (k) { var r = rows[k]; r.li.className = "lcd-row"; r.m.textContent = ""; return Promise.all([flip(r.c[0], r.data[1].slice(0, 2), 3), flip(r.c[1], r.data[1].slice(2), 4)]); }));
          for (var j = 0; j < rows.length; j++) { mark(rows[j], rows[j].data[1], "ok"); await sleep(50); }
          setStatus("ok", "MATCH"); asmEl.textContent = "20 B IDENTICAL"; stamp.classList.add("on");
          await sleep(3800);
        }
      })();
    }
  }

  // ── chapter 2: the chat ───────────────────────────────────────────
  var chat = $("#chat");
  if (chat) {
    var typing = $(".typing", chat);
    if (reduce) { $$(".msg", chat).forEach(function (m) { m.classList.add("on"); }); typing.classList.add("gone"); }
    else onView(chat, async function () {
      await sleep(500); $(".msg.me", chat).classList.add("on");
      await sleep(600); typing.classList.add("on");
      await sleep(1500); typing.classList.add("gone"); $(".msg.reply", chat).classList.add("on");
    }, 0.5);
  }

  // ── chapter 3: type the C ─────────────────────────────────────────
  var typeEl = $("[data-type]");
  if (typeEl && !reduce) {
    var codeEl = typeEl.querySelector("code"), nodes = [], w = document.createTreeWalker(codeEl, NodeFilter.SHOW_TEXT);
    while (w.nextNode()) nodes.push({ n: w.currentNode, t: w.currentNode.nodeValue });
    nodes.forEach(function (o) { o.n.nodeValue = ""; });
    var cur = document.createElement("span"); cur.className = "cur"; codeEl.appendChild(cur);
    onView(typeEl, function () {
      var i = 0, j = 0;
      (function step() {
        if (i >= nodes.length) return;
        var o = nodes[i]; j = Math.min(o.t.length, j + (o.t.charAt(j) === " " ? 2 : 1));
        o.n.nodeValue = o.t.slice(0, j);
        (o.n.parentNode === codeEl ? o.n : o.n.parentNode).after(cur);
        if (j >= o.t.length) { i++; j = 0; }
        setTimeout(step, o.t.charAt(j - 1) === "\n" ? 110 : 22);
      })();
    }, 0.5);
  }

  // ── chapter 3: the lie (a marble rolls down, the referee stamps it) ──
  var scene = $("#liarScene");
  if (scene) {
    var lies = 0, lieEl = $("[data-lies]");
    var marble = document.createElement("i"); marble.className = "lie-marble"; scene.appendChild(marble);
    var patch = document.createElement("i"); patch.className = "lie-patch"; scene.appendChild(patch);
    // chute in the 1200x896 render, ending where the painted red marble sits
    var P = [[70, 40], [170, 150], [270, 330], [380, 480], [520, 610], [640, 650], [725, 660]];
    var at = function (f) {
      var seg = Math.min(P.length - 2, Math.floor(f * (P.length - 1))), u = f * (P.length - 1) - seg;
      return [P[seg][0] + (P[seg + 1][0] - P[seg][0]) * u, P[seg][1] + (P[seg + 1][1] - P[seg][1]) * u];
    };
    var running = false;
    var bump = function () { if (!lieEl) return; lieEl.textContent = ++lies; lieEl.classList.add("bump"); setTimeout(function () { lieEl.classList.remove("bump"); }, 380); };
    var play = function () {
      if (running) return; running = true;
      scene.classList.remove("hit");
      if (reduce) { scene.classList.add("hit"); bump(); running = false; return; }
      var img = $("img", scene), W = img.clientWidth, H = img.clientHeight, t0 = performance.now(), dur = 1300;
      patch.style.opacity = 1; marble.style.opacity = 1;
      (function roll(now) {
        var f = Math.min(1, (now - t0) / dur), e = f * f * (3 - 2 * f), p = at(e);
        marble.style.transform = "translate(" + (p[0] / 1200 * W) + "px," + (p[1] / 896 * H) + "px) rotate(" + (e * 540) + "deg)";
        if (f < 1) return requestAnimationFrame(roll);
        marble.style.transition = "opacity .25s"; patch.style.transition = "opacity .25s";
        marble.style.opacity = 0; patch.style.opacity = 0;
        setTimeout(function () { marble.style.transition = patch.style.transition = ""; }, 300);
        scene.classList.add("hit"); setTimeout(bump, 250); running = false;
      })(t0);
    };
    onView(scene, play, 0.55);
    var rb = $("[data-replay]"); if (rb) rb.addEventListener("click", play);
  }

  // ── chapter 4: SHA-1 gate ─────────────────────────────────────────
  var sha = $("#sha");
  if (sha) {
    var target = $("[data-sha]", sha).dataset.sha, typed = $(".sha-typed", sha);
    if (reduce) { typed.textContent = target; sha.classList.add("done"); }
    else onView(sha, function () {
      var i = 0;
      setTimeout(function tick() {
        i = Math.min(target.length, i + 1); typed.textContent = target.slice(0, i);
        if (i < target.length) setTimeout(tick, 30); else setTimeout(function () { sha.classList.add("done"); }, 250);
      }, 700);
    }, 0.5);
  }

  // ── tilt on sponsor panels ────────────────────────────────────────
  if (finePointer && !reduce) {
    $$("[data-tilt]").forEach(function (card) {
      var raf = 0;
      card.addEventListener("pointermove", function (e) {
        if (!card.classList.contains("in")) return;
        var r = card.getBoundingClientRect(), x = (e.clientX - r.left) / r.width - 0.5, y = (e.clientY - r.top) / r.height - 0.5;
        cancelAnimationFrame(raf);
        raf = requestAnimationFrame(function () { card.style.transform = "translateY(-8px) rotateX(" + (-y * 8).toFixed(2) + "deg) rotateY(" + (x * 10).toFixed(2) + "deg)"; });
      });
      card.addEventListener("pointerleave", function () { cancelAnimationFrame(raf); card.style.transform = ""; });
    });
  }

  // ── GSAP polish: parallax and stacking panels (only if the library loaded) ──
  window.addEventListener("load", function () {
    if (reduce || !window.gsap || !window.ScrollTrigger) return;
    var gsap = window.gsap; gsap.registerPlugin(window.ScrollTrigger);
    // iOS Safari: the address bar resizing the viewport must not re-run scroll animations (no jumps)
    window.ScrollTrigger.config({ ignoreMobileResize: true });
    // parallax the whole stage layer (art + marble track + marbles + labels) so they stay aligned
    var layer = $("[data-parallax]");
    if (layer) gsap.fromTo(layer, { scale: 1.06, yPercent: -2 }, { scale: 1, yPercent: 3, ease: "none", transformOrigin: "50% 60%", scrollTrigger: { trigger: ".hero-stage", start: "top bottom", end: "bottom top", scrub: true } });
    var mm = gsap.matchMedia();
    mm.add("(min-width: 901px)", function () {
      var panels = $$(".panel");
      panels.forEach(function (p, i) {
        var next = panels[i + 1]; if (!next) return;
        var shade = document.createElement("i"); shade.className = "shade"; p.appendChild(shade);
        var st = { trigger: next, start: "top 75%", end: "top 120px", scrub: true };
        gsap.to(p, { scale: 0.92, ease: "none", scrollTrigger: st });
        gsap.to(shade, { opacity: 0.22, ease: "none", scrollTrigger: st });
      });
    });
    gsap.fromTo(".handheld-wrap", { y: 60 }, { y: -20, ease: "none", scrollTrigger: { trigger: ".referee", start: "top bottom", end: "bottom top", scrub: true } });
  });
})();
