"""Meta Model API client tests: urllib is monkeypatched, nothing leaves the process."""
from __future__ import annotations

import io
import json
import urllib.error

import pytest

from crew import llm as llm_mod
from crew.llm import LLM, LLMError, Usage

from .fakes import BASE_MODEL, ESC_MODEL, offline_config


class Resp:
    def __init__(self, body):
        self.body = body

    def __enter__(self):
        return self

    def __exit__(self, *a):
        return False

    def read(self):
        return json.dumps(self.body).encode()


def completion(model=BASE_MODEL, tool_calls=None, tin=1000, tout=200, content=None):
    msg = {"role": "assistant", "content": content}
    if tool_calls is not None:
        msg["tool_calls"] = tool_calls
    return {"model": model, "choices": [{"message": msg}], "usage": {"prompt_tokens": tin, "completion_tokens": tout}}


def http_error(code):
    return urllib.error.HTTPError("https://api.example/v1/chat/completions", code, "err", {}, io.BytesIO(b'{"error":"x"}'))


@pytest.fixture
def client():
    cfg = offline_config()
    cfg.api_key = "test-key"
    cfg.base_url = "https://api.example/v1"
    return LLM(cfg)


@pytest.fixture
def sleeps(monkeypatch):
    s = []
    monkeypatch.setattr(llm_mod.time, "sleep", s.append)
    return s


def test_retry_on_429_then_success(client, monkeypatch, sleeps):
    reqs = []
    replies = [http_error(429), http_error(503),
               Resp(completion(tool_calls=[{"id": "a", "type": "function", "function": {"name": "referee_check",
                                                                                        "arguments": "{}"}}]))]

    def urlopen(req, timeout=None):
        reqs.append((req, timeout))
        r = replies.pop(0)
        if isinstance(r, Exception):
            raise r
        return r

    monkeypatch.setattr(llm_mod.urllib.request, "urlopen", urlopen)
    tools = [{"type": "function", "function": {"name": "referee_check"}}]
    out = client.chat([{"role": "user", "content": "hi"}], tools=tools, effort="medium", temperature=0.2)
    assert len(reqs) == 3 and len(sleeps) == 2 and all(0 < s <= 30 for s in sleeps)
    req, timeout = reqs[-1]
    assert req.full_url == "https://api.example/v1/chat/completions" and timeout == 180
    assert req.get_header("Authorization") == "Bearer test-key"
    body = json.loads(req.data)
    assert body["model"] == BASE_MODEL and body["reasoning_effort"] == "medium" and body["tools"] == tools
    assert body["temperature"] == 0.2 and body["max_tokens"] == 8000
    assert out["tin"] == 1000 and out["tout"] == 200 and out["model"] == BASE_MODEL
    assert out["cost"] == pytest.approx(1000 * 1.25e-6 + 200 * 4.25e-6)
    assert out["message"]["tool_calls"][0]["function"]["name"] == "referee_check"


def test_usage_accounting(client, monkeypatch):
    replies = [completion(tool_calls=[{"id": "a"}, {"id": "b"}]), completion(model=ESC_MODEL, tin=10, tout=10),
               completion(content="plain")]
    monkeypatch.setattr(llm_mod.urllib.request, "urlopen", lambda req, timeout=None: Resp(replies.pop(0)))
    for _ in range(3):
        client.chat([{"role": "user", "content": "x"}])
    u = client.usage
    assert u.calls == 3 and u.tool_calls == 2 and u.tokens_in == 2010 and u.tokens_out == 410
    spark = 1000 * 1.25e-6 + 200 * 4.25e-6
    assert u.by_model[BASE_MODEL]["calls"] == 2 and u.by_model[BASE_MODEL]["cost_usd"] == pytest.approx(2 * spark)
    assert u.by_model[ESC_MODEL]["calls"] == 1  # unknown models are priced like Spark (an estimate)
    assert u.cost_usd == pytest.approx(2 * spark + 10 * 1.25e-6 + 10 * 4.25e-6)
    b = u.block("high")
    assert b["calls"] == 3 and b["reasoning_effort"] == "high" and b["cost_usd"] == round(u.cost_usd, 4)
    assert set(b["by_model"]) == {BASE_MODEL, ESC_MODEL}


def test_no_body_usage_is_zero_cost(client, monkeypatch):
    d = completion()
    del d["usage"]
    monkeypatch.setattr(llm_mod.urllib.request, "urlopen", lambda req, timeout=None: Resp(d))
    out = client.chat([])
    assert out["cost"] == 0 and client.usage.calls == 1


def test_missing_key_raises_without_calling(monkeypatch):
    def boom(*a, **k):
        raise AssertionError("must not call the network")

    monkeypatch.setattr(llm_mod.urllib.request, "urlopen", boom)
    cfg = offline_config()
    assert cfg.api_key == ""
    with pytest.raises(LLMError, match="META_API_KEY"):
        LLM(cfg).chat([{"role": "user", "content": "x"}])


def test_client_error_is_not_retried(client, monkeypatch, sleeps):
    n = []

    def urlopen(req, timeout=None):
        n.append(1)
        raise http_error(400)

    monkeypatch.setattr(llm_mod.urllib.request, "urlopen", urlopen)
    with pytest.raises(LLMError, match="HTTP 400"):
        client.chat([])
    assert len(n) == 1 and sleeps == [] and client.usage.calls == 0


def test_gives_up_after_retries(client, monkeypatch, sleeps):
    monkeypatch.setattr(llm_mod.urllib.request, "urlopen",
                        lambda req, timeout=None: (_ for _ in ()).throw(urllib.error.URLError("refused")))
    with pytest.raises(LLMError, match="after retries"):
        client.chat([])
    assert len(sleeps) == 5 and client.usage.calls == 0


def test_shared_usage_across_clients(monkeypatch):
    monkeypatch.setattr(llm_mod.urllib.request, "urlopen", lambda req, timeout=None: Resp(completion()))
    cfg = offline_config()
    cfg.api_key = "k"
    u = Usage()
    LLM(cfg, u).chat([])
    LLM(cfg, u).chat([])
    assert u.calls == 2
