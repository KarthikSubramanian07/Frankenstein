// Pieces shared by several scenes: text updates and the game-scope counters.
import type { Ctx } from '../types.ts';
import type { State } from '../state.ts';
import { pctOf } from '../state.ts';

export function setText(root: ParentNode, k: string, v: string) {
  const el = root.querySelector(`[data-k="${k}"]`);
  if (el && el.textContent !== v) el.textContent = v;
}

// ---------- scope: this run vs the whole game (never present a run rate as the game rate) ----------
export function gameName(s: State) { return s.bench ? 'BENCH' : (s.gameId ?? 'doom').toUpperCase(); }
/** Functions in the whole game: the manifest's game scope; a bench run only has its own set. */
export function gameTotal(ctx: Ctx) { return ctx.state.bench ? ctx.state.fnTotal : ctx.side.gameTotal || ctx.state.fnTotal; }
export function gamePct(ctx: Ctx) { return pctOf(ctx.state.matched.length, gameTotal(ctx)); }
