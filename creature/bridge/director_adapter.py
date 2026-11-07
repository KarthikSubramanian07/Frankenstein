"""Feed real observed PC samples to crew.run --director, using localhost only.

Default mode prints eligible sample summaries without forwarding. --forward feeds
the existing Crew run; Crew may then make model calls under its own run budget.
"""
from __future__ import annotations

import argparse
import base64
import json
import re
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

FN = re.compile(r'fn_[0-9A-F]{8}\Z')
MAX_JSON = 1024 * 1024
MAX_PNG = 4 * 1024 * 1024


def local_url(value):
    p = urllib.parse.urlsplit(value)
    if p.scheme != 'http' or p.hostname not in ('127.0.0.1', 'localhost', '::1') or p.username or p.password or p.fragment:
        raise argparse.ArgumentTypeError('use an http localhost endpoint without credentials')
    return value


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


def request_json(url, body=None):
    data = None if body is None else json.dumps(body).encode()
    req = urllib.request.Request(url, data=data, headers={'Content-Type': 'application/json'})
    # Do not send local telemetry through HTTP_PROXY or follow redirects off host.
    opener = urllib.request.build_opener(urllib.request.ProxyHandler({}), NoRedirect())
    with opener.open(req, timeout=2) as response:
        raw = response.read(MAX_JSON + 1)
    if len(raw) > MAX_JSON:
        raise ValueError('response too large')
    return json.loads(raw)


def payload_for(snapshot, shots_root):
    """Only pass observed ids and PNG bytes. No viz map, healing or source names."""
    if not isinstance(snapshot, dict) or snapshot.get('fixture') is not False:
        return None, 'fixture or unknown source'
    if snapshot.get('source_status') != 'file' or snapshot.get('tap_connected') is not True:
        return None, 'event source or tap is disconnected'
    age = snapshot.get('sample_age_s')
    if not isinstance(age, (int, float)) or isinstance(age, bool) or not 0 <= age < 3:
        return None, 'stale or invalid telemetry'
    running = snapshot.get('running')
    if not isinstance(running, list):
        return None, 'no observed function ids'
    ids = list(dict.fromkeys(f for f in running if isinstance(f, str) and FN.fullmatch(f)))
    if not ids:
        return None, 'no observed game code in this sample'
    body = {'running': ids}
    filename = snapshot.get('screenshot_path')
    shot_age = snapshot.get('screenshot_age_s')
    if filename and shots_root is not None and isinstance(shot_age, (int, float)) and 0 <= shot_age <= 4:
        try:
            path = Path(filename).resolve(strict=True)
            path.relative_to(shots_root.resolve(strict=True))
            if path.stat().st_size <= MAX_PNG:
                png = path.read_bytes()
                if png.startswith(b'\x89PNG\r\n\x1a\n'):
                    body['frame_png_b64'] = base64.b64encode(png).decode('ascii')
        except (OSError, ValueError):
            pass  # real PC sample remains useful without a screenshot
    return body, None


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--bridge', type=local_url, default='http://127.0.0.1:7304/state')
    p.add_argument('--director', type=local_url, default='http://127.0.0.1:7112/heartbeat')
    p.add_argument('--shots-root', type=Path, default=Path('creature/shots'))
    p.add_argument('--forward', action='store_true', help='feed an already-running crew.run --director; Crew may spend its configured budget')
    p.add_argument('--interval', type=float, default=.5)
    p.add_argument('--once', action='store_true')
    a = p.parse_args(argv)
    if not .1 <= a.interval <= 60:
        p.error('--interval must be between .1 and 60 seconds')
    last_sample = None
    last_status = None
    try:
        while True:
            try:
                snapshot = request_json(a.bridge)
                body, reason = payload_for(snapshot, a.shots_root)
                sample = (snapshot.get('run_id'), snapshot.get('frame'))
                if body is None:
                    status = {'status': 'waiting', 'reason': reason}
                elif sample == last_sample:
                    status = {'status': 'waiting', 'reason': 'no new emulator frame'}
                else:
                    status = {'status': 'forwarded' if a.forward else 'inspect', 'frame': sample[1],
                              'running': body['running'], 'screenshot': 'frame_png_b64' in body}
                    if a.forward:
                        result = request_json(a.director, body)
                        if not isinstance(result, dict) or result.get('ok') is not True:
                            raise ValueError('Crew did not acknowledge heartbeat')
                    last_sample = sample
            except (OSError, ValueError, urllib.error.URLError):
                status = {'status': 'unavailable', 'reason': 'local bridge or director endpoint unavailable'}
            if status != last_status:
                print(json.dumps(status), flush=True)
                last_status = status
            if a.once:
                return 0
            time.sleep(a.interval)
    except KeyboardInterrupt:
        return 0


if __name__ == '__main__':
    raise SystemExit(main())
