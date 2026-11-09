"""rebuild and patch (contract section 4). Works on any machine: needs the game's out dir (Doom: lab/out/target.gba), manifest, link_info.

rebuild: for every recovered function the referee re-checks the candidate (it must MATCH), then the ROM is
  assembled from the agent's own compiled bytes. At relocation sites, where the referee proved both sides point
  at the same fn_/data_ id and offset, the linked address is taken from the original. The SHA-1 must equal the
  original's; that equality is the end-to-end proof.
patch: the changed function is compiled, linked by ld at its original address (every id resolves to its real
  address), and written in place. It must fit in the original function's bytes, because GbaWadUtil appends the
  WAD straight after the ROM. The report lists every game function whose bytes changed: exactly one on success.
"""
import hashlib
import json
import shutil
import uuid
from datetime import datetime, timezone
from pathlib import Path

from .core import COMPILE_TIMEOUT_S, DIAG_FLAGS, GCC, OBJDUMP, REPO, Referee, _docker, scrub_log
from .lint import lint

ROM_BASE = 0x08000000
LD = "$DEVKITARM/bin/arm-none-eabi-ld"
NM = "$DEVKITARM/bin/arm-none-eabi-nm"
OBJCOPY = "$DEVKITARM/bin/arm-none-eabi-objcopy"
THUMB_NOP = bytes.fromhex("c046")


class RomLinker:
    def __init__(self, referee: Referee | None = None) -> None:
        self.referee = referee or Referee()
        self.out = self.referee.out
        self.info = json.loads((self.out / "link_info.json").read_text())
        self.original = (self.out / "target.gba").read_bytes()
        self.game = {fn: m for fn, m in self.referee.functions.items() if m["scope"] == "game"}

    # ---------- addresses ----------
    def rom_offset(self, addr: int) -> int:
        for sec in self.info["sections"]:
            if sec["vma"] <= addr < sec["vma"] + sec["size"]:
                return sec["lma"] + (addr - sec["vma"]) - ROM_BASE
        raise ValueError(f"address 0x{addr:08X} is not stored in the ROM")

    def symbol_value(self, name: str) -> int:
        """Address ld should use for an undefined symbol in a candidate object (Thumb functions get bit 0)."""
        if name in self.info["runtime"]:
            return self.info["runtime"][name]
        kind, _, hexaddr = name.partition("_")
        if kind == "fn":
            meta = self.referee.functions.get(name)
            if meta is None:
                raise KeyError(f"unknown function {name}")
            return int(hexaddr, 16) | (1 if meta["mode"] == "thumb" else 0)
        if kind == "data":
            return int(hexaddr, 16)
        raise KeyError(f"cannot resolve {name}: use fn_/data_ ids or a compiler runtime helper")

    # ---------- rebuild ----------
    def rebuild(self, recovered_dir: str, emit: bool = False) -> dict:
        rom = bytearray(self.original)
        recovered, rejected, agent_bytes = [], {}, 0
        for path in sorted(Path(recovered_dir).glob("fn_*.c")):
            fn = path.stem
            if fn not in self.game:
                rejected[fn] = "not a game function"
                continue
            result, target, got = self.referee.check_items(fn, path.read_text())
            if result["status"] != "MATCH":
                rejected[fn] = result["status"]
                continue
            base = self.rom_offset(int(self.game[fn]["addr"], 16))
            start = target[0]["off"]
            for t, g in zip(target, got):
                if t.get("key"):
                    continue  # relocation site: proven same target, keep the linked address
                raw = _insn_bytes(g["bytes"], g["text"], self.game[fn]["mode"])
                rom[base + t["off"] - start: base + t["off"] - start + len(raw)] = raw
            recovered.append(fn)
            agent_bytes += self.game[fn]["size"]
        sha1 = hashlib.sha1(rom).hexdigest()
        original_sha1 = hashlib.sha1(self.original).hexdigest()
        out = self.out / "rebuilt.gba"
        out.write_bytes(rom)
        total = sum(m["size"] for m in self.game.values())
        result = {"v": 1, "rom_sha1": sha1, "original_sha1": original_sha1, "identical": sha1 == original_sha1,
                  "recovered": len(recovered), "from_original": len(self.game) - len(recovered), "method": "object-splice",
                  # pct_agent_code is a percent (0-100) of the game's code bytes
                  "pct_agent_code": round(100.0 * agent_bytes / total, 2), "rom_path": str(out.relative_to(REPO)),
                  "rejected": rejected}
        result["rejected_count"] = len(rejected)
        if emit:
            payload = {k: result[k] for k in ("rom_sha1", "identical", "recovered", "from_original", "pct_agent_code", "rom_path", "rejected_count")}
            result["event_written"] = append_event("build.rom", payload)
        return result

    # ---------- patch ----------
    def patch(self, fn: str, src: str) -> dict:
        meta = self.game.get(fn)
        if meta is None:
            raise KeyError(f"unknown game function {fn}")
        addr = int(meta["addr"], 16)
        if meta["mode"] != "thumb" or addr < ROM_BASE:
            raise ValueError(f"{fn} runs from IWRAM ({meta['mode']}); only Thumb ROM functions can be patched")
        lint_result = lint(src, meta["size"] // 2)
        if not lint_result["ok"]:
            return {"v": 1, "error": "LINT_FAIL", "lint": lint_result}
        code = self._compile_and_link(fn, src, addr, meta["mode"])
        if isinstance(code, str):
            return {"v": 1, "error": "BUILD_FAIL", "log": code[-3000:]}
        tail = code[meta["size"]:]
        if tail and all(tail[i:i + 2] in (THUMB_NOP, b"\x00\x00") for i in range(0, len(tail), 2)):
            code = code[: meta["size"]]  # trailing alignment padding, which sits between functions in the ROM too
        if len(code) > meta["size"]:
            return {"v": 1, "error": "TOO_BIG", "log": f"patched code is {len(code)} bytes; it must fit in the original {meta['size']}"}
        rom = bytearray(self.original)
        off = self.rom_offset(addr)
        filler = THUMB_NOP * ((meta["size"] - len(code)) // 2)
        rom[off: off + meta["size"]] = code + filler + bytes(meta["size"] - len(code) - len(filler))
        changed = self.changed_functions(rom)
        out = self.out / "patched.gba"
        out.write_bytes(rom)
        return {"v": 1, "rom_path": str(out.relative_to(REPO)), "rom_sha1": hashlib.sha1(rom).hexdigest(),
                "changed_functions": changed, "unchanged": len(self.game) - len(changed),
                "patched_bytes": len(code), "original_bytes": meta["size"]}

    def changed_functions(self, rom: bytes) -> list[str]:
        changed = []
        for fn, meta in self.game.items():
            try:
                off = self.rom_offset(int(meta["addr"], 16))
            except ValueError:
                continue
            if rom[off: off + meta["size"]] != self.original[off: off + meta["size"]]:
                changed.append(fn)
        return sorted(changed)

    def _compile_and_link(self, fn: str, src: str, addr: int, mode: str) -> bytes | str:
        work = self.out / "tmp" / uuid.uuid4().hex[:10]
        work.mkdir(parents=True)
        try:
            return self._compile_and_link_in(work, fn, src, addr, mode)
        finally:
            shutil.rmtree(work, ignore_errors=True)

    def _compile_and_link_in(self, work: Path, fn: str, src: str, addr: int, mode: str) -> bytes | str:
        (work / "fix.c").write_text(src)
        rel = work.relative_to(REPO)
        flags = self.referee.arm_flags if mode == "arm" else self.referee.thumb_flags
        proc = _docker(f"{GCC} {flags} {DIAG_FLAGS} -include {self.referee.game['out_rel']}/ctx/{fn}.h -c {rel}/fix.c -o {rel}/fix.o 2>&1 && {NM} -u {rel}/fix.o",
                       timeout=COMPILE_TIMEOUT_S)
        if proc.returncode != 0:
            return scrub_log(proc.stdout + proc.stderr)
        undefined = [line.split()[-1] for line in proc.stdout.splitlines() if line.strip().startswith("U ")]
        # Typed symbols, not --defsym: an untyped absolute symbol looks like ARM code to ld, which then inserts
        # Thumb-to-ARM veneers. .thumb_set marks Thumb functions so calls stay direct bl instructions.
        stub = [".syntax unified"]
        try:
            for name in undefined:
                value = self.symbol_value(name)
                if name.startswith("data_"):
                    stub.append(f".global {name}\n.set {name}, 0x{value:08X}")
                elif value & 1:
                    stub.append(f".global {name}\n.thumb_set {name}, 0x{value & ~1:08X}")
                else:
                    stub.append(f".global {name}\n.type {name}, %function\n.set {name}, 0x{value:08X}")
        except KeyError as e:
            return str(e)
        (work / "syms.s").write_text("\n".join(stub) + "\n")
        (work / "fix.ld").write_text(
            f"SECTIONS {{ .text 0x{addr:08X} : {{ *(.text.{fn}) *(.text*) *(.rodata*) }} "
            ".data : { *(.data*) } .bss : { *(.bss*) *(COMMON) } "
            "/DISCARD/ : { *(.comment) *(.ARM.attributes) *(.note*) *(.ARM.exidx*) } }\n")
        link = _docker(f"$DEVKITARM/bin/arm-none-eabi-as -mthumb-interwork {rel}/syms.s -o {rel}/syms.o 2>&1 && "
                       f"{LD} -T {rel}/fix.ld {rel}/fix.o {rel}/syms.o -o {rel}/fix.elf 2>&1 && "
                       f"{OBJDUMP} -h {rel}/fix.elf && {OBJCOPY} -O binary -j .text {rel}/fix.elf {rel}/fix.bin")
        if link.returncode != 0:
            return scrub_log(link.stdout + link.stderr)
        for line in link.stdout.splitlines():
            parts = line.split()
            if len(parts) > 2 and parts[1] in (".data", ".bss") and int(parts[2], 16) > 0:
                return "the fix may not add globals or static variables (.data/.bss); keep state in existing data_ ids"
        return (work / "fix.bin").read_bytes()


def _insn_bytes(hexstr: str, text: str, mode: str) -> bytes:
    """objdump prints Thumb as 16-bit units and ARM or .word as 32-bit values; ROM bytes are little-endian."""
    unit = 8 if (mode == "arm" or text.startswith(".word")) else 4
    if len(hexstr) % unit:
        unit = 4 if len(hexstr) % 4 == 0 else 2
    return b"".join(bytes.fromhex(hexstr[i:i + unit])[::-1] for i in range(0, len(hexstr), unit))


def append_event(kind: str, payload: dict, actor: str = "lab") -> bool:
    """Append to runs/live/events.jsonl. Returns False (and says so on stderr) when there is no live run."""
    live = REPO / "runs" / "live"
    if not live.exists():
        import sys
        print(f"warning: runs/live does not exist, so the {kind} event was not written", file=sys.stderr)
        return False
    path = live / "events.jsonl"
    seq = sum(1 for _ in path.open()) if path.exists() else 0
    event = {"v": 1, "ts": datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z"),
             "run_id": live.resolve().name, "seq": seq + 1, "type": kind, "actor": actor, "fn": payload.get("fn"), "payload": payload}
    with path.open("a") as f:
        f.write(json.dumps(event) + "\n")
    return True
