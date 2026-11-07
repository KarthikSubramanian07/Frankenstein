// For judges: phone menu, copy buttons, the proof cards' small animations and the track rail's current-section highlight.
// Everything renders its final state without JS or with reduced motion; animation only adds the reveal.
(function () {
  'use strict';
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  var $$ = function (s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); };

  // ── phone menu (same behaviour as the home page) ──
  var menu = document.querySelector('.menu-btn'), nav = document.querySelector('.nav');
  if (menu && nav) {
    var close = function () { nav.classList.remove('open'); menu.setAttribute('aria-expanded', 'false'); };
    menu.addEventListener('click', function () {
      menu.setAttribute('aria-expanded', nav.classList.toggle('open') ? 'true' : 'false');
    });
    $$('.nav-links a').forEach(function (a) { a.addEventListener('click', close); });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && nav.classList.contains('open')) { close(); menu.focus(); } });
  }

  // ── copy agent addresses ──
  if (navigator.clipboard) {
    $$('button[data-copy]').forEach(function (b) {
      b.hidden = false;
      b.setAttribute('aria-label', 'Copy the address of ' + b.parentElement.querySelector('b').textContent);
      b.addEventListener('click', function () {
        navigator.clipboard.writeText(b.dataset.copy).then(function () {
          b.textContent = 'Copied';
          setTimeout(function () { b.textContent = 'Copy'; }, 1600);
        });
      });
    });
  }

  // ── the cartridge meter: one cell per game function, address order; proved ones are mint ──
  var meter = document.querySelector('.meter');
  var card = document.querySelector('.progress');
  if (meter && card) {
    var total = +card.dataset.total || 568;
    var on = {};
    (card.dataset.cells || '').split(/\s+/).forEach(function (n) { if (n) on[n] = true; });
    var frag = document.createDocumentFragment(), k = 0;
    for (var i = 0; i < total; i++) {
      var c = document.createElement('i');
      if (on[i]) { c.className = 'on'; c.style.setProperty('--d', (k++ * 14) + 'ms'); }
      frag.appendChild(c);
    }
    meter.appendChild(frag);
    if (reduce) meter.classList.add('lit');
  }

  // ── reveals: meter fill, count-up, stamps, Snap log ──
  $$('.stamp').forEach(function (s) { if (!reduce) s.classList.add('pre'); });
  $$('.log li').forEach(function (li, i) { if (!reduce) { li.classList.add('pre'); li.style.setProperty('--d', (i * 160) + 'ms'); } });

  function countUp(el) {
    var to = +el.dataset.to, t0 = null;
    el.textContent = '0';
    function step(t) {
      if (!t0) t0 = t;
      var p = Math.min(1, (t - t0) / 1100), e = 1 - Math.pow(1 - p, 3);
      el.textContent = String(Math.round(to * e));
      if (p < 1) requestAnimationFrame(step);
    }
    requestAnimationFrame(step);
  }

  if (!reduce && 'IntersectionObserver' in window) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) {
        if (!e.isIntersecting) return;
        var el = e.target;
        if (el.classList.contains('progress')) {
          var m = el.querySelector('.meter'); if (m) m.classList.add('lit');
          var n = el.querySelector('.count'); if (n) countUp(n);
        }
        $$('.stamp', el).forEach(function (s) { setTimeout(function () { s.classList.add('on'); }, 250); });
        $$('.log li', el).forEach(function (li) { li.classList.add('in'); });
        io.unobserve(el);
      });
    }, { threshold: 0.35 });
    $$('.pc').forEach(function (el) { io.observe(el); });
  } else {
    $$('.stamp').forEach(function (s) { s.classList.add('on'); });
    $$('.log li').forEach(function (li) { li.classList.add('in'); });
    if (meter) meter.classList.add('lit');
  }

  // ── rail: highlight the track in view; keep it visible in the phone jump bar ──
  var links = $$('.rail a');
  var byId = {};
  links.forEach(function (a) { byId[a.getAttribute('href').slice(1)] = a; });
  var current = null;
  function setCurrent(id) {
    if (id === current || !byId[id]) return;
    if (current && byId[current]) byId[current].removeAttribute('aria-current');
    current = id;
    var a = byId[id];
    a.setAttribute('aria-current', 'true');
    var rail = a.closest('.rail');
    if (rail && rail.scrollWidth > rail.clientWidth) {
      rail.scrollTo({ left: a.offsetLeft - 24, behavior: reduce ? 'auto' : 'smooth' });
    }
  }
  if ('IntersectionObserver' in window && links.length) {
    var seen = {};
    var tio = new IntersectionObserver(function (entries) {
      entries.forEach(function (e) { seen[e.target.id] = e.isIntersecting ? e.boundingClientRect.top : null; });
      var best = null, bestTop = Infinity;
      Object.keys(seen).forEach(function (id) {
        var top = seen[id];
        if (top !== null && Math.abs(top) < bestTop) { bestTop = Math.abs(top); best = id; }
      });
      if (best) setCurrent(best);
    }, { rootMargin: '-35% 0px -55% 0px' });
    $$('.track').forEach(function (t) { tio.observe(t); });
  }
})();
// open a collapsed proof when a link points into it
(function () {
  function openFor(hash) {
    var el = hash && document.getElementById(hash.slice(1));
    var d = el && el.closest('details');
    if (d && !d.open) d.open = true;
  }
  document.addEventListener('click', function (e) {
    var a = e.target.closest('a[href^="#"]');
    if (a) openFor(a.getAttribute('href'));
  });
  window.addEventListener('hashchange', function () { openFor(location.hash); });
  openFor(location.hash);
})();
