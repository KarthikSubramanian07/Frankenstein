"""Score a crew run's inferred names.json against the hidden answer key. Prints aggregates only.

    python3 -m lab.score_names <names.json> [--json] [--private-detail lab/secrets/<file>]

Similarity (documented so Lane B knows what is measured):
  1. Normalise both names: drop a GBADoom module prefix (`P_`, `ST_`, `R_`, `A_`, `HU_`, ... any
     1-3 capitals followed by `_`), split camelCase and snake_case, lowercase.
     `P_SetMobjState` -> [set, mobj, state]; `set_mobj_state` -> [set, mobj, state].
  2. similarity = Jaccard overlap of the two token sets (0..1); exact = token lists are equal.
  A null inferred name, or a function missing from the key, scores 0.
  subsystem_hits: only when names.json entries carry a `subsystem` guess; compared with the
  subsystem lab/out/viz_map.json assigns to that function (built from the real source files).

Lane B's agents read this output, so it never prints a real name or a per-function pairing.
Per-function detail goes only to a file inside lab/secrets/ via --private-detail.
"""
import argparse
import json
import re
import sys
from pathlib import Path

LAB = Path(__file__).resolve().parent
SECRETS = LAB / "secrets"
KEY = SECRETS / "names.json"
VIZ_MAP = LAB / "out" / "viz_map.json"

_PREFIX = re.compile(r"^[A-Z]{1,3}_")
_CAMEL = re.compile(r"(?<=[a-z0-9])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])")


def tokens(name):
    if not name:
        return []
    name = _CAMEL.sub("_", _PREFIX.sub("", name.strip()))
    return [t.lower() for t in re.split(r"[^A-Za-z0-9]+", name) if t]


def similarity(a, b):
    ta, tb = set(tokens(a)), set(tokens(b))
    return len(ta & tb) / len(ta | tb) if ta and tb else 0.0


def load_subsystems():
    try:
        subs = json.loads(VIZ_MAP.read_text())["subsystems"]
    except (OSError, ValueError, KeyError):
        return {}
    return {fn: s["id"] for s in subs for fn in s.get("functions", [])}


def score(run, key, fn_subsystem=None):
    """Return (aggregate dict, per-function detail list). Only the aggregate is ever printed."""
    entries = run.get("names", [])
    detail = []
    for e in entries:
        real = (key.get(e["fn"]) or {}).get("name")
        guess = e.get("name")
        row = {"fn": e["fn"], "inferred": guess, "real": real,
               "similarity": round(similarity(guess, real), 4),
               "exact": bool(real and guess and tokens(guess) == tokens(real))}
        if "subsystem" in e:
            row["subsystem_guess"] = e["subsystem"]
            row["subsystem_real"] = (fn_subsystem or {}).get(e["fn"])
        detail.append(row)
    n = len(detail)
    agg = {"run_id": run.get("run_id"), "fn_count": n,
           "in_key": sum(r["real"] is not None for r in detail),
           "exact": sum(r["exact"] for r in detail),
           "mean_similarity": round(sum(r["similarity"] for r in detail) / n, 4) if n else 0.0}
    if any("subsystem_guess" in r for r in detail):
        agg["subsystem_hits"] = sum(1 for r in detail if r.get("subsystem_guess")
                                    and r.get("subsystem_guess") == r.get("subsystem_real"))
    return agg, detail


def private_path(arg):
    p = Path(arg).resolve()
    if not p.is_relative_to(SECRETS.resolve()):
        sys.exit(f"--private-detail must be inside {SECRETS}; refusing {arg}")
    return p


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("names_json")
    ap.add_argument("--json", action="store_true", help="print the aggregate as JSON")
    ap.add_argument("--private-detail", metavar="FILE", help="write per-function detail (lab/secrets/ only)")
    a = ap.parse_args(argv)
    detail_path = private_path(a.private_detail) if a.private_detail else None
    if not KEY.exists():
        sys.exit("answer key is on Lane A's machine (lab/secrets/names.json missing); ask Lane A to score this run")
    run = json.loads(Path(a.names_json).read_text())
    agg, detail = score(run, json.loads(KEY.read_text()), load_subsystems())
    if detail_path:
        detail_path.write_text(json.dumps(detail, indent=1))
    if a.json:
        print(json.dumps(agg))
    else:
        print(" ".join(f"{k}={v}" for k, v in agg.items()))
    return agg


if __name__ == "__main__":
    main()
