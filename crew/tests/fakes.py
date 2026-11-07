"""Test doubles for the crew: a scripted OpenAI-style model, scripted referees, and small helpers.

Nothing here touches the network. FakeLLM speaks the same interface as crew.llm.LLM (cfg, usage, chat)
and records every call so tests can assert on models, efforts and the conversation the Digger built.
"""
from __future__ import annotations

import functools
import itertools
import json
import re
import sys
import threading
from pathlib import Path

from crew.config import ROOT, Config
from crew.llm import LLMError, Usage
from crew.prompts import DISTILL_SYSTEM
from crew.referee import MockReferee

FIXTURE = "contracts/fixtures/manifest.sample.json"
BASE_MODEL = "muse-spark-1.3"
ESC_MODEL = "muse-wonder-1.0"

sys.path.insert(0, str(ROOT / "contracts"))
import validate  # noqa: E402

VALIDATORS = validate.load_validators()


def offline_config(tmp_path: Path | None = None) -> Config:
    """A Config that can never reach a real service, whatever the developer's .env holds."""
    cfg = Config()
    cfg.api_key = ""
    cfg.subq_key = ""
    cfg.mongodb_uri = ""
    cfg.referee_url = "mock"
    cfg.model = BASE_MODEL
    cfg.escalation_model = ESC_MODEL
    cfg.reasoning_effort = "high"
    if tmp_path is not None:
        cfg.runs_dir = Path(tmp_path)
    return cfg


def schema_errors(path: Path) -> list[str]:
    return validate.check_file(VALIDATORS, Path(path))


def read_events(path: Path) -> list[dict]:
    return [json.loads(l) for l in Path(path).read_text().splitlines() if l.strip()]


# ---------------------------------------------------------------- scripted model messages
_ids = itertools.count(1)


def tool_call(name: str, **args) -> dict:
    return {"id": f"call_{next(_ids)}", "type": "function",
            "function": {"name": name, "arguments": json.dumps(args)}}


def calls(*tcs: dict, content: str | None = None) -> dict:
    return {"role": "assistant", "content": content, "tool_calls": list(tcs)}


def check(src: str) -> dict:
    return calls(tool_call("referee_check", src=src))


def claim(text: str = "It matched.") -> dict:
    return calls(tool_call("submit_claim", text=text))


def prose(text: str) -> dict:
    return {"role": "assistant", "content": text}


class FakeLLM:
    """Scripted stand-in for crew.llm.LLM.

    `script` is either a list of assistant messages (consumed in order; when it runs out the model
    keeps answering in prose with no code, which the Digger nudges) or a callable(messages, model) -> message.
    Models in `fail_models` raise LLMError, like an unavailable endpoint.
    """

    def __init__(self, cfg: Config, usage: Usage | None = None, script=None, *, cost: float = 0.001,
                 tin: int = 1000, tout: int = 200, fail_models=()):
        self.cfg = cfg
        self.usage = usage if usage is not None else Usage()
        self.script = script if script is not None else []
        self.cost = cost
        self.tin, self.tout = tin, tout
        self.fail_models = set(fail_models)
        self.calls: list[dict] = []
        self._lock = threading.Lock()

    def chat(self, messages, *, model=None, tools=None, effort=None, max_tokens=8000, temperature=None):
        model = model or self.cfg.model
        with self._lock:
            self.calls.append({"model": model, "effort": effort, "tools": bool(tools),
                               "messages": [dict(m) for m in messages]})
        if model in self.fail_models:
            raise LLMError(f"HTTP 404: model {model} not found")
        if callable(self.script):
            msg = self.script(messages, model)
        else:
            with self._lock:
                msg = self.script.pop(0) if self.script else prose("I am thinking about it.")
        self.usage.add(model, self.tin, self.tout, self.cost, len(msg.get("tool_calls") or []))
        return {"message": msg, "tin": self.tin, "tout": self.tout, "cost": self.cost, "model": model}

    @property
    def models(self) -> list[str]:
        return [c["model"] for c in self.calls]


# ---------------------------------------------------------------- referees
def result(fn: str, status: str, pct: float | None = None) -> dict:
    fd = None
    if status == "PARTIAL":
        fd = {"offset": 4, "expected": "1c08", "got": "1c10", "expected_ins": "adds r0, r1, #0",
              "got_ins": "adds r0, r2, #0"}
    pct = pct if pct is not None else {"MATCH": 100.0, "PARTIAL": 72.5}.get(status, 0.0)
    lint_ok = status != "LINT_FAIL"
    return {"v": 1, "fn": fn, "status": status, "match_pct": pct, "first_diff": fd, "diff": [fd] if fd else [],
            "lint": {"ok": lint_ok, "violations": [] if lint_ok else [{"rule": "L001", "reason": "asm"}]},
            "compile": {"ok": status in ("MATCH", "PARTIAL"), "log": "" if status != "NO_COMPILE" else "error: x"},
            "referee": "scripted", "elapsed_ms": 1}


class ScriptedReferee:
    """Answers from `by_src` when the exact source is known, else pops `seq`, else `default`.
    Records every check so tests can count referee calls."""
    kind = "mock"

    def __init__(self, seq=(), by_src: dict | None = None, default: str = "PARTIAL"):
        self.seq = list(seq)
        self.by_src = dict(by_src or {})
        self.default = default
        self.checks: list[tuple[str, str]] = []

    def health(self):
        return {"ok": True, "referee": "scripted"}

    def context(self, fn):
        return ""

    def check(self, fn, src):
        self.checks.append((fn, src))
        if src in self.by_src:
            st = self.by_src[src]
        elif self.seq:
            st = self.seq.pop(0)
        else:
            st = self.default
        return result(fn, st)

    def rebuild(self, d):
        return {"v": 1, "identical": True}


# ---------------------------------------------------------------- a whole-run model policy
TARGET_RX = re.compile(r"Target: (fn_[0-9A-F]{8})")
ROLES = ("match", "liar", "stuck", "lint")


@functools.lru_cache(maxsize=None)
def variant(fn: str, want: str, start: int = 0) -> str:
    """A plain C candidate that the default MockReferee scores as `want` (MATCH or PARTIAL)."""
    ref = MockReferee()
    for k in range(start, start + 2000):
        src = f"int {fn}(int a, int b)\n{{\n    return (a * b) >> {k % 31} ^ {k};\n}}"
        if ref.check(fn, src)["status"] == want:
            return src
    raise AssertionError(f"no {want} variant for {fn}")


class CrewPolicy:
    """Deterministic model behaviour for end-to-end runs against MockReferee.

    Roles are handed out in the order functions are first seen:
      match - one PARTIAL, then a MATCH, then an honest claim
      liar  - claims after its PARTIAL (a false claim), then matches and claims honestly
      stuck - never compiles (abandoned at budget)
      lint  - inline asm first (LINT_FAIL), then the MATCH as prose with a ```c block, then claims
    Distiller calls get a name and one generic idiom.
    """

    def __init__(self):
        self.roles: dict[str, str] = {}
        self._lock = threading.Lock()

    def role(self, fn: str) -> str:
        with self._lock:
            return self.roles.setdefault(fn, ROLES[len(self.roles) % len(ROLES)])

    def __call__(self, messages, model):
        if messages[0]["content"] == DISTILL_SYSTEM:
            fn = re.search(r"Function (fn_[0-9A-F]{8})", messages[1]["content"]).group(1)
            return prose(json.dumps({"name": f"update_{fn.lower()}", "idioms": [
                {"title": "Arithmetic shift for fixed point", "applies_when": "asrs follows muls",
                 "do": "keep the product in a signed int", "example": "int k(int x, int y)\n{\n return (x*y)>>8;\n}"}]}))
        fn = TARGET_RX.search(messages[1]["content"]).group(1)
        role = self.role(fn)
        n = sum(1 for m in messages if m["role"] == "assistant")  # turns taken so far
        if role == "stuck":
            return check(f"int {fn}(int a  /* attempt {n} */")
        if role == "match":
            return [check(variant(fn, "PARTIAL")), check(variant(fn, "MATCH")), claim()][min(n, 2)]
        if role == "liar":
            return [check(variant(fn, "PARTIAL")), claim("Definitely matches."), check(variant(fn, "MATCH")),
                    claim()][min(n, 3)]
        # lint
        if n == 0:
            return check(f'int {fn}(int a) {{ asm("mov r0, r1"); return a; }}')
        if n == 1:
            return prose("Fixed it:\n```c\n" + variant(fn, "MATCH") + "\n```\n")
        return claim()
