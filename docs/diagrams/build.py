#!/usr/bin/env python3
"""Draw the README diagrams: one geometry, a light and a dark palette.

    python3 docs/diagrams/build.py            # writes docs/diagrams/*.svg
    python3 docs/diagrams/build.py --out DIR  # somewhere else
    python3 docs/diagrams/build.py --fallback # drop Inter/JetBrains from the stacks (to test system fonts)

GitHub shows a README SVG inside <img>, so web fonts never load. Every label uses a
font stack that ends in fonts every reader has, and nothing relies on exact text width.
"""
from __future__ import annotations

import argparse
import math
from pathlib import Path
from xml.sax.saxutils import escape

W = 1200

SANS = "'Inter Tight', Inter, -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif"
MONO = "'JetBrains Mono', SFMono-Regular, ui-monospace, Menlo, Consolas, 'Liberation Mono', monospace"
SERIF = "Fraunces, Georgia, 'Times New Roman', serif"

# The site's tokens (site/assets/site.css). Panels are the dark "instrument" surface in both themes.
THEMES = {
    "light": dict(
        bg="#F4F0E6", grid="#17141F", grid_a=0.05, card="#FBF9F3", well="#F4F0E6",
        line="#DDD5C3", line2="#CFC6B2", ink="#17141F", ink2="#4A4556", ink3="#6E6878",
        panel="#12101E", panel_line="#12101E", node="#1B1830", node_line="#2E2A48",
        p_ink="#ECEAF6", p_mute="#A29EBB", p_dim="#5E5A7A",
        mint="#7CF2C8", mint_ink="#0A7552", violet="#9A9AFF", violet_ink="#4F47CF",
        red="#FF5147", red_ink="#C42A22", spark="#FFD23F",
        bus="#17141F", bus_line="#17141F", bus_ink="#ECEAF6", bus_mute="#A29EBB",
        cart="#2B2735", cart_line="#2B2735", label="#ECEAF6", static="#B9B4C9",
        room="#EBE5D7", inv="#17141F", inv_ink="#ECEAF6", inv_mute="#A29EBB", inv_2="#C9C5DE",
    ),
    "dark": dict(
        bg="#12101E", grid="#ECEAF6", grid_a=0.04, card="#1B1830", well="#151327",
        line="#2E2A48", line2="#3A3560", ink="#ECEAF6", ink2="#C9C5DE", ink3="#9894B0",
        panel="#1B1830", panel_line="#2E2A48", node="#252140", node_line="#3A3560",
        p_ink="#ECEAF6", p_mute="#A29EBB", p_dim="#5E5A7A",
        mint="#7CF2C8", mint_ink="#7CF2C8", violet="#9A9AFF", violet_ink="#B9B9FF",
        red="#FF5147", red_ink="#FF8A82", spark="#FFD23F",
        bus="#252140", bus_line="#3A3560", bus_ink="#ECEAF6", bus_mute="#A29EBB",
        cart="#2B2735", cart_line="#4A4566", label="#ECEAF6", static="#8C87A3",
        room="#171529", inv="#ECEAF6", inv_ink="#17141F", inv_mute="#5E5A70", inv_2="#4A4556",
    ),
}

# Sponsor pills: the site's card washes with a dark ink of the same hue. Same in both themes.
SPONSOR = {
    "meta": ("#DCEFFC", "#0B4F7C"),
    "subq": ("#E6E5FF", "#4F47CF"),
    "fetch": ("#FFF0BC", "#6B4C00"),
    "mongo": ("#DBF5E8", "#0A7552"),
    "gemini": ("#FFE4D3", "#9A3B12"),
}

MONO_W = 0.6  # every listed monospace face is 0.6 em (Consolas 0.55): pill widths are predictable


class Svg:
    def __init__(self, t: dict, h: int, title: str, desc: str):
        self.t, self.h, self.parts = t, h, []
        self.title, self.desc = title, desc

    def add(self, s: str):
        self.parts.append(s)

    # ── primitives ───────────────────────────────────────────────────────
    def rect(self, x, y, w, h, r=0, fill="none", stroke=None, sw=1, dash=None, extra=""):
        s = f'<rect x="{x:g}" y="{y:g}" width="{w:g}" height="{h:g}"'
        if r:
            s += f' rx="{r:g}"'
        s += f' fill="{fill}"'
        if stroke:
            s += f' stroke="{stroke}" stroke-width="{sw:g}"'
        if dash:
            s += f' stroke-dasharray="{dash}"'
        self.add(s + extra + "/>")

    def text(self, x, y, s, cls="s", size=14, weight=400, fill=None, anchor="start", ls=None, italic=False, extra=""):
        a = f' text-anchor="{anchor}"' if anchor != "start" else ""
        l = f' letter-spacing="{ls:g}"' if ls else ""
        i = ' font-style="italic"' if italic else ""
        w = f' font-weight="{weight}"' if weight != 400 else ""
        self.add(f'<text x="{x:g}" y="{y:g}" class="{cls}" font-size="{size:g}"{w}{i}{a}{l} fill="{fill or self.t["ink"]}"{extra}>{escape(s)}</text>')

    def eyebrow(self, x, y, s, fill=None, anchor="start"):
        self.text(x, y, s.upper(), "m", 12, 600, fill or self.t["ink2"], anchor, ls=1.4)

    def line(self, pts, stroke, sw=2, dash=None, r=10, extra=""):
        d = rounded(pts, r)
        da = f' stroke-dasharray="{dash}"' if dash else ""
        self.add(f'<path d="{d}" fill="none" stroke="{stroke}" stroke-width="{sw:g}" stroke-linecap="round" stroke-linejoin="round"{da}{extra}/>')

    def head(self, x, y, ang, fill, size=9):
        """Filled arrowhead with its tip at (x, y), pointing along ang (degrees, screen space)."""
        a = math.radians(ang)
        bx, by = x - size * math.cos(a), y - size * math.sin(a)
        px, py = -math.sin(a) * size * 0.56, math.cos(a) * size * 0.56
        d = f"M{x:.1f},{y:.1f} L{bx + px:.1f},{by + py:.1f} L{bx - px:.1f},{by - py:.1f} Z"
        self.add(f'<path d="{d}" fill="{fill}" stroke="{fill}" stroke-width="1.5" stroke-linejoin="round"/>')

    def arrow(self, pts, stroke, sw=2, dash=None, r=10, size=9):
        """Polyline that stops short of its last point, plus a head on that point."""
        (x1, y1), (x2, y2) = pts[-2], pts[-1]
        ang = math.degrees(math.atan2(y2 - y1, x2 - x1))
        a = math.radians(ang)
        cut = size - 1.5
        body = pts[:-1] + [(x2 - cut * math.cos(a), y2 - cut * math.sin(a))]
        self.line(body, stroke, sw, dash, r)
        self.head(x2, y2, ang, stroke, size)

    def pill(self, x, y, s, bg, fg, size=12, h=22, weight=600, anchor="start", stroke=None, pad=8):
        w = len(s) * size * MONO_W + 2 * pad
        if anchor == "middle":
            x -= w / 2
        elif anchor == "end":
            x -= w
        self.rect(x, y, w, h, h / 2, bg, stroke, 1.25 if stroke else 1)
        self.text(x + w / 2, y + h / 2 + size * 0.36, s, "m", size, weight, fg, "middle")
        return w

    def sponsor(self, x, y, s, who, anchor="start"):
        bg, fg = SPONSOR[who]
        return self.pill(x, y, s, bg, fg, anchor=anchor)

    def question(self, cx, cy, r=9):
        t = self.t
        self.add(f'<circle cx="{cx:g}" cy="{cy:g}" r="{r:g}" fill="{SPONSOR["subq"][0]}" stroke="{t["violet"]}" stroke-width="1.5"/>')
        self.text(cx, cy + 4.3, "?", "m", 12, 700, "#4F47CF", "middle")

    def check(self, cx, cy, r=9, bg=None, fg="#063D2B"):
        self.add(f'<circle cx="{cx:g}" cy="{cy:g}" r="{r:g}" fill="{bg or self.t["mint"]}"/>')
        self.add(f'<path d="M{cx - 4:g},{cy:g} l2.8,2.9 l5.2,-5.8" fill="none" stroke="{fg}" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>')

    # ── frame ───────────────────────────────────────────────────────────
    def background(self):
        t = self.t
        self.add(
            "<defs>"
            f'<pattern id="g" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M40 0H0V40" fill="none" stroke="{t["grid"]}" stroke-opacity="{t["grid_a"]}" stroke-width="1"/></pattern>'
            '<radialGradient id="f" cx="50%" cy="38%" r="62%"><stop offset="0" stop-color="#fff" stop-opacity="1"/><stop offset="1" stop-color="#fff" stop-opacity="0"/></radialGradient>'
            f'<mask id="m"><rect width="{W}" height="{self.h}" fill="url(#f)"/></mask>'
            "</defs>"
        )
        self.rect(0, 0, W, self.h, 24, t["bg"])
        self.add(f'<rect width="{W}" height="{self.h}" rx="24" fill="url(#g)" mask="url(#m)"/>')

    def render(self, fallback=False) -> str:
        sans, mono, serif = SANS, MONO, SERIF
        if fallback:
            sans = fallback if isinstance(fallback, str) else "Helvetica, Arial, sans-serif"
            mono = "Menlo, Consolas, 'Liberation Mono', monospace"
            serif = "Georgia, 'Times New Roman', serif"
        style = f".s{{font-family:{sans}}}.m{{font-family:{mono}}}.f{{font-family:{serif}}}"
        head = (
            f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{self.h}" viewBox="0 0 {W} {self.h}" role="img" aria-labelledby="t d">'
            f'<title id="t">{escape(self.title)}</title><desc id="d">{escape(self.desc)}</desc>'
            f"<style>{style}</style>"
        )
        return head + "\n".join(self.parts) + "</svg>\n"


def rounded(pts, r):
    """Orthogonal (or any) polyline with rounded joints."""
    if len(pts) == 2 or r == 0:
        return "M" + " L".join(f"{x:.1f},{y:.1f}" for x, y in pts)
    d = f"M{pts[0][0]:.1f},{pts[0][1]:.1f}"
    for i in range(1, len(pts) - 1):
        (x0, y0), (x1, y1), (x2, y2) = pts[i - 1], pts[i], pts[i + 1]
        l1 = math.hypot(x1 - x0, y1 - y0)
        l2 = math.hypot(x2 - x1, y2 - y1)
        rr = min(r, l1 / 2, l2 / 2)
        ax, ay = x1 - (x1 - x0) / l1 * rr, y1 - (y1 - y0) / l1 * rr
        bx, by = x1 + (x2 - x1) / l2 * rr, y1 + (y2 - y1) / l2 * rr
        d += f" L{ax:.1f},{ay:.1f} Q{x1:.1f},{y1:.1f} {bx:.1f},{by:.1f}"
    d += f" L{pts[-1][0]:.1f},{pts[-1][1]:.1f}"
    return d


def header(s: Svg, eyebrow: str, title: str):
    s.eyebrow(48, 60, eyebrow)
    s.text(48, 98, title, "f", 30, 600, s.t["ink"], ls=-0.4)


# ════════════════════════════════════════════════════════════════════════
# 1. How it works
# ════════════════════════════════════════════════════════════════════════
def how_it_works(t) -> Svg:
    H = 664
    s = Svg(t, H, "How Frankenstein works",
            "A compiled game whose source is lost goes into a loop: Diggers write C, the referee compiles it and compares bytes, "
            "the Checker re-runs every claim, and two labs (SubQ Snap and Gemini) screen each match for fakes. SubQ Snap's judgment "
            "steers the loop. Rejected work goes back to the Diggers; accepted matches teach the habit library in MongoDB. "
            "The output is a rebuilt ROM with an identical SHA-1 that plays on a phone.")
    s.background()
    header(s, "How it works", "Agents write it. A compiler proves it.")

    # legend (top right): the evidence rule
    lx = 948
    s.rect(lx - 6, 46, 12, 12, 3, t["mint"])
    s.text(lx + 16, 57, "proved by the compiler", "m", 12, 400, t["ink2"])
    s.question(lx, 75, 8)
    s.text(lx + 16, 79, "judgment, not proof", "m", 12, 400, t["ink2"])
    s.line([(lx - 7, 97), (lx + 7, 97)], t["red"], 2.5)
    s.text(lx + 16, 101, "rejected, sent back", "m", 12, 400, t["ink2"])

    Y = 362  # the focal path
    top = 166

    # ── left: the patient ─────────────────────────────────────────────
    s.eyebrow(48, top, "The patient")
    cx, cy = 112, Y
    x0, y0, cw, ch = cx - 62, cy - 78, 124, 156
    s.add(f'<path d="M{x0 + 12},{y0} H{x0 + cw - 30} L{x0 + cw},{y0 + 30} V{y0 + ch - 12} Q{x0 + cw},{y0 + ch} {x0 + cw - 12},{y0 + ch} '
          f'H{x0 + 12} Q{x0},{y0 + ch} {x0},{y0 + ch - 12} V{y0 + 12} Q{x0},{y0} {x0 + 12},{y0} Z" fill="{t["cart"]}" stroke="{t["cart_line"]}" stroke-width="1.5"/>')
    # label with static
    s.rect(x0 + 14, y0 + 16, cw - 28, 82, 6, t["label"])
    import random
    rnd = random.Random(7)
    for gy in range(int(y0 + 22), int(y0 + 92), 6):
        for gx in range(int(x0 + 20), int(x0 + cw - 20), 6):
            if rnd.random() < 0.42:
                s.add(f'<rect x="{gx}" y="{gy}" width="4" height="4" fill="{t["static"]}"/>')
    # contacts
    for i in range(9):
        s.rect(x0 + 18 + i * 10, y0 + ch - 26, 6, 14, 1.5, "#4A4566")
    # stamp
    s.add(f'<g transform="rotate(-8 {cx} {y0 + 57})">')
    s.rect(cx - 52, y0 + 45, 104, 26, 6, t["label"], t["red"], 2)
    s.text(cx, y0 + 62.5, "SOURCE: LOST", "m", 12, 700, "#C42A22", "middle", ls=0.6)
    s.add("</g>")
    s.text(cx, cy + 112, "Compiled game", "s", 15, 600, t["ink"], "middle")
    s.text(cx, cy + 132, "795 functions", "m", 12, 400, t["ink3"], "middle")
    s.text(cx, cy + 150, "agents see only asm", "m", 12, 400, t["ink3"], "middle")

    # ── middle: the loop ──────────────────────────────────────────────
    px, py, pw, ph = 200, 136, 730, 488
    s.rect(px, py, pw, ph, 20, t["panel"], t["panel_line"], 1)
    s.eyebrow(224, top, "The loop · every function, every attempt", t["p_mute"])

    nodes = [
        ("01", "Diggers", ["write C from", "the assembly"], ("Muse Spark", "meta")),
        ("02", "Referee", ["compiles it and", "compares bytes"], ("0.1–0.2 s", None)),
        ("03", "Checker", ["re-runs every", "claim itself"], ("fresh compile", None)),
        ("04", "Two labs", ["screen each", "match for fakes"], None),
    ]
    nw, nh, gap = 152, 140, 24
    nx = [224 + i * (nw + gap) for i in range(4)]
    ny = Y - nh / 2

    # judgment band
    by, bh = 186, 70
    s.rect(224, by, 682, bh, 14, "#9A9AFF", None, extra=' fill-opacity="0.09"')
    s.rect(224, by, 682, bh, 14, "none", "#9A9AFF", 1, extra=' stroke-opacity="0.35"')
    s.question(254, by + 21, 8)
    s.text(270, by + 25, "SUBQ SNAP · THE JUDGMENT", "m", 12, 600, "#B9B9FF", ls=1.4)
    s.text(886, by + 25, "steers, never proves", "m", 12, 400, t["p_mute"], "end")
    chips = [("triage · budget", nx[0] + nw / 2), ("keep · escalate · abandon", nx[1] + nw / 2 + 16), ("fake gate", nx[3] + nw / 2)]
    for label, cxx in chips:
        w = len(label) * 12 * MONO_W + 20
        s.rect(cxx - w / 2, by + 36, w, 24, 12, "#9A9AFF", None, extra=' fill-opacity="0.18"')
        s.text(cxx, by + 52.5, label, "m", 12, 600, "#D4D4FF", "middle")
    for cxx in (nx[0] + nw / 2, nx[1] + nw / 2 + 16, nx[3] + nw / 2):
        s.line([(cxx, by + 60), (cxx, ny - 4)], "#9A9AFF", 1.5, "3 4")
        s.add(f'<circle cx="{cxx}" cy="{ny}" r="3.5" fill="#9A9AFF"/>')

    for i, (num, title, desc, pill) in enumerate(nodes):
        x = nx[i]
        s.rect(x, ny, nw, nh, 14, t["node"], t["node_line"], 1)
        s.text(x + 16, ny + 28, num, "m", 12, 600, t["mint"] if i == 1 else t["p_mute"])
        s.text(x + 16, ny + 54, title, "s", 17, 600, t["p_ink"])
        for j, d in enumerate(desc):
            s.text(x + 16, ny + 76 + j * 18, d, "s", 13, 400, t["p_mute"])
        if pill:
            label, who = pill
            if who:
                s.sponsor(x + 16, ny + nh - 36, label, who)
            else:
                s.pill(x + 16, ny + nh - 36, label, "#2E2A48", t["p_ink"], weight=500)
    # split pill: Snap + Gemini
    x = nx[3] + 16
    yy = ny + nh - 36
    w1, w2 = 4 * 12 * MONO_W + 18, 6 * 12 * MONO_W + 18
    s.add(f'<path d="M{x + 11},{yy} H{x + w1} V{yy + 22} H{x + 11} A11,11 0 0 1 {x + 11},{yy} Z" fill="{SPONSOR["subq"][0]}"/>')
    s.add(f'<path d="M{x + w1},{yy} H{x + w1 + w2 - 11} A11,11 0 0 1 {x + w1 + w2 - 11},{yy + 22} H{x + w1} Z" fill="{SPONSOR["gemini"][0]}"/>')
    s.text(x + w1 / 2 + 1, yy + 15.3, "Snap", "m", 12, 600, SPONSOR["subq"][1], "middle")
    s.text(x + w1 + w2 / 2 - 1, yy + 15.3, "Gemini", "m", 12, 600, SPONSOR["gemini"][1], "middle")

    # main path arrows
    s.arrow([(x0 + cw + 6, Y), (nx[0] - 2, Y)], t["mint"], 2.5)
    for i in range(3):
        s.arrow([(nx[i] + nw + 3, Y), (nx[i + 1] - 3, Y)], t["mint"], 2.5, size=8)

    # rejected loop
    ry = ny + nh + 40
    s.line([(nx[3] + nw / 2, ny + nh), (nx[3] + nw / 2, ry), (nx[0] + nw / 2 + 30, ry)], t["red"], 2)
    s.line([(nx[2] + nw / 2, ny + nh), (nx[2] + nw / 2, ry)], t["red"], 2)
    s.arrow([(nx[0] + nw / 2 + 30, ry), (nx[0] + nw / 2 + 30, ny + nh + 2)], t["red"], 2, r=10)
    s.add(f'<circle cx="{nx[2] + nw / 2}" cy="{ry}" r="3.5" fill="{t["red"]}"/>')
    rx = (nx[2] + nx[3] + nw) / 2
    s.pill(rx, ry - 12, "REJECTED", "#3A1A22", "#FF8A82", 12, 24, 700, "middle", stroke=t["red"], pad=12)
    s.text((nx[0] + nw / 2 + 30 + nx[2] + nw / 2) / 2, ry + 26, "first wrong byte goes back", "m", 12, 400, t["p_mute"], "middle")
    s.text(rx, ry + 52, "Agents lie. The referee doesn't.", "f", 18, 500, t["p_ink"], "middle", italic=True)

    # accepted → right; habit loop
    ax = 947
    s.arrow([(nx[3] + nw + 3, Y), (990, Y)], t["mint"], 2.5)
    s.pill(ax, Y - 12, "ACCEPTED", t["mint"], "#063D2B", 12, 24, 700, "middle", pad=9)
    hy = 576
    lib = (440, hy - 28, 260, 56)
    s.arrow([(ax, Y + 12), (ax, hy), (lib[0] + lib[2] + 2, hy)], t["p_mute"], 1.75, r=12)
    s.arrow([(lib[0], hy), (nx[0] + nw / 2 - 30, hy), (nx[0] + nw / 2 - 30, ny + nh + 2)], t["p_mute"], 1.75, r=12)
    s.rect(*lib, 14, t["node"], t["node_line"], 1)
    s.text(lib[0] + 16, hy - 4, "Habit library", "s", 15, 600, t["p_ink"])
    s.sponsor(lib[0] + lib[2] - 14, hy - 19, "MongoDB", "mongo", anchor="end")
    s.text(lib[0] + 16, hy + 16, "every match teaches the next", "m", 12, 400, t["p_mute"])

    # ── right: it's alive ────────────────────────────────────────────
    rx0 = 990
    s.eyebrow(rx0, top, "It's alive")
    s.text(rx0, 214, "It's alive.", "f", 28, 600, t["ink"], italic=True, ls=-0.3)
    s.text(rx0, 240, "Same SHA-1, or it", "s", 14, 400, t["ink2"])
    s.text(rx0, 259, "doesn't ship.", "s", 14, 400, t["ink2"])
    cy0 = Y - 52
    s.rect(rx0, cy0, 170, 104, 14, t["card"], t["line2"], 1)
    s.text(rx0 + 16, cy0 + 28, "Rebuilt ROM", "s", 15, 600, t["ink"])
    s.text(rx0 + 16, cy0 + 48, "from the agents' C", "m", 12, 400, t["ink3"])
    s.rect(rx0 + 14, cy0 + 62, 142, 28, 14, t["mint"])
    s.check(rx0 + 29, cy0 + 76, 7, "#063D2B", t["mint"])
    s.text(rx0 + 43, cy0 + 80.3, "SHA-1 identical", "m", 12, 700, "#063D2B")
    # phone (landscape) playing the game
    phx, phy, phw, phh = rx0 + 10, Y + 92, 150, 84
    s.arrow([(rx0 + 85, cy0 + 104), (rx0 + 85, phy - 2)], t["ink3"], 1.75)
    s.rect(phx, phy, phw, phh, 16, t["cart"], t["cart_line"], 1.5)
    sx, sy, sw_, sh = phx + 16, phy + 9, phw - 32, phh - 18
    s.rect(sx, sy, sw_, sh, 5, "#0B0A12")
    # tiny scene: a corridor in perspective, and the HUD with the healed face
    hud = 16
    gy_ = sy + sh - hud
    s.add(f'<path d="M{sx},{sy} L{sx + 34},{sy + 16} V{gy_ - 14} L{sx},{gy_} Z" fill="#4A3B35"/>')
    s.add(f'<path d="M{sx + sw_},{sy} L{sx + sw_ - 34},{sy + 16} V{gy_ - 14} L{sx + sw_},{gy_} Z" fill="#4A3B35"/>')
    s.rect(sx + 34, sy + 16, sw_ - 68, gy_ - sy - 30, 0, "#2A2240")
    s.add(f'<path d="M{sx},{gy_} L{sx + 34},{gy_ - 14} H{sx + sw_ - 34} L{sx + sw_},{gy_} Z" fill="#6B5446"/>')
    s.rect(sx + sw_ / 2 - 6, sy + 22, 12, 16, 2, "#FF5147")
    s.rect(sx, gy_, sw_, hud, 0, "#3A3550")
    s.rect(sx + 6, gy_ + 5, 22, 6, 1.5, "#FFD23F")
    s.rect(sx + sw_ - 28, gy_ + 5, 22, 6, 1.5, "#FF5147")
    fx = sx + sw_ / 2 - 7
    s.rect(fx, gy_ + 1, 14, 14, 2, "#E8B48A", t["mint"], 1.5)
    s.rect(fx + 3, gy_ + 5, 2.5, 2.5, 0, "#17141F")
    s.rect(fx + 8.5, gy_ + 5, 2.5, 2.5, 0, "#17141F")
    s.rect(fx + 4, gy_ + 10, 6, 1.6, 0, "#17141F")
    s.add(f'<circle cx="{phx + 8}" cy="{phy + phh / 2}" r="2.5" fill="#4A4566"/>')
    s.text(rx0 + 85, phy + phh + 26, "plays on every phone", "s", 13, 400, t["ink2"], "middle")
    return s


# ════════════════════════════════════════════════════════════════════════
# 2. System
# ════════════════════════════════════════════════════════════════════════
def system(t) -> Svg:
    H = 836
    s = Svg(t, H, "Frankenstein system architecture",
            "Four lanes share one append-only event stream, runs/live/events.jsonl. Lane A, the Lab, runs the referee on port 7101, "
            "builds the target (manifest, asm, ctx) and hosts the ASI:One agent. Lane B, the Crew, runs the Diggers on Muse Spark, the Checker, "
            "SubQ Snap judgment, a Gemini review, the MongoDB habit library, the jobs API on 7111 and the director on 7112. The Crew calls "
            "POST /check and POST /rebuild on the Lab; the ASI:One agent calls POST /jobs with the user's query. Lane D, the Creature, "
            "runs mGBA with a tap, the heal overlay, hot-swap and the phone page on 7401, reads fn.matched and build.rom, writes rom.swapped "
            "and sends heartbeats to the director. Lane C, the Stage, tails the stream to its scenes over ws 7202. The room watches the "
            "projector and plays on phones via a QR code.")
    s.background()
    header(s, "System", "Four lanes, one creature.")

    # legend
    lx = 930
    s.arrow([(lx - 2, 56), (lx + 30, 56)], t["ink2"], 1.75, size=8)
    s.text(lx + 42, 60, "HTTP request", "m", 12, 400, t["ink2"])
    s.arrow([(lx - 2, 82), (lx + 30, 82)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(lx + 42, 86, "file or event", "m", 12, 400, t["ink2"])

    def panel(x, y, w, h, lane, name, path):
        s.rect(x, y, w, h, 18, t["card"], t["line2"], 1)
        s.rect(x + 20, y + 19, 9, 9, 3, t["ink"])
        s.text(x + 38, y + 28, f"{lane} · {name}".upper(), "m", 12, 700, t["ink"], ls=1.4)
        s.text(x + w - 20, y + 28, path, "m", 12, 400, t["ink3"], "end")

    def row(x, y, w, name, detail, right=None, h=46, dashed=False):
        s.rect(x, y, w, h, 10, t["well"], t["line2" if dashed else "line"], 1, dash="4 3" if dashed else None)
        s.text(x + 14, y + 20, name, "s", 14, 600, t["ink3"] if dashed else t["ink"])
        s.text(x + 14, y + 37, detail, "m", 12, 400, t["ink3"])
        if right:
            label, who = right
            if who:
                bg, fg = SPONSOR[who]
                s.pill(x + w - 8, y + 7, label, bg, fg, 12, 20, 600, "end", pad=7)
            else:
                s.text(x + w - 14, y + 20, label, "m", 12, 600, t["ink2"], "end")

    ry = [184, 238, 292, 346]
    # ── Lab ──
    LX, LW = 236, 340
    panel(LX, 136, LW, 272, "A", "Lab", "lab/")
    rx, rw = LX + 20, LW - 40
    row(rx, ry[0], rw, "Referee", "check · rebuild · patch", (":7101", None))
    row(rx, ry[1], rw, "Target", "lab/out: manifest · asm · ctx")
    row(rx, ry[2], rw, "ASI:One agent", "Agentverse · chat protocol", ("Fetch.ai", "fetch"))
    row(rx, ry[3], rw, "Answer key", "lab/secrets · referee only", dashed=True)
    # lock glyph
    kx, ky = rx + rw - 30, ry[3] + 16
    s.rect(kx, ky + 6, 16, 12, 3, t["ink3"])
    s.add(f'<path d="M{kx + 3.5},{ky + 6} v-3 a4.5,4.5 0 0 1 9,0 v3" fill="none" stroke="{t["ink3"]}" stroke-width="2"/>')

    # ── Crew ──
    CX, CW = 726, 426
    panel(CX, 136, CW, 272, "B", "Crew", "crew/")
    c1, c2, cw = CX + 20, CX + 20 + 187 + 12, 187
    row(c1, ry[0], cw, "Diggers", "write the C", ("Muse Spark", "meta"))
    row(c1, ry[1], cw, "Checker", "re-runs every claim")
    row(c1, ry[2], cw, "Jobs API", ":7111 · one fn a job")
    row(c1, ry[3], cw, "Director", ":7112 · heartbeats")
    row(c2, ry[0], cw, "Judgment", "routes every try", ("SubQ Snap", "subq"))
    row(c2, ry[1], cw, "Review", "a second lab", ("Gemini", "gemini"))
    row(c2, ry[2], cw, "Memory", "habit library", ("MongoDB", "mongo"))
    row(c2, ry[3], cw, "Recovered C", "recovered/fn_*.c")

    # ── Lab ↔ Crew ──
    gx0, gx1 = LX + LW, CX
    gm = (gx0 + gx1) / 2
    yc = ry[0] + 23
    s.arrow([(gx1, yc), (gx0 + 2, yc)], t["ink2"], 1.75, size=8)
    s.text(gm, yc - 8, "POST /check", "m", 12, 600, t["ink"], "middle")
    s.text(gm, yc + 18, "POST /rebuild", "m", 12, 400, t["ink3"], "middle")
    yc = ry[1] + 23 + 6
    s.arrow([(gx0, yc), (gx1 - 2, yc)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(gm, yc - 8, "manifest", "m", 12, 600, t["ink"], "middle")
    s.text(gm, yc + 18, "asm · ctx", "m", 12, 400, t["ink3"], "middle")
    yc = ry[2] + 23 + 10
    s.arrow([(gx0, yc), (gx1 - 2, yc)], t["ink2"], 1.75, size=8)
    s.text(gm, yc - 8, "POST /jobs", "m", 12, 600, t["ink"], "middle")
    s.text(gm, yc + 18, "{query}", "m", 12, 400, t["ink3"], "middle")

    # ── the ASI:One user ──
    ux, uy, uw, uh = 40, 232, 162, 176
    s.rect(ux, uy, uw, uh, 18, t["card"], t["line2"], 1)
    s.eyebrow(ux + 16, uy + 26, "You, in ASI:One")
    s.add(f'<path d="M{ux + 16 + 12},{uy + 40} H{ux + uw - 16 - 12} Q{ux + uw - 16},{uy + 40} {ux + uw - 16},{uy + 52} V{uy + 72} '
          f'Q{ux + uw - 16},{uy + 84} {ux + uw - 28},{uy + 84} H{ux + 16 + 4} Q{ux + 16},{uy + 84} {ux + 16},{uy + 80} V{uy + 52} '
          f'Q{ux + 16},{uy + 40} {ux + 28},{uy + 40} Z" fill="{SPONSOR["fetch"][0]}"/>')
    s.text(ux + 28, uy + 59, "Bring back", "s", 13, 500, "#3A2A00")
    s.text(ux + 28, uy + 76, "Doomguy's face.", "s", 13, 500, "#3A2A00")
    s.rect(ux + 40, uy + 94, uw - 56, 66, 12, t["well"], t["line"], 1)
    s.pill(ux + 52, uy + 103, "✓ proved", t["mint"], "#063D2B", 12, 22, 700)
    s.pill(ux + 52, uy + 131, "? guess", SPONSOR["subq"][0], "#4F47CF", 12, 22, 700, stroke=t["violet"])
    ay = ry[2] + 14
    s.arrow([(ux + uw, ay), (rx - 2, ay)], t["ink2"], 1.75, size=8)
    s.arrow([(rx, ay + 18), (ux + uw + 2, ay + 18)], t["ink2"], 1.75, size=8)

    # ── the bus ──
    bx, by, bw, bh = 236, 440, 916, 44
    s.rect(bx, by, bw, bh, 22, t["bus"], t["bus_line"], 1)
    s.add(f'<circle cx="{bx + 24}" cy="{by + bh / 2}" r="5" fill="{t["mint"]}"/>')
    s.text(bx + 40, by + 27, "runs/live/events.jsonl", "m", 13, 700, t["mint"])
    s.text(bx + 450, by + 27, "append-only · the only thing the lanes share", "m", 12, 400, t["bus_mute"])
    s.text(bx + bw - 22, by + 27, "+ metrics.json", "m", 12, 400, t["bus_mute"], "end")

    # into the bus
    s.arrow([(LX + 234, 408), (LX + 234, by - 2)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(LX + 244, 429, "build.rom", "m", 12, 600, t["ink"])
    s.arrow([(CX + 120, 408), (CX + 120, by - 2)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(CX + 130, 429, "appends every event", "m", 12, 600, t["ink"])

    # ── row 2 ──
    R2 = 524
    DX, DW = 236, 340
    panel(DX, R2, DW, 164, "D", "Creature", "creature/")
    hw = (DW - 40 - 10) / 2
    row(DX + 20, R2 + 48, hw, "mGBA + tap", ":7300 · :7301")
    row(DX + 30 + hw, R2 + 48, hw, "Heal overlay", "static → pixels")
    row(DX + 20, R2 + 102, hw, "Hot-swap", "loads build.rom")
    row(DX + 30 + hw, R2 + 102, hw, "Phone page", "browser · :7401")

    SX, SW = 726, 426
    panel(SX, R2, SW, 164, "C", "Stage", "stage/")
    xx = SX + 20
    for sc in ["Title", "Split", "Versus", "Time trial", "Ending"]:
        w = s.pill(xx, R2 + 52, sc, t["well"], t["ink"], 12, 26, 600, stroke=t["line2"], pad=11)
        xx += w + 8
    row(SX + 20, R2 + 98, SW - 40, "Event-driven show", "tails events.jsonl → ws :7202 · replay 1–20×", h=50)

    # bus → row 2
    s.arrow([(DX + 54, by + bh), (DX + 54, R2 - 2)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(DX + 64, by + bh + 17, "fn.matched", "m", 12, 600, t["ink"])
    s.text(DX + 64, by + bh + 33, "build.rom", "m", 12, 400, t["ink3"])
    s.arrow([(DX + 210, R2), (DX + 210, by + bh + 2)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(DX + 220, by + bh + 17, "rom.swapped", "m", 12, 600, t["ink"])
    s.text(DX + 220, by + bh + 33, "patch.verified", "m", 12, 400, t["ink3"])
    s.arrow([(SX + 120, by + bh), (SX + 120, R2 - 2)], t["ink2"], 1.75, dash="4 4", size=8)
    s.text(SX + 130, by + bh + 25, "tail → ws :7202", "m", 12, 600, t["ink"])

    # heartbeat: Creature → director, through a slot in the bus
    hx = gm
    s.rect(hx - 5, by - 2, 10, bh + 4, 0, t["bg"])
    s.arrow([(DX + DW, R2 + 71), (hx, R2 + 71), (hx, ry[3] + 23), (c1 - 2, ry[3] + 23)], t["ink2"], 1.75, r=12, size=8)
    s.text(hx + 10, 429, "heartbeat", "m", 12, 600, t["ink"])

    # ── the room ──
    RY = 736
    s.rect(236, RY, 916, 60, 18, t["room"], t["line2"], 1, dash="5 4")
    s.eyebrow(258, RY + 35, "The room", t["ink3"])
    # phone glyph + label
    gx = DX + 128
    s.rect(gx, RY + 18, 14, 24, 3, "none", t["ink2"], 1.75)
    s.text(gx + 26, RY + 35, "everyone plays on a phone", "s", 14, 500, t["ink"])
    gx = SX + 118
    s.rect(gx, RY + 19, 26, 18, 3, "none", t["ink2"], 1.75)
    s.line([(gx + 8, RY + 42), (gx + 18, RY + 42)], t["ink2"], 1.75)
    s.text(gx + 38, RY + 35, "judges watch the projector", "s", 14, 500, t["ink"])
    s.arrow([(DX + 112, R2 + 164), (DX + 112, RY - 2)], t["ink2"], 1.75, size=8)
    s.text(DX + 122, R2 + 192, "QR · phone.published", "m", 12, 600, t["ink"])
    s.arrow([(SX + 100, R2 + 164), (SX + 100, RY - 2)], t["ink2"], 1.75, size=8)
    s.text(SX + 110, R2 + 192, "the show", "m", 12, 600, t["ink"])

    # ── the organs (left column) ──
    oy = 452
    s.eyebrow(40, oy, "The organs")
    organs = [("Muse Spark", "meta", "the hands"), ("SubQ Snap", "subq", "the judgment"), ("Fetch.ai", "fetch", "the front door"),
              ("MongoDB", "mongo", "the memory"), ("Gemini", "gemini", "the second opinion")]
    for i, (label, who, role) in enumerate(organs):
        y = oy + 20 + i * 54
        s.sponsor(40, y, label, who)
        s.text(42, y + 40, role, "s", 13, 400, t["ink2"])
    return s


# ════════════════════════════════════════════════════════════════════════
# 3. Play to recover
# ════════════════════════════════════════════════════════════════════════
def play_to_recover(t) -> Svg:
    H = 668
    s = Svg(t, H, "Play to recover",
            "A loop. A player plays on the controller. The tap samples the running functions and frames. SubQ Snap's director picks "
            "the next function from what is on screen. The crew recovers it and the Checker proves it. The Lab rebuilds the ROM with an "
            "identical SHA-1. The rebuilt ROM is hot-swapped into the running game, and that region of the screen heals, back in front "
            "of the player.")
    s.background()
    header(s, "Play to recover", "The game tells the crew where to dig.")

    cy, top, bot = 400, 222, 578
    lx, rx = 340, 860
    R = (bot - top) / 2
    # track: a soft band, then each stretch in its evidence colour
    d = (f"M{lx},{top} H{rx} A{R},{R} 0 0 1 {rx},{bot} H{lx} A{R},{R} 0 0 1 {lx},{top} Z")
    s.add(f'<path d="{d}" fill="none" stroke="{t["ink"]}" stroke-opacity="0.07" stroke-width="18"/>')
    neutral = t["ink3"]
    s.add(f'<path d="M{lx - R},{cy} A{R},{R} 0 0 1 {lx},{top} H600" fill="none" stroke="{neutral}" stroke-width="2"/>')
    s.add(f'<path d="M600,{top} H{rx}" fill="none" stroke="{t["violet"]}" stroke-width="2.5"/>')
    s.add(f'<path d="M{rx},{top} A{R},{R} 0 0 1 {rx + R},{cy}" fill="none" stroke="{neutral}" stroke-width="2"/>')
    s.add(f'<path d="M{rx + R},{cy} A{R},{R} 0 0 1 {rx},{bot} H{lx} A{R},{R} 0 0 1 {lx - R},{cy}" fill="none" stroke="{t["mint"]}" stroke-width="2.5"/>')

    def head_at_arc(cx_, ang_deg, col):
        a = math.radians(ang_deg)
        x, y = cx_ + R * math.cos(a), cy + R * math.sin(a)
        s.head(x, y, ang_deg + 90, col, 11)

    s.head(470 + 6, top, 0, neutral, 11)
    s.head(730 + 6, top, 0, t["violet"], 11)
    head_at_arc(rx, -45, neutral)
    head_at_arc(rx, 45, t["mint"])
    s.head(600 - 6, bot, 180, t["mint"], 11)
    head_at_arc(lx, 135, t["mint"])
    head_at_arc(lx, 225, neutral)

    def card(cx_, cy_, num, lane, title, detail, accent=None, w=200, h=92, mark=None):
        x, y = cx_ - w / 2, cy_ - h / 2
        s.rect(x, y, w, h, 16, t["card"], accent or t["line2"], 1.5 if accent else 1)
        s.text(x + 16, y + 26, f"{num} · {lane}", "m", 12, 600, t["ink3"], ls=1.2)
        s.text(x + 16, y + 52, title, "s", 16, 600, t["ink"])
        s.text(x + 16, y + 74, detail, "m", 12, 400, t["ink3"])
        if mark == "?":
            s.question(x + w - 22, y + 21, 9)
        elif mark == "ok":
            s.check(x + w - 22, y + 21, 9)

    # player: the focal card at the left end
    pw, ph = 216, 132
    px, py = lx - R - pw / 2, cy - ph / 2
    s.rect(px, py, pw, ph, 20, t["inv"])
    pad_ink = t["inv_ink"]
    s.text(px + 18, py + 28, "01 · YOU", "m", 12, 600, t["inv_mute"], ls=1.2)
    s.text(px + 18, py + 56, "You play", "f", 24, 600, pad_ink, italic=True)
    s.text(px + 18, py + 78, "controller or phone", "m", 12, 400, t["inv_mute"])
    # gamepad glyph, top right
    gx, gy = px + pw - 72, py + 18
    s.rect(gx, gy, 54, 28, 14, "none", pad_ink, 1.75)
    s.line([(gx + 14, gy + 9), (gx + 14, gy + 19)], pad_ink, 2)
    s.line([(gx + 9, gy + 14), (gx + 19, gy + 14)], pad_ink, 2)
    s.add(f'<circle cx="{gx + 38}" cy="{gy + 11}" r="2.6" fill="{t["mint"]}"/><circle cx="{gx + 44}" cy="{gy + 17}" r="2.6" fill="{t["spark"]}"/>')
    s.text(px + 18, py + 110, "static where code is lost", "s", 13, 400, t["inv_2"])

    card(lx, top, "02", "CREATURE", "Tap samples it", "running fns + frames")
    card(600, top, "03", "SNAP", "Director picks next", "what's on screen", accent=t["violet"], mark="?")
    card(rx, top, "04", "CREW", "Crew recovers it", "Diggers + Checker")
    card(rx + R, cy, "05", "LAB", "Lab rebuilds", "SHA-1 identical", accent=t["mint"], mark="ok")
    card(730, bot, "06", "CREATURE", "Hot-swap, live", "rom.swapped")
    card(470, bot, "07", "CREATURE", "The region heals", "static → pixels")

    # centre
    s.text(600, cy - 18, "Play it, and we rebuild it.", "f", 32, 600, t["ink"], "middle", ls=-0.4)
    s.text(600, cy + 14, "Snap watches what's on screen and sends the crew there.", "s", 15, 400, t["ink2"], "middle")
    s.text(600, cy + 36, "Every swap is byte-identical, or it doesn't ship.", "s", 15, 400, t["ink2"], "middle")
    # evidence pills
    s.pill(600 - 6, cy + 56, "✓ swap: proved by bytes", t["mint"], "#063D2B", 12, 24, 700, "end", pad=11)
    s.pill(600 + 6, cy + 56, "? pick: Snap's judgment", SPONSOR["subq"][0], "#4F47CF", 12, 24, 700, "start", stroke=t["violet"], pad=11)
    return s


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default=str(Path(__file__).resolve().parent))
    ap.add_argument("--fallback", nargs="?", const=True, default=False, help="optional sans stack to force")
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
