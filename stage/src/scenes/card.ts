// The ending card. IDENTICAL + both checksums + IT'S ALIVE only when build.rom says identical and the hashes
// agree; otherwise an honest "not rebuilt yet" (or DIFFERENT). The phone link only after phone.published.
// `c` flips to Built today / Not ours (the demo must end on it).
import './card.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import { gameTotal } from './common.ts';

export class CardScene implements Scene {
  id = 'card' as const;
  el = h('section', 'scene cardscene');
  private credits = false;
  private memo = '';

  constructor() {
    this.el.innerHTML = `
      <div class="cd-main" data-k="main"></div>
      <div class="cd-credits">
        <div class="col"><h2>Built today</h2><p>Nov 7, 2026, after 10:45</p><ul>
          <li>The compiler referee and the fakematch linter</li>
          <li>The agent crew: diggers, checker, archivist, distiller</li>
          <li>This stage and its event server</li>
          <li>The overlay, hot-swap and phone page</li>
          <li>The contracts, fixtures and the public site</li></ul></div>
        <div class="col"><h2>Not ours</h2><ul>
          <li>DOOM by id Software, prBoom, and GBADoom by doomhack (GPL-2.0+): the hidden answer key</li>
          <li>Muse Spark (Meta), SubQ (Subquadratic), Agentverse and ASI:One (Fetch.ai), MongoDB Atlas, Gemini</li>
          <li>mGBA, devkitARM, and the fonts (Google Fonts, OFL)</li>
          <li>Prior work: the planning kit in docs/ and the event clock</li></ul></div>
      </div>`;
  }

  /** the credits carry no data, so no sample mark there */
  sample() { return this.credits ? false : null; }

  key(_ctx: Ctx, k: string) {
    if (k !== 'c') return false;
    this.credits = !this.credits;
    this.el.classList.toggle('show-credits', this.credits);
    return true;
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const orig = ctx.side.romSha1;
    const b = s.build;
    const identical = !!b && b.identical === true && (!orig || orig === b.rom_sha1);
    const differ = !!b && !identical;
    const url = s.phone?.url ? String(s.phone.url) : '';
    const key = `${identical}|${differ}|${b?.rom_sha1}|${orig}|${url}|${s.matched.length}`;
    if (key === this.memo) return;
    this.memo = key;
    const sums = `<div class="cd-sums"><span>original</span><code>${esc(orig ?? 'not in the manifest')}</code>${b ? `<span>rebuilt</span><code class="${differ ? 'bad' : ''}">${esc(b.rom_sha1 ?? '')}</code>` : ''}</div>`;
    const phone = url ? `<div class="cd-phone">Play it on your phone: <b>${esc(url.replace(/^https?:\/\//, '').replace(/\/$/, ''))}</b></div>` : '';
    const main = this.el.querySelector('[data-k="main"]') as HTMLElement;
    main.innerHTML = identical
      ? `<div class="cd-big ok">IDENTICAL</div>${sums}<div class="cd-alive">IT'S ALIVE</div>${phone}`
      : differ
        ? `<div class="cd-big bad">DIFFERENT</div>${sums}${phone}`
        : `<div class="cd-big wait">NOT REBUILT YET</div>${sums}<div class="cd-note">${s.matched.length} of ${gameTotal(ctx) || '--'} pieces proved so far</div>${phone}`;
  }
}
