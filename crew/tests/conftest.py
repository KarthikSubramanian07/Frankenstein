import os
import socket

import pytest

LOOPBACK = {"127.0.0.1", "localhost", "::1"}


def pytest_configure(config):
    config.addinivalue_line("markers", "live: calls a real external API; runs only with LIVE=1")


@pytest.fixture(autouse=True)
def offline(monkeypatch):
    """Every crew test is offline: a developer's .env keys are blanked and non-loopback sockets refuse to
    connect, so a missed mock fails loudly instead of spending money. LIVE=1 leaves the environment alone."""
    if os.environ.get("LIVE") == "1":
        yield
        return
    for k in ("META_API_KEY", "SUBQ_API_KEY", "MONGODB_URI", "GEMINI_API_KEY", "AGENTVERSE_API_KEY"):
        monkeypatch.setenv(k, "")
    monkeypatch.setenv("REFEREE_URL", "mock")
    monkeypatch.setenv("FRANK_MANIFEST", "contracts/fixtures/manifest.sample.json")
    monkeypatch.delenv("FRANK_RUN_DIR", raising=False)

    real_connect, real_connect_ex = socket.socket.connect, socket.socket.connect_ex

    def _ok(addr) -> bool:
        return not isinstance(addr, tuple) or str(addr[0]) in LOOPBACK

    def connect(self, addr):
        if not _ok(addr):
            raise OSError(f"crew tests are offline: refused connect to {addr!r}")
        return real_connect(self, addr)

    def connect_ex(self, addr):
        if not _ok(addr):
            raise OSError(f"crew tests are offline: refused connect to {addr!r}")
        return real_connect_ex(self, addr)

    monkeypatch.setattr(socket.socket, "connect", connect)
    monkeypatch.setattr(socket.socket, "connect_ex", connect_ex)
    yield
