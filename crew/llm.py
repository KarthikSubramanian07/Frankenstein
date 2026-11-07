"""Minimal OpenAI-compatible chat client for the Meta Model API (stdlib only).

Tracks the `muse` usage block (contracts 6c) across the whole process.
"""
from __future__ import annotations

import json
import random
import threading
import time
import urllib.error
import urllib.request
from dataclasses import dataclass, field

from .config import Config


@dataclass
class Usage:
    calls: int = 0
    tool_calls: int = 0
    image_calls: int = 0
    tokens_in: int = 0
    tokens_out: int = 0
    cost_usd: float = 0.0
    by_model: dict = field(default_factory=dict)
    _lock: threading.Lock = field(default_factory=threading.Lock, repr=False)

    def add(self, model: str, tin: int, tout: int, cost: float, tool_calls: int) -> None:
        with self._lock:
            self.calls += 1
            self.tool_calls += tool_calls
            self.tokens_in += tin
            self.tokens_out += tout
            self.cost_usd += cost
            m = self.by_model.setdefault(model, {"calls": 0, "cost_usd": 0.0})
            m["calls"] += 1
            m["cost_usd"] += cost

    def block(self, effort: str) -> dict:
        return {"calls": self.calls, "tool_calls": self.tool_calls, "image_calls": self.image_calls,
                "tokens_in": self.tokens_in, "tokens_out": self.tokens_out, "reasoning_effort": effort,
                "cost_usd": round(self.cost_usd, 4),
                "by_model": {k: {"calls": v["calls"], "cost_usd": round(v["cost_usd"], 4)} for k, v in self.by_model.items()}}


class LLMError(RuntimeError):
    pass


class LLM:
    def __init__(self, cfg: Config, usage: Usage | None = None, timeout: float = 180):
        self.cfg = cfg
        self.usage = usage or Usage()
        self.timeout = timeout

    def chat(self, messages: list[dict], *, model: str | None = None, tools: list[dict] | None = None,
             effort: str | None = None, max_tokens: int = 8000, temperature: float | None = None) -> dict:
        """Returns {"message": assistant message dict, "tin", "tout", "cost", "model"}."""
        if not self.cfg.api_key:
            raise LLMError("META_API_KEY is not set (.env)")
        model = model or self.cfg.model
        body = {"model": model, "messages": messages, "max_tokens": max_tokens,
                "reasoning_effort": effort or self.cfg.reasoning_effort}
        if tools:
            body["tools"] = tools
        if temperature is not None:
            body["temperature"] = temperature
        data = json.dumps(body).encode()
        last = None
        for attempt in range(5):
            req = urllib.request.Request(f"{self.cfg.base_url}/chat/completions", data=data, method="POST", headers={
                "Authorization": f"Bearer {self.cfg.api_key}", "Content-Type": "application/json"})
            try:
                with urllib.request.urlopen(req, timeout=self.timeout) as r:
                    d = json.loads(r.read())
                break
            except urllib.error.HTTPError as e:
                last = f"HTTP {e.code}: {e.read()[:300]!r}"
                if e.code in (429, 500, 502, 503, 504):
                    time.sleep(min(30, 2 ** attempt + random.random() * 2))
                    continue
                raise LLMError(last) from e
            except (urllib.error.URLError, TimeoutError) as e:
                last = str(e)
                time.sleep(2 ** attempt)
        else:
            raise LLMError(f"model call failed after retries: {last}")
        msg = d["choices"][0]["message"]
        u = d.get("usage") or {}
        tin, tout = int(u.get("prompt_tokens", 0)), int(u.get("completion_tokens", 0))
        pin, pout = self.cfg.price(model)
        cost = tin * pin + tout * pout
        self.usage.add(d.get("model", model), tin, tout, cost, len(msg.get("tool_calls") or []))
        return {"message": msg, "tin": tin, "tout": tout, "cost": cost, "model": d.get("model", model)}
