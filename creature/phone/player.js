// Player 2: real mGBA WASM core, touch-first controller, honest states. No gameplay is ever simulated.
const $ = (id) => document.getElementById(id);
const root = document.documentElement;
const GBA_W = 240, GBA_H = 160, HUD_ROWS = 32; // GBADoom's status bar is the bottom 32 of 160 rows.
let core, coreReady, staged = null, running = false, paused = false, muted = false, wakeLock = null, status = null;
const held = new Map(); // button -> Set of sources (pointer ids, key codes)
const trackers = [];
const keyMap = {ArrowUp:'up', ArrowDown:'down', ArrowLeft:'left', ArrowRight:'right', KeyX:'a', KeyZ:'b', KeyA:'l', KeyS:'r', Enter:'start', Backspace:'select'};
const MB = (n) => (n / 1048576).toFixed(1);

/* ---------- Input mode: touch shows the overlay; keyboard and controller hide it and show a legend ---------- */
const LEGEND = {
  keys: [['←↑↓→', 'move'], ['Z', 'fire'], ['X', 'use'], ['A / S', 'strafe'], ['X + A/S', 'weapon'], ['Enter', 'menu'], ['⌫', 'map'], ['Esc', 'pause']],
  pad: [['L stick', 'move · strafe'], ['R stick', 'turn'], ['A · RT', 'fire'], ['X · B · LT', 'use'], ['LB / RB', 'strafe'], ['Y', 'weapon'], ['Menu', 'Doom menu'], ['View', 'map'], ['View + Menu', 'pause']],
};
function setInput(mode) {
  if (root.dataset.input === mode) return;
  root.dataset.input = mode;
  const items = LEGEND[mode] || [];
  $('legend').innerHTML = items.map(([k, v]) => `<span><kbd>${k}</kbd>${v}</span>`).join('');
  showLegend();
  if (root.dataset.state === 'ready' && staged?.origin !== 'local') $('gate-line').textContent = readyLine();
  layout();
}
let legendTimer;
function showLegend() { $('legend').classList.remove('fade'); clearTimeout(legendTimer); legendTimer = setTimeout(() => $('legend').classList.add('fade'), 7000); }
let toastTimer;
function toast(text) { $('toast').textContent = text; $('toast').classList.add('show'); clearTimeout(toastTimer); toastTimer = setTimeout(() => $('toast').classList.remove('show'), 3200); }

/* ---------- States ---------- */
const copy = {
  loading: ['CHARGING<br>THE LIGHTNING<span class="dot">.</span>', 'Loading the emulator and the game.'],
  ready: ['IT\'S ALIVE<span class="dot">.</span>', 'Doom, on your phone, in a Game Boy Advance emulator. Sound on. Turn sideways.'],
  norom: ['THE CREATURE IS STILL ON THE TABLE<span class="dot">.</span>', 'The patched ROM isn\'t published yet. Check back when the lightning hits.'],
  error: ['THAT DIDN\'T SURVIVE THE LIGHTNING<span class="dot">.</span>', 'Something went wrong.'],
};
function readyLine() {
  const mode = root.dataset.input;
  if (mode === 'touch') return copy.ready[1];
  return `Doom in a Game Boy Advance emulator, on whatever screen you've got. Sound on. ${mode === 'pad' ? 'Press A to start.' : 'Press Enter to start.'}`;
}
const signals = {loading: 'LOADING', ready: 'READY', norom: 'NO ROM YET', error: 'UNAVAILABLE', playing: 'PLAYING'};
function setState(state, line, note) {
  root.dataset.state = state;
  if (copy[state]) { $('gate-title').innerHTML = copy[state][0]; $('gate-line').textContent = line || (state === 'ready' ? readyLine() : copy[state][1]); }
  if (note !== undefined) $('gate-note').textContent = note;
  $('signal').textContent = paused && state === 'playing' ? 'PAUSED' : signals[state] || '';
  if (state === 'ready') requestAnimationFrame(() => $('start').focus({preventScroll: true}));
  layout();
}
function fail(error) {
  running = false; releaseAll();
  setState('error', error?.message || String(error));
  console.error(error);
}

/* ---------- Layout: the game as big as possible, controls beside it, never on the HUD unless forced ---------- */
const clamp = (v, lo, hi) => Math.max(lo, Math.min(hi, v));
function place(el, x, y, w, h) { Object.assign(el.style, {left: `${x}px`, top: `${y}px`, width: `${w}px`, height: `${h}px`}); }
function insets() {
  const s = getComputedStyle($('safe'));
  return {t: parseFloat(s.paddingTop) || 0, r: parseFloat(s.paddingRight) || 0, b: parseFloat(s.paddingBottom) || 0, l: parseFloat(s.paddingLeft) || 0};
}
function snap(scale) { // Prefer a whole-number scale when it costs under 6% of the size.
  const whole = Math.floor(scale);
  return whole >= 1 && whole / scale >= 0.94 ? whole : scale;
}
function layout() {
  const W = innerWidth, H = innerHeight, s = insets();
  const land = W > H;
  root.dataset.orient = land ? 'land' : 'port';
  const aw = W - s.l - s.r, ah = H - s.t - s.b;
  const els = {l: document.querySelector('[data-key=l]'), r: document.querySelector('[data-key=r]'), select: document.querySelector('[data-key=select]'), start: document.querySelector('[data-key=start]')};
  if (land) {
    const touch = root.dataset.input === 'touch';
    const c = Math.round(clamp(ah * 0.38, 104, 160));      // D-pad and FIRE/USE cluster size
    const gap = Math.round(clamp(ah * 0.035, 8, 18));
    const side = touch ? c + gap * 2 : 0;                   // column each cluster needs (none without touch)
    const fit = Math.min(aw / GBA_W, ah / GBA_H);
    const besideScale = Math.min(ah / GBA_H, (aw - 2 * side) / GBA_W);
    const scale = snap(Math.min(fit, Math.max(besideScale, fit * 0.8))); // shrink up to 20% to keep thumbs off the picture
    const gw = Math.round(GBA_W * scale), gh = Math.round(GBA_H * scale);
    const gx = Math.round(s.l + (aw - gw) / 2), gy = Math.round(s.t + (ah - gh) / 2);
    place($('screen'), gx, gy, gw, gh);
    const letterbox = gx - s.l;
    const overlap = Math.max(0, side - letterbox);
    root.dataset.overlap = overlap > 0 ? 'yes' : 'no';
    const colW = Math.max(side, letterbox);                 // column centre for each cluster
    const leftX = Math.round(s.l + (colW - c) / 2), rightX = Math.round(W - s.r - (colW + c) / 2);
    // Bottom of clusters: low for comfort; lifted above the HUD rows if the cluster would sit on the picture.
    let bottom = H - s.b - gap;
    if (overlap > 0) bottom = Math.min(bottom, gy + gh - Math.round(gh * HUD_ROWS / GBA_H) - gap);
    const shoulderH = Math.round(clamp(c * 0.32, 38, 52));
    const clusterY = Math.max(s.t + gap + shoulderH + gap * 2 + 34, bottom - c);
    place($('dpad'), leftX, clusterY, c, c);
    place($('actions'), rightX, clusterY, c, c);
    place(els.l, leftX, s.t + gap, c, shoulderH);
    place(els.r, rightX, s.t + gap, c, shoulderH);
    const sysW = Math.round(clamp(c * 0.5, 56, 76)), sysH = 30;
    const below = H - s.b - (gy + gh);
    if (below >= sysH + 8) { // Room under the picture: classic bottom-centre START / SELECT.
      const y = H - s.b - sysH - 4;
      place(els.select, W / 2 - sysW - 8, y, sysW, sysH);
      place(els.start, W / 2 + 8, y, sysW, sysH);
    } else { // Otherwise in the side columns, between the shoulder and the cluster, nearest the picture.
      const y = Math.round((s.t + gap + shoulderH + clusterY) / 2 - sysH / 2);
      place(els.select, leftX + c - sysW, y, sysW, sysH);
      place(els.start, rightX, y, sysW, sysH);
    }
    const p = 34;
    place($('pause'), Math.round(W / 2 - p / 2), Math.max(s.t, gy - p - 6) + 4, p, p);
    if (gy - p - 6 < s.t) $('pause').style.top = `${s.t + 4}px`;
    // Legend: a column in the letterbox when it fits, else a strip over the top of the picture that fades.
    const lg = $('legend');
    if (letterbox >= 150) { lg.dataset.place = 'column'; place(lg, s.l + 12, gy + 12, letterbox - 24, gh - 24); }
    else { lg.dataset.place = 'strip'; place(lg, gx + 8, gy + 8, gw - 16, 0); lg.style.height = 'auto'; }
  } else {
    const barH = 40;
    const bar = document.querySelector('.bar');
    place(bar, s.l + 14, s.t, aw - 28 - 44, barH); // leaves room for the pause button
    const maxGameH = Math.max(120, ah - barH - (root.dataset.input === 'touch' ? 300 : 120));
    const scale = snap(Math.min((aw - 16) / GBA_W, maxGameH / GBA_H));
    const gw = Math.round(GBA_W * scale), gh = Math.round(GBA_H * scale);
    const gx = Math.round(s.l + (aw - gw) / 2), gy = s.t + barH;
    place($('screen'), gx, gy, gw, gh);
    root.dataset.overlap = 'no';
    const top = gy + gh + 18, hintH = 22, bottom = H - s.b - hintH - 10;
    const shoulderH = 44, sysH = 32;
    const shoulderW = Math.round(clamp(aw * 0.34, 110, 150));
    place(els.l, s.l + 12, top, shoulderW, shoulderH);
    place(els.r, W - s.r - 12 - shoulderW, top, shoulderW, shoulderH);
    const zoneTop = top + shoulderH + 12, zoneBottom = bottom - sysH - 14;
    const c = Math.round(clamp(Math.min(aw * 0.42, zoneBottom - zoneTop), 112, 180));
    const cy = Math.round(zoneTop + (zoneBottom - zoneTop - c) / 2);
    const edge = Math.round(clamp(aw * 0.05, 10, 28));
    place($('dpad'), s.l + edge, cy, c, c);
    place($('actions'), W - s.r - edge - c, cy, c, c);
    const sysW = 78, sy = bottom - sysH;
    place(els.select, W / 2 - sysW - 10, sy, sysW, sysH);
    place(els.start, W / 2 + 10, sy, sysW, sysH);
    place($('pause'), W - s.r - 14 - 34, s.t + 3, 34, 34);
    place($('rotate'), s.l, H - s.b - hintH - 4, aw, hintH);
    $('legend').dataset.place = 'below'; place($('legend'), gx, gy + gh + 16, gw, 0); $('legend').style.height = 'auto';
  }
}

/* ---------- Input: one path for touch and keyboard, multi-touch, slide between directions ---------- */
function input(name, source, down) {
  if (down && (!running || paused || !core)) return;
  const sources = held.get(name) || new Set();
  const before = sources.size;
  down ? sources.add(source) : sources.delete(source);
  if (sources.size) held.set(name, sources); else held.delete(name);
  if (!before && sources.size) { core?.buttonPress(name); if (String(source).startsWith('p')) navigator.vibrate?.(8); }
  if (before && !sources.size) core?.buttonUnpress(name);
  document.querySelectorAll(`[data-key="${name}"]`).forEach(el => el.classList.toggle('on', sources.size > 0));
}
function releaseAll() {
  trackers.forEach(t => t.clear());
  for (const index of padHeld.keys()) padHeld.set(index, new Set());
  for (const [name, sources] of [...held]) for (const source of [...sources]) input(name, source, false);
}
// Tracks every pointer on an element and maps its position to a set of buttons, so a thumb can slide.
function track(el, resolve) {
  const active = new Map();
  const apply = (id, keys) => {
    const prev = active.get(id) || new Set();
    for (const k of prev) if (!keys.has(k)) input(k, `p${id}`, false);
    for (const k of keys) if (!prev.has(k)) input(k, `p${id}`, true);
    if (keys.size || active.has(id)) active.set(id, keys);
    el.classList.toggle('held', [...active.values()].some(set => set.size));
  };
  const at = (e) => { const r = el.getBoundingClientRect(); return new Set(resolve(e.clientX - r.left, e.clientY - r.top, r.width, r.height)); };
  const end = (e) => { if (!active.has(e.pointerId)) return; apply(e.pointerId, new Set()); active.delete(e.pointerId); el.classList.toggle('held', active.size > 0); };
  el.addEventListener('pointerdown', e => {
    e.preventDefault();
    if (e.pointerType === 'touch') setInput('touch');
    if (!running || paused) return;
    try { el.setPointerCapture(e.pointerId); } catch { /* Synthetic or already-released pointer. */ }
    active.set(e.pointerId, new Set());
    apply(e.pointerId, at(e));
  });
  el.addEventListener('pointermove', e => { if (active.has(e.pointerId)) { e.preventDefault(); apply(e.pointerId, at(e)); } });
  for (const type of ['pointerup', 'pointercancel', 'lostpointercapture']) el.addEventListener(type, end);
  el.addEventListener('contextmenu', e => e.preventDefault());
  trackers.push({clear() { for (const id of [...active.keys()]) apply(id, new Set()); active.clear(); el.classList.remove('held'); }});
}
// D-pad: eight 45° sectors around the centre, small dead zone; capture keeps tracking past the edge.
track($('dpad'), (x, y, w, h) => {
  const dx = x - w / 2, dy = y - h / 2;
  if (Math.hypot(dx, dy) < w * 0.13) return [];
  const sector = ((Math.round(Math.atan2(dy, dx) / (Math.PI / 4)) % 8) + 8) % 8;
  return [['right'], ['right', 'down'], ['down'], ['down', 'left'], ['left'], ['left', 'up'], ['up'], ['up', 'right']][sector];
});
// FIRE / USE: nearest button, both when the thumb sits on the seam between them.
track($('actions'), (x, y, w, h) => {
  const fire = [w * 0.27, h * 0.69], use = [w * 0.77, h * 0.27];
  const df = Math.hypot(x - fire[0], y - fire[1]), du = Math.hypot(x - use[0], y - use[1]);
  if (Math.abs(df - du) < w * 0.1) return ['b', 'a'];
  return df < du ? ['b'] : ['a'];
});
document.querySelectorAll('#controls button[data-key]').forEach(b => track(b, () => [b.dataset.key]));
// No callouts, selection, double-tap zoom or pinch on the play surface (iOS ignores user-scalable=no).
for (const el of [$('screen'), $('dpad'), $('actions'), ...document.querySelectorAll('#controls button[data-key]')]) {
  el.addEventListener('touchstart', e => { if (e.cancelable) e.preventDefault(); }, {passive: false});
}
document.addEventListener('gesturestart', e => e.preventDefault());
document.addEventListener('dblclick', e => e.preventDefault(), {passive: false});
document.addEventListener('contextmenu', e => { if (running) e.preventDefault(); });
window.addEventListener('keydown', e => {
  if (e.target instanceof HTMLInputElement) return;
  const name = keyMap[e.code];
  if (name && running && !paused) { e.preventDefault(); if (!e.repeat) setInput('keys'); input(name, e.code, true); }
  if (e.code === 'Escape' && running) paused ? closeSheet() : openSheet();
});
window.addEventListener('keyup', e => { const name = keyMap[e.code]; if (name && held.has(name)) { e.preventDefault(); input(name, e.code, false); } });
window.addEventListener('blur', releaseAll);
document.addEventListener('visibilitychange', () => { if (document.hidden) releaseAll(); else if (running) keepAwake(); });
for (const ev of ['resize', 'orientationchange']) window.addEventListener(ev, () => { releaseAll(); layout(); });
window.visualViewport?.addEventListener('resize', layout);

/* ---------- Controllers: Gamepad API standard mapping (Xbox, PlayStation, Switch Pro, 8BitDo, Steam Deck) ---------- */
// Doom on GBA: B fires, A uses (hold to run), L/R strafe, A+R / A+L change weapon. Positions follow the pad, not the letters.
const PAD_BUTTONS = {0: ['b'], 7: ['b'], 1: ['a'], 2: ['a'], 6: ['a'], 3: ['a', 'r'], 4: ['l'], 5: ['r'], 8: ['select'], 9: ['start'], 12: ['up'], 13: ['down'], 14: ['left'], 15: ['right']};
const padHeld = new Map(); // gamepad index -> Set of GBA buttons held
const padPrev = new Map(); // gamepad index -> previous pressed button indexes, for menu edges
let padLoop = 0;
function padKeys(gp) {
  const keys = new Set(), dead = 0.5, ax = gp.axes || [];
  gp.buttons.forEach((b, i) => { if ((b.pressed || b.value > 0.5) && PAD_BUTTONS[i]) PAD_BUTTONS[i].forEach(k => keys.add(k)); });
  if (ax[1] < -dead) keys.add('up'); if (ax[1] > dead) keys.add('down');
  if (ax[0] < -dead) keys.add('l'); if (ax[0] > dead) keys.add('r');       // left stick sideways: strafe
  if (ax[2] < -dead) keys.add('left'); if (ax[2] > dead) keys.add('right'); // right stick: turn
  return keys;
}
function pollPads() {
  padLoop = 0;
  const pads = [...(navigator.getGamepads?.() || [])].filter(Boolean);
  for (const gp of pads) {
    const pressed = new Set(gp.buttons.map((b, i) => (b.pressed || b.value > 0.5 ? i : -1)).filter(i => i >= 0));
    const prev = padPrev.get(gp.index) || new Set();
    const edge = i => pressed.has(i) && !prev.has(i);
    const ax = gp.axes || [];
    const stick = [ax[1] < -0.5 ? 12 : ax[1] > 0.5 ? 13 : -1, ax[0] < -0.5 ? 14 : ax[0] > 0.5 ? 15 : -1].filter(i => i >= 0);
    stick.forEach(i => pressed.add(100 + i));
    if (pressed.size || stick.length) { if (root.dataset.input !== 'pad') setInput('pad'); }
    const pauseCombo = (pressed.has(8) && pressed.has(9) && !(prev.has(8) && prev.has(9))) || edge(16);
    const menuOpen = !$('sheet').hidden || !running;
    if (pauseCombo && running) { setPadKeys(gp.index, new Set()); $('sheet').hidden ? openSheet() : closeSheet(); }
    else if (menuOpen) { setPadKeys(gp.index, new Set()); navigate(edge, i => pressed.has(100 + i) && !prev.has(100 + i)); }
    else setPadKeys(gp.index, padKeys(gp));
    padPrev.set(gp.index, pressed);
  }
  if (pads.length) padLoop = requestAnimationFrame(pollPads);
}
function setPadKeys(index, keys) {
  const prev = padHeld.get(index) || new Set();
  for (const k of prev) if (!keys.has(k)) input(k, `g${index}`, false);
  for (const k of keys) if (!prev.has(k)) input(k, `g${index}`, true);
  padHeld.set(index, keys);
}
// Controller-only menus: D-pad or stick moves focus, A presses, B goes back, Menu starts.
function navigate(edge, stickEdge) {
  const items = [...document.querySelectorAll('#sheet:not([hidden]) :is(button, a, summary, label.link-button), #gate :is(button, a, summary, label.link-button)')]
    .filter(el => el.offsetParent !== null && !el.closest('[hidden]') && (!$('sheet').hidden ? el.closest('#sheet') : true));
  if (!items.length) return;
  const at = items.indexOf(document.activeElement);
  const step = d => { const next = items[(at + d + items.length) % items.length] || items[0]; next.focus(); next.scrollIntoView({block: 'nearest'}); };
  if (edge(12) || edge(14) || stickEdge(12) || stickEdge(14)) step(at < 0 ? 1 : -1);
  if (edge(13) || edge(15) || stickEdge(13) || stickEdge(15)) step(1);
  if (edge(0)) (at >= 0 ? items[at] : items[0]).click();
  if (edge(1) && !$('sheet').hidden) closeSheet();
  if (edge(9) && root.dataset.state === 'ready' && $('sheet').hidden) play();
}
window.addEventListener('gamepadconnected', e => {
  toast(`Controller connected · ${e.gamepad.id.replace(/\s*\(.*$/, '').slice(0, 40) || 'gamepad'}`);
  setInput('pad');
  if (!padLoop) padLoop = requestAnimationFrame(pollPads);
});
window.addEventListener('gamepaddisconnected', e => {
  setPadKeys(e.gamepad.index, new Set()); padHeld.delete(e.gamepad.index); padPrev.delete(e.gamepad.index);
  toast('Controller disconnected');
  if (![...(navigator.getGamepads?.() || [])].some(Boolean)) setInput(matchMedia('(pointer: coarse)').matches ? 'touch' : 'keys');
});

/* ---------- Loading: progress for core and ROM; HTTP cache revalidates by ETag ---------- */
async function download(url, onProgress) {
  const res = await fetch(url);
  if (!res.ok) return {ok: false, status: res.status};
  const total = Number(res.headers.get('X-Uncompressed-Length') || res.headers.get('Content-Length')) || 0;
  onProgress(0, total);
  if (!res.body) { const buf = await res.arrayBuffer(); onProgress(buf.byteLength, buf.byteLength); return {ok: true, buffer: buf}; }
  const reader = res.body.getReader(), chunks = [];
  let got = 0;
  for (;;) {
    const {done, value} = await reader.read();
    if (done) break;
    chunks.push(value); got += value.byteLength; onProgress(got, Math.max(total, got));
  }
  const out = new Uint8Array(got);
  let at = 0; for (const c of chunks) { out.set(c, at); at += c.byteLength; }
  return {ok: true, buffer: out.buffer};
}
const progress = {core: [0, 1852057], rom: [0, 0]};
function showProgress() {
  const got = progress.core[0] + progress.rom[0], total = progress.core[1] + progress.rom[1];
  const pct = total ? Math.min(100, Math.round(got / total * 100)) : 0;
  $('progress').firstElementChild.style.width = `${pct}%`;
  $('progress').setAttribute('aria-valuenow', pct);
  const part = (label, [g, t]) => t ? `${label} ${g >= t ? '✓' : `${MB(g)}/${MB(t)} MB`}` : `${label} …`;
  $('progress-text').textContent = `${pct}% · ${part('Emulator', progress.core)} · ${part('Game', progress.rom)}`;
}
// Honest label: the agent-written share appears only when the server verified a real rebuild report for this ROM.
function romLabel() {
  const pct = status?.build?.pct_agent_code;
  return typeof pct === 'number'
    ? `This is the rebuilt game running in a browser emulator (mGBA core). ${pct}% of its game code was written by our agents and proven byte for byte.`
    : 'Doom in a browser emulator (mGBA core). This page doesn\'t vouch for how the ROM was built.';
}
function applyStatus(value) {
  status = value;
  $('sheet-label').textContent = romLabel();
  if (status?.rom && status.distribution_approved) {
    $('ways-download').innerHTML = '<a class="cta" href="game.gba" download="frankenstein-doom.gba">DOWNLOAD THE ROM</a>'
      + '<p class="fine">Runs in RetroArch (mGBA core) on any console that has it, or on a real Game Boy Advance from a flash cart. '
      + 'GBADoom is GPL-2.0: <a href="https://github.com/KarthikSubramanian07/Frankenstein/blob/main/lab/out/NOTICE.md" target="_blank" rel="noopener">source offer</a>.</p>';
  }
}
async function showQr() {
  const url = location.href.split('#')[0];
  $('qr-url').textContent = /^(localhost|127\.|\[::1\])/.test(location.hostname) ? `${url} (this address only works on this machine)` : url;
  if ($('qr').childElementCount) return;
  try {
    const {default: qrcode} = await import('./core/qrcode.mjs');
    const qr = qrcode(0, 'M'); qr.addData(url); qr.make();
    $('qr').innerHTML = qr.createSvgTag({cellSize: 4, margin: 3, scalable: true});
  } catch { $('qr').textContent = ''; }
}
$('ways').addEventListener('toggle', () => { if ($('ways').open) showQr(); });
// Offline play: registered after the first downloads, so the worker fills its cache from the HTTP cache.
function registerOffline() {
  if (!('serviceWorker' in navigator) || !window.isSecureContext) return;
  navigator.serviceWorker.register('sw.js').catch(error => console.warn('Offline cache unavailable', error));
}
async function boot() {
  setState('loading', undefined, romLabel());
  showProgress();
  try {
    if (!window.isSecureContext || !window.crossOriginIsolated) throw new Error('This page needs a secure host with cross-origin isolation (COOP/COEP headers). Open it from the supplied server, or from HTTPS with those headers.');
    const statusJob = fetch('status.json').then(r => (r.ok ? r.json() : null)).catch(() => null).then(applyStatus);
    const romJob = download('game.gba', (g, t) => { progress.rom = [g, t]; showProgress(); });
    const wasm = await download('core/mgba.wasm', (g, t) => { progress.core = [g, t || progress.core[1]]; showProgress(); });
    if (!wasm.ok) throw new Error('The emulator core is not installed on this host. In creature/phone run npm install --ignore-scripts, then npm run prepare:core.');
    coreReady = startCore(wasm.buffer);
    const [rom] = await Promise.all([romJob, coreReady, statusJob]);
    registerOffline();
    if (rom.ok) { stage(new Uint8Array(rom.buffer), 'demo'); return; }
    if (rom.status === 404) { setState('norom', undefined, 'Nothing to play yet, and nothing faked while you wait.'); return; }
    throw new Error(`The game download failed (HTTP ${rom.status}). Try again in a moment.`);
  } catch (error) { fail(error); }
}
async function startCore(wasmBinary) {
  if (core) return core;
  const {default: mGBA} = await import('./core/mgba.js');
  const module = await mGBA({canvas: $('game'), wasmBinary, locateFile: name => new URL(`./core/${name}`, import.meta.url).href,
    printErr: message => console.warn('[mGBA]', message)});
  await module.FSInit();
  module.toggleInput(false); // One input path for touch and keyboard; no double presses.
  core = module;
  return module;
}
function stage(bytes, origin) {
  if (!bytes.byteLength || bytes.byteLength > 32 * 1024 * 1024) throw new Error('That isn\'t a usable .gba file (empty, or over 32 MB).');
  const path = `${core.filePaths().gamePath}/frankenstein.gba`; // Fixed safe filename; user paths never reach the emulator FS.
  core.FS.writeFile(path, bytes);
  staged = {path, origin};
  setState('ready', undefined, origin === 'local' ? 'Your file. It stays on this device.' : romLabel());
}
async function pickFile(file) {
  if (!file) return;
  try {
    if (!file.name.toLowerCase().endsWith('.gba')) throw new Error('Choose a .gba game file.');
    if (!core) { setState('loading', 'Loading the emulator.'); await (coreReady || Promise.reject(new Error('The emulator core is not available on this host.'))); }
    stage(new Uint8Array(await file.arrayBuffer()), 'local');
    if (running) { closeSheet(); play(); }
  } catch (error) { fail(error); }
}

/* ---------- One-tap start: sound, full screen, landscape lock (each optional) ---------- */
function play() {
  if (!core || !staged) return;
  releaseAll();
  // Full screen and orientation lock must start inside the tap. iPhone Safari has neither; that's fine.
  if (!document.fullscreenElement && !new URLSearchParams(location.search).has('windowed')) {
    const el = document.documentElement, request = el.requestFullscreen || el.webkitRequestFullscreen;
    try {
      Promise.resolve(request?.call(el, {navigationUI: 'hide'}))
        .then(() => screen.orientation?.lock?.('landscape')).catch(() => {});
    } catch { /* No full screen here. */ }
  }
  if (!core.loadGame(staged.path)) { fail(new Error('The emulator could not start this ROM. It must be the assembled game: engine plus the shareware WAD.')); return; }
  core.SDL2?.audioContext?.resume?.().catch(() => {});
  core.setVolume(muted ? 0 : 1);
  running = true; paused = false;
  setState('playing');
  keepAwake();
  syncSheet();
}
async function keepAwake() { try { if (!wakeLock || wakeLock.released) wakeLock = await navigator.wakeLock?.request('screen'); } catch { /* Optional. */ } }

/* ---------- Sheet: pause, sound, full screen, credits ---------- */
function syncSheet() {
  $('mute').textContent = muted ? 'SOUND OFF' : 'SOUND ON';
  const canFs = Boolean(document.documentElement.requestFullscreen || document.documentElement.webkitRequestFullscreen);
  $('fullscreen').hidden = !canFs;
  $('fullscreen').textContent = document.fullscreenElement ? 'EXIT FULL SCREEN' : 'FULL SCREEN';
  const playing = root.dataset.state === 'playing';
  $('sheet-title').textContent = playing ? 'PAUSED' : 'PLAYER 2';
  $('sheet-sub').textContent = playing ? 'The monsters will wait.' : 'How to play, and whose work this is.';
}
function openSheet() {
  releaseAll();
  if (running && !paused) { core.pauseGame(); paused = true; $('signal').textContent = 'PAUSED'; }
  syncSheet();
  $('sheet').hidden = false;
  $('sheet').scrollTop = 0;
  (running ? $('resume') : $('close-sheet')).focus({preventScroll: true});
}
function closeSheet() {
  $('sheet').hidden = true;
  if (running && paused) { core.SDL2?.audioContext?.resume?.().catch(() => {}); core.resumeGame(); paused = false; $('signal').textContent = 'PLAYING'; }
}
$('start').addEventListener('click', play);
$('retry').addEventListener('click', () => location.reload());
$('rom').addEventListener('change', e => pickFile(e.target.files?.[0]));
$('rom-sheet').addEventListener('change', e => pickFile(e.target.files?.[0]));
$('pause').addEventListener('click', openSheet);
$('resume').addEventListener('click', closeSheet);
$('close-sheet').addEventListener('click', closeSheet);
document.querySelectorAll('[data-open-sheet]').forEach(b => b.addEventListener('click', openSheet));
$('mute').addEventListener('click', () => { muted = !muted; core?.setVolume(muted ? 0 : 1); syncSheet(); });
$('fullscreen').addEventListener('click', async () => {
  try {
    if (document.fullscreenElement) await document.exitFullscreen();
    else { await document.documentElement.requestFullscreen({navigationUI: 'hide'}); await screen.orientation?.lock?.('landscape').catch(() => {}); }
  } catch { /* Unsupported. */ }
  syncSheet();
});
document.addEventListener('fullscreenchange', () => { syncSheet(); layout(); });

for (const ev of ['pointerdown', 'keydown']) window.addEventListener(ev, () => { if (running && !paused) core?.SDL2?.audioContext?.resume?.().catch(() => {}); }, {capture: true});
document.querySelector('#controls').addEventListener('pointerdown', e => { if (e.pointerType === 'touch') setInput('touch'); });
setInput(matchMedia('(pointer: coarse)').matches ? 'touch' : 'keys');
if ([...(navigator.getGamepads?.() || [])].some(Boolean)) padLoop = requestAnimationFrame(pollPads);
layout();
boot();
