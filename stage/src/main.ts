// Stage shell: one websocket, one state, scenes switched by keys or ?scene=.
import './style.css';
import { emptyState, apply } from './state.ts';
import type { Ev, Effect } from './state.ts';
import { emptySide, loadSide, refreshNames } from './data.ts';
import { Fx } from './fx.ts';
import { unlockAudio, setMuted, isMuted } from './audio.ts';
import type { Ctx, Scene, SceneId } from './types.ts';
import { h } from './types.ts';
import { SplitScene } from './scenes/split.ts';
import { VersusScene } from './scenes/versus.ts';
import { TitleScene } from './scenes/title.ts';
import { TimeTrialScene } from './scenes/timetrial.ts';
import { EndingScene } from './scenes/ending.ts';
import { LogScene } from './scenes/log.ts';
import { CardScene } from './scenes/card.ts';
import { RoadScene } from './road.ts';
import { Director } from './director.ts';
import type { Source } from './director.ts';

const params = new URLSearchParams(location.search);
const host = params.get('server') || '127.0.0.1';
const HTTP = `http://${host}:7201`;
const WS = `ws://${host}:7202`;
const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
const obs = params.get('obs') === '1';
if (obs) document.body.classList.add('obs');
// default: the log and the ending card only, silent (no sounds, voice or beams); ?legacy=1 brings the old scenes back
const legacy = params.get('legacy') === '1';
if (reduced || !legacy) setMuted(true);

const stageEl = document.getElementById('stage')!;
const fxCanvas = h('canvas');
fxCanvas.id = 'fxlayer';
const flashEl = h('div');
flashEl.id = 'flash';
const markEl = h('div');
markEl.id = 'mark';
const fx = new Fx(fxCanvas, flashEl, stageEl, reduced);

const scenes: Partial<Record<SceneId, Scene>> = {};
const log = new LogScene();
const card = new CardScene();
const split = legacy ? new SplitScene() : null;
const ending = legacy ? new EndingScene(HTTP, reduced) : null;
const list: Scene[] = legacy
  ? [new TitleScene(reduced), split!, new VersusScene(), new TimeTrialScene(HTTP), ending!]
  : [log, card];
const road = new RoadScene(HTTP); // ROAD (key 6): the road to 100%, see road.ts
list.push(road);
for (const s of list) { scenes[s.id] = s; stageEl.appendChild(s.el); }
// sponsors are one line on Rebuild (minimal redesign); the judgment rail's reducer still runs (judgment.ts)
stageEl.append(fxCanvas, flashEl, markEl);

let current: SceneId = 'split';
const ctx: Ctx = {
  state: emptyState(),
  side: emptySide(),
  fx,
  reduced,
  obs,
  go: (id) => go(id),
  current: () => current,
  invalidate: () => { dirty = true; },
};

function show(id: SceneId) {
  for (const s of Object.values(scenes)) s!.el.classList.toggle('on', s!.id === id);
  stageEl.dataset.scene = id;
  const prev = current;
  current = id;
  if (prev !== id) scenes[prev]?.leave?.(ctx);
  scenes[id]?.enter?.(ctx);
  dirty = true;
}
function go(id: SceneId) {
  if (!scenes[id] || id === current) return;
  fx.sceneDissolve(() => show(id));
}

// ---------- scale the 1920x1080 stage to the window ----------
function fit() {
  const k = Math.min(innerWidth / 1920, innerHeight / 1080);
  const x = (innerWidth - 1920 * k) / 2, y = (innerHeight - 1080 * k) / 2;
  stageEl.style.transform = `translate(${x}px, ${y}px) scale(${k})`;
}
addEventListener('resize', fit);
fit();

// ---------- corner mark ----------
let connected = false;
function renderMark() {
  const s = ctx.state;
  const parts: string[] = [];
  if (!connected) parts.push('NO SIGNAL · RECONNECTING');
  const own = scenes[current]?.sample?.(ctx);
  const streamScene = own == null;
  if (own ?? (s.fixture || ctx.side.fixture)) parts.push('SAMPLE DATA');
  if (s.bench && current !== 'timetrial') parts.push('BENCH · NOT DOOM');
  if (streamScene && s.mode === 'replay') parts.push(`REPLAY · ${s.speed}X${s.ended ? ' · END' : ''}`);
  const html = parts.map((p) => `<span>${p}</span>`).join('<i> · </i>');
  if (markEl.innerHTML !== html) markEl.innerHTML = html;
  markEl.classList.toggle('show', parts.length > 0);
  markEl.classList.toggle('bad', !connected);
}

// ---------- event stream ----------
let backlogLeft = 0;
let dirty = true;
let sideDir: string | null | undefined;

let versusCut = false;
function onEffects(list: Effect[]) {
  for (const e of list) {
    // a caught lie or a rejected fake during Rebuild: hold 1 s, Caught for 4.5 s, back to Rebuild
    if ((e.kind === 'falseClaim' || e.kind === 'fake') && current === 'split' && !versusCut) {
      versusCut = true;
      setTimeout(() => go('versus'), 1000);
      setTimeout(() => { if (current === 'versus') go('split'); versusCut = false; }, 5500);
    }
    for (const s of Object.values(scenes)) {
      // the visible scene animates; hidden scenes still hear resets
      if (s!.id === current || e.kind === 'reset') s!.effect?.(ctx, e);
    }
  }
}

function handle(e: Ev) {
  road.ingest(e, backlogLeft <= 0 && e.type !== 'stage.hello');
  const effects = apply(ctx.state, e);
  if (e.type === 'stage.hello') {
    backlogLeft = Number(e.backlog) || 0;
    onEffects(effects);
    const dir = (e.run_id as string | null) ?? null;
    if (dir !== sideDir) {
      sideDir = dir;
      void loadSide(HTTP, dir).then((side) => { ctx.side = side; dirty = true; });
    }
  } else if (backlogLeft > 0) {
    backlogLeft--; // rebuilding state from the file: no animation, no sound
  } else {
    onEffects(effects);
  }
  dirty = true;
}

// the event source: a replay of a finished run (?replay=) or runs/live. Director beats switch it in place.
let source: Source = params.get('replay')
  ? { replay: params.get('replay')!, speed: Number(params.get('speed') || 8), t: Number(params.get('t') || 0) }
  : { live: true };
let ws: WebSocket | null = null;
let gen = 0;
function connect() {
  const mine = ++gen;
  const q = new URLSearchParams();
  if (source.replay) {
    q.set('replay', source.replay);
    q.set('speed', String(source.speed ?? 8));
    if (source.t) q.set('t', String(source.t));
  }
  const sock = new WebSocket(`${WS}/?${q}`);
  ws = sock;
  sock.onopen = () => { if (mine === gen) { connected = true; dirty = true; } };
  sock.onmessage = (m) => {
    if (mine !== gen) return; // an old source still draining
    try { handle(JSON.parse(String(m.data))); } catch { /* skip a bad line */ }
  };
  sock.onclose = () => {
    if (mine !== gen) return;
    connected = false;
    dirty = true;
    setTimeout(() => { if (mine === gen) connect(); }, 1000);
  };
}
function setSource(s: Source) {
  source = s;
  const old = ws;
  gen++; // silence the old socket before closing it
  old?.close();
  connect();
}
connect();
setInterval(() => { void refreshNames(HTTP, ctx.side).then(() => { dirty = true; }); }, 5000);

// ---------- render loop ----------
function frame() {
  if (dirty || split?.busy() || scenes[current]?.animating?.(ctx)) {
    dirty = false;
    scenes[current]?.render(ctx);
    renderMark();
  }
  requestAnimationFrame(frame);
}

// ---------- keys (the presenter never touches the mouse) ----------
const KEYS: Record<string, SceneId> = { '0': 'title', '1': 'split', '2': 'versus', '3': 'timetrial', '4': 'ending', '5': 'split', h: 'split' }; // Hi-score folded into Rebuild
addEventListener('keydown', (k) => {
  unlockAudio();
  if (director?.key(k.key)) { k.preventDefault(); dirty = true; return; }
  if (scenes[current]?.key?.(ctx, k.key)) { dirty = true; return; }
  if (k.key === '6') { const to = current === 'road' ? (legacy ? 'split' : 'log') : 'road'; if (legacy) go(to); else show(to); return; }
  if (!legacy) { if (k.key === ' ') { k.preventDefault(); show(current === 'card' ? 'log' : 'card'); } return; }
  if (KEYS[k.key]) go(KEYS[k.key]);
  else if (k.key === ' ' && current === 'title') go('split');
  else if (k.key === 'm') { setMuted(!isMuted()); }
});
addEventListener('pointerdown', unlockAudio);

// ---------- director mode: the run of show on space / b / r ----------
const cueEl = h('div');
cueEl.id = 'cue';
stageEl.append(cueEl);
let cueTimer = 0;
const director = legacy && params.get('director') === '1' ? new Director({
  go: (id, instant) => (instant ? show(id) : go(id)),
  setSource,
  setPage: (p) => { ending?.setPage(p); dirty = true; },
  cue: (text) => {
    cueEl.textContent = text;
    cueEl.classList.add('on');
    clearTimeout(cueTimer);
    cueTimer = window.setTimeout(() => cueEl.classList.remove('on'), 1600);
  },
}) : null;

const want = params.get('scene') as SceneId | null;
show(want && scenes[want] ? want : legacy ? 'title' : 'log');
director?.start();
requestAnimationFrame(frame);
