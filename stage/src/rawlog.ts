// One raw machine-log line per real event: time · who · fn · what happened. Pure (no DOM), so the
// reducer can keep the tail in state and a reconnect or a replay rebuilds the log exactly.
import type { Ev } from './state.ts';

export type RawKind = 'proved' | 'rejected' | 'dim';
export type RawLine = { ts: number; time: string; who: string; fn: string; text: string; kind: RawKind };

const pc = (x: unknown) => (typeof x === 'number' && Number.isFinite(x) ? `${(x * 100).toFixed(x < 0.1 ? 1 : 0)}%` : '?');
const pct = (x: unknown) => (typeof x === 'number' && Number.isFinite(x) ? `${x.toFixed(1)}%` : '?');
const model = (m: unknown) => (typeof m === 'string' ? m.replace(/^muse-/, '').replace(/-[\d.]+$/, '') : '');
const cut = (s: string, n: number) => (s.length > n ? `${s.slice(0, n - 1)}…` : s);

function hms(ts: string | undefined): { ts: number; time: string } {
  const t = ts ? Date.parse(ts) : NaN;
  if (!Number.isFinite(t)) return { ts: 0, time: '--:--:--' };
  return { ts: t, time: new Date(t).toTimeString().slice(0, 8) };
}

export function rawLine(e: Ev): RawLine | null {
  const p = e.payload ?? {};
  const { ts, time } = hms(e.ts);
  const fn = e.fn ?? '—';
  const actor = String(e.actor ?? '');
  const line = (who: string, text: string, kind: RawKind = 'dim'): RawLine => ({ ts, time, who, fn, text, kind });
  switch (e.type) {
    case 'run.started': return line('scheduler', `run ${e.run_id ?? ''} started · ${p.fn_total ?? '?'} functions · ${model(p.model)}`);
    case 'fn.claimed': return line(String(p.digger ?? actor), 'takes it');
    case 'attempt.submitted': return line(actor, `try ${p.attempt ?? '?'} · ${model(p.model) || 'muse'} wrote C`);
    case 'claim.made': return line(actor, `claims a match: "${cut(String(p.text ?? ''), 40)}"`);
    case 'verdict': {
      if (p.fake_rejected === true) return line('checker', `✗ REJECTED fake: ${cut(String(p.reason ?? ''), 48)}`, 'rejected');
      if (p.claim_was_true === false) return line('checker', `✗ REJECTED claimed right, ${pct(p.match_pct)} of bytes match`, 'rejected');
      const st = String(p.status ?? '');
      if (st === 'MATCH') return line('referee', `match 100% · try ${p.attempt ?? '?'}`);
      if (st === 'PARTIAL') {
        return line('referee', `✗ REJECTED only ${pct(p.match_pct)} of bytes match`, 'rejected');
      }
      if (st === 'NO_COMPILE') return line('referee', '✗ REJECTED does not compile', 'rejected');
      if (st === 'LINT_FAIL') return line('referee', '✗ REJECTED breaks the no-cheating rules', 'rejected');
      return line('referee', st.toLowerCase());
    }
    case 'fakematch.rejected': return line('checker', `✗ REJECTED fake: ${cut(String(p.reason ?? ''), 48)}`, 'rejected');
    case 'fn.matched': return line('checker', `✓ PROVED byte-identical · ${p.attempts ?? '?'} tries`, 'proved');
    case 'fn.abandoned': return line(actor, `gave up after ${p.attempts ?? '?'} tries · best ${pct(p.best_pct)}`);
    case 'snap.decision': {
      const op = String(p.op ?? '');
      if (op === 'review') {
        const gem = p.reviewer === 'gemini';
        return line(gem ? 'gemini' : 'snap', `${gem ? 'second opinion' : 'fake gate'} · ${pc(p.fakematch_p)} fake · ${pc(p.recital_p)} copied`);
      }
      const sure = typeof p.confidence === 'number' ? ` (${Math.round(p.confidence * 100)}%)` : '';
      if (op === 'decide_next') return line('snap', `${String(p.action ?? 'keep')}${sure} after try ${p.attempt ?? '?'}`);
      if (op === 'triage') return line('snap', `triaged ${p.functions ?? '?'} functions`);
      if (op === 'director') return line('snap', `picked from play${sure}`);
      if (op === 'eyes') return line('snap', 'compared two frames');
      if (op === 'route') return line('snap', 'routed a request');
      return line('snap', op);
    }
    case 'idiom.learned': return line(actor || 'distiller', `learned idiom: ${cut(String(p.title ?? p.idiom_id ?? ''), 40)}`);
    case 'idiom.used': return line(actor, `uses idiom ${p.idiom_id ?? '?'}`);
    case 'build.rom': return line('lab', `rebuilt the ROM · ${p.identical ? 'identical' : 'DIFFERENT'} · ${String(p.rom_sha1 ?? '').slice(0, 12)}`, p.identical ? 'proved' : 'rejected');
    case 'rom.swapped': return line('creature', `hot-swapped · ${p.pct_agent_code ?? '?'}% agent-written`);
    case 'patch.verified': return line('lab', `patch verified · ${Array.isArray(p.changed_functions) ? p.changed_functions.length : '?'} function changed`, 'proved');
    case 'run.finished': return line('scheduler', `run finished · ${p.matched ?? '?'} matched · ${p.abandoned ?? '?'} abandoned`);
    default: return null; // metric.tick, narration and the rest stay off the log
  }
}
