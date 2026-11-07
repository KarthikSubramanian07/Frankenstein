// Canvas layer for beams and the scene dissolve, plus flash and shake. All 1920x1080 stage coords.

export type Pt = { x: number; y: number };
type Beam = { from: Pt; to: Pt; land: { x: number; y: number; w: number; h: number }; t0: number; color: string; landed: boolean; onLand?: () => void };

const BEAM_MS = 400;
const LAND_MS = 420;
const PX = 12; // beam pixel size

export class Fx {
  private ctx: CanvasRenderingContext2D;
  private beams: Beam[] = [];
  private dissolve: { t0: number; order: number[]; cols: number; rows: number; color: string; mid?: () => void; midDone: boolean } | null = null;
  private running = false;
  private flashEl: HTMLElement;
  private stageEl: HTMLElement;
  reduced: boolean;
  constructor(canvas: HTMLCanvasElement, flashEl: HTMLElement, stageEl: HTMLElement, reduced: boolean) {
    this.flashEl = flashEl;
    this.stageEl = stageEl;
    this.reduced = reduced;
    canvas.width = 1920;
    canvas.height = 1080;
    this.ctx = canvas.getContext('2d')!;
  }

  beam(from: Pt, to: Pt, land: Beam['land'], color: string, onLand?: () => void) {
    if (this.reduced) { onLand?.(); return; }
    if (this.beams.length > 10) this.beams.shift();
    this.beams.push({ from, to, land, t0: performance.now(), color, landed: false, onLand });
    this.kick();
  }

  /** 300 ms blocky dissolve; `mid` runs at the halfway point (swap scenes there). */
  sceneDissolve(mid: () => void) {
    if (this.reduced) { mid(); return; }
    const cols = 30, rows = 17;
    const order = Array.from({ length: cols * rows }, (_, i) => i);
    for (let i = order.length - 1; i > 0; i--) { const j = (i * 7919 + 13) % (i + 1); [order[i], order[j]] = [order[j], order[i]]; }
    // Blocks are the stage background (--bg), so the cut reads as the screen going dark, not a foreign colour.
    const color = getComputedStyle(this.stageEl).getPropertyValue('--bg').trim() || '#0c0a09';
    this.dissolve = { t0: performance.now(), order, cols, rows, color, mid, midDone: false };
    this.kick();
  }

  flash() {
    if (this.reduced) return;
    const f = this.flashEl;
    // two frames of white
    f.style.opacity = '1';
    requestAnimationFrame(() => requestAnimationFrame(() => { f.style.opacity = '0'; }));
  }

  shake() {
    if (this.reduced) return;
    this.stageEl.classList.remove('shake');
    void this.stageEl.offsetWidth;
    this.stageEl.classList.add('shake');
    setTimeout(() => this.stageEl.classList.remove('shake'), 220);
  }

  private kick() {
    if (this.running) return;
    this.running = true;
    requestAnimationFrame(this.frame);
  }

  private frame = (now: number) => {
    const c = this.ctx;
    c.clearRect(0, 0, 1920, 1080);
    // beams
    this.beams = this.beams.filter((b) => now - b.t0 < BEAM_MS + LAND_MS);
    for (const b of this.beams) {
      const t = Math.min(1, (now - b.t0) / BEAM_MS);
      const dx = b.to.x - b.from.x, dy = b.to.y - b.from.y;
      const len = Math.hypot(dx, dy);
      const steps = Math.floor(len / PX);
      const head = Math.floor(steps * t);
      const tail = Math.max(0, head - 14);
      c.fillStyle = b.color;
      for (let i = tail; i <= head; i++) {
        const x = Math.round((b.from.x + (dx * i) / steps) / PX) * PX;
        const y = Math.round((b.from.y + (dy * i) / steps) / PX) * PX;
        c.globalAlpha = 0.35 + 0.65 * ((i - tail) / Math.max(1, head - tail));
        c.fillRect(x - PX / 2, y - PX / 2, PX, PX);
      }
      c.globalAlpha = 1;
      if (t >= 1) {
        if (!b.landed) { b.landed = true; b.onLand?.(); }
        const lt = (now - b.t0 - BEAM_MS) / LAND_MS;
        const grow = 6 + 30 * lt;
        c.globalAlpha = Math.max(0, 1 - lt);
        c.strokeStyle = b.color;
        c.lineWidth = 8;
        c.strokeRect(b.land.x - grow, b.land.y - grow, b.land.w + grow * 2, b.land.h + grow * 2);
        c.globalAlpha = 1;
      }
    }
    // dissolve
    const d = this.dissolve;
    if (d) {
      const t = (now - d.t0) / 300;
      const bw = 1920 / d.cols, bh = 1080 / d.rows;
      const n = d.order.length;
      const filled = t < 0.5 ? Math.floor(n * (t / 0.5)) : Math.floor(n * (1 - (t - 0.5) / 0.5));
      if (t >= 0.5 && !d.midDone) { d.midDone = true; d.mid?.(); }
      c.fillStyle = d.color;
      for (let i = 0; i < Math.max(0, filled); i++) {
        const k = d.order[i];
        c.fillRect((k % d.cols) * bw, Math.floor(k / d.cols) * bh, Math.ceil(bw), Math.ceil(bh));
      }
      if (t >= 1) this.dissolve = null;
    }
    if (this.beams.length || this.dissolve) requestAnimationFrame(this.frame);
    else { c.clearRect(0, 0, 1920, 1080); this.running = false; }
  };
}
