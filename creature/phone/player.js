const $ = (id) => document.getElementById(id);
let core, initializing, running = false, paused = false, muted = false;
const held = new Map();
const keyMap = {ArrowUp:'up', ArrowDown:'down', ArrowLeft:'left', ArrowRight:'right', KeyX:'a', KeyZ:'b', KeyA:'l', KeyS:'r', Enter:'start', Backspace:'select'};
function status(message, signal) { $('status').textContent = message; if (signal) $('signal').textContent = signal; }
function sync() {
  $('pause').disabled = !running; $('mute').disabled = !core;
  $('pause').textContent = paused ? 'RESUME' : 'PAUSE';
  $('mute').textContent = muted ? 'SOUND OFF' : 'SOUND ON';
  document.querySelectorAll('[data-key]').forEach(b => { b.disabled = !running || paused; });
}
function input(name, source, down) {
  if (down && (!running || paused || !core)) return;
  const sources = held.get(name) || new Set();
  const before = sources.size;
  down ? sources.add(source) : sources.delete(source);
  if (sources.size) held.set(name, sources); else held.delete(name);
  if (!before && sources.size) core?.buttonPress(name);
  if (before && !sources.size) core?.buttonUnpress(name);
  document.querySelector(`[data-key="${name}"]`)?.classList.toggle('pressed', sources.size > 0);
}
function releaseAll() {
  for (const [name, sources] of [...held]) for (const source of [...sources]) input(name, source, false);
}
async function initialize() {
  if (core) return core;
  if (initializing) return initializing;
  initializing = (async () => {
    if (!window.isSecureContext || !window.crossOriginIsolated) throw new Error('This emulator needs a secure page with cross-origin isolation. Use the supplied localhost server, or HTTPS with COOP/COEP headers.');
    status('Loading emulator…', 'LOADING');
    const response = await fetch('core/mgba.js', {method:'HEAD', cache:'no-store'});
    if (!response.ok) throw new Error('Emulator core is not installed. Run npm install --ignore-scripts, then npm run prepare:core in creature/phone.');
    const {default: mGBA} = await import('./core/mgba.js');
    const module = await mGBA({canvas: $('game'), locateFile: name => new URL(`./core/${name}`, import.meta.url).href,
      printErr: message => console.warn('[mGBA]', message)});
    await module.FSInit();
    module.toggleInput(false); // One input path for touch and keyboard; no double presses.
    core = module;
    sync();
    return module;
  })();
  try { return await initializing; } finally { initializing = undefined; }
}
async function load(file) {
  $('boot').disabled = true; $('rom').disabled = true;
  try {
    const module = await initialize();
    if (!file) {
      status('Loading the local demo ROM…', 'LOADING');
      const response = await fetch('game.gba', {cache:'no-store'});
      if (!response.ok) throw new Error('No assembled demo ROM is available. Select a local .gba file, or start server.py with --rom pointing to the assembled game (engine plus shareware IWAD).');
      file = new File([await response.arrayBuffer()], 'frankenstein.gba');
    }
    if (!file.name.toLowerCase().endsWith('.gba') || !file.size || file.size > 32 * 1024 * 1024) throw new Error('Choose a nonempty .gba game file up to 32 MB.');
    releaseAll();
    running = false; sync();
    // Fixed safe filename avoids using user file paths in the emulator filesystem.
    const gameFile = new File([file], 'frankenstein.gba');
    status('Starting game…', 'LOADING');
    const paths = module.filePaths();
    module.FS.writeFile(`${paths.gamePath}/frankenstein.gba`, new Uint8Array(await gameFile.arrayBuffer()));
    if (!module.loadGame(`${paths.gamePath}/frankenstein.gba`)) throw new Error('The emulator could not load this ROM. Confirm the WAD was appended by Lane A.');
    try { await module.SDL2?.audioContext?.resume(); } catch { /* Sound can be resumed by a subsequent gesture. */ }
    running = true; paused = false; $('cover').hidden = true;
    status(`Running ${file.name}. Browser emulator; build provenance is supplied by the team.`, 'PLAYING');
  } catch (error) {
    status(error.message || String(error), 'UNAVAILABLE');
  } finally { $('boot').disabled = false; $('rom').disabled = false; sync(); }
}
$('boot').addEventListener('click', () => load($('rom').files?.[0]));
$('rom').addEventListener('change', () => { const file = $('rom').files?.[0]; if (file) load(file); });
$('pause').addEventListener('click', async () => {
  releaseAll();
  if (paused) { try { await core.SDL2?.audioContext?.resume(); } catch {} core.resumeGame(); }
  else core.pauseGame();
  paused = !paused; sync(); status(paused ? 'Game paused.' : 'Game resumed.', paused ? 'PAUSED' : 'PLAYING');
});
$('mute').addEventListener('click', () => { muted = !muted; core.setVolume(muted ? 0 : 1); sync(); });
$('fullscreen').addEventListener('click', async () => {
  try { if (document.fullscreenElement) await document.exitFullscreen(); else await document.querySelector('main').requestFullscreen(); }
  catch { status('Fullscreen is unavailable in this browser. Rotate your phone for a wider view.'); }
});
document.querySelectorAll('[data-key]').forEach(button => {
  button.addEventListener('pointerdown', event => { event.preventDefault(); button.setPointerCapture(event.pointerId); input(button.dataset.key, `p${event.pointerId}`, true); });
  for (const name of ['pointerup','pointercancel','lostpointercapture']) button.addEventListener(name, event => { event.preventDefault(); input(button.dataset.key, `p${event.pointerId}`, false); });
  button.addEventListener('contextmenu', event => event.preventDefault());
});
window.addEventListener('keydown', event => { if (event.target instanceof HTMLInputElement) return; const name = keyMap[event.code]; if (name && running) { event.preventDefault(); input(name, event.code, true); } });
window.addEventListener('keyup', event => { const name = keyMap[event.code]; if (name && held.has(name)) { event.preventDefault(); input(name, event.code, false); } });
window.addEventListener('blur', releaseAll);
document.addEventListener('visibilitychange', () => { if (document.hidden) releaseAll(); });
sync();
