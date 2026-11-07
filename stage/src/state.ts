// Pure run state, rebuilt from the event stream. No DOM here so tests can run it under node.
// Every number the scenes show comes from this state, which comes only from events.
import { emptyJudge, judge } from './judgment.ts';
import { rawLine } from './rawlog.ts';
import type { RawLine } from './rawlog.ts';
import type { Judge, Line } from './judgment.ts';

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

/** One lab's fake-gate screen of a byte match (SubQ Snap, or Gemini as the second opinion). */
export type Review = { reviewer: string; fakematch_p: number | null; recital_p: number | null; plausible_p: number | null; ts: number };
export type Matched = {
  fn: string; ts: number; attempts: number; minutes: number; cost_usd: number; lines: number; actor: string;
  models: Record<string, number>; // which Muse model wrote it (attempts per model)
  reviews: Review[]; // attached only when unambiguous (one review per lab since the last match)
};
/** A Digger's "matched" claim and what the Checker found. */
export type Checked = { fn: string; actor: string; attempt: number; text: string; status: string; match_pct: number; upheld: boolean; model: string | null; reviews: Review[]; ts: number };
/** Bytes matched, but the Checker refused it as compiler-coaxing (rules, SubQ Snap or Gemini). */
export type FakeRejected = { fn: string; actor: string; attempt: number; reason: string; ts: number };
/** A SubQ Snap decision that changed what the crew did (contracts v1.1 snap.decision). */
export type SnapDecision = { op: string; fn: string | null; p: any; ts: number };
export type FalseClaim = {
  fn: string; actor: string; attempt: number; match_pct: number; status: string;
  first_diff: FirstDiff | null; claim_text: string | null; ts: number; index: number;
};
export type Attempt = { fn: string; actor: string; attempt: number; src: string; ts: number; model: string | null };
export type Verdict = { fn: string; attempt: number; status: string; match_pct: number; lint_ok: boolean; claim_was_true: boolean | null; first_diff: FirstDiff | null; ts: number };

export type State = {
  mode: 'live' | 'replay' | 'none';
  speed: number;
  fixture: boolean;
  runId: string | null;
  label: string | null;
  model: string | null;
  gameId: string | null;
  bench: boolean; // bench runs are not Doom; always labelled
  snapOn: boolean;
  escalationModel: string | null;
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
  snap: SnapDecision[]; // every snap.decision, newest last (capped)
  snapCount: number;
  reviews: Review[]; // every fake-gate review in the run
  pendingReviews: Review[]; // reviews since the last fn.matched
  lastChecked: Checked | null; // newest claim the Checker re-ran
  fakes: FakeRejected[]; // fakematch.rejected: bytes matched but the Checker refused it (contract v1.1)
  modelsUsed: Record<string, number>; // attempts per Muse model
  raw: RawLine[]; // the machine log: one line per real event (rawlog.ts), last 200
  judge: Judge; // the judgment rail: sponsor lines (judgment.ts)
};

export type Effect =
  | { kind: 'matched'; m: Matched }
  | { kind: 'falseClaim'; c: FalseClaim }
  | { kind: 'verdict'; v: Verdict }
  | { kind: 'attempt'; a: Attempt }
  | { kind: 'narration'; text: string; mood: string; speak: boolean }
  | { kind: 'swap'; pct: number }
  | { kind: 'build' }
  | { kind: 'fake'; f: FakeRejected }
  | { kind: 'snap'; d: SnapDecision }
  | { kind: 'judgment'; line: Line }
  | { kind: 'reset' };

/** one fake per fn+attempt, whether it came as fakematch.rejected or verdict.fake_rejected */
function pushFake(s: State, fx: Effect[], f: FakeRejected) {
  if (s.fakes.some((x) => x.fn === f.fn && x.attempt === f.attempt)) return;
  s.fakes.push(f);
  fx.push({ kind: 'fake', f });
}

export function emptyState(): State {
  return {
    mode: 'none', speed: 1, fixture: false, runId: null, label: null, model: null, gameId: null, bench: false, snapOn: false, escalationModel: null, fnTotal: 0,
    t0: null, tNow: null, matched: [], matchedSet: new Set(), abandoned: 0, attempts: 0, verdicts: 0,
    lintFails: 0, falseClaims: [], claims: new Map(), claimsMade: 0, lastAttempt: null, lastVerdict: null,
    narration: [], idiomsLearned: 0, pctAgentCode: null, swaps: 0, build: null, patch: null, phone: null,
    tick: null, finished: null, ended: false, events: 0,
    snap: [], snapCount: 0, reviews: [], pendingReviews: [], lastChecked: null, fakes: [], modelsUsed: {}, raw: [],
    judge: emptyJudge(),
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
  const rl = rawLine(e);
  if (rl) { s.raw.push(rl); if (s.raw.length > 200) s.raw.shift(); }
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
      s.bench = p.game_id === 'bench' || /\bbench\b/i.test(String(p.label ?? ''));
      s.snapOn = !!p.snap;
      s.escalationModel = p.escalation_model ?? null;
      s.fnTotal = Number(p.fn_total) || 0;
      if (t != null) s.t0 = t;
      if (typeof p.label === 'string' && /\(sample\)|fixture/i.test(p.label)) s.fixture = true;
      break;
    case 'attempt.submitted': {
      s.attempts++;
      const a: Attempt = { fn: e.fn ?? '?', actor: e.actor ?? '?', attempt: Number(p.attempt) || 0, src: String(p.src_preview ?? ''), ts: t ?? 0, model: p.model ?? null };
      if (a.model) s.modelsUsed[a.model] = (s.modelsUsed[a.model] ?? 0) + 1;
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
      const claimText = [...s.claims].reverse().find(([k]) => { const [kf, , kat] = k.split('|'); return kf === v.fn && Number(kat) === v.attempt; });
      // a Digger's own words beat the crew's "(auto-submitted …)" placeholder when picking what Versus shows
      const auto = (x: string) => x.startsWith('(');
      if (claimText && (!auto(claimText[1]) || !s.lastChecked || auto(s.lastChecked.text))) {
        const [k, text] = claimText;
        const actor = k.split('|')[1];
        const model = s.lastAttempt && s.lastAttempt.fn === v.fn ? s.lastAttempt.model : null;
        s.lastChecked = { fn: v.fn, actor, attempt: v.attempt, text, status: v.status, match_pct: v.match_pct,
          upheld: v.claim_was_true !== false && v.status === 'MATCH', model, reviews: [], ts: v.ts };
      }
      // contract additive (Lane B): a byte MATCH the Checker refused as compiler-coaxing
      if (p.fake_rejected === true) pushFake(s, fx, { fn: v.fn, actor: 'checker', attempt: v.attempt, reason: String(p.reason ?? ''), ts: v.ts });
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
        // a review belongs to this match only if each lab screened exactly once since the last match
        const byLab = new Map<string, Review[]>();
        for (const r of s.pendingReviews) byLab.set(r.reviewer, [...(byLab.get(r.reviewer) ?? []), r]);
        const reviews = [...byLab.values()].every((rs) => rs.length === 1) ? s.pendingReviews.slice() : [];
        const m: Matched = {
          fn, ts: t ?? 0, attempts: Number(p.attempts) || 0, minutes: Number(p.minutes) || 0,
          cost_usd: Number(p.cost_usd) || 0, lines: Number(p.lines) || 0, actor: e.actor ?? '',
          models: p.models && typeof p.models === 'object' ? p.models : {}, reviews,
        };
        if (s.lastChecked && s.lastChecked.fn === fn) s.lastChecked.reviews = reviews;
        s.matchedSet.add(fn);
        s.matched.push(m);
        fx.push({ kind: 'matched', m });
      }
      s.pendingReviews = [];
      break;
    }
    case 'snap.decision': {
      s.snapCount++;
      const d: SnapDecision = { op: String(p.op ?? ''), fn: e.fn ?? null, p, ts: t ?? 0 };
      s.snap.push(d);
      if (s.snap.length > 60) s.snap.shift();
      if (d.op === 'review') {
        const num = (x: any) => (typeof x === 'number' && Number.isFinite(x) ? x : null);
        const r: Review = { reviewer: String(p.reviewer ?? 'snap'), fakematch_p: num(p.fakematch_p), recital_p: num(p.recital_p), plausible_p: num(p.period_plausible_p), ts: t ?? 0 };
        s.reviews.push(r);
        s.pendingReviews.push(r);
      }
      fx.push({ kind: 'snap', d });
      break;
    }
    case 'fn.abandoned': s.abandoned++; break;
    case 'fakematch.rejected': {
      pushFake(s, fx, { fn: e.fn ?? '?', actor: e.actor ?? 'checker', attempt: Number(p.attempt) || 0, reason: String(p.reason ?? ''), ts: t ?? 0 });
      break;
    }
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
  for (const line of judge(s, e)) fx.push({ kind: 'judgment', line });
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

/** Game functions in the whole target (manifest), falling back to this run's scope. */
export function pctOf(n: number, total: number): string {
  if (!total) return '--';
  const p = (100 * n) / total;
  return p > 0 && p < 10 ? p.toFixed(1) : String(Math.floor(p));
}

export const MODEL_SHORT: Record<string, string> = { 'muse-spark-1.3': 'MUSE SPARK', 'muse-wonder-1.0': 'MUSE WONDER' };
export function modelName(m: string | null | undefined): string {
  if (!m) return 'MUSE';
  return MODEL_SHORT[m] ?? m.replace(/-[\d.]+$/, '').replace(/-/g, ' ').toUpperCase();
}
