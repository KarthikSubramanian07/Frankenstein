"""The permuter: semantics-preserving rewrites of a near-miss, scored by the real referee, until bytes match.

Why: on mid-size GBADoom functions the Digger's C is often structurally right but GCC picks different
registers or a different instruction order, and the model stalls at 75 to 90 percent. Matching-decomp
communities break that last mile with a permuter (simonlindholm/decomp-permuter): random rewrites that do
not change what the program means, each one compiled and scored, keeping whatever scores better.

This is fresh, stdlib-only code written for our setting, inspired by decomp-permuter's design (its pass list,
random walk from the best candidate, and diff scoring). No code was copied from it.

Every pass here is exact for C, not "usually fine": commutative operand swaps (with parentheses that keep the
parse tree), mirrored comparisons, hoisting or inlining a side-effect-free temporary whose type is known
exactly, ++ vs += 1 vs x = x + 1, swapping adjacent statements only when their data flow is independent and no
memory or call ordering can change, for to while (never with `continue`), while to do-while rotation, int to
unsigned (never back) when no use can tell the difference, identity casts, if/else swaps, and declaration
order. When the analysis is unsure, the pass does nothing.

Acceptance is unchanged: a permuted MATCH still goes through the Checker's fresh verify and fakematch review.
"""
from __future__ import annotations

import difflib
import hashlib
import json
import os
import random
import re
import threading
import time
import urllib.request
from collections import Counter
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait


class ParseError(ValueError):
    pass


# ---------------------------------------------------------------- tokens
class Tok:
    __slots__ = ("t", "ws")

    def __init__(self, t: str, ws: str = " "):
        self.t, self.ws = t, ws

    def __repr__(self):
        return f"Tok({self.t!r})"


_SCAN = re.compile(r"""
 (?P<ws>(?:\s+|//[^\n]*|/\*.*?\*/)+)
|(?P<pp>\#(?:\\\n|[^\n])*)
|(?P<lit>"(?:\\.|[^"\\\n])*"|'(?:\\.|[^'\\\n])*')
|(?P<num>\.?\d(?:[eE][+-]|[\w.])*)
|(?P<id>[A-Za-z_]\w*)
|(?P<op>\.\.\.|<<=|>>=|->|\+\+|--|<<|>>|<=|>=|==|!=|&&|\|\||[-+*/%&|^]=|[-+*/%&|^~!<>=?:;,.()\[\]{}])
""", re.S | re.X)


def tokenize(src: str) -> tuple[list[Tok], str]:
    toks, pos, ws = [], 0, ""
    while pos < len(src):
        m = _SCAN.match(src, pos)
        if not m:
            raise ParseError(f"unexpected character {src[pos]!r}")
        pos = m.end()
        if m.lastgroup == "ws":
            ws += m.group()
            continue
        toks.append(Tok(m.group(), ws))
        ws = ""
    return toks, ws


def render(toks: list[Tok], tail: str = "") -> str:
    return "".join(t.ws + t.t for t in toks) + tail


def lead(tl: list[Tok], ws: str) -> list[Tok]:
    return [Tok(tl[0].t, ws)] + tl[1:] if tl else tl


def _pairs(toks: list[Tok]) -> dict[int, int]:
    m, st = {}, []
    close = {")": "(", "]": "[", "}": "{"}
    for i, t in enumerate(toks):
        if t.t in ("(", "[", "{"):
            st.append(i)
        elif t.t in close:
            if not st or toks[st[-1]].t != close[t.t]:
                raise ParseError("unbalanced brackets")
            j = st.pop()
            m[i], m[j] = j, i
    if st:
        raise ParseError("unbalanced brackets")
    return m


# ---------------------------------------------------------------- types
QUALS = {"const", "volatile", "static", "register", "extern", "inline", "auto", "__inline", "__inline__"}
BASE_KW = {"void", "char", "short", "int", "long", "signed", "unsigned", "float", "double", "_Bool", "bool"}
TAG_KW = {"struct", "union", "enum"}
TYPE_KW = QUALS | BASE_KW | TAG_KW
DEFAULT_TYPEDEFS = {"u8": "unsigned char", "u16": "unsigned short", "u32": "unsigned int", "s8": "signed char",
                    "s16": "short", "s32": "int", "uint8_t": "unsigned char", "uint16_t": "unsigned short",
                    "uint32_t": "unsigned int", "int8_t": "signed char", "int16_t": "short", "int32_t": "int",
                    "fixed_t": "int", "boolean": "int", "byte": "unsigned char", "size_t": "unsigned int"}
_CANON = {"unsigned": "unsigned int", "signed": "int", "signed int": "int", "short int": "short",
          "signed short": "short", "unsigned short int": "unsigned short", "long int": "long", "signed long": "long",
          "unsigned long int": "unsigned long", "char signed": "signed char"}
NARROW = {"char", "signed char", "unsigned char", "short", "unsigned short", "_Bool", "bool"}
INT32 = {"int", "unsigned int"}
SCALAR_INT = NARROW | INT32 | {"long", "unsigned long"}
KEYWORDS = TYPE_KW | {"if", "else", "for", "while", "do", "switch", "case", "default", "return", "break",
                      "continue", "goto", "sizeof", "typedef"}


def canon(words: list[str], typedefs: dict[str, str]) -> str | None:
    """Canonical spelling of a scalar or pointer type from specifier words and stars, or None if unknown."""
    stars = sum(1 for w in words if w == "*")
    base = [w for w in words if w not in QUALS and w != "*"]
    if not base:
        return None
    if len(base) == 1 and base[0] in typedefs:
        inner = typedefs[base[0]]
        if inner is None:
            return None
        b = inner
    elif base[0] in TAG_KW:
        if len(base) != 2:
            return None
        b = " ".join(base)
    elif all(w in BASE_KW for w in base):
        b = " ".join(base)
        b = _CANON.get(b, b)
    else:
        return None
    if " *" in b:  # typedef of a pointer
        return b + " *" * stars
    return b + " *" * stars


def strip_ptr(t: str | None) -> str | None:
    if t and t.endswith(" *"):
        return t[:-2]
    return None


def promote(t: str | None) -> str | None:
    if t in NARROW:
        return "int"
    return t


def arith(a: str | None, b: str | None) -> str | None:
    a, b = promote(a), promote(b)
    if a is None or b is None or a not in INT32 or b not in INT32:
        return None
    return "unsigned int" if "unsigned int" in (a, b) else "int"


def num_type(text: str) -> str | None:
    t = text.lower()
    if "." in t or ("e" in t and not t.startswith("0x")) or t.endswith("f"):
        return None
    suf = re.search(r"[ul]+$", t)
    s = suf.group() if suf else ""
    body = t[: len(t) - len(s)]
    try:
        v = int(body, 16) if body.startswith("0x") else int(body, 8) if body.startswith("0") and len(body) > 1 else int(body)
    except ValueError:
        return None
    if "l" in s:
        return None
    if "u" in s:
        return "unsigned int" if v <= 0xFFFFFFFF else None
    if v <= 0x7FFFFFFF:
        return "int"
    if body.startswith("0") and v <= 0xFFFFFFFF:  # hex/octal literals may be unsigned int
        return "unsigned int"
    return None


# ---------------------------------------------------------------- expressions
BIN = {"||": 4, "&&": 5, "|": 6, "^": 7, "&": 8, "==": 9, "!=": 9, "<": 10, ">": 10, "<=": 10, ">=": 10,
       "<<": 11, ">>": 11, "+": 12, "-": 12, "*": 13, "/": 13, "%": 13}
ASSIGN = {"=", "+=", "-=", "*=", "/=", "%=", "&=", "|=", "^=", "<<=", ">>="}
COMMUTATIVE = {"+", "*", "&", "|", "^", "==", "!="}
MIRROR = {"<": ">", ">": "<", "<=": ">=", ">=": "<="}
NEGATE = {"<": ">=", ">=": "<", ">": "<=", "<=": ">", "==": "!=", "!=": "=="}


class E:
    __slots__ = ("k", "lo", "hi", "op", "opi", "kids", "parent")

    def __init__(self, k, lo, hi, op=None, opi=None, kids=()):
        self.k, self.lo, self.hi, self.op, self.opi, self.kids = k, lo, hi, op, opi, list(kids)
        self.parent = None
        for c in self.kids:
            c.parent = self

    def walk(self):
        yield self
        for c in self.kids:
            yield from c.walk()


class ExprParser:
    def __init__(self, toks, P, is_type):
        self.toks, self.P, self.is_type = toks, P, is_type

    def parse(self, lo, hi) -> E:
        if lo >= hi:
            raise ParseError("empty expression")
        save = getattr(self, "i", None), getattr(self, "end", None)
        self.i, self.end = lo, hi
        e = self.comma()
        if self.i != hi:
            raise ParseError(f"trailing tokens at {self.toks[self.i].t!r}")
        self.i, self.end = save
        return e

    def peek(self, k=0):
        j = self.i + k
        return self.toks[j].t if j < self.end else None

    def comma(self):
        left = self.assign()
        while self.peek() == ",":
            opi = self.i
            self.i += 1
            r = self.assign()
            left = E("comma", left.lo, r.hi, ",", opi, [left, r])
        return left

    def assign(self):
        left = self.cond()
        if self.peek() in ASSIGN:
            opi, op = self.i, self.peek()
            self.i += 1
            r = self.assign()
            return E("asg", left.lo, r.hi, op, opi, [left, r])
        return left

    def cond(self):
        c = self.binary(4)
        if self.peek() == "?":
            q = self.i
            self.i += 1
            a = self.comma()
            if self.peek() != ":":
                raise ParseError("expected :")
            self.i += 1
            b = self.cond()
            return E("tern", c.lo, b.hi, "?", q, [c, a, b])
        return c

    def binary(self, minp):
        left = self.unary()
        while True:
            op = self.peek()
            p = BIN.get(op)
            if p is None or p < minp:
                return left
            opi = self.i
            self.i += 1
            r = self.binary(p + 1)
            left = E("bin", left.lo, r.hi, op, opi, [left, r])

    def unary(self):
        t, lo = self.peek(), self.i
        if t in ("++", "--"):
            self.i += 1
            x = self.unary()
            return E("pre", lo, x.hi, t, lo, [x])
        if t in ("-", "+", "!", "~", "*", "&"):
            self.i += 1
            x = self.unary()
            return E("un", lo, x.hi, t, lo, [x])
        if t == "sizeof":
            if self.peek(1) == "(" and self.is_type(self.i + 2, self.P[self.i + 1]):
                self.i = self.P[self.i + 1] + 1
                return E("sizeof", lo, self.i, "sizeof", lo)
            self.i += 1
            x = self.unary()
            return E("sizeof", lo, x.hi, "sizeof", lo, [x])
        if t == "(" and self.is_type(self.i + 1, self.P[self.i]):
            rp = self.P[self.i]
            self.i = rp + 1
            if self.peek() == "{":
                raise ParseError("compound literal")
            x = self.unary()
            return E("cast", lo, x.hi, None, rp, [x])
        return self.postfix()

    def postfix(self):
        x = self.primary()
        while True:
            t = self.peek()
            if t == "(":
                rp = self.P[self.i]
                args, j = [], self.i + 1
                while j < rp:
                    k = j
                    while k < rp and self.toks[k].t != ",":
                        k = self.P[k] + 1 if self.toks[k].t in ("(", "[", "{") else k + 1
                    args.append(self.parse(j, k))
                    j = k + 1
                self.i = rp + 1
                x = E("call", x.lo, self.i, None, None, [x] + args)
            elif t == "[":
                rb = self.P[self.i]
                idx = self.parse(self.i + 1, rb)
                self.i = rb + 1
                x = E("idx", x.lo, self.i, "[", rb, [x, idx])
            elif t in (".", "->"):
                opi = self.i
                self.i += 2
                x = E("mem", x.lo, self.i, t, opi, [x])
            elif t in ("++", "--"):
                self.i += 1
                x = E("post", x.lo, self.i, t, self.i - 1, [x])
            else:
                return x

    def primary(self):
        t, lo = self.peek(), self.i
        if t is None:
            raise ParseError("unexpected end")
        if t == "(":
            rp = self.P[lo]
            inner = self.parse(lo + 1, rp)
            self.i = rp + 1
            return E("paren", lo, self.i, None, None, [inner])
        if t == "{":
            self.i = self.P[lo] + 1
            return E("init", lo, self.i)
        self.i += 1
        if t[0] == '"':
            while self.peek() and self.peek()[0] == '"':
                self.i += 1
            return E("str", lo, self.i)
        if t[0] == "'" or t[0].isdigit() or t[0] == ".":
            return E("num", lo, self.i, t)
        if re.match(r"[A-Za-z_]\w*$", t) and t not in KEYWORDS:
            return E("atom", lo, self.i, t)
        raise ParseError(f"unexpected token {t!r}")


def side_effects(e: E) -> bool:
    return any(x.k in ("asg", "pre", "post", "call") for x in e.walk())


def needs_paren(x: E, p: int) -> bool:
    return (x.k == "bin" and BIN[x.op] <= p) or x.k in ("tern", "asg", "comma")


def tight(x: E) -> bool:
    """True when x can be pasted anywhere without parentheses."""
    return x.k in ("atom", "num", "str", "paren", "call", "idx", "mem", "post")


# ---------------------------------------------------------------- statements
class S:
    __slots__ = ("k", "lo", "hi", "items", "c", "body", "els", "parts", "exprs", "decl")

    def __init__(self, k, lo, hi, **kw):
        self.k, self.lo, self.hi = k, lo, hi
        self.items = kw.get("items")
        self.c = kw.get("c")  # (lp, rp) of a condition
        self.body = kw.get("body")
        self.els = kw.get("els")
        self.parts = kw.get("parts")  # for: (lp, s1, s2, rp)
        self.exprs = None  # parsed expression roots, filled by Func
        self.decl = None

    def walk(self):
        yield self
        for ch in (self.items or []):
            yield from ch.walk()
        for ch in (self.body, self.els):
            if ch is not None:
                yield from ch.walk()


class Decl:
    __slots__ = ("lo", "hi", "spec_hi", "spec", "decls", "storage", "volatile", "simple")

    def __init__(self):
        self.decls = []  # (name, type, name_i, dlo, dhi, init_lo, init_hi, is_array)


class Env:
    """What the file and its ctx header declare: typedefs, global variables, prototypes and macros."""

    def __init__(self, src: str, ctx: str = ""):
        self.typedefs = dict(DEFAULT_TYPEDEFS)
        self.globals: dict[str, tuple[str | None, bool]] = {}  # name -> (type, volatile)
        self.funcs: dict[str, str | None] = {}  # name -> return type
        self.macros: set[str] = set()
        for text in (ctx, src):
            if text:
                try:
                    self._scan(text)
                except ParseError:
                    pass

    def _scan(self, text: str):
        toks, _ = tokenize(text)
        for t in toks:
            m = re.match(r"#\s*define\s+(\w+)", t.t)
            if m:
                self.macros.add(m.group(1))
        toks = [t for t in toks if not t.t.startswith("#")]
        P = _pairs(toks)
        i = 0
        while i < len(toks):
            j = i
            while j < len(toks) and toks[j].t not in (";", "{"):
                j = P[j] + 1 if toks[j].t in ("(", "[") else j + 1
            if j < len(toks) and toks[j].t == "{":
                if j > i and toks[j - 1].t == ")":  # function definition
                    self._proto(toks, P, i, j)
                    i = P[j] + 1
                    continue
                j = P[j] + 1  # struct/enum body: skip to its ';'
                while j < len(toks) and toks[j].t != ";":
                    j = P[j] + 1 if toks[j].t in ("(", "[", "{") else j + 1
                self._top(toks, P, i, j)
                i = j + 1
                continue
            self._top(toks, P, i, j)
            i = j + 1

    def _proto(self, toks, P, lo, hi):
        k = lo
        while k < hi and not (toks[k].t not in TYPE_KW and toks[k].t not in self.typedefs
                              and re.match(r"[A-Za-z_]", toks[k].t) and k + 1 < hi and toks[k + 1].t == "("):
            k += 1
        if k < hi:
            self.funcs[toks[k].t] = canon([t.t for t in toks[lo:k]], self.typedefs)

    def _top(self, toks, P, lo, hi):
        words = [t.t for t in toks[lo:hi]]
        if not words:
            return
        if words[0] == "typedef":
            name = words[-1]
            if "(" in words or "[" in words or "{" in words:
                self.typedefs[name] = None
                if re.match(r"[A-Za-z_]\w*$", name):
                    pass
                m = [w for w in words if re.match(r"[A-Za-z_]\w*$", w)]
                if m:
                    self.typedefs[m[-1]] = None
                return
            self.typedefs[name] = canon(words[1:-1], self.typedefs)
            return
        if "(" in words and words.index("(") > 0:  # prototype
            k = words.index("(")
            if toks[lo + k - 1].t not in TYPE_KW:
                self.funcs[words[k - 1]] = canon(words[: k - 1], self.typedefs)
            return
        d = parse_decl(toks, P, lo, hi, self.typedefs)
        if d is not None:
            for name, typ, *_ in d.decls:
                self.globals[name] = (typ, d.volatile)

    def is_type_word(self, w: str) -> bool:
        return w in TYPE_KW or w in self.typedefs


def parse_decl(toks, P, lo, hi, typedefs) -> Decl | None:
    """`spec declarator [= init], ...` over [lo, hi) (no ';'). None when it is not a declaration we understand."""
    i, spec = lo, []
    while i < hi:
        t = toks[i].t
        if t in TAG_KW:
            if i + 1 >= hi:
                return None
            spec += [t, toks[i + 1].t]
            i += 2
            if i < hi and toks[i].t == "{":
                return None
        elif t in TYPE_KW or (t in typedefs and not any(w in typedefs or w in BASE_KW for w in spec if w not in QUALS)):
            spec.append(t)
            i += 1
        else:
            break
    if not [w for w in spec if w not in QUALS] or i >= hi:
        return None
    d = Decl()
    d.lo, d.hi, d.spec_hi, d.spec = lo, hi, i, spec
    d.storage = "static" in spec or "extern" in spec
    d.volatile = "volatile" in spec
    d.simple = True
    while i < hi:
        dlo, stars = i, []
        while i < hi and toks[i].t in ("*", "const", "volatile"):
            stars.append(toks[i].t)
            if toks[i].t == "volatile":
                d.volatile = True
            i += 1
        if i >= hi or not re.match(r"[A-Za-z_]\w*$", toks[i].t) or toks[i].t in KEYWORDS:
            return None
        name_i = i
        i += 1
        is_array = False
        while i < hi and toks[i].t == "[":
            is_array = True
            i = P[i] + 1
        if i < hi and toks[i].t == "(":
            return None  # function declarator or pointer to function
        ilo = ihi = None
        if i < hi and toks[i].t == "=":
            ilo = i + 1
            while i < hi and toks[i].t != ",":
                i = P[i] + 1 if toks[i].t in ("(", "[", "{") else i + 1
            ihi = i
        typ = canon(spec + stars, typedefs)
        if is_array:
            typ = None
        d.decls.append((toks[name_i].t, typ, name_i, dlo, i, ilo, ihi, is_array))
        if i < hi:
            if toks[i].t != ",":
                return None
            i += 1
    return d if d.decls else None


class Func:
    """One parsed function: statement tree, expression trees, locals and their facts."""

    def __init__(self, toks: list[Tok], name: str, env: Env):
        self.toks, self.name, self.env = toks, name, env
        self.P = _pairs(toks)
        self.parser = ExprParser(toks, self.P, self._is_type)
        start = None
        for i in range(len(toks) - 1):
            if toks[i].t == name and toks[i + 1].t == "(":
                rp = self.P[i + 1]
                if rp + 1 < len(toks) and toks[rp + 1].t == "{":
                    start = i
                    break
        if start is None:
            raise ParseError(f"no definition of {name}")
        k = start
        while k > 0 and toks[k - 1].t not in (";", "}") and not toks[k - 1].t.startswith("#"):
            k -= 1
        self.ret = canon([t.t for t in toks[k:start]], env.typedefs)
        lp = start + 1
        self.lp, self.rp = lp, self.P[lp]
        self.locals: dict[str, dict] = {}
        self._params(lp + 1, self.rp)
        self.body = self.block(self.rp + 1)
        self.opaque: set[int] = set()
        for s in self.body.walk():
            self._exprs(s)
        self.addr_taken = {e.kids[0].op for s in self.body.walk() for e in self._all(s)
                           if e.k == "un" and e.op == "&" and e.kids[0].k == "atom"}
        self.has_float = any(t.t in ("float", "double") for t in toks[self.lp:self.body.hi])
        self.has_long = any(t.t == "long" for t in toks[self.lp:self.body.hi])

    # ---- parsing
    def _is_type(self, lo, hi):
        if lo >= hi or not self.env.is_type_word(self.toks[lo].t) or self.toks[lo].t in self.locals:
            return False
        for j in range(lo, hi):
            t = self.toks[j].t
            if not (self.env.is_type_word(t) or t == "*" or (j > lo and self.toks[j - 1].t in TAG_KW)):
                return False
        return True

    def _params(self, lo, hi):
        j = lo
        while j < hi:
            k = j
            while k < hi and self.toks[k].t != ",":
                k = self.P[k] + 1 if self.toks[k].t in ("(", "[") else k + 1
            d = parse_decl(self.toks, self.P, j, k, self.env.typedefs)
            if d:
                for name, typ, *_rest in d.decls:
                    self.locals[name] = {"type": typ, "array": _rest[-1], "volatile": d.volatile, "param": True,
                                         "static": False}
            j = k + 1

    def block(self, lo) -> S:
        if self.toks[lo].t != "{":
            raise ParseError("expected {")
        hi = self.P[lo]
        items, i = [], lo + 1
        while i < hi:
            st = self.stmt(i)
            items.append(st)
            i = st.hi
        return S("block", lo, hi + 1, items=items)

    def _scan_to(self, i, stop=";"):
        n = len(self.toks)
        while i < n and self.toks[i].t != stop:
            if self.toks[i].t in ("(", "[", "{"):
                i = self.P[i]
            elif self.toks[i].t == "}":
                raise ParseError("unexpected }")
            i += 1
        if i >= n:
            raise ParseError("missing ;")
        return i

    def _paren(self, i):
        if self.toks[i].t != "(":
            raise ParseError("expected (")
        return i, self.P[i]

    def stmt(self, i) -> S:
        t = self.toks[i].t
        if t == "{":
            return self.block(i)
        if t == "if":
            c = self._paren(i + 1)
            th = self.stmt(c[1] + 1)
            els, hi = None, th.hi
            if hi < len(self.toks) and self.toks[hi].t == "else":
                els = self.stmt(hi + 1)
                hi = els.hi
            return S("if", i, hi, c=c, body=th, els=els)
        if t in ("while", "switch"):
            c = self._paren(i + 1)
            body = self.stmt(c[1] + 1)
            return S(t, i, body.hi, c=c, body=body)
        if t == "for":
            lp, rp = self._paren(i + 1)
            semis, j = [], lp + 1
            while j < rp:
                if self.toks[j].t in ("(", "[", "{"):
                    j = self.P[j]
                elif self.toks[j].t == ";":
                    semis.append(j)
                j += 1
            if len(semis) != 2:
                raise ParseError("bad for")
            body = self.stmt(rp + 1)
            return S("for", i, body.hi, parts=(lp, semis[0], semis[1], rp), body=body)
        if t == "do":
            body = self.stmt(i + 1)
            j = body.hi
            if self.toks[j].t != "while":
                raise ParseError("bad do")
            c = self._paren(j + 1)
            if self.toks[c[1] + 1].t != ";":
                raise ParseError("bad do")
            return S("do", i, c[1] + 2, c=c, body=body)
        if t == "case":
            j = i + 1
            depth = 0
            while self.toks[j].t != ":" or depth:
                depth += {"?": 1}.get(self.toks[j].t, 0) - (1 if self.toks[j].t == ":" and depth else 0)
                j += 1
            return S("label", i, j + 1)
        if t == "default" or (re.match(r"[A-Za-z_]\w*$", t) and t not in KEYWORDS
                              and i + 1 < len(self.toks) and self.toks[i + 1].t == ":"):
            return S("label", i, i + 2)
        if t == ";":
            return S("empty", i, i + 1)
        j = self._scan_to(i)
        if t in ("return", "break", "continue", "goto"):
            return S(t, i, j + 1)
        if self.env.is_type_word(t) and t not in self.locals or (
                re.match(r"[A-Za-z_]\w*$", t) and t not in KEYWORDS and t not in self.locals
                and re.match(r"[A-Za-z_]\w*$", self.toks[i + 1].t) and self.toks[i + 1].t not in KEYWORDS):
            if t not in self.env.typedefs and t not in TYPE_KW:
                self.env.typedefs.setdefault(t, None)  # an unknown typedef name: a type, but of unknown shape
            d = parse_decl(self.toks, self.P, i, j, self.env.typedefs)
            st = S("decl", i, j + 1)
            st.decl = d
            if d:
                for name, typ, *_rest in d.decls:
                    self.locals[name] = {"type": typ, "array": _rest[-1], "volatile": d.volatile,
                                         "param": False, "static": d.storage}
            return st
        return S("expr", i, j + 1)

    def _exprs(self, s: S):
        roots = []
        try:
            if s.k in ("expr",):
                roots.append(self.parser.parse(s.lo, s.hi - 1))
            elif s.k == "return" and s.hi - 1 > s.lo + 1:
                roots.append(self.parser.parse(s.lo + 1, s.hi - 1))
            elif s.k == "decl":
                if s.decl is None:
                    raise ParseError("opaque declaration")
                for *_x, ilo, ihi, _arr in s.decl.decls:
                    if ilo is not None:
                        roots.append(self.parser.parse(ilo, ihi))
            elif s.k in ("if", "while", "switch", "do"):
                roots.append(self.parser.parse(s.c[0] + 1, s.c[1]))
            elif s.k == "for":
                lp, s1, s2, rp = s.parts
                for a, b in ((lp + 1, s1), (s1 + 1, s2), (s2 + 1, rp)):
                    if b > a:
                        if a == lp + 1 and self.env.is_type_word(self.toks[a].t):
                            d = parse_decl(self.toks, self.P, a, b, self.env.typedefs)
                            if d is None:
                                raise ParseError("opaque for-init")
                            for name, typ, *_rest in d.decls:
                                self.locals[name] = {"type": typ, "array": _rest[-1], "volatile": d.volatile,
                                                     "param": False, "static": d.storage}
                            for *_x, ilo, ihi, _arr in d.decls:
                                if ilo is not None:
                                    roots.append(self.parser.parse(ilo, ihi))
                        else:
                            roots.append(self.parser.parse(a, b))
        except (ParseError, KeyError, IndexError):
            self.opaque.add(s.lo)
            roots = []
        s.exprs = roots

    @staticmethod
    def _all(s: S):
        for r in s.exprs or []:
            yield from r.walk()

    # ---- facts
    def scalar_local(self, name: str) -> bool:
        v = self.locals.get(name)
        return bool(v) and not v["array"] and not v["volatile"] and not v["static"] and name not in self.addr_taken \
            and v["type"] is not None and not v["type"].startswith(("struct", "union"))

    def type_of(self, e: E) -> str | None:
        k = e.k
        if k == "atom":
            v = self.locals.get(e.op)
            if v is not None:
                return None if v["array"] else v["type"]
            g = self.env.globals.get(e.op)
            return g[0] if g else None
        if k == "num":
            return num_type(e.op)
        if k == "paren":
            return self.type_of(e.kids[0])
        if k == "cast":
            return canon([t.t for t in self.toks[e.lo + 1:e.opi]], self.env.typedefs)
        if k in ("un",):
            if e.op == "*":
                return strip_ptr(self.type_of(e.kids[0]))
            if e.op == "!":
                return "int"
            if e.op in ("-", "~", "+"):
                t = promote(self.type_of(e.kids[0]))
                return t if t in INT32 else None
            return None
        if k == "idx":
            return strip_ptr(self.type_of(e.kids[0]))
        if k == "bin":
            a, b = self.type_of(e.kids[0]), self.type_of(e.kids[1])
            if e.op in ("==", "!=", "<", ">", "<=", ">=", "&&", "||"):
                return "int"
            if e.op in ("<<", ">>"):
                t = promote(a)
                return t if t in INT32 and b is not None else None
            if e.op in ("+", "-") and a and a.endswith("*"):
                if e.op == "-" and b and b.endswith("*"):
                    return "int" if a == b else None
                return a if promote(b) in INT32 else None
            if e.op == "+" and b and b.endswith("*"):
                return b if promote(a) in INT32 else None
            return arith(a, b)
        if k == "tern":
            a, b = self.type_of(e.kids[1]), self.type_of(e.kids[2])
            return a if a == b and a is not None else None
        if k == "call" and e.kids[0].k == "atom":
            return self.env.funcs.get(e.kids[0].op)
        return None

    def effects(self, s: S) -> dict | None:
        """reads/writes of scalar locals, memory reads/writes, calls and volatile. None when unknowable."""
        if s.lo in self.opaque or s.k not in ("expr", "decl"):
            return None
        fx = {"r": set(), "w": set(), "mr": False, "mw": False, "call": False, "vol": False}
        if "volatile" in (t.t for t in self.toks[s.lo:s.hi]):
            fx["vol"] = True
        if s.k == "decl":
            if s.decl is None or s.decl.storage:
                return None
            for name, *_ in s.decl.decls:
                fx["w"].add(name)
        for r in s.exprs or []:
            self._fx(r, fx)
        return fx

    def _lvalue(self, x: E, fx: dict, also_read: bool):
        while x.k == "paren":
            x = x.kids[0]
        if x.k == "atom" and self.scalar_local(x.op):
            fx["w"].add(x.op)
            if also_read:
                fx["r"].add(x.op)
            return
        fx["mw"] = True
        if x.k == "atom":
            self._atom(x.op, fx)
            fx["mr"] = fx["mr"] or also_read
        else:
            for c in x.kids:
                self._fx(c, fx)
            if x.k == "mem" and x.op == ".":
                pass

    def _atom(self, name: str, fx: dict):
        if self.scalar_local(name):
            fx["r"].add(name)
        elif name in self.locals:
            v = self.locals[name]
            fx["mr"] = True
            if v["volatile"]:
                fx["vol"] = True
        elif name in self.env.globals:
            fx["mr"] = True
            if self.env.globals[name][1]:
                fx["vol"] = True
        elif name in self.env.funcs:
            pass
        else:
            fx["mr"] = fx["vol"] = True  # unknown name or macro: assume the worst

    def _fx(self, e: E, fx: dict):
        k = e.k
        if k == "atom":
            self._atom(e.op, fx)
        elif k == "asg":
            self._lvalue(e.kids[0], fx, e.op != "=")
            self._fx(e.kids[1], fx)
        elif k in ("pre", "post"):
            self._lvalue(e.kids[0], fx, True)
        elif k == "call":
            fx["call"] = True
            for c in e.kids[1:]:
                self._fx(c, fx)
            if e.kids[0].k != "atom":
                self._fx(e.kids[0], fx)
        elif k in ("un", "idx", "mem") and (k != "un" or e.op == "*") or (k == "mem"):
            fx["mr"] = True
            for c in e.kids:
                self._fx(c, fx)
        elif k == "sizeof":
            pass
        elif k == "init":
            fx["mr"] = fx["vol"] = True
        else:
            for c in e.kids:
                self._fx(c, fx)

    def uses(self, name: str) -> list[int]:
        return [i for i in range(self.body.lo, self.body.hi) if self.toks[i].t == name]


def independent(a: dict | None, b: dict | None) -> bool:
    if a is None or b is None:
        return False
    if a["w"] & (b["r"] | b["w"]) or b["w"] & a["r"]:
        return False

    def pure(x):
        return not (x["mr"] or x["mw"] or x["call"] or x["vol"])
    if pure(a) or pure(b):
        return True
    if a["call"] or b["call"] or a["vol"] or b["vol"]:
        return False
    return not ((a["mw"] and (b["mr"] or b["mw"])) or (b["mw"] and a["mr"]))


# ---------------------------------------------------------------- passes
def _sites(f: Func, pred):
    return [e for s in f.body.walk() if s.lo not in f.opaque for r in (s.exprs or []) for e in r.walk() if pred(e)]


def _ctx_rvalue(e: E) -> bool:
    """e is read as a value and evaluated unconditionally within its full expression."""
    x = e
    while x.parent is not None:
        p = x.parent
        if p.k == "asg" and p.kids[0] is x:
            return False
        if p.k in ("pre", "post", "sizeof") or (p.k == "un" and p.op == "&"):
            return False
        if p.k == "mem" and p.op == ".":
            return False
        if p.k == "call" and p.kids[0] is x:
            return False
        if p.k == "bin" and p.op in ("&&", "||") and p.kids[1] is x:
            return False
        if p.k == "tern" and p.kids[0] is not x:
            return False
        x = p
    return True


def p_commute(f: Func, rng) -> list[Tok] | None:
    sites = _sites(f, lambda e: e.k == "bin" and (e.op in COMMUTATIVE or e.op in MIRROR)
                   and not (side_effects(e.kids[0]) and side_effects(e.kids[1])))
    if not sites:
        return None
    e = rng.choice(sites)
    L, R = e.kids
    toks = f.toks
    lt, rt = toks[L.lo:L.hi], toks[R.lo:R.hi]
    if needs_paren(L, BIN[e.op]):
        lt = [Tok("(", " ")] + lead(lt, "") + [Tok(")", "")]
    op = MIRROR.get(e.op, e.op)
    new = lead(rt, toks[e.lo].ws) + [Tok(op, toks[e.opi].ws or " ")] + lead(lt, toks[R.lo].ws or " ")
    return toks[:e.lo] + new + toks[e.hi:]


def p_incdec(f: Func, rng) -> list[Tok] | None:
    """x++  <->  ++x  <->  x += 1  <->  x = x + 1, and x = x op y  <->  x op= y, on whole-statement expressions."""
    cands = []
    for s in f.body.walk():
        if s.lo in f.opaque:
            continue
        roots = []
        if s.k == "expr":
            roots = s.exprs or []
        elif s.k == "for" and s.exprs:
            lp, s1, s2, rp = s.parts
            roots = [r for r in s.exprs if r.lo > s2]
        for r in roots:
            x = r
            while x.k == "comma":
                x = x.kids[1]
            for e in ([r] if r.k != "comma" else [c for c in r.walk() if c.parent and c.parent.k == "comma"]):
                if e.k in ("pre", "post", "asg") and e.kids[0].k == "atom":
                    cands.append(e)
    if not cands:
        return None
    e = rng.choice(cands)
    toks = f.toks
    v = toks[e.kids[0].lo]
    ws = toks[e.lo].ws
    forms = []
    if e.k in ("pre", "post") or (e.k == "asg" and e.op in ("+=", "-=") and e.kids[1].k == "num" and e.kids[1].op == "1"):
        sign = e.op[0]
        forms = [[Tok(v.t, ws), Tok(sign * 2, "")], [Tok(sign * 2, ws), Tok(v.t, "")],
                 [Tok(v.t, ws), Tok(sign + "=", " "), Tok("1", " ")],
                 [Tok(v.t, ws), Tok("=", " "), Tok(v.t, " "), Tok(sign, " "), Tok("1", " ")]]
    elif e.k == "asg" and e.op == "=" and e.kids[1].k == "bin" and e.kids[1].op in ("+", "-", "*", "&", "|", "^", "<<", ">>", "/", "%") \
            and e.kids[1].kids[0].k == "atom" and e.kids[1].kids[0].op == v.t:
        b = e.kids[1]
        rhs = toks[b.kids[1].lo:b.kids[1].hi]
        forms = [[Tok(v.t, ws), Tok(b.op + "=", " ")] + lead(rhs, " ")]
        if b.op in ("+", "-") and b.kids[1].k == "num" and b.kids[1].op == "1":
            forms.append([Tok(v.t, ws), Tok(b.op * 2, "")])
    elif e.k == "asg" and e.op in ASSIGN and e.op != "=":
        op = e.op[:-1]
        R = e.kids[1]
        rhs = toks[R.lo:R.hi]
        if needs_paren(R, BIN[op]):
            rhs = [Tok("(", " ")] + lead(rhs, "") + [Tok(")", "")]
        forms = [[Tok(v.t, ws), Tok("=", " "), Tok(v.t, " "), Tok(op, " ")] + lead(rhs, " ")]
    cur = render(toks[e.lo:e.hi]).split()
    forms = [fm for fm in forms if render(fm).split() != cur]
    if not forms:
        return None
    return toks[:e.lo] + rng.choice(forms) + toks[e.hi:]


def _block_pairs(f: Func, ok):
    out = []
    for s in f.body.walk():
        if s.k != "block":
            continue
        for a, b in zip(s.items, s.items[1:]):
            if ok(a, b):
                out.append((a, b))
    return out


def _swap(toks, a: S, b: S) -> list[Tok]:
    at, bt = toks[a.lo:a.hi], toks[b.lo:b.hi]
    return toks[:a.lo] + lead(bt, toks[a.lo].ws) + lead(at, toks[b.lo].ws) + toks[b.hi:]


def p_reorder_stmts(f: Func, rng) -> list[Tok] | None:
    pairs = _block_pairs(f, lambda a, b: a.k in ("expr", "decl") and b.k in ("expr", "decl")
                         and independent(f.effects(a), f.effects(b)))
    if not pairs:
        return None
    a, b = rng.choice(pairs)
    return _swap(f.toks, a, b)


def p_reorder_decls(f: Func, rng) -> list[Tok] | None:
    """Swap two adjacent declarations, or split `int a, b;` into two declarations."""
    pairs = _block_pairs(f, lambda a, b: a.k == "decl" and b.k == "decl" and independent(f.effects(a), f.effects(b)))
    multi = [s for s in f.body.walk() if s.k == "decl" and s.decl and len(s.decl.decls) > 1 and not s.decl.storage
             and s.lo not in f.opaque]
    if not pairs and not multi:
        return None
    toks = f.toks
    if multi and (not pairs or rng.random() < 0.3):
        s = rng.choice(multi)
        d = s.decl
        spec = toks[d.lo:d.spec_hi]
        new = []
        for k, (_n, _t, _ni, dlo, dhi, *_r) in enumerate(d.decls):
            ws = toks[s.lo].ws if k == 0 else (toks[s.lo].ws if "\n" in toks[s.lo].ws else " ")
            new += lead(spec, ws) + lead(toks[dlo:dhi], " ") + [Tok(";", "")]
        return toks[:s.lo] + new + toks[s.hi:]
    a, b = rng.choice(pairs)
    return _swap(toks, a, b)


def _fresh(f: Func, base="tmp") -> str:
    names = {t.t for t in f.toks}
    k = 0
    while (base + (str(k) if k else "")) in names:
        k += 1
    return base + (str(k) if k else "")


def _stmt_ok_for_hoist(f: Func, s: S) -> bool:
    """Only top-level assignments as side effects: hoisting a pure operand cannot reorder anything observable."""
    for r in s.exprs or []:
        for e in r.walk():
            if e.k in ("pre", "post"):
                return False
            if e.k == "asg" and e.parent is not None and not (e.parent.k == "comma" and e.parent.parent is None):
                return False
    return True


def _decl_text(typ: str, name: str) -> list[Tok]:
    words = typ.split()
    out = [Tok(w, " ") for w in words if w != "*"]
    stars = sum(1 for w in words if w == "*")
    return out + [Tok("*" * stars + name, " ")] if stars else out + [Tok(name, " ")]


def p_temp_for_expr(f: Func, rng) -> list[Tok] | None:
    """`x = a*b + c;`  ->  `T tmp = a*b; x = tmp + c;` for a side-effect-free a*b of exactly known type T."""
    cands = []
    for blk in f.body.walk():
        if blk.k != "block":
            continue
        for k, s in enumerate(blk.items):
            if s.k not in ("expr", "return", "if", "decl") or s.lo in f.opaque or not s.exprs:
                continue
            if k > 0 and blk.items[k - 1].k == "label":
                continue
            if s.k == "decl" and len(s.decl.decls) != 1:
                continue
            if not _stmt_ok_for_hoist(f, s):
                continue
            calls = any(e.k == "call" for r in s.exprs for e in r.walk())
            for r in s.exprs:
                for e in r.walk():
                    if e is r and s.k in ("expr", "decl"):
                        continue  # the whole statement expression (or the whole initializer)
                    if e.k not in ("bin", "un", "idx", "mem", "cast", "atom") or side_effects(e):
                        continue
                    if e.k == "atom" and (e.op in f.locals or e.op not in f.env.globals):
                        continue  # a global read is worth hoisting; a local copy is pointless
                    if e.k == "un" and e.op == "&":
                        continue
                    if e.parent is not None and e.parent.k == "paren":
                        continue
                    if not _ctx_rvalue(e):
                        continue
                    typ = f.type_of(e)
                    if typ is None or typ.startswith(("struct", "union", "void")) or typ == "void":
                        continue
                    fx = {"r": set(), "w": set(), "mr": False, "mw": False, "call": False, "vol": False}
                    f._fx(e, fx)
                    if fx["vol"] or (calls and fx["mr"]):
                        continue
                    cands.append((s, e, typ))
    if not cands:
        return None
    s, e, typ = rng.choice(cands)
    toks = f.toks
    name = _fresh(f)
    ws = toks[s.lo].ws if "\n" in toks[s.lo].ws else "\n    "
    decl = lead(_decl_text(typ, name), ws) + [Tok("=", " ")] + lead(toks[e.lo:e.hi], " ") + [Tok(";", "")]
    body = toks[s.lo:e.lo] + [Tok(name, toks[e.lo].ws)] + toks[e.hi:s.hi]
    return toks[:s.lo] + decl + lead(body, ws) + toks[s.hi:]


def p_inline_temp(f: Func, rng) -> list[Tok] | None:
    """`T t = E; ...; use(t);`  ->  `...; use((E));` when E is pure, of exactly type T, used once, and nothing
    in between can change what E reads."""
    cands = []
    for blk in f.body.walk():
        if blk.k != "block":
            continue
        for k, s in enumerate(blk.items):
            if s.k != "decl" or not s.decl or len(s.decl.decls) != 1 or s.lo in f.opaque or s.decl.storage:
                continue
            name, typ, name_i, dlo, dhi, ilo, ihi, arr = s.decl.decls[0]
            if ilo is None or arr or typ is None or s.decl.volatile or "const" in s.decl.spec or not s.exprs:
                continue
            init = s.exprs[0]
            if side_effects(init) or f.type_of(init) != typ or name in f.addr_taken:
                continue
            fx_e = {"r": set(), "w": set(), "mr": False, "mw": False, "call": False, "vol": False}
            f._fx(init, fx_e)
            if fx_e["vol"]:
                continue
            uses = [i for i in f.uses(name) if i != name_i]
            if len(uses) != 1:
                continue
            u = uses[0]
            j = k + 1
            ok = False
            while j < len(blk.items):
                t = blk.items[j]
                if t.lo <= u < t.hi:
                    if t.lo in f.opaque or t.k not in ("expr", "decl", "return", "if"):
                        break
                    if t.k == "if" and not (t.c[0] < u < t.c[1]):
                        break
                    occ = [e for r in t.exprs or [] for e in r.walk() if e.k == "atom" and e.lo == u]
                    if not occ or not _ctx_rvalue(occ[0]):
                        break
                    fx_t = {"r": set(), "w": set(), "mr": False, "mw": False, "call": False, "vol": False}
                    for r in t.exprs or []:
                        f._fx(r, fx_t)
                    pure_e = not fx_e["mr"]
                    if not _stmt_ok_for_hoist(f, t) or (fx_t["w"] & fx_e["r"] and t.k != "expr") or (
                            not pure_e and (fx_t["call"] or fx_t["vol"])):
                        break
                    # a top-level assignment to something E reads happens after E is evaluated: fine
                    ok = True
                    break
                fx = f.effects(t)
                if fx is None or fx["w"] & fx_e["r"] or (fx_e["mr"] and (fx["mw"] or fx["call"] or fx["vol"])) or name in fx["r"]:
                    break
                j += 1
            if ok:
                cands.append((s, init, u))
    if not cands:
        return None
    s, init, u = rng.choice(cands)
    toks = f.toks
    et = toks[init.lo:init.hi]
    if not tight(init):
        et = [Tok("(", toks[u].ws)] + lead(et, "") + [Tok(")", "")]
    else:
        et = lead(et, toks[u].ws)
    out = toks[:u] + et + toks[u + 1:]
    nxt = toks[s.hi] if s.hi < len(toks) else None
    del out[s.lo:s.hi]
    if nxt is not None:
        out[s.lo] = Tok(out[s.lo].t, toks[s.lo].ws)
    return out


def p_loops(f: Func, rng) -> list[Tok] | None:
    """for -> while (no `continue` in the body), while -> for(;;) form, while -> if + do-while rotation."""
    cands = [s for s in f.body.walk() if s.k in ("for", "while") and s.lo not in f.opaque]
    if not cands:
        return None
    s = rng.choice(cands)
    toks = f.toks
    ws = toks[s.lo].ws
    inner_ws = ws + "    " if "\n" in ws else " "
    body_has_continue = any(toks[i].t == "continue" for i in range(s.body.lo, s.body.hi))
    if s.k == "for":
        if body_has_continue:
            return None
        lp, s1, s2, rp = s.parts
        init, cond, step = toks[lp + 1:s1], toks[s1 + 1:s2], toks[s2 + 1:rp]
        cond = lead(cond, "") if cond else [Tok("1", "")]
        if s.body.k == "block":
            b = toks[s.body.lo:s.body.hi - 1]
            if step:
                b = b + lead(step, inner_ws) + [Tok(";", "")]
            body = b + [Tok("}", toks[s.body.hi - 1].ws)]
        else:
            body = [Tok("{", " ")] + lead(toks[s.body.lo:s.body.hi], inner_ws)
            if step:
                body += lead(step, inner_ws) + [Tok(";", "")]
            body += [Tok("}", ws if "\n" in ws else " ")]
        loop = [Tok("while", inner_ws if init else ws), Tok("(", " ")] + cond + [Tok(")", "")] + lead(body, " ")
        if init:
            if f.env.is_type_word(init[0].t):
                return toks[:s.lo] + [Tok("{", ws)] + lead(init, inner_ws) + [Tok(";", "")] + loop + \
                    [Tok("}", ws)] + toks[s.hi:]
            return toks[:s.lo] + lead(init, ws) + [Tok(";", "")] + loop + toks[s.hi:]
        return toks[:s.lo] + lead(loop, ws) + toks[s.hi:]
    lp, rp = s.c
    cond = toks[lp + 1:rp]
    if rng.random() < 0.5:
        return toks[:s.lo] + [Tok("for", ws), Tok("(", " "), Tok(";", ""), Tok(cond[0].t, " ")] + cond[1:] + \
            [Tok(";", ""), Tok(")", "")] + toks[rp + 1:]
    # while (c) B  ->  if (c) do B while (c);  : c is evaluated exactly as often, in the same places
    if s.exprs and side_effects(s.exprs[0]):
        return None
    body = lead(toks[s.body.lo:s.body.hi], " ")
    return toks[:s.lo] + [Tok("if", ws), Tok("(", " ")] + lead(cond, "") + [Tok(")", ""), Tok("do", " ")] + body + \
        [Tok("while", " "), Tok("(", " ")] + lead(cond, "") + [Tok(")", ""), Tok(";", "")] + toks[s.hi:]


def p_unrotate(f: Func, rng) -> list[Tok] | None:
    """if (c) do B while (c);  ->  while (c) B"""
    cands = []
    for s in f.body.walk():
        if s.k == "if" and s.els is None and s.body.k == "do" and s.lo not in f.opaque:
            c1 = render(f.toks[s.c[0] + 1:s.c[1]]).split()
            c2 = render(f.toks[s.body.c[0] + 1:s.body.c[1]]).split()
            if c1 == c2:
                cands.append(s)
    if not cands:
        return None
    s = rng.choice(cands)
    toks = f.toks
    d = s.body
    return toks[:s.lo] + [Tok("while", toks[s.lo].ws)] + toks[s.c[0]:s.c[1] + 1] + \
        lead(toks[d.body.lo:d.body.hi], " ") + toks[s.hi:]


def _unsigned_safe(f: Func, name: str) -> bool:
    """Every use of `name` would compute the same bits if it were unsigned instead of int."""
    for s in f.body.walk():
        for r in s.exprs or []:
            for e in r.walk():
                if e.k != "atom" or e.op != name:
                    continue
                x = e
                while True:
                    p = x.parent
                    if p is None:
                        if s.k == "return" and f.ret not in INT32 | NARROW:
                            return False
                        if s.k == "decl":  # initializer of another local: its type must be int-like
                            for dn, dt, *_rest in s.decl.decls:
                                if _rest[3] is not None and _rest[3] <= x.lo < _rest[4] and dt not in INT32 | NARROW:
                                    return False
                        break
                    if p.k in ("paren",) or (p.k == "bin" and p.op in ("+", "-", "*", "&", "|", "^")) or \
                            (p.k == "un" and p.op in ("-", "~", "+")) or (p.k == "tern" and p.kids[0] is not x) or \
                            (p.k == "comma" and p.kids[1] is x):
                        x = p
                        continue
                    if p.k == "bin" and p.op == "<<" and p.kids[0] is x:
                        x = p
                        continue
                    if p.k == "bin" and p.op in ("<<", ">>") and p.kids[1] is x:
                        break  # shift count: signedness irrelevant
                    if p.k == "bin" and p.op in ("==", "!=", "&&", "||"):
                        break
                    if p.k == "un" and p.op == "!":
                        break
                    if p.k == "tern" and p.kids[0] is x:
                        break
                    if p.k == "idx" and p.kids[1] is x:
                        break
                    if p.k in ("pre", "post"):
                        break
                    if p.k == "asg":
                        if p.kids[0] is x:
                            if p.op in ("/=", "%=", ">>="):
                                return False
                            break
                        lhs = p.kids[0]
                        lt = f.type_of(lhs)
                        if p.op in ("/=", "%=", ">>=") or lt is None or lt not in INT32 | NARROW:
                            return False
                        break
                    if p.k == "cast":
                        ct = f.type_of(p)
                        if ct not in INT32 | NARROW:
                            return False
                        break
                    return False  # relational, division, right shift, call argument, member, unknown: unsure
            if s.k in ("if", "while", "do", "for") and False:
                pass
    return True


def p_signedness(f: Func, rng) -> list[Tok] | None:
    """int -> unsigned int on a local whose every use computes the same bits either way (one way only: the
    reverse could introduce signed overflow, which the compiler may assume never happens)."""
    if f.has_float or f.has_long:
        return None
    cands = []
    for s in f.body.walk():
        if s.k != "decl" or not s.decl or len(s.decl.decls) != 1 or s.decl.storage or s.lo in f.opaque:
            continue
        name, typ, name_i, *_r = s.decl.decls[0]
        spec = [w for w in s.decl.spec if w not in ("const", "register")]
        if typ != "int" or not f.scalar_local(name) or spec not in (["int"], ["signed", "int"], ["signed"], ["s32"]):
            continue
        if _unsigned_safe(f, name):
            cands.append(s)
    if not cands:
        return None
    s = rng.choice(cands)
    toks = f.toks
    spec_toks = [t for t in toks[s.decl.lo:s.decl.spec_hi] if t.t in ("const", "register")]
    new = [Tok("unsigned", toks[s.lo].ws), Tok("int", " ")] + lead(spec_toks, " ") if spec_toks else \
        [Tok("unsigned", toks[s.lo].ws), Tok("int", " ")]
    return toks[:s.lo] + new + toks[s.decl.spec_hi:]


def p_cast(f: Func, rng) -> list[Tok] | None:
    """Add an identity cast `(T)x` on a value already of type T, or remove one whose operand already is T."""
    toks = f.toks
    adds = _sites(f, lambda e: e.k == "atom" and e.op in f.locals and f.type_of(e) is not None
                  and not f.type_of(e).startswith(("struct", "union")) and _ctx_rvalue(e)
                  and not (e.parent is not None and e.parent.k == "cast"))
    rems = _sites(f, lambda e: e.k == "cast" and f.type_of(e) is not None and f.type_of(e.kids[0]) == f.type_of(e))
    if not adds and not rems:
        return None
    if rems and (not adds or rng.random() < 0.5):
        e = rng.choice(rems)
        inner = toks[e.kids[0].lo:e.kids[0].hi]
        return toks[:e.lo] + lead(inner, toks[e.lo].ws) + toks[e.hi:]
    e = rng.choice(adds)
    typ = f.type_of(e)
    words = [Tok(w, " ") for w in typ.split()]
    cast = [Tok("(", "")] + lead(words, "") + [Tok(")", "")] + lead(toks[e.lo:e.hi], "")
    if e.parent is not None and e.parent.k in ("idx", "mem", "call", "post"):
        cast = [Tok("(", "")] + cast + [Tok(")", "")]  # a cast binds looser than postfix operators
    return toks[:e.lo] + lead(cast, toks[e.lo].ws) + toks[e.hi:]


def p_if_else(f: Func, rng) -> list[Tok] | None:
    """if (c) A else B  ->  if (!c) B else A  (comparisons are inverted exactly; no floats)."""
    if f.has_float:
        return None
    cands = [s for s in f.body.walk() if s.k == "if" and s.els is not None and s.lo not in f.opaque and s.exprs]
    if not cands:
        return None
    s = rng.choice(cands)
    toks = f.toks
    c = s.exprs[0]
    while c.k == "paren":
        c = c.kids[0]
    ct = toks[c.lo:c.hi]
    if c.k == "bin" and c.op in NEGATE:
        neg = toks[c.lo:c.opi] + [Tok(NEGATE[c.op], toks[c.opi].ws)] + toks[c.opi + 1:c.hi]
    elif c.k == "un" and c.op == "!":
        inner = c.kids[0]
        neg = toks[inner.lo:inner.hi]
    else:
        neg = [Tok("!", "")] + ([Tok("(", "")] + lead(ct, "") + [Tok(")", "")] if not tight(c) else lead(ct, ""))
    a, b = s.body, s.els
    else_i = a.hi
    at, bt = toks[a.lo:a.hi], toks[b.lo:b.hi]
    return toks[:s.c[0] + 1] + lead(neg, "") + [Tok(")", "")] + lead(bt, toks[a.lo].ws) + [toks[else_i]] + \
        lead(at, toks[b.lo].ws) + toks[s.hi:]


def p_split_init(f: Func, rng) -> list[Tok] | None:
    """T x = E;  <->  T x; x = E;  (single scalar declarator, not const)."""
    toks = f.toks
    splits, merges = [], []
    for blk in f.body.walk():
        if blk.k != "block":
            continue
        for k, s in enumerate(blk.items):
            if s.k != "decl" or not s.decl or len(s.decl.decls) != 1 or s.decl.storage or s.lo in f.opaque:
                continue
            name, typ, name_i, dlo, dhi, ilo, ihi, arr = s.decl.decls[0]
            if arr or "const" in s.decl.spec or typ is None:
                continue
            if ilo is not None and toks[ilo].t != "{":
                splits.append((s, name_i, ilo, ihi))
            elif ilo is None and k + 1 < len(blk.items):
                n = blk.items[k + 1]
                if n.k == "expr" and n.exprs and n.exprs[0].k == "asg" and n.exprs[0].op == "=" and \
                        n.exprs[0].kids[0].k == "atom" and n.exprs[0].kids[0].op == name and \
                        name not in {e.op for e in n.exprs[0].kids[1].walk() if e.k == "atom"}:
                    merges.append((s, n))
    if not splits and not merges:
        return None
    if splits and (not merges or rng.random() < 0.5):
        s, name_i, ilo, ihi = rng.choice(splits)
        ws = toks[s.lo].ws if "\n" in toks[s.lo].ws else " "
        return toks[:ilo - 1] + [Tok(";", "")] + [Tok(toks[name_i].t, ws), Tok("=", " ")] + lead(toks[ilo:ihi], " ") + \
            toks[ihi:]
    s, n = rng.choice(merges)
    r = n.exprs[0].kids[1]
    return toks[:s.hi - 1] + [Tok("=", " ")] + lead(toks[r.lo:r.hi], " ") + [Tok(";", "")] + toks[n.hi:]


PASSES = {  # name -> (function, weight)
    "commute": (p_commute, 12),
    "reorder_stmts": (p_reorder_stmts, 12),
    "temp_for_expr": (p_temp_for_expr, 10),
    "inline_temp": (p_inline_temp, 6),
    "reorder_decls": (p_reorder_decls, 6),
    "incdec": (p_incdec, 5),
    "split_init": (p_split_init, 4),
    "loops": (p_loops, 4),
    "unrotate": (p_unrotate, 2),
    "if_else": (p_if_else, 5),
    "signedness": (p_signedness, 4),
    "cast": (p_cast, 4),
}


def mutate(toks: list[Tok], fn: str, env: Env, rng: random.Random, n: int = 1, passes=None) -> tuple[list[Tok], list[str]] | None:
    """Apply n random passes in a row. Returns (tokens, pass names) or None when nothing applied."""
    names = list(passes or PASSES)
    weights = [PASSES[p][1] for p in names]
    used = []
    for _ in range(n):
        for _try in range(8):
            name = rng.choices(names, weights)[0]
            try:
                f = Func(toks, fn, env)
                new = PASSES[name][0](f, rng)
            except (ParseError, KeyError, IndexError, AttributeError, TypeError):
                new = None
            if new is not None:
                toks = new
                used.append(name)
                break
    return (toks, used) if used else None


# ---------------------------------------------------------------- scoring
_BRANCH = re.compile(r"^(b(?:eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|hs|lo)?(?:\.[nw])?|cbn?z)\s+(?:(r\d+),\s*)?([0-9a-f]+)\b")


def _shapes(items: list[dict]) -> list[str]:
    from .align import _shape
    out = []
    for it in items:
        m = _BRANCH.match(it["text"])
        out.append(m.group(1) + " L" if m else _shape(it["text"]))
    return out


def _same(t: dict, g: dict) -> bool:
    tk, gk = t.get("key"), g.get("key")
    if tk or gk:
        return tuple(tk or ()) == tuple(gk or ())
    return t.get("bytes") == g.get("bytes")


PENALTY_OPERAND, PENALTY_REORDER, PENALTY_INSDEL = 5, 60, 100  # asm-differ / objdiff / decomp-permuter scale


def _fields(text: str) -> list[str]:
    from .align import _clean
    return [x for x in re.split(r"[\s,\[\]{}]+", _clean(text)) if x]


def penalty(target: list[dict], got: list[dict]) -> tuple[int, int, int]:
    """(penalty, exact, structural) for a candidate against the target. 0 penalty and equal length is a match.

    Instructions are aligned on their shape (registers and branch targets blanked). Aligned pairs whose bytes
    differ cost 5 per differing operand (register allocation). Unaligned instructions that appear on both
    sides with the same shape count as reorders (60), the rest as insertions or deletions (100): a line that
    moved AND changed register costs 60, not 200 as in a text-only multiset.
    """
    ts, gs = _shapes(target), _shapes(got)
    sm = difflib.SequenceMatcher(None, ts, gs, autojunk=False)
    pen = exact = struct = 0
    dels, ins = Counter(), Counter()
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == "equal":
            for k in range(i2 - i1):
                t, g = target[i1 + k], got[j1 + k]
                struct += 1
                if _same(t, g):
                    exact += 1
                else:
                    a, b = _fields(t["text"]), _fields(g["text"])
                    pen += PENALTY_OPERAND * max(1, sum(1 for x, y in zip(a, b) if x != y) + abs(len(a) - len(b)))
        else:
            dels.update(ts[i1:i2])
            ins.update(gs[j1:j2])
    moved = sum((dels & ins).values())
    pen += PENALTY_REORDER * moved + PENALTY_INSDEL * (sum(dels.values()) + sum(ins.values()) - 2 * moved)
    return pen, exact, struct


def score(res: dict, target: list[dict] | None, got: list[dict] | None) -> tuple | None:
    """Higher is better: (-penalty, exact %, structure %, match_pct). None for candidates that did not compile
    or failed lint (they are discarded). Without instruction lists (HTTP referee) only match_pct is known."""
    st = res.get("status")
    if st == "MATCH":
        return (float("inf"),)
    if st != "PARTIAL":
        return None
    pct = float(res.get("match_pct", 0.0))
    if not target or not got:
        return (pct, pct, 0.0, pct)
    pen, exact, struct = penalty(target, got)
    n = max(1, len(target))
    return (-pen, round(100.0 * exact / n, 2), round(100.0 * struct / n, 2), pct)


def describe(sc: tuple | None, res: dict) -> dict:
    if sc is None:
        return {"match_pct": 0.0, "exact_pct": None, "structure_pct": None, "status": res.get("status")}
    if sc[0] == float("inf"):
        return {"match_pct": 100.0, "exact_pct": 100.0, "structure_pct": 100.0, "status": "MATCH"}
    return {"match_pct": sc[3], "exact_pct": sc[1], "structure_pct": sc[2], "penalty": -sc[0] if sc[2] else None,
            "status": res.get("status")}


# ---------------------------------------------------------------- referee access
_SLOTS = threading.BoundedSemaphore(max(1, int(os.environ.get("PERMUTE_MAX_PARALLEL", "6"))))
_REF = None
_REF_LOCK = threading.Lock()


def _lab():
    global _REF
    with _REF_LOCK:
        if _REF is None:
            from lab.referee.core import Referee
            _REF = Referee()
        return _REF


def lab_check(fn: str, src: str):
    return _lab().check_items(fn, src)


def http_checker(url: str):
    url = url.rstrip("/")

    def check(fn, src):
        req = urllib.request.Request(url + "/check", data=json.dumps({"fn": fn, "src": src}).encode(),
                                     headers={"Content-Type": "application/json"}, method="POST")
        with urllib.request.urlopen(req, timeout=90) as r:
            return json.loads(r.read()), None, None
    return check


def default_check():
    try:
        _lab()
        return lab_check
    except Exception:
        return http_checker(os.environ.get("REFEREE_URL", "http://127.0.0.1:7101"))


def lab_context(fn: str) -> str:
    try:
        return _lab().context(fn)
    except Exception:
        return ""


def _checker_ok(src: str, base: str) -> bool:
    """The Checker's deterministic fakematch rules, applied before spending a referee check."""
    from .checker import CAST, GOTO, VOLATILE
    if VOLATILE.search(src) and not VOLATILE.search(base):
        return False
    if len(GOTO.findall(src)) > max(2, len(GOTO.findall(base))):
        return False
    return max((len(CAST.findall(line)) for line in src.splitlines()), default=0) < 4


def _key(toks: list[Tok]) -> str:
    return hashlib.sha1(" ".join(t.t for t in toks).encode()).hexdigest()


# ---------------------------------------------------------------- search
def permute(fn: str, src: str, *, budget_s: float = 60, max_checks: int = 300, workers: int = 6, seed: int = 0,
            check=None, ctx: str | None = None, passes=None, stop=None) -> dict:
    """Random-walk local search over semantics-preserving rewrites of `src`, scored by the referee.

    check(fn, src) -> (result, target_items | None, candidate_items | None); defaults to Lane A's referee
    in-process (fast, gives instruction lists for aligned scoring), else HTTP (match_pct only).
    Stops at the first MATCH, after budget_s seconds, or after max_checks referee checks.
    """
    t0 = time.time()
    rng = random.Random(seed)
    check = check or default_check()
    if ctx is None:
        ctx = lab_context(fn) if check is lab_check else ""
    env = Env(src, ctx)
    applied, tried = Counter(), Counter()
    discarded = 0

    def run(s):
        with _SLOTS:
            try:
                return check(fn, s)
            except Exception as e:  # a referee hiccup costs one candidate, not the search
                return {"status": "ERROR", "error": str(e)[:200]}, None, None

    res0, tg0, got0 = run(src)
    sc0 = score(res0, tg0, got0)
    out = {"best_src": src, "best": res0, "checks": 1, "improved_from": describe(sc0, res0)["match_pct"],
           "from": describe(sc0, res0), "matched": res0.get("status") == "MATCH", "passes": applied,
           "tried": tried, "discarded": 0, "seconds": 0.0, "improved": False}
    try:
        toks0, tail = tokenize(src)
        Func(toks0, fn, env)
    except ParseError as e:
        out["error"] = f"parse: {e}"
    if out["matched"] or sc0 is None or "error" in out:
        out["to"] = out["from"]
        out["seconds"] = round(time.time() - t0, 2)
        return out
    best = (sc0, toks0, res0, [])
    current = best
    seen = {_key(toks0)}
    stale, checks = 0, 1
    inflight = {}
    with ThreadPoolExecutor(max_workers=max(1, workers), thread_name_prefix="permute") as ex:
        while True:
            timed_out = time.time() - t0 >= budget_s
            stopping = timed_out or best[0][0] == float("inf") or (stop is not None and stop())
            while not stopping and len(inflight) < workers and checks + len(inflight) < max_checks:
                cand = None
                for _ in range(12):
                    n = 1 if rng.random() < 0.55 else 2 if rng.random() < 0.65 else 3
                    m = mutate(current[1], fn, env, rng, n, passes)
                    if m is None:
                        continue
                    k = _key(m[0])
                    if k in seen:
                        continue
                    seen.add(k)
                    s = render(m[0], tail)
                    if not _checker_ok(s, src):
                        discarded += 1
                        continue
                    cand = (m[0], m[1], s)
                    break
                if cand is None:
                    break
                tried.update(cand[1])
                inflight[ex.submit(run, cand[2])] = cand
            if not inflight:
                break
            done, _ = wait(list(inflight), timeout=max(0.05, budget_s - (time.time() - t0)) if not stopping else None,
                           return_when=FIRST_COMPLETED)
            for fut in done:
                ctoks, used, s = inflight.pop(fut)
                res, tg, got = fut.result()
                checks += 1
                sc = score(res, tg, got)
                if sc is None:
                    discarded += 1
                    stale += 1
                    continue
                if sc > best[0]:
                    best = (sc, ctoks, res, current[3] + used)
                    current = best
                    stale = 0
                elif sc == best[0] and sc >= current[0]:
                    if rng.random() < 0.5:  # neutral drift: equal-scoring variants open new neighbourhoods
                        current = (sc, ctoks, res, current[3] + used)
                    stale += 1
                else:
                    stale += 1
                if stale >= 40:
                    current, stale = best, 0
            if stopping and not inflight:
                break
            if time.time() - t0 >= budget_s + 30:  # never wait forever on a hung check
                break
    applied.update(best[3])
    out.update(best_src=render(best[1], tail), best=best[2], checks=checks, matched=best[0][0] == float("inf"),
               discarded=discarded, to=describe(best[0], best[2]), improved=best[0] > sc0,
               seconds=round(time.time() - t0, 2))
    return out


def main(argv=None) -> int:
    import argparse
    ap = argparse.ArgumentParser(description="Permute a C candidate against Lane A's referee.")
    ap.add_argument("fn")
    ap.add_argument("src", help="path to a .c file")
    ap.add_argument("--budget-s", type=float, default=60)
    ap.add_argument("--max-checks", type=int, default=300)
    ap.add_argument("--workers", type=int, default=6)
    ap.add_argument("--seed", type=int, default=0)
    ap.add_argument("--out", default="")
    a = ap.parse_args(argv)
    r = permute(a.fn, open(a.src).read(), budget_s=a.budget_s, max_checks=a.max_checks, workers=a.workers, seed=a.seed)
    print(json.dumps({k: (dict(v) if isinstance(v, Counter) else v) for k, v in r.items() if k not in ("best", "best_src")},
                     indent=1))
    if a.out:
        open(a.out, "w").write(r["best_src"])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
