import type { State, Effect } from './state.ts';
import type { Side } from './data.ts';
import type { Fx } from './fx.ts';

export type SceneId = 'title' | 'split' | 'hiscore' | 'versus' | 'timetrial' | 'ending';

export type Ctx = {
  state: State;
  side: Side;
  fx: Fx;
  reduced: boolean;
  obs: boolean;
  go: (id: SceneId) => void;
  current: () => SceneId;
  invalidate: () => void;
};

export interface Scene {
  id: SceneId;
  el: HTMLElement;
  /** redraw from state; called at most once per frame when something changed */
  render(ctx: Ctx): void;
  /** live effects (never called for backlog events) */
  effect?(ctx: Ctx, e: Effect): void;
  enter?(ctx: Ctx): void;
  leave?(ctx: Ctx): void;
  /** a key the scene handles itself (true = handled) */
  key?(ctx: Ctx, key: string): boolean;
  /** true/false when this scene's numbers come from its own files (Time trial); null/undefined = the stream */
  sample?(ctx: Ctx): boolean | null;
}

export const esc = (s: string) => s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);

export function h<K extends keyof HTMLElementTagNameMap>(tag: K, cls = '', html = ''): HTMLElementTagNameMap[K] {
  const el = document.createElement(tag);
  if (cls) el.className = cls;
  if (html) el.innerHTML = html;
  return el;
}

/** Split an instruction pair into tokens and mark the operands that differ. */
export function diffIns(expected: string, got: string): { exp: string; got: string } {
  const tok = (s: string) => s.split(/(\s+|,)/);
  const a = tok(expected), b = tok(got);
  const mark = (xs: string[], ys: string[]) =>
    xs.map((t, i) => (t.trim() && t !== ',' && t !== ys[i] ? `<span class="diff">${esc(t)}</span>` : esc(t))).join('');
  return { exp: mark(a, b), got: mark(b, a) };
}
