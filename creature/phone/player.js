// Player 2: real mGBA WASM core, touch-first controller, honest states. No gameplay is ever simulated.
const $ = (id) => document.getElementById(id);
const root = document.documentElement;
const GBA_W = 240, GBA_H = 160, HUD_ROWS = 32; // GBADoom's status bar is the bottom 32 of 160 rows.
let core, coreReady, staged = null, running = false, paused = false, muted = false, wakeLock = null;
const held = new Map(); // button -> Set of sources (pointer ids, key codes)
const trackers = [];
const keyMap = {ArrowUp:'up', ArrowDown:'down', ArrowLeft:'left', ArrowRight:'right', KeyX:'a', KeyZ:'b', KeyA:'l', KeyS:'r', Enter:'start', Backspace:'select'};
const MB = (n) => (n / 1048576).toFixed(1);

/* ---------- States ---------- */
const copy = {
  loading: ['CHARGING<br>THE LIGHTNING<span class="dot">.</span>', 'Loading the emulator and the game.'],
  ready: ['IT\'S ALIVE<span class="dot">.</span>', 'Doom, on your phone, in a Game Boy Advance emulator. Sound on. Turn sideways.'],
  norom: ['THE CREATURE IS STILL ON THE TABLE<span class="dot">.</span>', 'The patched ROM isn\'t published yet. Check back when the lightning hits.'],
  error: ['THAT DIDN\'T SURVIVE THE LIGHTNING<span class="dot">.</span>', 'Something went wrong.'],
};
const signals = {loading: 'LOADING', ready: 'READY', norom: 'NO ROM YET', error: 'UNAVAILABLE', playing: 'PLAYING'};
function setState(state, line, note) {
  root.dataset.state = state;
  if (copy[state]) { $('gate-title').innerHTML = copy[state][0]; $('gate-line').textContent = line || copy[state][1]; }
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
    const c = Math.round(clamp(ah * 0.38, 104, 160));      // D-pad and FIRE/USE cluster size
    const gap = Math.round(clamp(ah * 0.035, 8, 18));
    const side = c + gap * 2;                               // column each cluster needs
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
  } else {
    const barH = 40;
    const bar = document.querySelector('.bar');
    place(bar, s.l + 14, s.t, aw - 28 - 44, barH); // leaves room for the pause button
    const maxGameH = Math.max(120, ah - barH - 300);
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
  if (name && running && !paused) { e.preventDefault(); input(name, e.code, true); }
  if (e.code === 'Escape' && running) paused ? closeSheet() : openSheet();
});
window.addEventListener('keyup', e => { const name = keyMap[e.code]; if (name && held.has(name)) { e.preventDefault(); input(name, e.code, false); } });
window.addEventListener('blur', releaseAll);
document.addEventListener('visibilitychange', () => { if (document.hidden) releaseAll(); else if (running) keepAwake(); });
for (const ev of ['resize', 'orientationchange']) window.addEventListener(ev, () => { releaseAll(); layout(); });
window.visualViewport?.addEventListener('resize', layout);

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
async function boot() {
  setState('loading', undefined, 'Real emulator, real ROM. This page doesn\'t vouch for how the ROM was built.');
  showProgress();
  try {
    if (!window.isSecureContext || !window.crossOriginIsolated) throw new Error('This page needs a secure host with cross-origin isolation (COOP/COEP headers). Open it from the supplied server, or from HTTPS with those headers.');
    const romJob = download('game.gba', (g, t) => { progress.rom = [g, t]; showProgress(); });
    const wasm = await download('core/mgba.wasm', (g, t) => { progress.core = [g, t || progress.core[1]]; showProgress(); });
    if (!wasm.ok) throw new Error('The emulator core is not installed on this host. In creature/phone run npm install --ignore-scripts, then npm run prepare:core.');
    coreReady = startCore(wasm.buffer);
    const [rom] = await Promise.all([romJob, coreReady]);
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
  setState('ready', undefined, origin === 'local' ? 'Your file. It stays on this phone.' : 'Real emulator, real ROM. This page doesn\'t vouch for how the ROM was built.');
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
  if (matchMedia('(pointer: coarse)').matches && !document.fullscreenElement) {
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

layout();
boot();
