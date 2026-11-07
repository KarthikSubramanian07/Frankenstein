// The judgment rail, pure half: turns sponsor events into short lines for the Stage.
// No DOM here, so node tests run it. Every value on a line is a field of the event (or of run.started);
// when a field is missing the line says less, it never guesses.
import type { Ev, State } from './state.ts';
import { modelName } from './state.ts';

/** Who acted. `library` is the idiom library when it is not on MongoDB Atlas (we never claim Atlas we didn't use). */
export type Sponsor = 'snap' | 'muse' | 'gemini' | 'mongodb' | 'library' | 'asi';

/** What kind of act: a snap.decision op, or a habit being learned or judged. */
export type Op = 'triage' | 'decide' | 'review' | 'director' | 'route' | 'eyes' | 'learned' | 'judged';

export type Line = {
  id: number;
  sponsor: Sponsor;
  op: Op;
  /** same key = same toast: a new line with a visible key updates that toast instead of stacking */
  key: string;
  /** html-safe text, uppercased like the rest of the Stage; event values wrapped in <i> */
  text: string;
  /** 1 = background chatter, 5 = the moment */
  prio: number;
  ts: number;
};

export type Judge = {
  lines: Line[]; // newest last, capped
  n: number;
  asi: { query: string | null; label: string } | null; // the run came in through ASI:One
  libraryBackend: string | null; // run.started library_backend
};

export const LABEL: Record<Sponsor, string> = {
  snap: 'SUBQ SNAP', muse: 'MUSE', gemini: 'GEMINI', mongodb: 'MONGODB', library: 'LIBRARY', asi: 'ASI:ONE',
};

export function emptyJudge(): Judge {
  return { lines: [], n: 0, asi: null, libraryBackend: null };
}

type Draft = Omit<Line, 'id' | 'ts'>;

const esc = (s: string) => s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
const num = (x: unknown): number | null => (typeof x === 'number' && Number.isFinite(x) ? x : null);
/** a probability as the rail prints it: two decimals */
export const p2 = (x: number) => x.toFixed(2);
const v = (s: string) => `<i>${s}</i>`; // a value from the event, drawn in the sponsor's colour
const fnId = (f: unknown) => (typeof f === 'string' && /^fn_[0-9A-F]{8}$/.test(f) ? f : null);
const clip = (s: string, n: number) => (s.length > n ? `${s.slice(0, n - 1).trimEnd()}…` : s);
const up = (s: string) => esc(s.toUpperCase());

/** The Checker's lowest reject bar for either lab (crew/checker.py: Gemini rejects at 0.7 when Snap is also >= 0.5). */
const CLEAN_BELOW = 0.7;

function snapLine(s: State, e: Ev): Draft | null {
  const p = e.payload ?? {};
  const conf = num(p.confidence);
  const f = fnId(e.fn);
  switch (String(p.op ?? '')) {
    case 'triage': {
      const n = num(p.functions);
      const ms = num(p.latency_ms);
      if (n == null) return null;
      return { sponsor: 'snap', op: 'triage', key: 'triage', prio: 4,
        text: `READ ALL ${v(String(n))} FUNCTIONS${ms != null ? ` · ${v((ms / 1000).toFixed(1))} S` : ''}` };
    }
    case 'decide_next': {
      const a = String(p.action ?? '');
      const c = conf != null ? ` · ${v(p2(conf))}` : '';
      const key = `decide:${f}`;
      if (a === 'escalate') {
        const to = s.escalationModel ? ` TO ${up(modelName(s.escalationModel))}` : '';
        return { sponsor: 'snap', op: 'decide', key, prio: 4, text: `${v('ESCALATE')}${to}${c}` };
      }
      if (a === 'abandon') return { sponsor: 'snap', op: 'decide', key, prio: 4, text: `${v('ABANDON')}${f ? ` ${f}` : ''}${c}` };
      if (a === 'keep') return { sponsor: 'snap', op: 'decide', key, prio: 2, text: `${v('KEEP DIGGING')}${f ? ` ${f}` : ''}${c}` };
      return null;
    }
    case 'review': {
      const fake = num(p.fakematch_p);
      if (fake == null) return null;
      const rec = num(p.recital_p);
      const verdict = fake < CLEAN_BELOW && (rec == null || rec < CLEAN_BELOW) ? 'CLEAN' : 'FLAGGED';
      // `reviewer` arrived with the Gemini second opinion; before it, Snap was the only lab reviewing
      if (String(p.reviewer ?? 'snap') === 'gemini') {
        return { sponsor: 'gemini', op: 'review', key: 'review:gemini', prio: 2, text: `SECOND OPINION · FAKE? ${v(p2(fake))} · ${v(verdict)}` };
      }
      return { sponsor: 'snap', op: 'review', key: 'review:snap', prio: 1, text: `FAKE? ${v(p2(fake))} · ${v(verdict)}` };
    }
    case 'director': {
      const fns = (Array.isArray(p.fns) ? p.fns : []).map(fnId).filter((x: string | null): x is string => !!x);
      if (!fns.length) return null;
      // a fallback pick is the hottest running function, not Snap's call: no confidence shown
      const c = conf != null && !p.fallback ? ` · ${v(p2(conf))}` : '';
      return { sponsor: 'snap', op: 'director', key: 'director', prio: 4, text: `PLAY → ${v(fns[0])} NEXT${c}` };
    }
    case 'route': {
      const fns = (Array.isArray(p.fns) ? p.fns : []).map(fnId).filter((x: string | null): x is string => !!x);
      if (!fns.length) return null;
      const pr = p.p && typeof p.p === 'object' ? num(p.p[fns[0]]) : null;
      // the words themselves ride on the ASI:One chip (Judge.asi); the line says where Snap sent them
      return { sponsor: 'snap', op: 'route', key: 'route', prio: 5, text: `ROUTED → ${v(fns[0])}${pr != null ? ` · P ${v(p2(pr))}` : ''}` };
    }
    case 'eyes': {
      const ch = num(p.changed_as_claimed_p);
      if (ch == null) return null;
      return { sponsor: 'snap', op: 'eyes', key: 'eyes', prio: 5, text: `EYES: CHANGE ${v(ch >= 0.5 ? 'CONFIRMED' : 'NOT SEEN')} · ${v(p2(ch))}` };
    }
  }
  return null;
}

/** MongoDB only when the run says its library lives in Atlas (run.started library_backend). */
function habitSponsor(j: Judge): Sponsor {
  return j.libraryBackend && /mongo|atlas/i.test(j.libraryBackend) ? 'mongodb' : 'library';
}

/** Apply one event to the rail's state (s.judge). Returns the new lines; empty for events the rail ignores. */
export function judge(s: State, e: Ev): Line[] {
  const j = s.judge;
  const p = e.payload ?? {};
  let out: Draft | null = null;
  switch (e.type) {
    case 'run.started': {
      j.libraryBackend = typeof p.library_backend === 'string' ? p.library_backend : null;
      const label = typeof p.label === 'string' ? p.label : '';
      j.asi = /^asi:one/i.test(label) ? { query: j.asi?.query ?? null, label } : null;
      break;
    }
    case 'snap.decision':
      out = snapLine(s, e);
      if (p.op === 'route' && typeof p.query === 'string' && p.query.trim()) {
        j.asi = { query: p.query.trim(), label: j.asi?.label ?? '' };
      }
      break;
    case 'idiom.judged': {
      const st = String(p.status ?? '');
      const word = st === 'adopted' ? 'HABIT KEPT' : st === 'retired' ? 'HABIT RETIRED' : null;
      if (word) {
        const title = typeof p.title === 'string' && p.title.trim() ? `: ${up(clip(p.title.trim(), 21))}` : '';
        out = { sponsor: habitSponsor(j), op: 'judged', key: `judged:${p.idiom_id}`, prio: 3, text: `${v(word)}${title}` };
      }
      break;
    }
    case 'idiom.learned':
      // the Archivist's ticker already says "the library grows"; the rail adds only the Atlas attribution
      if (habitSponsor(j) === 'mongodb' && typeof p.title === 'string' && p.title.trim()) {
        out = { sponsor: habitSponsor(j), op: 'learned', key: 'learned', prio: 1, text: `${v('LEARNED')}: ${up(clip(p.title.trim(), 25))}` };
      }
      break;
  }
  if (!out) return [];
  const t = e.ts ? Date.parse(e.ts) : NaN;
  const line: Line = { ...out, id: ++j.n, ts: Number.isFinite(t) ? t : 0 };
  j.lines.push(line);
  if (j.lines.length > 40) j.lines.shift();
  return [line];
}

/** The Muse counter: attempts per model (the reducer's modelsUsed, from attempt.submitted payload.model). */
export function museCounts(s: State): { model: string; short: string; n: number }[] {
  return Object.entries(s.modelsUsed)
    .map(([model, n]) => ({ model, short: modelName(model).replace(/^MUSE\s+/, ''), n }))
    .sort((a, b) => Number(/wonder/i.test(a.model)) - Number(/wonder/i.test(b.model)));
}
