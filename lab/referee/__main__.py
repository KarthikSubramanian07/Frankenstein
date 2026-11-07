"""python -m lab.referee check|context|serve|mock (contract section 4).

  check   --fn fn_0801B7D4 --src cand.c [--json]
  context --fn fn_0801B7D4
  serve   [--port 7101]          real referee over HTTP
  mock    serve [--port 7101]    fixture-backed fake for other lanes
  rebuild --recovered runs/live/recovered [--emit]   ROM from the agents' code; SHA-1 must equal the original
  patch   --fn fn_X --src fixed.c                   fixed function in place; lists every changed function
"""
import argparse
import json
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

FIXTURES = Path(__file__).resolve().parents[2] / "contracts" / "fixtures"
MAX_BODY = 256 * 1024


def make_handler(referee, mock: bool):
    class Handler(BaseHTTPRequestHandler):
        def _send(self, code: int, body: dict | str) -> None:
            data = (json.dumps(body) if isinstance(body, dict) else body).encode()
            self.send_response(code)
            self.send_header("Content-Type", "application/json" if isinstance(body, dict) else "text/plain")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.send_header("Content-Length", str(len(data)))
            self.end_headers()
            self.wfile.write(data)

        def do_GET(self) -> None:
            if self.path == "/health":
                return self._send(200, {"ok": True, "mock": mock})
            if self.path.startswith("/context/"):
                fn = self.path.rsplit("/", 1)[1]
                if mock:
                    return self._send(200, f"/* mock context for {fn} */\n")
                try:
                    return self._send(200, referee.context(fn))
                except (FileNotFoundError, KeyError):
                    return self._send(404, {"error": f"unknown function {fn}"})
            self._send(404, {"error": "not found"})

        def do_POST(self) -> None:
            length = int(self.headers.get("Content-Length") or 0)
            if length > MAX_BODY:
                return self._send(413, {"error": "body too large"})
            try:
                body = json.loads(self.rfile.read(length) or b"{}")
            except json.JSONDecodeError:
                return self._send(400, {"error": "invalid JSON"})
            if self.path == "/check":
                fn, src = body.get("fn"), body.get("src")
                if not isinstance(fn, str) or not isinstance(src, str):
                    return self._send(400, {"error": "need {fn, src} strings"})
                if mock:
                    name = "match" if "MATCH" in src else "partial"
                    return self._send(200, {**json.loads((FIXTURES / f"referee_result.{name}.json").read_text()), "fn": fn})
                try:
                    return self._send(200, referee.check(fn, src))
                except KeyError as e:
                    return self._send(404, {"error": str(e)})
            if self.path in ("/rebuild", "/patch"):
                if mock:
                    name = "rebuild_result" if self.path == "/rebuild" else "patch_result"
                    return self._send(200, json.loads((FIXTURES / f"{name}.sample.json").read_text()))
                from .romlink import RomLinker
                linker = RomLinker(referee)
                try:
                    if self.path == "/rebuild":
                        return self._send(200, linker.rebuild(str(body.get("recovered_dir", "runs/live/recovered")), emit=bool(body.get("emit"))))
                    fn, src = body.get("fn"), body.get("src")
                    if not isinstance(fn, str) or not isinstance(src, str):
                        return self._send(400, {"error": "need {fn, src} strings"})
                    return self._send(200, linker.patch(fn, src))
                except (KeyError, ValueError) as e:
                    return self._send(400, {"error": str(e)})
            self._send(404, {"error": "not found"})

        def log_message(self, fmt: str, *args) -> None:
            sys.stderr.write("referee: " + fmt % args + "\n")

    return Handler


def main() -> None:
    p = argparse.ArgumentParser(prog="python -m lab.referee")
    p.add_argument("command", choices=["check", "context", "serve", "mock", "rebuild", "patch"])
    p.add_argument("--recovered", default="runs/live/recovered")
    p.add_argument("--emit", action="store_true")
    p.add_argument("sub", nargs="?")
    p.add_argument("--fn")
    p.add_argument("--src")
    p.add_argument("--port", type=int, default=7101)
    p.add_argument("--host", default="127.0.0.1")
    p.add_argument("--json", action="store_true")
    a = p.parse_args()

    mock = a.command == "mock"
    if a.command in ("serve", "mock"):
        referee = None if mock else _referee()
        print(f"referee {'mock ' if mock else ''}serving on {a.host}:{a.port}", file=sys.stderr)
        ThreadingHTTPServer((a.host, a.port), make_handler(referee, mock)).serve_forever()
    referee = _referee()
    if a.command == "context":
        print(referee.context(a.fn))
    elif a.command == "check":
        result = referee.check(a.fn, Path(a.src).read_text())
        print(json.dumps(result, indent=None if a.json else 1))
        sys.exit(0 if result["status"] == "MATCH" else 1)
    elif a.command in ("rebuild", "patch"):
        from .romlink import RomLinker
        linker = RomLinker(referee)
        result = linker.rebuild(a.recovered, emit=a.emit) if a.command == "rebuild" else linker.patch(a.fn, Path(a.src).read_text())
        print(json.dumps(result, indent=None if a.json else 1))
        ok = result.get("identical") if a.command == "rebuild" else "error" not in result and len(result["changed_functions"]) == 1
        sys.exit(0 if ok else 1)


def _referee():
    from .core import Referee
    return Referee()


if __name__ == "__main__":
    main()
