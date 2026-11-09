"""Bench referee: contract section 4 against the real compiler, for the bench in crew/bench/out/.

  python3 -m crew.bench.referee serve --port 7101
  python3 -m crew.bench.referee check --fn fn_08000250 --src cand.c [--json]
  python3 -m crew.bench.referee context --fn fn_08000250
  python3 -m crew.bench.referee rebuild --recovered runs/live/recovered [--json]

Reads only crew/bench/out/ (targets.json, ctx/) and the candidate. It never opens crew/bench/answers/, so
it cannot return answer-key text.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
import tempfile
import threading
import time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

from crew.bench.core import OUT, ROOT, compare, compile_c, compiler_version, disasm, extract, \
    find_function, read_elf
from crew.httpguard import cross_site_error
from lab.referee.lint import lint as lab_lint
try:  # keep the hard-floor rules identical to the crew's mirror of Lane A's linter
    from crew.referee import LINT_RULES
except ImportError:  # crew/referee.py not present in this checkout: same rules, inlined
    LINT_RULES = [
        ("L001", re.compile(r"\b(__asm__|__asm|asm)\s*(volatile\s*)?\("), "inline assembly is not allowed"),
        ("L002", re.compile(r"\.(2byte|4byte|byte|word|inst)\b"), "raw bytes emitted into code"),
        ("L003", re.compile(r"#\s*pragma|__attribute__"), "codegen-changing pragma or attribute"),
        ("L004", re.compile(r"register\s+[^;]*\basm\s*\("), "register asm binding"),
    ]

_ASM_MNEMONICS = (
    "adc|adcs|add|adds|and|ands|asr|asrs|b|bl|blx|bx|beq|bne|bcs|bcc|bhs|blo|bmi|bpl|bvs|bvc|bhi|bls|bge|blt|bgt|"
    "ble|bic|bics|cmn|cmp|eor|eors|ldmia|ldr|ldrb|ldrh|ldrsb|ldrsh|lsl|lsls|lsr|lsrs|mov|movs|mul|muls|mvn|mvns|"
    "neg|negs|nop|orr|orrs|pop|push|ror|rors|rsb|rsbs|sbc|sbcs|stmia|str|strb|strh|sub|subs|swi|svc|tst")
_ASM_LINE = re.compile(
    r"^\s*(?:[0-9a-f]{1,8}:\s*)?(?:[0-9a-f]{4,8}\s+)?(?:" + _ASM_MNEMONICS + r")(?:\.n|\.w)?\s+"
    r"(?:r\d+|sp|lr|pc|\{|\[|#|\.L|fn_|data_|__aeabi|0x|[0-9a-f]+\s*<)", re.I)
_LOCK = threading.Lock()
_STATE: dict = {}
MAX_BODY = 256 * 1024
# Candidate C is compiled on the host, so the include and directive rules of Lane A's hardened lint apply too:
# a quoted or absolute #include would print another file's lines (.env, crew/bench/answers/) in the compile log.
INCLUDE_RULES = ("L009", "L010")


def _load() -> dict:
    with _LOCK:
        if not _STATE:
            t = json.loads((OUT / "targets.json").read_text())
            _STATE["targets"] = t["functions"]
            _STATE["rom_sha1"] = t["rom_sha1"]
            _STATE["manifest"] = json.loads((OUT / "manifest.json").read_text())
            _STATE["referee"] = f"bench@{compiler_version()}"
        return _STATE


def referee_name() -> str:
    return _load()["referee"]


def lint(src: str) -> list[dict]:
    viol = [{"rule": r, "reason": why} for r, rx, why in LINT_RULES if rx.search(src)]
    run = 0
    for line in src.splitlines():
        body = re.sub(r"^\s*(/\*+|\*+/?|//+)\s*", "", line)
        body = re.sub(r"\*/\s*$", "", body)
        if _ASM_LINE.match(body):
            run += 1
            if run >= 4:
                viol.append({"rule": "L008", "reason": "4+ consecutive lines of assembly text copied into the C"})
                break
        elif body.strip():
            run = 0
    return viol + [v for v in lab_lint(src, 0)["violations"] if v["rule"] in INCLUDE_RULES]


def context(fn: str) -> str:
    st = _load()
    if fn not in st["targets"]:
        raise KeyError(fn)
    return (OUT / "ctx" / f"{fn}.h").read_text()


# /rebuild over HTTP reads only run directories, never an arbitrary path from the request body.
REBUILD_ROOTS = (os.path.realpath(ROOT / "runs"), os.path.realpath(ROOT / "crew" / "exports"))

LOG_PATH_RE = re.compile(r"^(?:In file included from|\s+from)?\s*([^\s:]+):\d+(?::\d+)?[:,]", re.M)


def _clean_log(log: str, tmp: str) -> str:
    log = log.replace(tmp + "/", "").replace(tmp, "")
    for m in LOG_PATH_RE.finditer(log):  # second line of defence behind L009: only our files and system headers
        path = m.group(1)
        if path not in ("candidate.c", "ctx.h", "<command-line>", "<built-in>") and not (path.startswith("/") and "/include/" in path):
            return "compile log withheld: the compiler reported on a file outside the candidate and its headers"
    log = re.sub(r"(?<![\w.])/(?:[^\s:'\"]+/)+([^\s:'\"/]+)", r"\1", log)  # strip any other absolute path
    return log[-6000:]


def check(fn: str, src: str) -> dict:
    t0 = time.time()
    st = _load()
    if fn not in st["targets"]:
        raise KeyError(fn)
    target = st["targets"][fn]
    base = {"v": 1, "fn": fn, "referee": st["referee"], "first_diff": None, "diff": [], "match_pct": 0.0}

    def done(d: dict) -> dict:
        d["elapsed_ms"] = int((time.time() - t0) * 1000)
        return d

    viol = lint(src)
    if viol:
        return done({**base, "status": "LINT_FAIL", "lint": {"ok": False, "violations": viol},
                     "compile": {"ok": False, "log": "not compiled: lint failed"}})
    okl = {"ok": True, "violations": []}
    with tempfile.TemporaryDirectory(prefix="benchref-") as td:
        tdp = Path(td)
        (tdp / "ctx.h").write_text(context(fn))
        (tdp / "candidate.c").write_text(src)
        try:
            r = compile_c(Path("candidate.c"), Path("candidate.o"), include=Path("ctx.h"), cwd=tdp, timeout=15)
        except Exception as e:  # timeout
            return done({**base, "status": "NO_COMPILE", "lint": okl, "compile": {"ok": False, "log": f"compiler: {e}"}})
        log = _clean_log(r.stderr, td)
        if r.returncode != 0:
            return done({**base, "status": "NO_COMPILE", "lint": okl, "compile": {"ok": False, "log": log}})
        elf = read_elf(tdp / "candidate.o")
        sym = find_function(elf, fn)
        if sym is None:
            return done({**base, "status": "NO_COMPILE", "lint": okl,
                         "compile": {"ok": False, "log": (log + "\n" if log else "") +
                                     f"compiled, but no function named {fn} is defined; name your function exactly {fn}"}})
        cand = extract(elf, sym)
        res = compare(target, cand, None)
        if res["status"] != "MATCH":
            units = disasm(tdp / "candidate.o", sym.value & ~1, sym.size, cand.relocs)
            res = compare(target, cand, units)
        return done({**base, **res, "lint": okl, "compile": {"ok": True, "log": log}})


def rebuild(recovered_dir: str) -> dict:
    """Bench stand-in for the source-tree rebuild: every recovered fn_*.c is re-checked against its target.
    identical is true only if every recovered function matches; unrecovered functions come from the original."""
    st = _load()
    d = Path(recovered_dir)
    d = d if d.is_absolute() else ROOT / d
    game = [f["id"] for f in st["manifest"]["functions"] if f["scope"] == "game"]
    matched, mismatched = [], []
    for p in sorted(d.glob("fn_*.c")) if d.is_dir() else []:
        if p.stem not in st["targets"]:
            continue
        res = check(p.stem, p.read_text(errors="replace"))
        (matched if res["status"] == "MATCH" else mismatched).append(p.stem)
    identical = not mismatched
    rom_sha1 = st["rom_sha1"] if identical else hashlib.sha1(
        (st["rom_sha1"] + "|" + ",".join(mismatched)).encode()).hexdigest()
    return {"v": 1, "rom_sha1": rom_sha1, "original_sha1": st["rom_sha1"], "identical": identical,
            "recovered": len(matched), "from_original": len(game) - len(matched), "mismatched": mismatched,
            "method": "source-tree", "bench": True,
            "note": "bench rebuild: recovered functions re-checked from their C; rom_sha1 differs if any mismatch"}


# --------------------------------------------------------------------------------------------- HTTP

class Handler(BaseHTTPRequestHandler):
    server_version = "bench-referee/1"

    def log_message(self, fmt, *args):  # quiet; one line per request to stderr
        sys.stderr.write("bench-referee %s\n" % (fmt % args))

    def _send(self, code: int, obj: dict) -> None:
        body = json.dumps(obj).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def _body(self) -> dict:
        n = int(self.headers.get("Content-Length") or 0)
        if not 0 <= n <= MAX_BODY:
            raise ValueError("body too large")
        body = json.loads(self.rfile.read(n) or b"{}")
        if not isinstance(body, dict):
            raise ValueError("body must be a JSON object")
        return body

    def do_GET(self):
        if refused := cross_site_error(self, post=False):
            return self._send(refused[0], {"error": refused[1]})
        path = self.path.split("?", 1)[0].rstrip("/")
        if path == "/health":
            return self._send(200, {"ok": True, "referee": referee_name()})
        if path.startswith("/context/"):
            fn = path[len("/context/"):]
            try:
                return self._send(200, {"fn": fn, "ctx": context(fn)})
            except KeyError:
                return self._send(404, {"error": f"unknown fn {fn}"})
        if path == "/manifest":
            return self._send(200, _load()["manifest"])
        return self._send(404, {"error": "not found"})

    def do_POST(self):
        path = self.path.split("?", 1)[0].rstrip("/")
        if refused := cross_site_error(self, post=True):
            return self._send(refused[0], {"error": refused[1]})
        try:
            body = self._body()
        except Exception:
            return self._send(400, {"error": "body must be a JSON object of at most 256 KB"})
        if path == "/check":
            fn, src = body.get("fn"), body.get("src")
            if not isinstance(fn, str) or not isinstance(src, str):
                return self._send(400, {"error": "need {fn, src}"})
            try:
                return self._send(200, check(fn, src))
            except KeyError:
                return self._send(404, {"error": f"unknown fn {fn}"})
        if path == "/rebuild":
            raw = body.get("recovered_dir") or "runs/live/recovered"
            d = os.path.realpath(os.path.join(ROOT, raw)) if isinstance(raw, str) else ""
            runs, exports = REBUILD_ROOTS
            if not (d.startswith(runs + os.sep) or d.startswith(exports + os.sep)):
                return self._send(400, {"error": "recovered_dir must be inside runs/ or crew/exports/"})
            return self._send(200, rebuild(d))
        if path == "/patch":
            return self._send(501, {"error": "patch is not supported by the bench referee"})
        return self._send(404, {"error": "not found"})


def serve(port: int, host: str = "127.0.0.1") -> None:
    _load()
    httpd = ThreadingHTTPServer((host, port), Handler)
    httpd.daemon_threads = True
    print(f"bench referee {referee_name()} on http://{host}:{port} ({len(_STATE['targets'])} functions)", flush=True)
    httpd.serve_forever()


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python3 -m crew.bench.referee")
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("serve")
    s.add_argument("--port", type=int, default=7101)
    s.add_argument("--host", default="127.0.0.1")
    c = sub.add_parser("check")
    c.add_argument("--fn", required=True)
    c.add_argument("--src", required=True)
    c.add_argument("--json", action="store_true")
    x = sub.add_parser("context")
    x.add_argument("--fn", required=True)
    r = sub.add_parser("rebuild")
    r.add_argument("--recovered", required=True)
    r.add_argument("--json", action="store_true")
    a = ap.parse_args(argv)
    if a.cmd == "serve":
        serve(a.port, a.host)
    elif a.cmd == "check":
        res = check(a.fn, Path(a.src).read_text())
        print(json.dumps(res, indent=None if a.json else 1))
        return 0 if res["status"] == "MATCH" else 1
    elif a.cmd == "context":
        print(context(a.fn), end="")
    elif a.cmd == "rebuild":
        print(json.dumps(rebuild(a.recovered), indent=None if a.json else 1))
    return 0


if __name__ == "__main__":
    sys.exit(main())
