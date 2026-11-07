// Player 2: real mGBA WASM core, touch / keyboard / controller input, honest states. No gameplay is ever simulated.
import * as C from './controls.js';
const $ = (id) => document.getElementById(id);
const root = document.documentElement;
const GBA_W = 240, GBA_H = 160, HUD_ROWS = 32; // GBADoom's status bar is the bottom 32 of 160 rows.
let core, coreReady, staged = null, running = false, paused = false, muted = false, wakeLock = null, status = null;
const held = new Map(); // GBA button -> Set of sources
const trackers = [];
const MB = (n) => (n / 1048576).toFixed(1);
const profiles = {};
const P = (device) => (profiles[device] ??= C.profile(device));

/* ---------- Adaptive UI: the active input decides overlay, legend glyphs and hints ---------- */
const deviceFor = (mode) => (mode === 'pad' ? activePad() : mode === 'keys' ? 'keyboard' : 'touch');
function chips(device, inputs) { return inputs.slice(0, 2).map(i => C.glyph(device, i)).join(''); }
function renderLegend() {
  const mode = root.dataset.input, device = deviceFor(mode);
  if (mode === 'touch') { $('legend').innerHTML = ''; return; }
  const p = P(device), b = p.binds;
  const row = (inputs, text) => (inputs.length ? `<span>${chips(device, inputs)}${text}</span>` : '');
  const move = device === 'keyboard' ? [...b.fwd.slice(0, 1), ...b.turn_l.slice(0, 1), ...b.back.slice(0, 1), ...b.turn_r.slice(0, 1)] : [...b.fwd.slice(0, 1)];
  $('legend').innerHTML = [row(move, device === 'keyboard' ? 'move · turn' : 'move'), device === 'keyboard' ? '' : row(b.turn_l.slice(0, 1), 'turn'),
    row(b.fire, 'fire'), row(b.use, 'use'), row([...b.strafe_l.slice(0, 1), ...b.strafe_r.slice(0, 1)], 'strafe'), row(b.weapon_next, 'weapon'),
    row(b.menu, 'menu'), row(b.map, 'map'), row(b.pause, 'pause')].join('');
}
function setInput(mode, force) {
  if (root.dataset.input === mode && !force) return;
  root.dataset.input = mode;
  renderLegend();
  showLegend();
  updateChip();
  if (root.dataset.state === 'ready' && staged?.origin !== 'local') $('gate-line').innerHTML = readyLine();
  layout();
}
let legendTimer;
function showLegend() { $('legend').classList.remove('fade'); clearTimeout(legendTimer); legendTimer = setTimeout(() => $('legend').classList.add('fade'), 7000); }
let toastTimer;
function toast(text) { $('toast').textContent = text; $('toast').classList.add('show'); clearTimeout(toastTimer); toastTimer = setTimeout(() => $('toast').classList.remove('show'), 3200); }
function updateChip() {
  const device = deviceFor(root.dataset.input);
  const how = device === 'touch' || device === 'keyboard' ? 'this device' : C.padOverride() ? 'set by you' : 'detected';
  $('device-chip').innerHTML = `<span>CONTROLLER</span> ${C.DEVICES[device].name} <small>(${how}) · how you'll play</small>`;
}

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
  const press = mode === 'pad' ? C.glyph(activePad(), 'b0') : C.glyph('keyboard', 'Enter');
  return `Doom in a Game Boy Advance emulator, on whatever screen you've got. Sound on. Press ${press} to start.`;
}
const signals = {loading: 'LOADING', ready: 'READY', norom: 'NO ROM YET', error: 'UNAVAILABLE', playing: 'PLAYING'};
function setState(state, line, note) {
  root.dataset.state = state;
  if (copy[state]) { $('gate-title').innerHTML = copy[state][0]; if (line) $('gate-line').textContent = line; else $('gate-line').innerHTML = state === 'ready' ? readyLine() : copy[state][1]; }
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
  const els = {l: document.querySelector('[data-slot=l]'), r: document.querySelector('[data-slot=r]'), select: document.querySelector('[data-slot=select]'), start: document.querySelector('[data-slot=start]')};
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

/* ---------- Input: every source becomes input ids, the active profile turns them into GBA buttons ---------- */
// GBA level: reference-counted per source, so touch, keys and pads can overlap without stuck buttons.
function input(name, source, down) {
  if (down && (!running || paused || !core)) return;
  const sources = held.get(name) || new Set();
  const before = sources.size;
  down ? sources.add(source) : sources.delete(source);
  if (sources.size) held.set(name, sources); else held.delete(name);
  if (!before && sources.size) { core?.buttonPress(name); if (String(source).startsWith('touch')) navigator.vibrate?.(8); }
  if (before && !sources.size) core?.buttonUnpress(name);
}
const sourceKeys = new Map(); // source -> Set of GBA buttons it holds
function setSource(source, keys) {
  const prev = sourceKeys.get(source) || new Set();
  for (const k of prev) if (!keys.has(k)) input(k, source, false);
  for (const k of keys) if (!prev.has(k)) input(k, source, true);
  sourceKeys.set(source, new Set([...keys].filter(k => held.get(k)?.has(source))));
}
function releaseAll() {
  trackers.forEach(t => t.clear());
  keysDown.clear();
  for (const source of [...sourceKeys.keys()]) setSource(source, new Set());
  for (const [name, sources] of [...held]) for (const source of [...sources]) input(name, source, false);
  document.querySelectorAll('#controls .on').forEach(el => el.classList.remove('on'));
}
// Touch: each pointer maps to touch slots; the touch profile decides what each slot does.
const touchDown = new Map(); // pointer key -> Set of 't:slot'
function touchChanged() {
  const slots = new Set([...touchDown.values()].flatMap(set => [...set]));
  setSource('touch', C.resolve(P('touch'), slots).keys);
  document.querySelectorAll('#controls [data-slot]').forEach(el => el.classList.toggle('on', slots.has(`t:${el.dataset.slot}`)));
}
function track(el, resolve) {
  const active = new Set();
  const apply = (id, slots) => {
    if (slots.size) touchDown.set(`${el.id || el.dataset.slot}:${id}`, slots); else touchDown.delete(`${el.id || el.dataset.slot}:${id}`);
    touchChanged();
    el.classList.toggle('held', [...active].some(p => touchDown.has(`${el.id || el.dataset.slot}:${p}`)));
  };
  const at = (e) => { const r = el.getBoundingClientRect(); return new Set(resolve(e.clientX - r.left, e.clientY - r.top, r.width, r.height).map(s => `t:${s}`)); };
  const end = (e) => { if (!active.has(e.pointerId)) return; active.delete(e.pointerId); apply(e.pointerId, new Set()); };
  el.addEventListener('pointerdown', e => {
    e.preventDefault();
    if (e.pointerType === 'touch') setInput('touch');
    if (!running || paused) return;
    try { el.setPointerCapture(e.pointerId); } catch { /* Synthetic or already-released pointer. */ }
    active.add(e.pointerId);
    apply(e.pointerId, at(e));
  });
  el.addEventListener('pointermove', e => { if (active.has(e.pointerId)) { e.preventDefault(); apply(e.pointerId, at(e)); } });
  for (const type of ['pointerup', 'pointercancel', 'lostpointercapture']) el.addEventListener(type, end);
  el.addEventListener('contextmenu', e => e.preventDefault());
  trackers.push({clear() { for (const id of [...active]) { active.delete(id); apply(id, new Set()); } el.classList.remove('held'); }});
}
// D-pad: eight 45° sectors around the centre, small dead zone; capture keeps tracking past the edge.
track($('dpad'), (x, y, w, h) => {
  const dx = x - w / 2, dy = y - h / 2;
  if (Math.hypot(dx, dy) < w * 0.13) return [];
  const sector = ((Math.round(Math.atan2(dy, dx) / (Math.PI / 4)) % 8) + 8) % 8;
  return [['right'], ['right', 'down'], ['down'], ['down', 'left'], ['left'], ['left', 'up'], ['up'], ['up', 'right']][sector];
});
// FIRE / USE slots: nearest button, both when the thumb sits on the seam between them.
track($('actions'), (x, y, w, h) => {
  const fire = [w * 0.27, h * 0.69], use = [w * 0.77, h * 0.27];
  const df = Math.hypot(x - fire[0], y - fire[1]), du = Math.hypot(x - use[0], y - use[1]);
  if (Math.abs(df - du) < w * 0.1) return ['fire', 'use'];
  return df < du ? ['fire'] : ['use'];
});
document.querySelectorAll('#controls button[data-slot]').forEach(b => track(b, () => [b.dataset.slot]));
// Overlay labels follow the touch profile, so a remapped slot says what it now does.
function relabelTouch() {
  const p = P('touch');
  document.querySelectorAll('#controls [data-slot]').forEach(el => {
    const acts = C.actionsOf(p, `t:${el.dataset.slot}`);
    const b = el.querySelector('b'), small = el.querySelector('small');
    if (!b) return;
    b.textContent = acts.length ? acts.map(a => C.ACTIONS[a].label.replace(/^STRAFE L$/, '◀ STRAFE').replace(/^STRAFE R$/, 'STRAFE ▶')).join(' + ') : '—';
    if (small) small.textContent = acts.flatMap(a => C.ACTIONS[a].gba).map(k => k.toUpperCase()).join('+') || 'unmapped';
    el.setAttribute('aria-label', acts.length ? acts.map(a => C.ACTIONS[a].label).join(' and ') : 'Unmapped');
  });
}
// No callouts, selection, double-tap zoom or pinch on the play surface (iOS ignores user-scalable=no).
for (const el of [$('screen'), $('dpad'), $('actions'), ...document.querySelectorAll('#controls button[data-slot]')]) {
  el.addEventListener('touchstart', e => { if (e.cancelable) e.preventDefault(); }, {passive: false});
}
document.addEventListener('gesturestart', e => e.preventDefault());
document.addEventListener('dblclick', e => e.preventDefault(), {passive: false});
document.addEventListener('contextmenu', e => { if (running) e.preventDefault(); });
// Keyboard: held key codes through the keyboard profile. Esc always pauses or cancels a remap.
const keysDown = new Set();
window.addEventListener('keydown', e => {
  if (capture) { e.preventDefault(); if (e.code === 'Escape') endCapture(null, 'Cancelled.'); else if (capture.device === 'keyboard') endCapture(e.code); return; }
  if (e.target instanceof HTMLInputElement) return;
  if (e.code === 'Escape') { if (!$('howto').hidden) closeHowto(); else if (running) paused ? closeSheet() : openSheet(); return; }
  const p = P('keyboard');
  if (!Object.values(p.binds).some(list => list.includes(e.code)) || !running || paused) return;
  e.preventDefault();
  if (!e.repeat) setInput('keys');
  keysDown.add(e.code);
  const {keys, page} = C.resolve(p, keysDown);
  setSource('keys', keys);
  if (page.has('pause') && !e.repeat) openSheet();
});
window.addEventListener('keyup', e => {
  if (!keysDown.delete(e.code)) return;
  e.preventDefault();
  setSource('keys', C.resolve(P('keyboard'), keysDown).keys);
});
window.addEventListener('blur', releaseAll);
document.addEventListener('visibilitychange', () => { if (document.hidden) releaseAll(); else if (running) keepAwake(); });
for (const ev of ['resize', 'orientationchange']) window.addEventListener(ev, () => { releaseAll(); layout(); });
window.visualViewport?.addEventListener('resize', layout);

/* ---------- Controllers: Gamepad API standard mapping; the device family picks glyphs and profile ---------- */
const padPrev = new Map(); // gamepad index -> previous pressed input ids, for menu edges and remap capture
let padLoop = 0, detectedPad = null;
const activePad = () => C.padOverride() || detectedPad || 'generic';
function padInputs(gp) {
  const ids = new Set(), ax = gp.axes || [];
  gp.buttons.forEach((b, i) => { if (b.pressed || b.value > 0.5) ids.add(`b${i}`); });
  ax.slice(0, 4).forEach((v, i) => { if (v < -0.5) ids.add(`a${i}-`); if (v > 0.5) ids.add(`a${i}+`); });
  return ids;
}
function pollPads() {
  padLoop = 0;
  const pads = [...(navigator.getGamepads?.() || [])].filter(Boolean);
  for (const gp of pads) {
    const now = padInputs(gp), prev = padPrev.get(gp.index) || new Set();
    const edge = id => now.has(id) && !prev.has(id);
    padPrev.set(gp.index, now);
    if (now.size && root.dataset.input !== 'pad') setInput('pad');
    if (capture) { if (C.DEVICES[capture.device].pad) { const hit = [...now].find(id => !prev.has(id)); if (hit) endCapture(hit); } continue; }
    const pauseCombo = (now.has('b8') && now.has('b9') && !(prev.has('b8') && prev.has('b9'))) || (running && C.resolve(P(activePad()), [...now].filter(edge)).page.has('pause'));
    const menuOpen = !$('sheet').hidden || !$('howto').hidden || !running;
    if (pauseCombo && running) { setSource(`pad${gp.index}`, new Set()); $('sheet').hidden ? openSheet() : closeSheet(); }
    else if (menuOpen) { setSource(`pad${gp.index}`, new Set()); navigate(edge); }
    else setSource(`pad${gp.index}`, C.resolve(P(activePad()), now).keys);
  }
  if (pads.length) padLoop = requestAnimationFrame(pollPads);
}
// Controller-only menus: D-pad or left stick moves focus, south button presses, east goes back, Menu starts.
function navigate(edge) {
  const scope = !$('howto').hidden ? '#howto' : !$('sheet').hidden ? '#sheet' : '#gate';
  const items = [...document.querySelectorAll(`${scope} :is(button, a, summary, label.link-button)`)].filter(el => el.offsetParent !== null && !el.closest('[hidden]') && !el.disabled);
  if (!items.length) return;
  const at = items.indexOf(document.activeElement);
  const step = d => { const next = items[(at + d + items.length) % items.length] || items[0]; next.focus(); next.scrollIntoView({block: 'nearest'}); };
  if (edge('b12') || edge('b14') || edge('a1-') || edge('a0-')) step(at < 0 ? 1 : -1);
  if (edge('b13') || edge('b15') || edge('a1+') || edge('a0+')) step(1);
  if (edge('b0')) (at >= 0 ? items[at] : items[0]).click();
  if (edge('b1')) { if (!$('howto').hidden) closeHowto(); else if (!$('sheet').hidden) closeSheet(); }
  if (edge('b9') && root.dataset.state === 'ready' && $('sheet').hidden && $('howto').hidden) play();
}
window.addEventListener('gamepadconnected', e => {
  detectedPad = C.detectPad(e.gamepad.id);
  const name = e.gamepad.id.replace(/\s*\(.*$/, '').replace(/^[0-9a-f]{4}-[0-9a-f]{4}-/i, '').slice(0, 32);
  toast(`Controller connected · ${C.DEVICES[activePad()].name}${name ? ` (${name})` : ''}`);
  setInput('pad', true);
  if (!padLoop) padLoop = requestAnimationFrame(pollPads);
});
window.addEventListener('gamepaddisconnected', e => {
  setSource(`pad${e.gamepad.index}`, new Set()); padPrev.delete(e.gamepad.index);
  toast('Controller disconnected');
  if (![...(navigator.getGamepads?.() || [])].some(Boolean)) { detectedPad = null; setInput(matchMedia('(pointer: coarse)').matches ? 'touch' : 'keys'); }
});

/* ---------- Remap: tap an action, press any key, button or touch control within 5 s ---------- */
let capture = null;
function startCapture(device, action) {
  endCapture(null);
  releaseAll();
  const what = C.DEVICES[device].pad ? 'a button on the controller' : device === 'keyboard' ? 'a key' : 'a touch control in the picture';
  capture = {device, action, left: 5};
  const tick = () => {
    if (!capture) return;
    $('remap-prompt').textContent = `Press ${what} for ${C.ACTIONS[action].label}… ${capture.left}s · Esc cancels`;
    if (capture.left-- <= 0) endCapture(null, `No input, so ${C.ACTIONS[action].label} is unchanged.`);
    else capture.timer = setTimeout(tick, 1000);
  };
  root.dataset.capturing = device;
  tick();
}
function endCapture(inputId, message) {
  if (!capture) return;
  const {device, action, timer} = capture;
  clearTimeout(timer);
  capture = null;
  delete root.dataset.capturing;
  if (!inputId) { $('remap-prompt').textContent = message || ''; return; }
  const p = P(device);
  const result = C.bind(p, action, inputId);
  const label = C.ACTIONS[action].label, what = C.inputLabel(device, inputId);
  if (result.refused) { $('remap-prompt').textContent = `${what} is reserved for ${C.ACTIONS[result.refused].label}. ${label} is unchanged.`; return; }
  C.storeProfile(device, p);
  $('remap-prompt').textContent = !result.swapped ? `${label} is now on ${what}.`
    : `${label} is now on ${what}. ${C.ACTIONS[result.swapped].label} took ${label}'s old ${result.gave?.length ? result.gave.map(i => C.inputLabel(device, i)).join(', ') : 'input (none, so it is unbound now)'}.`;
  refreshControls();
}

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
  if (!$('howto').hidden) renderHowto();
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

/* ---------- How you'll play: device picker, visual map, remap ---------- */
let howtoDevice = 'touch';
const coarse = () => matchMedia('(pointer: coarse)').matches;
function refreshControls() {
  releaseAll();
  relabelTouch(); renderLegend(); updateChip();
  if (root.dataset.state === 'ready' && staged?.origin !== 'local') $('gate-line').innerHTML = readyLine();
  if (!$('howto').hidden) renderHowto();
}
function keyboardMap(p) {
  const caps = C.ACTION_ORDER.flatMap(a => p.binds[a].map(k => `<div class="keycap"><kbd>${C.inputLabel('keyboard', k)}</kbd><span>${C.ACTIONS[a].label}</span></div>`));
  return `<div class="keymap" role="img" aria-label="Keyboard map">${caps.join('')}</div>`;
}
function touchMap(p) {
  const slot = (id, cls, text) => {
    const acts = C.actionsOf(p, id);
    return `<button class="tslot ${cls}${acts.length ? '' : ' unbound'}" data-touch="${id}" aria-label="${C.inputLabel('touch', id)}: ${acts.map(a => C.ACTIONS[a].label).join(', ') || 'unmapped'}"><b>${acts.map(a => C.ACTIONS[a].label).join(' + ') || '—'}</b><small>${text}</small></button>`;
  };
  return `<div class="touchmap" role="img" aria-label="Touch map"><div class="phone"><div class="tscreen">GAME</div>
    ${slot('t:l', 'tl', 'shoulder')}${slot('t:r', 'tr', 'shoulder')}${slot('t:up', 'up', '↑')}${slot('t:left', 'lt', '←')}${slot('t:right', 'rt', '→')}${slot('t:down', 'dn', '↓')}
    ${slot('t:use', 'use', 'round')}${slot('t:fire', 'fire', 'round')}${slot('t:select', 'sel', 'small')}${slot('t:start', 'sta', 'small')}</div></div>`;
}
function renderHowto() {
  const d = howtoDevice, p = P(d), dev = C.DEVICES[d];
  const rebuilt = typeof status?.build?.pct_agent_code === 'number';
  $('howto-lines').innerHTML = `${rebuilt ? 'Doom, rebuilt from recovered code' : 'Doom (GBADoom)'}, running in your browser via the mGBA core. Works on phones, tablets, laptops, TV and console browsers.<br>It runs right here in this tab, and your mapping is saved on this device only.`;
  $('devices').innerHTML = Object.entries(C.DEVICES).map(([k, v]) => {
    const tag = k === detectedPad ? ' · detected' : (k === 'touch' && coarse()) || (k === 'keyboard' && !coarse()) ? ' · this device' : '';
    return `<button class="chip dev" data-device="${k}" aria-pressed="${k === d}">${v.name}${tag}</button>`;
  }).join('');
  $('map').innerHTML = dev.pad ? C.padSvg(d, p) : d === 'keyboard' ? keyboardMap(p) : touchMap(p);
  $('binds').innerHTML = C.ACTION_ORDER.map(a => `<div class="bind"><span class="act">${C.ACTIONS[a].label}</span><span class="ins">${p.binds[a].length ? p.binds[a].map(i => C.glyph(d, i)).join('') : '<em>unmapped</em>'}</span>${C.ACTIONS[a].locked ? '<span class="fixed">fixed</span>' : `<button class="chip small" data-remap="${a}" aria-label="Change ${C.ACTIONS[a].label}">CHANGE</button>`}</div>`).join('');
  const {freeInputs, freeActions} = C.unmapped(d, p);
  $('unmapped').textContent = [freeActions.length ? `No ${d === 'keyboard' ? 'key' : 'button'} yet: ${freeActions.map(a => C.ACTIONS[a].label).join(', ')}.` : 'Every action has an input.',
    freeInputs.length ? `Unused: ${freeInputs.map(i => C.inputLabel(d, i)).join(', ')}.` : ''].join(' ');
  $('swap-ab').hidden = !dev.pad;
  $('swap-ab').setAttribute('aria-pressed', String(p.swapAB));
  $('swap-ab').textContent = `NINTENDO A/B SWAP: ${p.swapAB ? 'ON' : 'OFF'}`;
  $('reset-map').disabled = !p.custom && !p.swapAB && !C.profile(d).custom;
}
function openHowto() {
  releaseAll();
  if (running && !paused) { core.pauseGame(); paused = true; $('signal').textContent = 'PAUSED'; }
  howtoDevice = deviceFor(root.dataset.input);
  $('remap-prompt').textContent = '';
  renderHowto();
  $('howto').hidden = false;
  $('howto').scrollTop = 0;
  $('howto-done').focus({preventScroll: true});
}
function closeHowto() {
  endCapture(null);
  $('howto').hidden = true;
  if ($('sheet').hidden) closeSheet(); else $('open-howto').focus({preventScroll: true});
}
$('howto').addEventListener('click', e => {
  const t = e.target.closest('button');
  if (!t) return;
  if (t.dataset.device) {
    const k = t.dataset.device;
    howtoDevice = k;
    if (C.DEVICES[k].pad) { C.setPadOverride(k === detectedPad ? null : k); if (detectedPad) setInput('pad', true); }
    else setInput(k === 'keyboard' ? 'keys' : 'touch', true);
    refreshControls();
    $('howto').querySelector(`[data-device="${k}"]`)?.focus({preventScroll: true});
  } else if (t.dataset.remap) startCapture(howtoDevice, t.dataset.remap);
  else if (t.dataset.touch && capture?.device === 'touch') endCapture(t.dataset.touch);
  else if (t.id === 'reset-map') { C.resetProfile(howtoDevice); delete profiles[howtoDevice]; refreshControls(); $('remap-prompt').textContent = 'Defaults restored.'; }
  else if (t.id === 'swap-ab') { const p = P(howtoDevice); p.swapAB = !p.swapAB; C.storeProfile(howtoDevice, p); refreshControls(); }
  else if (t.id === 'howto-done') closeHowto();
});
$('device-chip').addEventListener('click', openHowto);
$('open-howto').addEventListener('click', openHowto);

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
relabelTouch();
setInput(matchMedia('(pointer: coarse)').matches ? 'touch' : 'keys', true);
for (const gp of navigator.getGamepads?.() || []) if (gp) detectedPad = C.detectPad(gp.id);
if ([...(navigator.getGamepads?.() || [])].some(Boolean)) padLoop = requestAnimationFrame(pollPads);
layout();
boot();
