// Original synthesized sounds only (Web Audio square waves). Muted with `m`.
let ctx: AudioContext | null = null;
let muted = false;

export function setMuted(m: boolean) { muted = m; }
export function isMuted() { return muted; }

export function unlockAudio() {
  try {
    if (!ctx) ctx = new AudioContext();
    if (ctx.state === 'suspended') void ctx.resume();
  } catch { /* no audio */ }
}

function tone(freq: number, start: number, dur: number, vol = 0.08, type: OscillatorType = 'square') {
  if (!ctx) return;
  const o = ctx.createOscillator();
  const g = ctx.createGain();
  o.type = type;
  o.frequency.value = freq;
  g.gain.setValueAtTime(vol, start);
  g.gain.exponentialRampToValueAtTime(0.0001, start + dur);
  o.connect(g).connect(ctx.destination);
  o.start(start);
  o.stop(start + dur + 0.01);
}

let lastCoin = 0;
/** 80 ms two-step blip for a recovered function. Rate limited so 20x replay doesn't buzz. */
export function coin() {
  if (muted || !ctx || ctx.state !== 'running') return;
  const now = ctx.currentTime;
  if (now - lastCoin < 0.09) return;
  lastCoin = now;
  tone(988, now, 0.03);
  tone(1319, now + 0.03, 0.05);
}

/** Low buzz + hit for a rejected claim. */
export function reject() {
  if (muted || !ctx || ctx.state !== 'running') return;
  const now = ctx.currentTime;
  tone(110, now, 0.25, 0.1, 'sawtooth');
  tone(82, now + 0.12, 0.3, 0.1, 'square');
}
