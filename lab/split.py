"""Split the target ELF into anonymous functions: manifest, asm, ctx headers, viz_map, hidden names.

Run lab/dump_target.sh first (writes lab/secrets/dump/). Then: python3 lab/split.py
Outputs (contract section 3): lab/out/manifest.json, lab/out/asm/<id>.s, lab/out/ctx/<id>.h,
lab/out/viz_map.json, and the answer key lab/secrets/names.json (never committed).
"""
import hashlib
import json
import random
import re
import subprocess
from pathlib import Path

LAB = Path(__file__).resolve().parent
SECRETS, OUT = LAB / "secrets", LAB / "out"
DUMP, SRC = SECRETS / "dump", SECRETS / "gbadoom" / "source"
SEED, HELDOUT_PER_10 = 7, 3

SUBSYSTEMS = [  # (id, label, source-file prefixes); first match wins, the rest is "world"
    ("hud", "Doomguy's face and the status bar", ("st_",)),
    ("weapons", "the weapons", ("p_pspr",)),
    ("enemies", "the monsters", ("p_enemy",)),
]
SYM_RE = re.compile(r"<([^<>+]+)(\+0x[0-9a-f]+)?>")
HEAD_RE = re.compile(r"^([0-9a-f]{8}) <(.+)>:$")


def parse_nm(path):
    """Yield (addr, size or None, type, name) from `nm -S` output."""
    for line in path.read_text().splitlines():
        parts = line.split()
        if len(parts) == 4:
            yield int(parts[0], 16), int(parts[1], 16), parts[2], parts[3]
        elif len(parts) == 3:
            yield int(parts[0], 16), None, parts[1], parts[2]


def object_of():
    """Map symbol name -> (object file basename, nm type in that object), from the per-object nm dump."""
    owner, current = {}, None
    for line in (DUMP / "obj_nm.txt").read_text().splitlines():
        if line.startswith("== "):
            current = line[3:]
        elif line.strip():
            parts = line.split()
            owner.setdefault(parts[-1], (current, parts[-2]))
    return owner


def scope_of(obj):
    """Game = C files directly in GBADoom's source/; everything else counts as library."""
    if obj is None:
        return "library", "toolchain (crt0, libgcc, newlib, libgba)"
    stem = obj[: -len(".o")]
    if (SRC / f"{stem}.c").exists():
        return "game", f"source/{stem}.c"
    for pattern, why in (("libtimidity/*.c", "third-party libtimidity"), ("*.cpp", "C++ platform layer"), ("*.s", "hand-written assembly")):
        if list(SRC.glob(pattern.replace("*", stem))):
            return "library", why
    return "library", "unknown origin"


def blocks():
    """Yield (addr, name, lines) for each function block in the full disassembly."""
    addr = name = None
    lines = []
    for line in (DUMP / "elf_dis.txt").read_text().splitlines():
        m = HEAD_RE.match(line)
        if m:
            if name:
                yield addr, name, lines
            addr, name, lines = int(m.group(1), 16), m.group(2), []
        elif name and line.strip():
            lines.append(line)
    if name:
        yield addr, name, lines


def anonymize(lines, ids):
    def sub(m):
        new = ids.get(m.group(1), "sym_" + hashlib.sha1(m.group(1).encode()).hexdigest()[:6])
        return f"<{new}{m.group(2) or ''}>"
    return [SYM_RE.sub(sub, line) for line in lines]


def main():
    syms = list(parse_nm(DUMP / "elf_nm.txt"))
    mapping = sorted((a, n) for a, _, t, n in syms if n in ("$a", "$t"))
    funcs = {n: (a, s) for a, s, t, n in syms if t in "tT" and s and not n.startswith("$")}
    data = {n: (a, s) for a, s, t, n in syms if t in "dDbBrR" and not n.startswith("$")}
    ids = {n: f"fn_{a:08X}" for n, (a, _) in funcs.items()}
    ids.update({n: f"data_{a:08X}" for n, (a, _) in data.items()})
    owner_typed = object_of()
    owner = {n: o for n, (o, _) in owner_typed.items()}
    # IWRAM data sits in an executable section, so the ELF calls it "t"; the object file knows it is data.
    for n in [n for n in funcs if n in owner_typed and owner_typed[n][1] not in "tT"]:
        data[n] = funcs.pop(n)
        ids[n] = f"data_{data[n][0]:08X}"

    def mode(addr):
        kind = "$t"
        for a, n in mapping:
            if a > addr:
                break
            kind = n
        return "arm" if kind == "$a" else "thumb"

    dis = {name: lines for _, name, lines in blocks()}
    for d in ("asm", "ctx"):
        (OUT / d).mkdir(parents=True, exist_ok=True)

    entries, names, callees = [], {}, {}
    for name, (addr, size) in sorted(funcs.items(), key=lambda kv: kv[1][0]):
        fid = ids[name]
        scope, origin = scope_of(owner.get(name))
        body = dis.get(name, [])
        callees[fid] = sorted({ids[t] for t in re.findall(r"\bbl\w*\s+[0-9a-f]+ <([^<>+]+)>", "\n".join(body)) if t in funcs and ids[t] != fid})
        branches = sum(1 for l in body if re.search(r"\tb(?:eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|x)?\s", l))
        entry = {"id": fid, "addr": f"0x{addr:08X}", "size": size, "mode": mode(addr), "scope": scope,
                 "split": "train", "asm_path": f"lab/out/asm/{fid}.s", "callees": callees[fid], "callers": [],
                 "difficulty": round(min(1.0, 0.6 * size / 1024 + 0.4 * branches / 60), 3),
                 "iwram": addr >= 0x03000000}
        entries.append(entry)
        names[fid] = {"name": name, "object": owner.get(name), "origin": origin}
        if scope == "game":
            asm = [f"{fid}:"] + anonymize(body, ids)
            (OUT / "asm" / f"{fid}.s").write_text("\n".join(asm) + "\n")
            refs = sorted(set(re.findall(r"(data_[0-9A-F]{8}|fn_[0-9A-F]{8})", "\n".join(asm))) - {fid})
            (OUT / "ctx" / f"{fid}.h").write_text(ctx_header(fid, entry, refs, funcs, data, ids))

    by_id = {e["id"]: e for e in entries}
    for e in entries:
        for c in e["callees"]:
            by_id[c]["callers"].append(e["id"])

    game = sorted((e for e in entries if e["scope"] == "game"), key=lambda e: (e["size"], e["addr"]))
    rng = random.Random(SEED)
    for i in range(0, len(game), 10):
        chunk = game[i:i + 10]
        for e in rng.sample(chunk, min(len(chunk), max(1, round(len(chunk) * HELDOUT_PER_10 / 10)))):
            e["split"] = "heldout"

    elf_sha1 = hashlib.sha1((SECRETS / "target.elf").read_bytes()).hexdigest()
    rom_sha1 = hashlib.sha1((OUT / "target.gba").read_bytes()).hexdigest()
    gcc = subprocess.run(["git", "-C", str(SECRETS / "gbadoom"), "rev-parse", "--short", "HEAD"], capture_output=True, text=True).stdout.strip()
    manifest = {"v": 1, "game": {
        "id": "doom", "title": "GBADoom (prBoom, Doom shareware)", "license": "GPL-2.0-or-later (GBADoom source headers); see DECISIONS.md",
        "rom_path": "lab/out/target.gba", "rom_sha1": rom_sha1, "elf_sha1": elf_sha1, "upstream": f"doomhack/GBADoom@{gcc}",
        "compiler": {"name": "devkitARM GCC", "version": "devkitARM r68 (gcc 16.1.0)",
                     "flags": "GBADoom Makefile flags minus -flto=8 (see lab/TOOLCHAIN.md)"}},
        "split_seed": SEED, "functions": entries}
    (OUT / "manifest.json").write_text(json.dumps(manifest, indent=1) + "\n")
    (SECRETS / "names.json").write_text(json.dumps(names, indent=1) + "\n")

    subs = {sid: {"id": sid, "label": label, "functions": []} for sid, label, _ in SUBSYSTEMS}
    subs["world"] = {"id": "world", "label": "the renderer and the rest of the world", "functions": []}
    for e in game:
        src = Path(names[e["id"]]["origin"]).name
        sid = next((s for s, _, prefixes in SUBSYSTEMS if src.startswith(prefixes)), "world")
        subs[sid]["functions"].append(e["id"])
    (OUT / "viz_map.json").write_text(json.dumps({"v": 1, "subsystems": list(subs.values())}, indent=1) + "\n")

    leaked = leak_check(names, game)
    held = sum(e["split"] == "heldout" for e in game)
    print(f"{len(entries)} functions: {len(game)} game ({held} heldout), {len(entries) - len(game)} library; leaks: {leaked}")
    for s in subs.values():
        print(f"  {s['id']}: {len(s['functions'])}")


def ctx_header(fid, entry, refs, funcs, data, ids):
    rev = {v: k for k, v in ids.items()}
    lines = [f"/* Context for {fid} ({entry['mode']}, {entry['size']} bytes). Generated by lab/split.py. */",
             "#pragma once", "#include <stdint.h>", "#include <stdbool.h>", "#include <stddef.h>", "",
             "/* Every function and global this code touches, by anonymous id. Declare their types yourself in",
             "   your candidate; the referee matches calls and loads by these ids. */"]
    for r in refs:
        name = rev.get(r)
        if r.startswith("fn_") and name in funcs:
            lines.append(f"/* function {r} ({funcs[name][1]} bytes) */")
        elif name in data:
            lines.append(f"/* global {r} ({data[name][1] or '?'} bytes) */")
    return "\n".join(lines) + "\n"


def leak_check(names, game):
    """Count original game function names that appear in any generated asm or ctx file."""
    text = "\n".join(p.read_text() for d in ("asm", "ctx") for p in (OUT / d).glob("*"))
    words = set(re.findall(r"[A-Za-z_][A-Za-z0-9_]{3,}", text))
    return sorted(n["name"] for fid, n in names.items() if n["name"] in words and len(n["name"]) > 3)[:10]


if __name__ == "__main__":
    main()
