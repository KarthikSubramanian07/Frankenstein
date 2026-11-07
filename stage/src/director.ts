// Director mode (?director=1): the run of show in director/show.json, driven by the presenter's keys.
// space = next beat, b = previous beat, r = restart from the top. A beat may switch the event source
// (a replay of a real exported run, or runs/live) without reloading the page.
import show from '../director/show.json';
import type { SceneId } from './types.ts';

export type Source = { replay?: string; speed?: number; t?: number; live?: boolean };
export type Beat = { at: string; scene: SceneId; page?: 'main' | 'credits'; source?: Source; say?: string };

export type DirectorHooks = {
  go: (id: SceneId, instant: boolean) => void;
  setSource: (s: Source) => void;
  setPage: (p: 'main' | 'credits') => void;
  cue: (text: string) => void; // a brief beat marker for the presenter
};

export class Director {
  beats: Beat[] = (show.beats as Beat[]).filter((b) => b && b.scene);
  i = -1;
  private hooks: DirectorHooks;
  private source: string = '';

  constructor(hooks: DirectorHooks) { this.hooks = hooks; }

  start() { this.to(0, true); }

  /** returns true when the key belongs to the director */
  key(k: string): boolean {
    if (k === ' ' || k === 'ArrowRight' || k === 'PageDown') { this.to(Math.min(this.i + 1, this.beats.length - 1), false); return true; }
    if (k === 'b' || k === 'ArrowLeft' || k === 'PageUp') { this.to(Math.max(this.i - 1, 0), false); return true; }
    if (k === 'r') { this.source = ''; this.to(0, true); return true; }
    return false;
  }

  private to(n: number, instant: boolean) {
    if (n === this.i && !instant) return;
    this.i = n;
    const b = this.beats[n];
    if (!b) return;
    // the source a beat asks for, or the nearest one set by an earlier beat (so b and r land correctly)
    let src: Source | undefined;
    for (let k = n; k >= 0 && !src; k--) src = this.beats[k].source;
    const key = JSON.stringify(src ?? {});
    if (src && (key !== this.source || b.source)) { this.source = key; this.hooks.setSource(src); }
    if (b.page) this.hooks.setPage(b.page);
    else if (b.scene === 'ending') this.hooks.setPage('main');
    this.hooks.go(b.scene, instant);
    this.hooks.cue(`${n + 1}/${this.beats.length} · ${b.at}`);
  }
}
