"""Export each game function's normalized target to lab/out/target/<fn>.json (committed).

The referee compares candidates against these files, so any teammate can judge against the private variant
without the hidden source. Each item: {"off", "bytes", "text", "key"}; text and keys use only fn_/data_ ids.
Run after lab/split.py: python3 lab/export_targets.py
"""
import json
import re
import shutil
import sys

from lab.referee.core import OUT, Referee

NAME_PATTERN = re.compile(r"\b[A-Z][A-Za-z0-9]*_[A-Za-z0-9_]{2,}\b")


def main() -> None:
    referee = Referee()
    target_dir = OUT / "target"
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
    print(f"exported {len(game)} targets to lab/out/target/")


if __name__ == "__main__":
    main()
