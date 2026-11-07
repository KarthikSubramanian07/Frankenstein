"""SubQ Snap's eyes: did the patched game visibly change the way we claimed? (behaviour, not bytes)

    python -m crew.eyes before.png after.png --claim "the shotgun fires twice as fast" [--run runs/live] [--fn fn_…]

Two frames from the same moment of play: the original ROM and the patched one. Snap answers two yes/no questions
(changed as claimed; otherwise the same) and the result is appended to the run's events.jsonl as a
`snap.decision` with op "eyes", so the Stage can show it next to the referee's "1 function changed".
The referee proves the bytes; this is observed behaviour, labelled as such.
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from .config import Config
from .director import eyes


class _AppendLog:
    """Append one event to an existing run (seq continues after the last line)."""

    def __init__(self, run_dir: Path):
        self.path = run_dir / "events.jsonl"
        self.run_id = run_dir.resolve().name
        last = 0
        if self.path.exists():
            for line in self.path.read_text().splitlines():
                try:
                    last = max(last, int(json.loads(line).get("seq", 0)))
                except (json.JSONDecodeError, ValueError, AttributeError):
                    continue
        self.seq = last

    def emit(self, type_, actor, fn=None, **payload):
        from .events import now_iso

        self.seq += 1
        ev = {"v": 1, "ts": now_iso(), "run_id": self.run_id, "seq": self.seq, "type": type_, "actor": actor,
              "fn": fn, "payload": payload}
        with self.path.open("a") as fh:
            fh.write(json.dumps(ev, separators=(",", ":")) + "\n")
        return ev


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m crew.eyes", description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("before")
    ap.add_argument("after")
    ap.add_argument("--claim", required=True)
    ap.add_argument("--run", default="", help="run dir to append the decision to (e.g. runs/live)")
    ap.add_argument("--fn", default=None)
    a = ap.parse_args(argv)
    log = _AppendLog(Path(a.run)) if a.run else None
    r = eyes(Config(), Path(a.before).read_bytes(), Path(a.after).read_bytes(), a.claim, log=log, fn=a.fn)
    print(json.dumps(r, indent=2))
    ok = (r.get("changed_as_claimed_p") or 0) >= 0.5 and (r.get("otherwise_same_p") or 0) >= 0.5
    print("Snap's eyes: " + ("the change shows, nothing else broke." if ok else "not convinced. Look again."),
          file=sys.stderr)
    return 0 if ok else 2


if __name__ == "__main__":
    raise SystemExit(main())
