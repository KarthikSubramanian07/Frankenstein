"""Fakematch linter: the hard floor under every candidate (rules in lab/LINT.md)."""
import re

MAX_LINES_PER_INSN = 8

RULES: list[tuple[str, re.Pattern[str], str]] = [
    ("L001", re.compile(r"\b(?:__asm__|__asm|asm)\b"), "inline assembly is not allowed"),
    ("L002", re.compile(r"\.(?:byte|2byte|4byte|hword|short|word|inst)\b"), "raw bytes or words emitted into code"),
    ("L003", re.compile(r"#\s*pragma|__attribute__"), "#pragma or __attribute__ that can change codegen"),
    ("L004", re.compile(r"\bregister\b[^;]*\basm\s*\("), "register asm bindings"),
    # RAM and ROM only (EWRAM 0x02, IWRAM 0x03, cart 0x08); I/O, palette, VRAM and OAM casts are normal GBA code.
    ("L006", re.compile(r"\(\s*\w[\w\s\*]*\*\s*\)\s*0x0?[238][0-9a-fA-F]{6}\b"), "hard-coded RAM or ROM address instead of an fn_/data_ id"),
]
COMPUTED_GOTO = re.compile(r"goto\s*\*|&&\s*[A-Za-z_]\w*")
GOTO_LABEL = re.compile(r"^\s*[A-Za-z_]\w*\s*:(?!:)", re.M)


def strip_comments(src: str) -> str:
    return re.sub(r"/\*.*?\*/|//[^\n]*", " ", src, flags=re.S)


def lint(src: str, target_insns: int, asm_text: str = "") -> dict:
    """Return {"ok": bool, "violations": [{"rule", "line", "reason"}]}."""
    code = strip_comments(src)
    violations = []
    for rule, pattern, reason in RULES:
        for m in pattern.finditer(code):
            violations.append({"rule": rule, "line": code.count("\n", 0, m.start()) + 1, "reason": reason})
    if COMPUTED_GOTO.search(code) or _consecutive_labels(code) > 2:
        violations.append({"rule": "L005", "line": 0, "reason": "computed goto or more than 2 consecutive labels"})
    lines = [l for l in code.splitlines() if l.strip()]
    if target_insns and len(lines) > MAX_LINES_PER_INSN * target_insns:
        violations.append({"rule": "L007", "line": 0, "reason": f"{len(lines)} lines for {target_insns} instructions (padding)"})
    if asm_text and _copies_asm(src, asm_text):
        violations.append({"rule": "L008", "line": 0, "reason": "asm text copied into comments or strings"})
    return {"ok": not violations, "violations": violations}


def _consecutive_labels(code: str) -> int:
    best = run = 0
    for line in code.splitlines():
        if GOTO_LABEL.match(line) and not re.match(r"\s*(?:case|default)\b", line):
            run += 1
            best = max(best, run)
        elif line.strip():
            run = 0
    return best


def _copies_asm(src: str, asm_text: str) -> bool:
    insns = {l.split("\t")[-1].strip() for l in asm_text.splitlines() if "\t" in l}
    insns = {i for i in insns if len(i) > 12}
    hits = sum(1 for i in insns if i in src)
    return hits >= 3


if __name__ == "__main__":
    assert lint("int f(void){return 1;}", 2)["ok"]
    assert lint("void f(void){ __asm__(\"nop\"); }", 2)["violations"][0]["rule"] == "L001"
    assert any(v["rule"] == "L002" for v in lint('void f(void){ x(".word 1"); }', 2)["violations"])
    assert any(v["rule"] == "L003" for v in lint("#pragma GCC optimize(0)\nint f;", 2)["violations"])
    assert any(v["rule"] == "L004" for v in lint('void f(void){ register int x asm("r4"); }', 2)["violations"])
    assert any(v["rule"] == "L005" for v in lint("void f(void){ a: b: c: return; }".replace(" ", "\n"), 50)["violations"])
    assert any(v["rule"] == "L006" for v in lint("int f(void){ return *(int *)0x03001234; }", 4)["violations"])
    assert any(v["rule"] == "L007" for v in lint("\n".join(["int a;"] * 40), 2)["violations"])
    asm = " 0:\t2000\tmovs r0, r1, r2 long\n 2:\t4770\tldr r4, [pc, #176] x\n 4:\t1\tadds r0, r1, #100 y"
    assert any(v["rule"] == "L008" for v in lint("/* movs r0, r1, r2 long ldr r4, [pc, #176] x adds r0, r1, #100 y */", 9, asm)["violations"])
    print("lint self-test ok")
