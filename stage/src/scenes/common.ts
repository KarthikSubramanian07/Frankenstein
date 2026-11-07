// Pieces shared by several scenes: HUD, narrator ticker, hi-score rows, cartridge meter.
import type { Ctx } from '../types.ts';
import { esc } from '../types.ts';
import type { State } from '../state.ts';
import { elapsedS, fmtClock } from '../state.ts';
import { displayName } from '../data.ts';

export const ORD = (n: number) => `${n}${['TH', 'ST', 'ND', 'RD'][n % 100 > 10 && n % 100 < 14 ? 0 : n % 10 < 4 ? n % 10 : 0]}`;

export function setText(root: ParentNode, k: string, v: string) {
  const el = root.querySelector(`[data-k="${k}"]`);
  if (el && el.textContent !== v) el.textContent = v;
}

// ---------- HUD (Split) ----------
export function hudHtml() {
  return `<div class="rec"><span class="k">RECOVERED</span><span class="v" data-k="rec">--</span></div>
    <div class="lies"><span class="k">LIES</span><span class="v" data-k="lies">0</span></div>
    <div><span class="k">TIME</span><span class="v" data-k="time">--:--</span></div>`;
}
export function renderHud(root: HTMLElement, s: State) {
  setText(root, 'rec', s.fnTotal ? `${s.matched.length}/${s.fnTotal}` : `${s.matched.length}`);
  setText(root, 'lies', String(s.falseClaims.length));
  setText(root, 'time', fmtClock(elapsedS(s)));
}

// ---------- narrator ticker: scrolls once when the line is wider than the bar ----------
export function tickerHtml() {
  return `<span class="who">ARCHIVIST</span><span class="clip"><span class="line" data-k="tick"></span></span>`;
}
export function renderTicker(root: HTMLElement, s: State, reduced: boolean) {
  const last = s.narration[s.narration.length - 1];
  const txt = last ? last.text : 'Waiting for the run to start.';
  const el = root.querySelector('[data-k="tick"]') as HTMLElement | null;
  if (!el || el.textContent === txt) return;
  el.textContent = txt;
  el.className = `line ${last?.mood ?? ''}`;
  if (reduced) return;
  requestAnimationFrame(() => {
    const over = el.scrollWidth - (el.parentElement?.clientWidth ?? 0);
    if (over > 0) {
      el.style.setProperty('--dx', `${-over - 24}px`);
      el.style.setProperty('--dur', `${Math.max(2, over / 220)}s`);
      el.classList.add('scroll');
    }
  });
}

// ---------- hi-score rows ----------
export type RowsMemo = { key: string; top: string };
export function renderRows(el: HTMLElement, ctx: Ctx, n: number, memo: RowsMemo, liar: string | null) {
  const s = ctx.state;
  const newest = s.matched.slice(-n).reverse();
  const ids = newest.map((m) => m.fn);
  const key = ids.join(',') + '#' + ids.map((f) => ctx.side.names.get(f) ?? '').join('|') + '#' + (liar ?? '');
  if (key === memo.key) return;
  const prevTop = memo.top;
  memo.key = key;
  memo.top = ids[0] ?? '';
  const total = s.matched.length;
  let html = liar ?? '';
  const rows = liar ? n - 1 : n;
  for (let i = 0; i < rows; i++) {
    const m = newest[i];
    if (!m) { html += `<div class="row empty"><span class="rk">---</span><span class="nm">. . .</span><span class="pc"></span></div>`; continue; }
    const rank = total - i;
    const nm = displayName(ctx.side, m.fn);
    const isNew = i === 0 && prevTop !== m.fn && !ctx.reduced;
    html += `<div class="row c${(rank - 1) % 3}${isNew ? ' new' : ''}"><span class="rk">${ORD(rank)}</span><span class="nm${nm.guess ? ' guess' : ''}">${esc(nm.text)}</span><span class="pc">100%</span></div>`;
  }
  el.innerHTML = html;
}

// ---------- cartridge meter: one cell per manifest function ----------
export function drawMeter(cv: HTMLCanvasElement, ctx: Ctx) {
  const g = cv.getContext('2d')!;
  const W = cv.width, H = cv.height;
  g.clearRect(0, 0, W, H);
  let cells = ctx.side.cells;
  const s = ctx.state;
  // a manifest from a different target than this run: fall back to fn_total cells in order
  const overlap = cells.some((c) => s.matchedSet.has(c.id));
  if (!cells.length || (s.matched.length && !overlap)) cells = Array.from({ length: s.fnTotal }, (_, i) => ({ id: `#${i}`, game: true }));
  const n = cells.length;
  if (!n) return;
  let rows = 1;
  while (Math.floor(W / Math.ceil(n / rows)) < Math.floor(H / rows) - 2 && rows < 16) rows++;
  const perRow = Math.ceil(n / rows);
  const cw = W / perRow, chh = H / rows;
  const fallback = cells[0]?.id.startsWith('#');
  const gap = cw > 6 ? 2 : 1;
  cells.forEach((c, i) => {
    const r = Math.floor(i / perRow), k = i % perRow;
    const on = fallback ? i < s.matched.length : s.matchedSet.has(c.id);
    g.fillStyle = !c.game ? '#4A4767' : on ? '#7CF2C8' : '#1b1846';
    g.fillRect(Math.floor(k * cw), Math.floor(r * chh), Math.max(1, Math.floor(cw) - gap), Math.max(1, Math.floor(chh) - gap));
  });
}
