// Pure run state, rebuilt from the event stream. No DOM here so tests can run it under node.
// Every number the scenes show comes from this state, which comes only from events.

export type Ev = {
  v?: number;
  ts?: string;
  run_id?: string;
  seq?: number;
  type: string;
  actor?: string;
  fn?: string | null;
  payload?: any;
  [k: string]: any;
};

export type FirstDiff = { offset: number; expected: string; got: string; expected_ins: string; got_ins: string };

export type Matched = { fn: string; ts: number; attempts: number; minutes: number; cost_usd: number; lines: number; actor: string };
export type FalseClaim = {
  fn: string; actor: string; attempt: number; match_pct: number; status: string;
  first_diff: FirstDiff | null; claim_text: string | null; ts: number; index: number;
};
export type Attempt = { fn: string; actor: string; attempt: number; src: string; ts: number };
export type Verdict = { fn: string; attempt: number; status: string; match_pct: number; lint_ok: boolean; claim_was_true: boolean | null; first_diff: FirstDiff | null; ts: number };

export type State = {
  mode: 'live' | 'replay' | 'none';
  speed: number;
  fixture: boolean;
  runId: string | null;
  label: string | null;
  model: string | null;
  gameId: string | null;
  fnTotal: number;
  t0: number | null;
  tNow: number | null;
  matched: Matched[];
  matchedSet: Set<string>;
  abandoned: number;
  attempts: number;
  verdicts: number;
  lintFails: number;
  falseClaims: FalseClaim[];
  claims: Map<string, string>; // `${fn}|${actor}|${attempt}` -> claim text
  claimsMade: number;
  lastAttempt: Attempt | null;
  lastVerdict: Verdict | null;
  narration: { text: string; mood: string; speak: boolean; ts: number }[];
  idiomsLearned: number;
  pctAgentCode: number | null; // from rom.swapped
  swaps: number;
  build: any | null; // build.rom payload
  patch: any | null; // patch.verified payload
  phone: any | null; // phone.published payload
  tick: any | null; // last metric.tick payload
  finished: any | null; // run.finished payload
  ended: boolean; // replay reached the end of the file
  events: number;
};

export type Effect =
  | { kind: 'matched'; m: Matched }
  | { kind: 'falseClaim'; c: FalseClaim }
  | { kind: 'verdict'; v: Verdict }
  | { kind: 'attempt'; a: Attempt }
  | { kind: 'narration'; text: string; mood: string; speak: boolean }
  | { kind: 'swap'; pct: number }
  | { kind: 'build' }
  | { kind: 'reset' };

export function emptyState(): State {
  return {
    mode: 'none', speed: 1, fixture: false, runId: null, label: null, model: null, gameId: null, fnTotal: 0,
    t0: null, tNow: null, matched: [], matchedSet: new Set(), abandoned: 0, attempts: 0, verdicts: 0,
    lintFails: 0, falseClaims: [], claims: new Map(), claimsMade: 0, lastAttempt: null, lastVerdict: null,
    narration: [], idiomsLearned: 0, pctAgentCode: null, swaps: 0, build: null, patch: null, phone: null,
    tick: null, finished: null, ended: false, events: 0,
  };
}

const tsOf = (e: Ev): number | null => {
  if (!e.ts) return null;
  const t = Date.parse(e.ts);
  return Number.isFinite(t) ? t : null;
};

/** Apply one event. Mutates `s`, returns the visual effects it should trigger. */
export function apply(s: State, e: Ev): Effect[] {
  const fx: Effect[] = [];
  if (!e || typeof e.type !== 'string') return fx;
  const p = e.payload ?? {};
  const t = tsOf(e);
  if (e.type === 'stage.hello') {
    Object.assign(s, emptyState());
    s.mode = e.mode === 'replay' ? 'replay' : 'live';
    s.speed = Number(e.speed) || 1;
    s.runId = e.run_id ?? null;
    fx.push({ kind: 'reset' });
    return fx;
  }
  if (e.type === 'stage.end') { s.ended = true; return fx; }
  if (e.type === 'fixture') { s.fixture = true; return fx; }
  s.events++;
  if (t != null) {
    if (s.t0 == null) s.t0 = t;
    if (s.tNow == null || t > s.tNow) s.tNow = t;
  }
  switch (e.type) {
    case 'run.started':
      s.runId = e.run_id ?? s.runId;
      s.label = p.label ?? null;
      s.model = p.model ?? null;
      s.gameId = p.game_id ?? null;
      s.fnTotal = Number(p.fn_total) || 0;
      if (t != null) s.t0 = t;
      if (typeof p.label === 'string' && /\(sample\)|fixture/i.test(p.label)) s.fixture = true;
      break;
    case 'attempt.submitted': {
      s.attempts++;
      const a: Attempt = { fn: e.fn ?? '?', actor: e.actor ?? '?', attempt: Number(p.attempt) || 0, src: String(p.src_preview ?? ''), ts: t ?? 0 };
      s.lastAttempt = a;
      fx.push({ kind: 'attempt', a });
      break;
    }
    case 'claim.made':
      s.claimsMade++;
      s.claims.set(`${e.fn}|${e.actor}|${p.attempt}`, String(p.text ?? ''));
      break;
    case 'verdict': {
      s.verdicts++;
      const v: Verdict = {
        fn: e.fn ?? '?', attempt: Number(p.attempt) || 0, status: String(p.status ?? ''),
        match_pct: Number(p.match_pct) || 0, lint_ok: p.lint_ok !== false,
        claim_was_true: p.claim_was_true ?? null, first_diff: p.first_diff ?? null, ts: t ?? 0,
      };
      if (v.status === 'LINT_FAIL') s.lintFails++;
      s.lastVerdict = v;
      fx.push({ kind: 'verdict', v });
      if (v.claim_was_true === false) {
        // who claimed it: the digger who submitted this fn+attempt
        let actor = '';
        let text: string | null = null;
        for (const [k, val] of s.claims) {
          const [kf, ka, kat] = k.split('|');
          if (kf === v.fn && Number(kat) === v.attempt) { actor = ka; text = val; }
        }
        if (!actor && s.lastAttempt && s.lastAttempt.fn === v.fn) actor = s.lastAttempt.actor;
        const c: FalseClaim = {
          fn: v.fn, actor: actor || 'digger', attempt: v.attempt, match_pct: v.match_pct, status: v.status,
          first_diff: v.first_diff, claim_text: text, ts: v.ts, index: s.falseClaims.length + 1,
        };
        s.falseClaims.push(c);
        fx.push({ kind: 'falseClaim', c });
      }
      break;
    }
    case 'fn.matched': {
      const fn = e.fn ?? '';
      if (fn && !s.matchedSet.has(fn)) {
        const m: Matched = {
          fn, ts: t ?? 0, attempts: Number(p.attempts) || 0, minutes: Number(p.minutes) || 0,
          cost_usd: Number(p.cost_usd) || 0, lines: Number(p.lines) || 0, actor: e.actor ?? '',
        };
        s.matchedSet.add(fn);
        s.matched.push(m);
        fx.push({ kind: 'matched', m });
      }
      break;
    }
    case 'fn.abandoned': s.abandoned++; break;
    case 'idiom.learned': s.idiomsLearned++; break;
    case 'narration': {
      const n = { text: String(p.text ?? ''), mood: String(p.mood ?? 'dry'), speak: !!p.speak, ts: t ?? 0 };
      s.narration.push(n);
      if (s.narration.length > 50) s.narration.shift();
      fx.push({ kind: 'narration', text: n.text, mood: n.mood, speak: n.speak });
      break;
    }
    case 'metric.tick': s.tick = p; break;
    case 'rom.swapped':
      s.swaps++;
      if (typeof p.pct_agent_code === 'number') { s.pctAgentCode = p.pct_agent_code; fx.push({ kind: 'swap', pct: p.pct_agent_code }); }
      break;
    case 'build.rom': s.build = p; fx.push({ kind: 'build' }); break;
    case 'patch.verified': s.patch = p; break;
    case 'phone.published': s.phone = p; break;
    case 'run.finished': s.finished = p; break;
  }
  return fx;
}

/** % recovered, from matched events and the run's own fn_total. null when unknown. */
export function pctRecovered(s: State): number | null {
  if (!s.fnTotal) return null;
  return (100 * s.matched.length) / s.fnTotal;
}

export function elapsedS(s: State): number | null {
  if (s.t0 == null || s.tNow == null) return null;
  return Math.max(0, (s.tNow - s.t0) / 1000);
}

export function fmtClock(sec: number | null): string {
  if (sec == null) return '--:--';
  const m = Math.floor(sec / 60);
  const ss = Math.floor(sec % 60);
  return `${String(m).padStart(2, '0')}:${String(ss).padStart(2, '0')}`;
}

export function fmtPct(p: number | null, digits = 0): string {
  if (p == null) return '--';
  return p.toFixed(digits);
}
