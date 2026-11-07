// Announcer voice (Web Speech API). Captions are always on screen; voice is extra and muted with `m`.
// Never more than one spoken line queued; stale lines are dropped.
import { isMuted } from './audio.ts';

const PREFERRED = ['Daniel', 'Moira', 'Serena'];
let voice: SpeechSynthesisVoice | null = null;
let last = 0;

function pick() {
  if (voice || typeof speechSynthesis === 'undefined') return;
  const all = speechSynthesis.getVoices();
  for (const name of PREFERRED) {
    const v = all.find((x) => x.name.startsWith(name));
    if (v) { voice = v; return; }
  }
}
if (typeof speechSynthesis !== 'undefined') speechSynthesis.onvoiceschanged = pick;

export function announce(text: string) {
  if (isMuted() || typeof speechSynthesis === 'undefined') return;
  const now = Date.now();
  if (now - last < 8000) return; // the announcer speaks at most once every 8 s
  last = now;
  pick();
  speechSynthesis.cancel();
  const u = new SpeechSynthesisUtterance(text.toLowerCase());
  if (voice) u.voice = voice;
  u.rate = 1.0;
  speechSynthesis.speak(u);
}
