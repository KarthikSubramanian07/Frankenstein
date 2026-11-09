"""Keep a web page open on the demo laptop from driving the crew's localhost APIs (SECURITY.md, threat 5).

Every legitimate caller is a local program (the ASI:One agents, crew.referee, the bridge adapter, curl), so:
- DNS rebinding: a page on evil.example that re-resolves to 127.0.0.1 still sends `Host: evil.example`.
  A server bound to loopback answers only Host 127.0.0.1, localhost or [::1].
- Cross-site requests: a browser always sends Origin on a cross-origin POST; only loopback origins pass.
- CSRF without CORS: a form or fetch can POST text/plain with no preflight. A POST must say application/json,
  which a cross-site page cannot send without a preflight that these servers never approve.
"""
from __future__ import annotations

from urllib.parse import urlsplit

LOOPBACK = {"127.0.0.1", "localhost", "::1"}


def _host_only(value: str) -> str:
    """`127.0.0.1:7111` -> 127.0.0.1, `[::1]:7111` -> ::1, `localhost` -> localhost."""
    v = value.strip().lower()
    if v.startswith("["):
        return v[1:v.find("]")] if "]" in v else v
    return v.rsplit(":", 1)[0] if v.count(":") == 1 else v


def cross_site_error(handler, *, post: bool) -> tuple[int, str] | None:
    """(HTTP status, reason) when this request must be refused, else None. `handler` is a BaseHTTPRequestHandler."""
    bound = handler.server.server_address[0]
    host = handler.headers.get("Host")
    if host and bound in LOOPBACK and _host_only(host) not in LOOPBACK:
        return 403, "Host must be 127.0.0.1 or localhost"
    origin = handler.headers.get("Origin")
    if origin is not None and (urlsplit(origin).hostname or "") not in LOOPBACK:
        return 403, "cross-origin requests are not accepted"
    if post and handler.headers.get_content_type() != "application/json":
        return 415, "Content-Type must be application/json"
    return None
