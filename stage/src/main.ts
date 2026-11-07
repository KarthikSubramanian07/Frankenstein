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
import { HiscoreScene } from './scenes/hiscore.ts';
import { TimeTrialScene } from './scenes/timetrial.ts';
import { EndingScene } from './scenes/ending.ts';

const params = new URLSearchParams(location.search);
const host = params.get('server') || '127.0.0.1';
const HTTP = `http://${host}:7201`;
const WS = `ws://${host}:7202`;
const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
const obs = params.get('obs') === '1';
if (obs) document.body.classList.add('obs');
if (reduced) setMuted(true);

const stageEl = document.getElementById('stage')!;
const fxCanvas = h('canvas');
fxCanvas.id = 'fxlayer';
const flashEl = h('div');
flashEl.id = 'flash';
const markEl = h('div');
markEl.id = 'mark';
const fx = new Fx(fxCanvas, flashEl, stageEl, reduced);

const scenes: Partial<Record<SceneId, Scene>> = {};
const split = new SplitScene();
const versus = new VersusScene();
const title = new TitleScene(reduced);
const hiscore = new HiscoreScene();
const timetrial = new TimeTrialScene(HTTP);
const ending = new EndingScene(HTTP, reduced);
for (const s of [title, split, hiscore, versus, timetrial, ending] as Scene[]) { scenes[s.id] = s; stageEl.appendChild(s.el); }
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
    // a false claim during Hi-score: liar row, hold 1 s, Versus for 4 s, back to Hi-score
    if (e.kind === 'falseClaim' && current === 'hiscore' && !versusCut) {
      versusCut = true;
      hiscore.showLiar(ctx, e.c);
      setTimeout(() => go('versus'), 1000);
      setTimeout(() => { if (current === 'versus') go('hiscore'); versusCut = false; }, 5300);
    }
    for (const s of Object.values(scenes)) {
      // the visible scene animates; hidden scenes still hear resets
      if (s!.id === current || e.kind === 'reset') s!.effect?.(ctx, e);
    }
  }
}

function handle(e: Ev) {
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

function connect() {
  const q = new URLSearchParams();
  const replay = params.get('replay');
  if (replay) {
    q.set('replay', replay);
    q.set('speed', params.get('speed') || '8');
    if (params.get('t')) q.set('t', params.get('t')!);
  }
  const ws = new WebSocket(`${WS}/?${q}`);
  ws.onopen = () => { connected = true; dirty = true; };
  ws.onmessage = (m) => {
    try { handle(JSON.parse(String(m.data))); } catch { /* skip a bad line */ }
  };
  ws.onclose = () => {
    connected = false;
    dirty = true;
    setTimeout(connect, 1000);
  };
}
connect();
setInterval(() => { void refreshNames(HTTP, ctx.side).then(() => { dirty = true; }); }, 5000);

// ---------- render loop ----------
function frame() {
  if (dirty || split.busy()) {
    dirty = false;
    scenes[current]?.render(ctx);
    renderMark();
  }
  requestAnimationFrame(frame);
}

// ---------- keys (the presenter never touches the mouse) ----------
const KEYS: Record<string, SceneId> = { '0': 'title', '1': 'split', '2': 'versus', '3': 'timetrial', '4': 'ending', '5': 'hiscore', h: 'hiscore' };
addEventListener('keydown', (k) => {
  unlockAudio();
  if (scenes[current]?.key?.(ctx, k.key)) { dirty = true; return; }
  if (KEYS[k.key]) go(KEYS[k.key]);
  else if (k.key === ' ' && current === 'title') go('hiscore');
  else if (k.key === 'm') { setMuted(!isMuted()); }
});
addEventListener('pointerdown', unlockAudio);

const want = params.get('scene') as SceneId | null;
show(want && scenes[want] ? want : 'title');
requestAnimationFrame(frame);
