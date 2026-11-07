"""Referee core: compile a candidate in the pinned devkitARM container and compare it to the original object.

A function matches when every instruction's bytes are identical, except at relocation sites, where both sides
must point at the same anonymous symbol (fn_/data_ id, plus the same offset into it).
"""
import json
import re
import subprocess
import time
import uuid
from pathlib import Path

from .lint import lint

REPO = Path(__file__).resolve().parents[2]
LAB = REPO / "lab"
SECRETS, OUT = LAB / "secrets", LAB / "out"
CONTAINER = "frank-lab"
OBJDUMP = "$DEVKITARM/bin/arm-none-eabi-objdump"
GCC = "$DEVKITARM/bin/arm-none-eabi-gcc"
MAX_DIFF = 64

# GBADoom's Makefile CFLAGS minus -flto=8 (lab/TOOLCHAIN.md). -g and include paths do not change code.
THUMB_FLAGS = ("-O3 -mcpu=arm7tdmi -mtune=arm7tdmi -fgcse-after-reload -fallow-store-data-races -ffast-math "
               "-fno-inline-functions-called-once -DGBA -mthumb -mthumb-interwork -std=gnu23")
ARM_FLAGS = THUMB_FLAGS.replace("-fno-inline-functions-called-once", "") + " -fno-lto -marm -finline-functions-called-once"

INSN_RE = re.compile(r"^\s*([0-9a-f]+):\t([0-9a-f ]+?)\s*\t(.*)$")
RELOC_RE = re.compile(r"^\s*([0-9a-f]+): (R_ARM_\w+)\t(\S+)$")
HEAD_RE = re.compile(r"^([0-9a-f]{8}) <(.+)>:$")
SYMTAB_RE = re.compile(r"^([0-9a-f]{8}) (.{7}) (\S+)\t([0-9a-f]{8}) (.+)$")


class Referee:
    def __init__(self) -> None:
        manifest = json.loads((OUT / "manifest.json").read_text())
        self.functions = {f["id"]: f for f in manifest["functions"]}
        self.names = json.loads((SECRETS / "names.json").read_text())
        self.ids = _elf_ids()
        self._targets: dict[str, list[dict]] = {}
        self._symtabs: dict[str, list[tuple[str, int, int, str]]] = {}

    # ---------- public API (contract section 4) ----------
    def check(self, fn: str, src: str) -> dict:
        started = time.time()
        meta = self.functions.get(fn)
        if meta is None or meta["scope"] != "game":
            raise KeyError(f"unknown game function {fn}")
        target = self._target(fn)
        asm_path = OUT / "asm" / f"{fn}.s"
        lint_result = lint(src, len(target), asm_path.read_text() if asm_path.exists() else "")
        result = {"v": 1, "fn": fn, "status": "LINT_FAIL", "match_pct": 0.0, "first_diff": None, "diff": [],
                  "lint": lint_result, "compile": {"ok": False, "log": ""}, "elapsed_ms": 0, "referee": _git_sha()}
        if lint_result["ok"]:
            ok, log, got = self._compile(fn, src, meta["mode"])
            result["compile"] = {"ok": ok, "log": log[-4000:]}
            if not ok:
                result["status"] = "NO_COMPILE"
            else:
                result.update(self._compare(target, got))
        result["elapsed_ms"] = int((time.time() - started) * 1000)
        return result

    def context(self, fn: str) -> str:
        return (OUT / "ctx" / f"{fn}.h").read_text()

    def self_check(self, fn: str, edit: tuple[str, str] | None = None) -> dict:
        """T2 (tests only): compile the hidden original source of fn's file and compare fn. Never exposed over HTTP."""
        name, origin = self.names[fn]["name"], self.names[fn]["origin"]
        src = (SECRETS / "gbadoom" / origin).read_text()
        if edit:
            assert src.count(edit[0]) == 1, f"edit anchor not unique: {edit[0]!r}"
            src = src.replace(edit[0], edit[1])
        work = OUT / "tmp" / uuid.uuid4().hex[:10]
        work.mkdir(parents=True)
        (work / "orig.c").write_text(src)
        rel = work.relative_to(REPO)
        inc = "-iquote lab/secrets/gbadoom/include -iquote lab/secrets/gbadoom/include/libtimidity -iquote lab/secrets/gbadoom/source -I/opt/devkitpro/libgba/include"
        flags = ARM_FLAGS if self.functions[fn]["mode"] == "arm" else THUMB_FLAGS
        proc = _docker(f"{GCC} {flags} {inc} -c {rel}/orig.c -o {rel}/o.o 2>&1 && {OBJDUMP} -dr {rel}/o.o > {rel}/o.dis && {OBJDUMP} -t {rel}/o.o > {rel}/o.sym")
        if proc.returncode != 0:
            return {"status": "NO_COMPILE", "log": proc.stdout[-2000:]}
        symtab = _symtab((work / "o.sym").read_text())
        got = [self._normalize(i, symtab, own_ids=False) for i in _blocks((work / "o.dis").read_text())[name]]
        return self._compare(self._target(fn), got)

    # ---------- compile ----------
    def _compile(self, fn: str, src: str, mode: str) -> tuple[bool, str, list[dict]]:
        work = OUT / "tmp" / uuid.uuid4().hex[:10]
        work.mkdir(parents=True)
        (work / "cand.c").write_text(src)
        rel = work.relative_to(REPO)
        flags = ARM_FLAGS if mode == "arm" else THUMB_FLAGS
        cmd = (f"{GCC} {flags} -include lab/out/ctx/{fn}.h -c {rel}/cand.c -o {rel}/cand.o 2>&1 && "
               f"{OBJDUMP} -dr {rel}/cand.o > {rel}/cand.dis && {OBJDUMP} -t {rel}/cand.o > {rel}/cand.sym")
        proc = _docker(cmd)
        if proc.returncode != 0:
            return False, proc.stdout + proc.stderr, []
        blocks = _blocks((work / "cand.dis").read_text())
        if fn not in blocks:
            return False, f"{proc.stdout}\nno function named {fn} in the object (define it non-static, named exactly {fn})", []
        symtab = _symtab((work / "cand.sym").read_text())
        return True, proc.stdout, [self._normalize(i, symtab, own_ids=True) for i in blocks[fn]]

    # ---------- target ----------
    def _target(self, fn: str) -> list[dict]:
        if fn not in self._targets:
            name, obj = self.names[fn]["name"], self.names[fn]["object"]
            cache = SECRETS / "dump" / "obj"
            dis, sym = cache / f"{obj}.dis", cache / f"{obj}.sym"
            if not dis.exists():
                cache.mkdir(parents=True, exist_ok=True)
                o = f"lab/secrets/gbadoom/build/{obj}"
                _docker(f"{OBJDUMP} -dr {o} > lab/secrets/dump/obj/{obj}.dis && {OBJDUMP} -t {o} > lab/secrets/dump/obj/{obj}.sym", check=True)
            symtab = self._symtabs.setdefault(obj, _symtab(sym.read_text()))
            items = [self._normalize(i, symtab, own_ids=False) for i in _blocks(dis.read_text())[name]]
            self._targets[fn] = [{**i, "text": self._anonymize(i["text"])} for i in items]
        return self._targets[fn]

    def _anonymize(self, text: str) -> str:
        """Never let an original name reach a result: <ST_Ticker+0xac> -> <fn_0801B7D8+0xac>."""
        return re.sub(r"<([^<>+]+)(\+0x[0-9a-f]+)?>", lambda m: f"<{self.ids.get(m.group(1), 'sym')}{m.group(2) or ''}>", text)

    def _normalize(self, item: dict, symtab: list, own_ids: bool) -> dict:
        """Turn a relocation into a comparable key: anonymous id plus offset, or a section class."""
        reloc = item.get("reloc")
        if not reloc:
            return item
        rtype, sym = reloc
        base, _, addend = sym.partition("+")
        offset = int(addend, 16) if addend else 0
        if rtype == "R_ARM_ABS32" and item["bytes"]:
            offset += int.from_bytes(bytes.fromhex(item["bytes"]), "little")
        if base.startswith("."):
            resolved = _resolve(symtab, base, offset)
            if resolved:
                base, offset = resolved
            else:
                return {**item, "key": (rtype, "section:" + base.split(".")[1], None)}
        ident = base if own_ids else self.ids.get(base, "local:" + base)
        return {**item, "key": (rtype, ident, offset if rtype == "R_ARM_ABS32" else None)}

    # ---------- compare ----------
    def _compare(self, target: list[dict], got: list[dict]) -> dict:
        diff = []
        for i, t in enumerate(target):
            g = got[i] if i < len(got) else None
            if g is not None and _same(t, g):
                continue
            diff.append({"index": i, "offset": t["off"] - target[0]["off"], "expected": t["bytes"], "got": g["bytes"] if g else "",
                         "expected_ins": t["text"], "got_ins": g["text"] if g else "(missing)"})
        matched = len(target) - len(diff)
        exact = not diff and len(got) == len(target)
        first = diff[0] if diff else ({"offset": got[len(target)]["off"] - got[0]["off"], "expected": "", "got": got[len(target)]["bytes"],
                                        "expected_ins": "(end of function)", "got_ins": got[len(target)]["text"]} if len(got) > len(target) else None)
        return {"status": "MATCH" if exact else "PARTIAL",
                "match_pct": round(100.0 * matched / len(target), 1) if target else 0.0,
                "first_diff": None if exact else {k: first[k] for k in ("offset", "expected", "got", "expected_ins", "got_ins")},
                "diff": [{k: d[k] for k in ("offset", "expected", "got", "expected_ins", "got_ins")} for d in diff[:MAX_DIFF]]}


def _same(t: dict, g: dict) -> bool:
    if t.get("key") or g.get("key"):
        return t.get("key") == g.get("key")
    return t["bytes"] == g["bytes"]


def _blocks(dis: str) -> dict[str, list[dict]]:
    """Function name -> [{"off", "bytes", "text", "reloc"}] from `objdump -dr`."""
    blocks: dict[str, list[dict]] = {}
    current: list[dict] | None = None
    for line in dis.splitlines():
        h = HEAD_RE.match(line)
        if h:
            current = blocks.setdefault(h.group(2), [])
            continue
        if current is None:
            continue
        r = RELOC_RE.match(line)
        if r and current and int(r.group(1), 16) == current[-1]["off"]:
            current[-1]["reloc"] = (r.group(2), r.group(3))
            continue
        m = INSN_RE.match(line)
        if m:
            current.append({"off": int(m.group(1), 16), "bytes": m.group(2).replace(" ", ""), "text": m.group(3).split("\t@")[0].strip(), "reloc": None})
    return blocks


def _symtab(text: str) -> list[tuple[str, int, int, str]]:
    """(section, value, size, name) for named object symbols."""
    rows = []
    for line in text.splitlines():
        m = SYMTAB_RE.match(line)
        if m and not m.group(5).startswith("$") and m.group(3) != "*ABS*":
            rows.append((m.group(3), int(m.group(1), 16), int(m.group(4), 16), m.group(5).strip()))
    return rows


def _resolve(symtab: list, section: str, offset: int) -> tuple[str, int] | None:
    for sec, value, size, name in symtab:
        if sec == section and name != section and value <= offset < value + max(size, 1):
            return name, offset - value
    return None


def _elf_ids() -> dict[str, str]:
    ids = {}
    for line in (SECRETS / "dump" / "elf_nm.txt").read_text().splitlines():
        parts = line.split()
        if len(parts) == 4 and not parts[3].startswith("$"):
            prefix = "fn" if parts[2] in "tT" else "data"
            ids.setdefault(parts[3], f"{prefix}_{int(parts[0], 16):08X}")
    return ids


def _docker(cmd: str, check: bool = False) -> subprocess.CompletedProcess:
    proc = subprocess.run(["docker", "exec", "-w", "/work", CONTAINER, "bash", "-c", cmd], capture_output=True, text=True)
    if check and proc.returncode != 0:
        raise RuntimeError(proc.stderr[-2000:])
    return proc


def _git_sha() -> str:
    sha = subprocess.run(["git", "-C", str(REPO), "rev-parse", "--short", "HEAD"], capture_output=True, text=True).stdout.strip()
    return f"lab@{sha}"
