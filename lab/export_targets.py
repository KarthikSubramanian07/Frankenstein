"""Export each game function's normalized target to lab/out/target/<fn>.json (committed).

The referee compares candidates against these files, so any teammate can judge against the private variant
without the hidden source. Each item: {"off", "bytes", "text", "key"}; text and keys use only fn_/data_ ids.
Run after lab/split.py: python3 -m lab.export_targets [--game voxelburg]  (or FRANK_GAME; default doom)
"""
import argparse
import json
import re
import shutil
import sys

from lab.referee.core import Referee, _docker, OBJDUMP

NAME_PATTERN = re.compile(r"\b[A-Z][A-Za-z0-9]*_[A-Za-z0-9_]{2,}\b")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--game", default=None, help="lab/games/<game>.json (default: FRANK_GAME or doom)")
    referee = Referee(parser.parse_args().game)
    target_dir = referee.out / "target"
    shutil.rmtree(target_dir, ignore_errors=True)
    target_dir.mkdir(parents=True)
    names = {v["name"] for v in referee.names.values()}
    game = [fn for fn, meta in referee.functions.items() if meta["scope"] == "game"]
    for fn in game:
        items = [{"off": i["off"], "bytes": i["bytes"], "text": i["text"], "key": list(i["key"]) if i.get("key") else None}
                 for i in referee._target(fn)]
        text = json.dumps({"v": 1, "fn": fn, "items": items})
        leaked = [w for w in NAME_PATTERN.findall(text) if w in names]
        if leaked:
            sys.exit(f"{fn}: original names would leak: {leaked[:3]}")
        (target_dir / f"{fn}.json").write_text(text + "\n")
    print(f"exported {len(game)} targets to {referee.game['out_rel']}/target/")
    export_link_info(referee.game)


def export_link_info(game: dict) -> None:
    """Section layout (VMA to ROM offset) and compiler runtime helper addresses, so patch works on any machine."""
    secrets, out = game["secrets"], game["out"]
    sections = []
    for line in _docker(f"{OBJDUMP} -h {game['secrets_rel']}/target.elf", check=True).stdout.splitlines():
        parts = line.split()
        if len(parts) >= 6 and parts[0].isdigit() and parts[1].startswith(".") and int(parts[2], 16) > 0:
            vma, lma = int(parts[3], 16), int(parts[4], 16)
            if 0x08000000 <= lma < 0x0A000000:
                sections.append({"name": parts[1], "vma": vma, "lma": lma, "size": int(parts[2], 16)})
    runtime = {}
    for line in (secrets / "dump" / "elf_nm.txt").read_text().splitlines():
        parts = line.split()
        if len(parts) in (3, 4) and parts[-1].startswith("__") and parts[-2] in "tT":
            runtime[parts[-1]] = int(parts[0], 16) | _thumb_bit(secrets, int(parts[0], 16))
    (out / "link_info.json").write_text(json.dumps({"v": 1, "sections": sections, "runtime": runtime}, indent=1) + "\n")
    print(f"link_info: {len(sections)} ROM sections, {len(runtime)} runtime helpers")


def _thumb_bit(secrets, addr: int) -> int:
    kind = "$t"
    for line in (secrets / "dump" / "elf_nm.txt").read_text().splitlines():
        parts = line.split()
        if len(parts) == 3 and parts[2] in ("$a", "$t"):
            a = int(parts[0], 16)
            if a > addr:
                break
            kind = parts[2]
    return 1 if kind == "$t" else 0


if __name__ == "__main__":
    main()
