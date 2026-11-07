// Scene 4: Alive (id "ending"). One idea: the rebuilt game is byte-for-byte the original.
// IDENTICAL only when the lab's build.rom says so and the hashes agree; DIFFERENT in red otherwise;
// before any build, an honest NOT REBUILT YET with the proved count. The QR shows on phone.published.
// Space flips to the Built today / Not ours card, which the demo and the video end on.
import './ending.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import type { Effect } from '../state.ts';
import { setText, gameTotal } from './common.ts';

export class EndingScene implements Scene {
  id = 'ending' as const;
  el = h('section', 'scene ending');
  private base: string;
  private page: 'main' | 'credits';
  private qrKey = '';

  constructor(base: string, _reduced: boolean) {
    this.base = base;
    this.page = new URLSearchParams(location.search).get('page') === 'credits' ? 'credits' : 'main';
    this.el.innerHTML = `
      <div class="en-main">
        <div class="en-col">
          <div class="en-verdict" data-k="verdict">NOT REBUILT YET</div>
          <div class="en-proof" data-k="proof"></div>
          <div class="en-meta" data-k="meta"></div>
          <div class="en-sums">
            <div class="en-sum"><span class="l">original</span><span class="v" data-k="orig">--</span></div>
            <div class="en-sum rb"><span class="l">rebuilt</span><span class="v" data-k="rebuilt">--</span></div>
          </div>
          <div class="en-foot" data-k="foot"></div>
        </div>
        <div class="en-qr" data-k="qr"></div>
      </div>
      <div class="en-credits">
        <h1>CREDITS</h1>
        <div class="cc">
          <div><h2>BUILT TODAY</h2><p class="when">Nov 7, 2026, after 10:45</p><ul>
            <li>The compiler referee and the fakematch linter</li>
            <li>The agent crew: diggers, checker, archivist, distiller</li>
            <li>These scenes and the event server</li>
            <li>The heal overlay, hot-swap and phone page</li>
            <li>The contracts, fixtures and the public site</li></ul></div>
          <div><h2 class="no">NOT OURS</h2><ul>
            <li>DOOM by id Software, prBoom, and GBADoom by doomhack (GPL-2.0+): the hidden answer key, never shown to the agents</li>
            <li>Muse Spark (Meta), SubQ (Subquadratic), Agentverse and ASI:One (Fetch.ai), MongoDB Atlas</li>
            <li>mGBA, devkitARM, and the fonts (Google Fonts, OFL)</li>
            <li>Prior work: the planning kit in docs/ and the event clock</li></ul></div>
        </div>
      </div>`;
    this.el.classList.toggle('show-credits', this.page === 'credits');
  }

  /** the credits card carries no data, so no sample mark; the main page follows the stream */
  sample() { return this.page === 'credits' ? false : null; }

  setPage(p: 'main' | 'credits') {
    this.page = p;
    this.el.classList.toggle('show-credits', p === 'credits');
  }

  key(_ctx: Ctx, k: string) {
    if (k !== ' ') return false;
    this.page = this.page === 'main' ? 'credits' : 'main';
    this.el.classList.toggle('show-credits', this.page === 'credits');
    return true;
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'build' && ctx.state.build?.identical) ctx.fx.flash();
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const orig: string | null = ctx.side.romSha1;
    const b = s.build;
    const identical = !!b && b.identical === true && (!orig || orig === b.rom_sha1);
    const differ = !!b && (b.identical === false || (!!orig && orig !== b.rom_sha1));
    const state = identical ? 'ok' : differ ? 'bad' : 'none';
    if (this.el.dataset.state !== state) this.el.dataset.state = state;

    setText(this.el, 'verdict', identical ? 'IDENTICAL' : differ ? 'DIFFERENT' : 'NOT REBUILT YET');
    this.setSha('orig', orig, 'not in the manifest');
    this.setSha('rebuilt', b ? b.rom_sha1 : null, b ? 'no checksum reported' : '');

    // the rebuild proof, straight from build.rom; nothing here when there is no build yet
    const n = b && typeof b.recovered === 'number' ? b.recovered : null;
    const verdictWord = identical ? 'ROM identical' : differ ? 'ROM differs' : '';
    const proof = !b ? '' : n !== null
      ? `<b>${n}</b> agent-written function${n === 1 ? '' : 's'} \u00b7 ${verdictWord || 'no verdict reported'}`
      : (verdictWord || 'Build reported, no verdict');
    const pp = this.el.querySelector('[data-k="proof"]') as HTMLElement;
    if (pp.innerHTML !== proof) pp.innerHTML = proof;
    const meta: string[] = [];
    if (b && typeof b.pct_agent_code === 'number' && b.pct_agent_code > 10) meta.push(`${Math.round(b.pct_agent_code)}% agent code`);
    if (b && typeof b.rejected_count === 'number') meta.push(`${b.rejected_count} rejected by the compiler`);
    setText(this.el, 'meta', meta.join(' \u00b7 '));

    const total = gameTotal(ctx);
    const proved = `<b>${s.matched.length}</b> of ${total || '?'} pieces proved`;
    const foot = identical ? "IT'S ALIVE" : proved;
    const f = this.el.querySelector('[data-k="foot"]') as HTMLElement;
    if (f.innerHTML !== foot) f.innerHTML = foot;
    this.renderQr(ctx);
  }

  /** a SHA-1 shortened to its first and last 8 characters, full value on hover */
  private setSha(k: string, sha: unknown, empty: string) {
    const el = this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    const full = typeof sha === 'string' && sha ? sha : '';
    const text = !full ? empty : full.length > 20 ? `${full.slice(0, 8)}\u2026${full.slice(-8)}` : full;
    if (el.textContent !== text) el.textContent = text;
    if (el.title !== full) el.title = full;
  }

  private renderQr(ctx: Ctx) {
    const ph = ctx.state.phone;
    const key = ph ? `${ph.url}|${ph.qr_png}` : '';
    if (key === this.qrKey) return;
    this.qrKey = key;
    const el = this.el.querySelector('[data-k="qr"]') as HTMLElement;
    this.el.classList.toggle('has-qr', !!ph);
    el.classList.remove('loaded', 'qr-missing');
    if (!ph) { el.innerHTML = ''; return; }
    const src = ph.qr_png ? `${this.base}/file?path=${encodeURIComponent(ph.qr_png)}` : '';
    const url = String(ph.url ?? '').replace(/^https?:\/\//, '').replace(/\/$/, '');
    // no QR image: the link itself, big enough to type; no link either: ask us
    el.innerHTML = `<div class="p2">Player 2, press start</div>
      <div class="img">${src ? `<img alt="QR code for ${esc(url)}" src="${esc(src)}">` : ''}</div>
      <div class="alt">${url
        ? `<span class="lbl">Open on your phone</span><span class="big">${urlLines(url)}</span>`
        : `<span class="big">Ask us for the link</span>`}</div>
      <div class="url">${esc(url)}</div>`;
    const img = el.querySelector('img');
    if (!img) el.classList.add('qr-missing');
    else img.onerror = () => el.classList.add('qr-missing');
    if (img) img.onload = () => el.classList.add('loaded');
  }
}

/** a host split before its first dot into unbreakable pieces, so it wraps as "word-word" / ".trycloudflare.com" */
function urlLines(url: string): string {
  const [host, ...rest] = url.split('/');
  const parts = host.split('.');
  const head = `<i>${esc(parts[0])}</i>`;
  const tail = parts.length > 1 ? `<wbr><i>.${esc(parts.slice(1).join('.'))}</i>` : '';
  return head + tail + (rest.length ? `<wbr><i>/${esc(rest.join('/'))}</i>` : '');
}
