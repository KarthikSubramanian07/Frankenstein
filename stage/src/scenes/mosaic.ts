// The cartridge, laid out like the game screen: one cell per game function, grouped by the part of the
// screen it drives (lab viz_map). Code not recovered yet is static; proved code is solid. Shown in the
// Split game window when there is no live capture under it (OBS mode hides it).
import type { Ctx } from '../types.ts';

type Band = { id: string; label: string; x: number; y: number; w: number; h: number };
type CellBox = { fn: string; sub: string; x: number; y: number; w: number; h: number };

// Layout only: bands in 240x160 GBA pixels, top to bottom like the Doom screen.
const BANDS: Band[] = [
  { id: 'world', label: 'WORLD', x: 0, y: 0, w: 240, h: 64 },
  { id: 'enemies', label: 'MONSTERS', x: 0, y: 64, w: 240, h: 40 },
  { id: 'weapons', label: 'WEAPONS', x: 0, y: 104, w: 240, h: 24 },
  { id: 'hud', label: 'STATUS BAR', x: 0, y: 128, w: 240, h: 32 },
];
export const FACE_FN = 'fn_0801B298';
const S = 4; // GBA pixel to stage pixel
// Stage palette (style.css tokens): toxic green ONLY means proved, violet means a guess.
const C = {
  bg: '#070605', off: '#15110e', offGuess: '#1f1a33', on: '#8cff2e', onEdge: '#4f9a12',
  guess: '#a99bff', guessEdge: '#6a5cc4', ink: '#0c0a09', bone: '#efe4d2',
};

export class Mosaic {
  cv: HTMLCanvasElement;
  private g: CanvasRenderingContext2D;
  private cells: CellBox[] = [];
  private byFn = new Map<string, CellBox>();
  private key = '';
  private flash = new Map<string, number>(); // fn -> time its beam landed
  private ox: number;
  private oy: number;

  constructor(ox: number, oy: number) {
    this.ox = ox;
    this.oy = oy;
    this.cv = document.createElement('canvas');
    this.cv.className = 'mosaic';
    this.cv.width = 960;
    this.cv.height = 640;
    this.g = this.cv.getContext('2d')!;
  }

  private layout(ctx: Ctx) {
    const subs = ctx.side.subsystems;
    const key = subs.map((s) => `${s.id}:${s.functions.length}`).join(',');
    if (key === this.key) return;
    this.key = key;
    this.cells = [];
    this.byFn.clear();
    for (const band of BANDS) {
      const sub = subs.find((s) => s.id === band.id);
      if (!sub) continue;
      const fns = [...sub.functions];
      // the face sits in the middle of the status bar, like Doomguy
      const fi = fns.indexOf(FACE_FN);
      if (fi >= 0) { fns.splice(fi, 1); fns.splice(Math.floor(fns.length / 2), 0, FACE_FN); }
      const W = band.w * S, H = band.h * S, n = fns.length;
      if (!n) continue;
      let cols = n <= 16 ? n : Math.ceil(Math.sqrt((n * W) / H));
      const rows = Math.ceil(n / cols);
      while (rows * cols < n) cols++;
      const cw = W / cols, ch = H / rows;
      fns.forEach((fn, i) => {
        const c = { fn, sub: band.id, x: band.x * S + (i % cols) * cw, y: band.y * S + Math.floor(i / cols) * ch, w: cw, h: ch };
        this.cells.push(c);
        this.byFn.set(fn, c);
      });
    }
  }

  /** Stage coordinates of a function's cell (beam target), or null when it is not on the map. */
  rectOf(ctx: Ctx, fn: string) {
    this.layout(ctx);
    const c = this.byFn.get(fn);
    return c ? { x: this.ox + c.x, y: this.oy + c.y, w: c.w, h: c.h } : null;
  }

  /** canvas can't read CSS vars in g.font, so resolve --font-pixel from the stage once mounted */
  private pixelFont() {
    return getComputedStyle(this.cv).getPropertyValue('--font-pixel').trim() || 'monospace';
  }

  land(fn: string) { this.flash.set(fn, performance.now()); }

  draw(ctx: Ctx, t: number) {
    this.layout(ctx);
    const g = this.g;
    const s = ctx.state;
    g.fillStyle = C.bg;
    g.fillRect(0, 0, 960, 640);
    let seed = ctx.reduced ? 7 : Math.floor(t / 90) + 1;
    const rnd = () => ((seed = (seed * 16807 + 11) % 2147483647) / 2147483647);
    for (const c of this.cells) {
      const x = Math.round(c.x), y = Math.round(c.y), w = Math.max(1, Math.round(c.w) - 2), h = Math.max(1, Math.round(c.h) - 2);
      const on = s.matchedSet.has(c.fn);
      // the face cell is a guess (violet ?) until the lab confirms the name in names.json
      const face = c.fn === FACE_FN && !ctx.side.confirmed.has(c.fn);
      if (on) {
        g.fillStyle = face ? C.guess : C.on;
        g.fillRect(x, y, w, h);
        g.fillStyle = face ? C.guessEdge : C.onEdge;
        g.fillRect(x, y + h - 4, w, 4);
      } else {
        g.fillStyle = face ? C.offGuess : C.off;
        g.fillRect(x, y, w, h);
        // static: code that isn't back yet
        const dots = Math.max(2, Math.floor((w * h) / 70));
        for (let k = 0; k < dots; k++) {
          const v = 40 + Math.floor(rnd() * 60);
          g.fillStyle = `rgb(${v + 14},${v + 4},${v - 6})`;
          g.fillRect(x + Math.floor(rnd() * Math.max(1, w - 3)), y + Math.floor(rnd() * Math.max(1, h - 3)), 3, 3);
        }
      }
      const f = this.flash.get(c.fn);
      if (f != null) {
        const a = 1 - (t - f) / 600;
        if (a <= 0) this.flash.delete(c.fn);
        else { g.globalAlpha = a; g.fillStyle = C.bone; g.fillRect(x - 3, y - 3, w + 6, h + 6); g.globalAlpha = 1; }
      }
      if (face) {
        // "this is the face" is inferred (Snap's router), so the cell carries the guess mark
        g.font = `${Math.min(56, Math.floor(Math.min(w, h) * 0.45))}px ${this.pixelFont()}`;
        g.textAlign = 'center';
        g.textBaseline = 'middle';
        g.fillStyle = on ? C.ink : C.guess;
        g.fillText('?', x + w / 2, y + h / 2 + 2);
      }
    }
    // band labels: proved / total for each part of the screen
    g.font = `28px ${this.pixelFont()}`;
    g.textAlign = 'left';
    g.textBaseline = 'top';
    for (const band of BANDS) {
      const sub = ctx.side.subsystems.find((x) => x.id === band.id);
      if (!sub) continue;
      const n = sub.functions.filter((f) => s.matchedSet.has(f)).length;
      const label = `${band.label} ${n}/${sub.functions.length}`;
      const tw = g.measureText(label).width;
      g.fillStyle = C.ink;
      g.fillRect(band.x * S, band.y * S, tw + 20, 44);
      g.fillStyle = n ? C.on : C.bone;
      g.fillText(label, band.x * S + 10, band.y * S + 9);
    }
  }
}
