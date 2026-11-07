#!/usr/bin/env python3
"""Draw the README diagrams: one layout, a light and a dark theme.

    python3 docs/diagrams/build.py            # writes docs/diagrams/*.svg
    python3 docs/diagrams/build.py --out DIR  # somewhere else
    python3 docs/diagrams/build.py --fallback # force Helvetica/Arial (to test without Inter)

Style: monochrome hairlines on an 8 px grid, one accent per diagram, labels of one to
three words. The explanation lives in the README, not in the drawing. GitHub shows
these inside <img>, so web fonts never load and the font stacks end in system fonts.
"""
from __future__ import annotations

import argparse
import math
from pathlib import Path
from xml.sax.saxutils import escape

W = 1200
SANS = "Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif"
MONO = "'JetBrains Mono', SFMono-Regular, ui-monospace, Menlo, Consolas, monospace"

THEMES = {
    # ink on paper / paper on ink; the page itself (GitHub) is the background
    "light": dict(ink="#17141F", line=0.32, arrow=0.5, mint="#0A7552", red="#C42A22"),
    "dark": dict(ink="#F4F0E6", line=0.34, arrow=0.55, mint="#7CF2C8", red="#FF6B62"),
}

NODE_H = 64
R = 8


class Svg:
    def __init__(self, t, h, title, desc):
        self.t, self.h, self.title, self.desc, self.parts = t, h, title, desc, []

    def add(self, s):
        self.parts.append(s)

    def node(self, x, y, w, label, sub=None, accent=None, mono_sub=False):
        t = self.t
        stroke = f'stroke="{accent}"' if accent else f'stroke="{t["ink"]}" stroke-opacity="{t["line"]}"'
        self.add(f'<rect x="{x + .5:g}" y="{y + .5:g}" width="{w - 1:g}" height="{NODE_H - 1}" rx="{R}" fill="none" {stroke} stroke-width="1"/>')
        cx = x + w / 2
        if sub:
            self.label(cx, y + 28, label)
            self.secondary(cx, y + 46, sub, mono=mono_sub)
        else:
            self.label(cx, y + 37, label)

    def label(self, x, y, s, anchor="middle", fill=None):
        self.add(f'<text x="{x:g}" y="{y:g}" class="s" font-size="15" font-weight="500" text-anchor="{anchor}" fill="{fill or self.t["ink"]}">{escape(s)}</text>')

    def secondary(self, x, y, s, anchor="middle", mono=False, fill=None, opacity=0.6):
        cls, size = ("m", 12) if mono else ("s", 13)
        op = f' fill-opacity="{opacity}"' if opacity < 1 else ""
        self.add(f'<text x="{x:g}" y="{y:g}" class="{cls}" font-size="{size}" text-anchor="{anchor}" fill="{fill or self.t["ink"]}"{op}>{escape(s)}</text>')

    def path(self, d, color=None, opacity=None, dash=None, width=1.25):
        t = self.t
        color = color or t["ink"]
        op = f' stroke-opacity="{opacity}"' if opacity is not None else ""
        da = f' stroke-dasharray="{dash}"' if dash else ""
        self.add(f'<path d="{d}" fill="none" stroke="{color}" stroke-width="{width}"{op}{da} stroke-linecap="round" stroke-linejoin="round"/>')

    def chevron(self, x, y, ang, color=None, opacity=None, size=7):
        """Open arrowhead with its tip at (x, y), pointing along ang (degrees, screen space)."""
        a = math.radians(ang)
        pts = []
        for s in (1, -1):
            b = a + math.pi + s * math.radians(38)
            pts.append((x + size * math.cos(b), y + size * math.sin(b)))
        d = f"M{pts[0][0]:.1f},{pts[0][1]:.1f} L{x:.1f},{y:.1f} L{pts[1][0]:.1f},{pts[1][1]:.1f}"
        self.path(d, color, opacity)

    def arrow(self, x1, y1, x2, y2, color=None, opacity=None, dash=None, both=False):
        t = self.t
        if color is None and opacity is None:
            opacity = t["arrow"]
        self.path(f"M{x1:g},{y1:g} L{x2:g},{y2:g}", color, opacity, dash)
        ang = math.degrees(math.atan2(y2 - y1, x2 - x1))
        self.chevron(x2, y2, ang, color, opacity)
        if both:
            self.chevron(x1, y1, ang + 180, color, opacity)

    def render(self, fallback=False):
        sans = "Helvetica, Arial, sans-serif" if fallback is True else (fallback or SANS)
        mono = "Menlo, Consolas, monospace" if fallback else MONO
        return (
            f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{self.h}" viewBox="0 0 {W} {self.h}" role="img" aria-labelledby="t d">'
            f'<title id="t">{escape(self.title)}</title><desc id="d">{escape(self.desc)}</desc>'
            f"<style>.s{{font-family:{sans}}}.m{{font-family:{mono}}}</style>\n"
            + "\n".join(self.parts) + "</svg>\n"
        )


# ── 1. How it works ─────────────────────────────────────────────────────
def how_it_works(t):
    s = Svg(t, 336, "How Frankenstein works",
            "The compiled game goes to a Digger (Muse), which writes C. The Referee compiles it, and the Checker re-runs the claim. "
            "Rejected work goes back to the Digger. Accepted work becomes a rebuilt ROM with the same SHA-1. SubQ Snap steers the loop, "
            "and every match adds habits to MongoDB for the next attempt.")
    w, gap, y = 160, 80, 104
    xs = [40 + i * (w + gap) for i in range(5)]
    cx = [x + w / 2 for x in xs]
    bot = y + NODE_H
    s.node(xs[0], y, w, "Compiled game", "source lost")
    s.node(xs[1], y, w, "Digger", "Muse")
    s.node(xs[2], y, w, "Referee", "compiler")
    s.node(xs[3], y, w, "Checker", "re-runs claims")
    s.node(xs[4], y, w, "Rebuilt ROM", "same SHA-1", accent=t["mint"])
    mid = y + NODE_H / 2
    for i in range(3):
        s.arrow(xs[i] + w + 8, mid, xs[i + 1] - 8, mid)
    # the focal step: accepted
    s.arrow(xs[3] + w + 8, mid, xs[4] - 8, mid, color=t["mint"])
    s.secondary((xs[3] + w + xs[4]) / 2, mid - 12, "accepted", fill=t["mint"], opacity=1)

    # SubQ Snap steers: a dotted bracket over the loop
    top = y - 32
    s.path(f"M{cx[1]},{y - 8} V{top + 8} Q{cx[1]},{top} {cx[1] + 8},{top} H{cx[3] - 8} Q{cx[3]},{top} {cx[3]},{top + 8} V{y - 8}",
           opacity=t["arrow"], dash="1 4")
    s.chevron(cx[1], y - 8, 90, opacity=t["arrow"])
    s.chevron(cx[3], y - 8, 90, opacity=t["arrow"])
    s.secondary(cx[2], top - 16, "SubQ Snap steers")

    # rejected: one red curve from the Checker back to the Digger
    a, b, d = cx[3] - 24, cx[1] + 24, 72
    s.path(f"M{a},{bot + 8} C{a},{bot + d} {b},{bot + d} {b},{bot + 8}", color=t["red"])
    s.chevron(b, bot + 8, -90, color=t["red"])
    s.secondary(cx[2], bot + 40, "rejected", fill=t["red"], opacity=1)

    # habits: a dotted loop underneath
    a, b, d = cx[3] + 32, cx[1] - 32, 152
    s.path(f"M{a},{bot + 8} C{a},{bot + d} {b},{bot + d} {b},{bot + 8}", opacity=t["arrow"], dash="1 4")
    s.chevron(b, bot + 8, -90, opacity=t["arrow"])
    s.secondary(cx[2], bot + 144, "habits · MongoDB")
    return s


# ── 2. System ───────────────────────────────────────────────────────────
def system(t):
    s = Svg(t, 432, "Frankenstein system",
            "Someone asks in ASI:One. The Lab (referee, port 7101) hands the job to the Crew (port 7111), and the Crew asks the Lab to check "
            "every attempt. The Lab and the Crew write to one append-only event stream, events.jsonl. The Stage (port 7202) reads it to run "
            "the show, and the Creature (port 7401) reads it to heal the game and writes back when it swaps the ROM.")
    w, xs = 176, [216, 512, 808]
    cx = [x + w / 2 for x in xs]
    y1, y2, spine = 64, 304, 216
    s.node(xs[0], y1, w, "ASI:One", "you ask")
    s.node(xs[1], y1, w, "Lab", ":7101", mono_sub=True)
    s.node(xs[2], y1, w, "Crew", ":7111", mono_sub=True)
    s.node(xs[1], y2, w, "Creature", ":7401", mono_sub=True)
    s.node(xs[2], y2, w, "Stage", ":7202", mono_sub=True)
    m1 = y1 + NODE_H / 2
    s.arrow(xs[0] + w + 8, m1, xs[1] - 8, m1)
    s.arrow(xs[1] + w + 8, m1, xs[2] - 8, m1, both=True)
    s.secondary((xs[1] + w + xs[2]) / 2, m1 - 12, "check")

    # the spine
    s.path(f"M{xs[0]},{spine} H{xs[2] + w}", color=t["mint"])
    s.secondary(xs[0], spine - 12, "events.jsonl", anchor="start", mono=True, fill=t["mint"], opacity=1)
    s.add(f'<circle cx="{xs[0]}" cy="{spine}" r="2.5" fill="{t["mint"]}"/>')
    s.add(f'<circle cx="{xs[2] + w}" cy="{spine}" r="2.5" fill="{t["mint"]}"/>')
    s.arrow(cx[1], y1 + NODE_H + 8, cx[1], spine - 8)
    s.arrow(cx[2], y1 + NODE_H + 8, cx[2], spine - 8)
    s.arrow(cx[1], spine + 8, cx[1], y2 - 8, both=True)
    s.arrow(cx[2], spine + 8, cx[2], y2 - 8)
    s.secondary(W / 2, 408, "Lanes share nothing but the event stream.")
    return s


# ── 3. Play to recover ──────────────────────────────────────────────────
def play_to_recover(t):
    s = Svg(t, 480, "Play to recover",
            "A loop of five steps. You play. SubQ Snap picks the function on screen. The crew (Muse) recovers it. The Lab rebuilds the ROM "
            "with the same SHA-1. The region heals on screen, and you keep playing.")
    cx, cy, r = 600, 240, 192
    w, h = 144, 56
    steps = [("Play", "you"), ("Snap picks", "SubQ Snap"), ("Crew recovers", "Muse"), ("Rebuild", "same SHA-1"), ("Heal", "on screen")]
    angs = [-90 + i * 72 for i in range(5)]
    boxes = []
    for (label, sub), a in zip(steps, angs):
        x = cx + r * math.cos(math.radians(a)) - w / 2
        y = cy + r * math.sin(math.radians(a)) - h / 2
        x, y = round(x / 8) * 8, round(y / 8) * 8
        boxes.append((x, y))

    def inside(px, py, box, pad=10):
        x, y = box
        return x - pad <= px <= x + w + pad and y - pad <= py <= y + h + pad

    def edge(i, direction):
        a = angs[i]
        while True:
            a += direction * 0.5
            px, py = cx + r * math.cos(math.radians(a)), cy + r * math.sin(math.radians(a))
            if not inside(px, py, boxes[i]):
                return a

    for i in range(5):
        a0, a1 = edge(i, 1), edge((i + 1) % 5, -1)
        if a1 < a0:
            a1 += 360
        p0 = (cx + r * math.cos(math.radians(a0)), cy + r * math.sin(math.radians(a0)))
        p1 = (cx + r * math.cos(math.radians(a1)), cy + r * math.sin(math.radians(a1)))
        col = t["mint"] if i == 3 else None
        op = None if col else t["arrow"]
        s.path(f"M{p0[0]:.1f},{p0[1]:.1f} A{r},{r} 0 0 1 {p1[0]:.1f},{p1[1]:.1f}", col, op)
        s.chevron(p1[0], p1[1], a1 + 90, col, op)

    for (label, sub), (x, y) in zip(steps, boxes):
        stroke = f'stroke="{t["ink"]}" stroke-opacity="{t["line"]}"'
        s.add(f'<rect x="{x + .5:g}" y="{y + .5:g}" width="{w - 1}" height="{h - 1}" rx="{R}" fill="none" {stroke} stroke-width="1"/>')
        s.label(x + w / 2, y + 24, label)
        s.secondary(x + w / 2, y + 42, sub)
    s.secondary(cx, cy + 4, "Play it, and we rebuild it.")
    return s


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=str(Path(__file__).resolve().parent))
    ap.add_argument("--fallback", nargs="?", const=True, default=False, help="force a sans stack (default Helvetica, Arial)")
    a = ap.parse_args()
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    for name, fn in [("how-it-works", how_it_works), ("system", system), ("play-to-recover", play_to_recover)]:
        for theme in ("light", "dark"):
            svg = fn(THEMES[theme]).render(a.fallback)
            p = out / f"{name}-{theme}.svg"
            p.write_text(svg)
            print(f"{p}  {len(svg.encode()) / 1024:.1f} KB")


if __name__ == "__main__":
    main()
