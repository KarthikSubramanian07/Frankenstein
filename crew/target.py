"""The crew's only view of the game: manifest, per-function asm, ctx headers, recovered neighbours.

All reads go through guard.safe_read. Original names never appear here (Lane A anonymizes to fn_ ids).
"""
from __future__ import annotations

import json

from .config import ROOT, Config
from .guard import safe_read


class Target:
    def __init__(self, cfg: Config, referee=None):
        self.cfg = cfg
        self.referee = referee
        self.manifest = json.loads(safe_read(cfg.manifest_path))
        self.fixture = bool(self.manifest.get("fixture"))
        self.fns = {f["id"]: f for f in self.manifest["functions"]}
        self.recovered: dict[str, str] = {}  # fn -> accepted C (this run)
        self._ctx_cache: dict[str, str] = {}

    @property
    def game_id(self) -> str:
        return self.manifest["game"]["id"]

    def game_functions(self, split: str | None = None) -> list[dict]:
        out = [f for f in self.manifest["functions"] if f["scope"] == "game"]
        return [f for f in out if split is None or f["split"] == split]

    def asm(self, fn: str) -> str:
        f = self.fns[fn]
        p = ROOT / f["asm_path"]
        if p.exists():
            return safe_read(p)
        # fixture manifest: no asm exists yet; give an honest placeholder so wiring can be tested
        return (f"@ {fn} at {f['addr']}, {f['size']} bytes, {f['mode']} (FIXTURE: Lane A's real asm is not here yet)\n"
                f"@ callees: {', '.join(f['callees']) or 'none'}\n"
                "\tpush\t{r4, lr}\n\tadds\tr4, r0, #0\n\tcmp\tr4, #0\n\tble\t.L2\n\tmuls\tr0, r1\n"
                "\tasrs\tr0, r0, #16\n.L2:\n\tpop\t{r4}\n\tpop\t{r1}\n\tbx\tr1\n")

    def context(self, fn: str) -> str:
        if fn in self._ctx_cache:
            return self._ctx_cache[fn]
        p = self.cfg.lab_out / "ctx" / f"{fn}.h"
        if p.exists():
            ctx = safe_read(p)
        elif self.referee is not None:
            try:
                ctx = self.referee.context(fn)
            except Exception:
                ctx = ""
        else:
            ctx = ""
        self._ctx_cache[fn] = ctx
        return ctx

    def neighbors(self, fn: str) -> dict:
        f = self.fns[fn]
        def info(i):
            return {"id": i, "size": self.fns[i]["size"], "recovered_c": self.recovered.get(i)} if i in self.fns else {"id": i}
        return {"callees": [info(i) for i in f["callees"]], "callers": [info(i) for i in f["callers"]]}
