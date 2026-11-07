"""Fakematch linter: the hard floor under every candidate (rules in lab/LINT.md)."""
import re

MAX_LINES_PER_INSN = 8
MAX_CHARS_PER_INSN = 320  # non-blank characters; stops padding hidden in one very long line
DIGRAPHS = (("%:%:", "##"), ("%:", "#"), ("<:", "["), (":>", "]"), ("<%", "{"), ("%>", "}"), ("??=", "#"))
DIRECTIVES = "include|define|undef|if|ifdef|ifndef|elif|elifdef|elifndef|else|endif|error|warning"

RULES: list[tuple[str, re.Pattern[str], str]] = [
    ("L001", re.compile(r"\b(?:__asm__|__asm|asm)\b"), "inline assembly is not allowed"),
    ("L002", re.compile(r"\.(?:byte|2byte|4byte|hword|short|word|inst)\b"), "raw bytes or words emitted into code"),
    ("L003", re.compile(r"#\s*pragma|_Pragma|__attribute__|\[\s*\["), "#pragma, __attribute__ or [[attribute]] that can change codegen"),
    # __builtin_arm_cdp/mcr/ldc... take immediates, so they encode chosen instruction bits.
    ("L011", re.compile(r"__builtin_arm_"), "ARM instruction intrinsics (__builtin_arm_*)"),
    ("L004", re.compile(r"\bregister\b[^;]*\basm\s*\("), "register asm bindings"),
    # Only <system> headers: a quoted, absolute or ../ include could read lab/secrets or .env through the compile log.
    ("L009", re.compile(r'#\s*(?:include|include_next|import|embed)\s*(?:"|<\s*/|<[^>]*(?:\.\.|secrets)|[^"<\s])'), "only <system> headers may be included"),
    ("L009", re.compile(r"has_include|has_embed"), "only <system> headers may be included"),
    # #line and GNU linemarkers could relabel candidate code as a system header; #embed/#include_next/#import read files.
    ("L010", re.compile(rf"^[ \t]*#[ \t]*(?!(?:{DIRECTIVES})\b)\S", re.M), "preprocessor directive not on the allowlist"),
    # RAM and ROM only (EWRAM 0x02, IWRAM 0x03, cart 0x08); I/O, palette, VRAM and OAM casts are normal GBA code.
    # Hex or decimal, optionally parenthesized; the value is checked against BANNED_REGIONS in _rule_hits.
    ("L006", re.compile(r"\(\s*\w[\w\s\*]*\*\s*\)\s*\(?\s*(0[xX][0-9a-fA-F]+|\d+)"),
     "hard-coded RAM or ROM address instead of an fn_/data_ id"),
]
BANNED_REGIONS = {0x02, 0x03, 0x08}
# Rules that still mean something after `gcc -E` (directives are gone by then).
EXPANDED_RULES = ("L001", "L002", "L003", "L004", "L006", "L011")
LINEMARKER = re.compile(r'^# \d+ "((?:[^"\\]|\\.)*)"')
# Unary && (label address) follows an operator or `return`; binary `a && b` follows an operand and is fine.
COMPUTED_GOTO = re.compile(r"goto\s*\*|(?:[=(,?:{\[]|\breturn)\s*&&\s*[A-Za-z_]")
GOTO_LABEL = re.compile(r"^\s*[A-Za-z_]\w*\s*:(?!:)", re.M)
# The one L003 exception: target("arm") on a function definition, for functions the manifest marks mode "arm"
# (Voxelburg builds every file -mthumb and marks its IWRAM functions this way). Not on a directive line,
# and the lookahead requires the next ; { } = to be the `) {` that opens a body.
ARM_ATTR = re.compile(r'^([^#\n]*?)__attribute__\s*\(\(\s*target\s*\(\s*"arm"\s*\)\s*\)\)(?=[^;{}=#]*\)\s*\{)', re.M)


# String and char literals are matched first so a "/*" inside a string cannot hide the code after it.
_LEXEME = re.compile(r'''(?:u8|[uUL])?R"([^()\\\s"]{0,16})\((?:.|\n)*?\)\1"|"(?:\\.|[^"\\\n])*"|'(?:\\.|[^'\\\n])*'|(/\*(?:.|\n)*?\*/|//[^\n]*)''')
INCLUDE_LINE = re.compile(r"^[ \t]*#[ \t]*(include|include_next|import|embed)\b[ \t]*(.*)$", re.M)
SYSTEM_HEADER = re.compile(r"<[A-Za-z0-9_][A-Za-z0-9_+./-]*>[ \t]*$")


def strip_comments(src: str) -> str:
    """The source as the preprocessor sees it: line splices joined, comments as one space, %: digraphs as #."""
    src = re.sub(r"\\[ \t]*\r?\n", "", src)
    src = _LEXEME.sub(lambda m: " " if m.group(2) is not None else m.group(0), src)
    for alt, std in DIGRAPHS:
        src = src.replace(alt, std)
    return src


def _allow_arm(code: str, mode: str, limit: int = 1) -> tuple[str, int]:
    """Blank (same length, so line numbers hold) up to `limit` allowed target("arm") attributes; return (code, count)."""
    if mode != "arm" or limit <= 0:
        return code, 0
    blanked = ARM_ATTR.sub(lambda m: m.group(1) + " " * (m.end() - m.end(1)), code, count=limit)
    return blanked, len(ARM_ATTR.findall(code)[:limit])


def arm_attrs(src: str, mode: str) -> int:
    """How many allowed attributes the raw source spells out literally (0 or 1); the expanded pass may allow no more."""
    return _allow_arm(strip_comments(src), mode)[1]


def _rule_hits(code: str, only: tuple[str, ...] | None = None) -> list[dict]:
    violations = [{"rule": rule, "line": code.count("\n", 0, m.start()) + 1, "reason": reason}
                  for rule, pattern, reason in RULES if only is None or rule in only for m in pattern.finditer(code)
                  if rule != "L006" or int(m.group(1), 16 if m.group(1)[:2] in ("0x", "0X") else 10) >> 24 in BANNED_REGIONS]
    if COMPUTED_GOTO.search(code) or _consecutive_labels(code) > 2:
        violations.append({"rule": "L005", "line": 0, "reason": "computed goto or more than 2 consecutive labels"})
    return violations


def lint_expanded(expanded: str, cand_path: str, mode: str = "thumb", allowed: int = 0) -> dict:
    """Second pass over `gcc -E` output: only lines the linemarkers attribute to the candidate file,
    so token pasting and macros can't assemble asm, _Pragma or attributes that the raw pass missed.
    `allowed` is arm_attrs(src, mode): a macro-built target("arm") has no literal twin in the raw source, so it stays banned."""
    keep, mine = [], False
    for line in expanded.splitlines():
        m = LINEMARKER.match(line)
        if m:
            mine = m.group(1) == cand_path
            continue
        keep.append(line if mine else "")
    violations = _rule_hits(_allow_arm(strip_comments("\n".join(keep)), mode, allowed)[0], EXPANDED_RULES)
    for v in violations:
        v["reason"] += " (after macro expansion)"
    return {"ok": not violations, "violations": violations}


def lint(src: str, target_insns: int, asm_text: str = "", mode: str = "thumb") -> dict:
    """Return {"ok": bool, "violations": [{"rule", "line", "reason"}]}. mode is the manifest's "arm"/"thumb"."""
    code = strip_comments(src)
    violations = _rule_hits(_allow_arm(code, mode)[0])
    for m in INCLUDE_LINE.finditer(code):  # allow-list: every include must be a plain <system> header
        arg = m.group(2)
        line = code.count("\n", 0, m.start()) + 1
        bad = m.group(1) == "embed" or not SYSTEM_HEADER.match(arg) or ".." in arg or "secrets" in arg
        if bad and {"rule": "L009", "line": line, "reason": "only <system> headers may be included"} not in violations:
            violations.append({"rule": "L009", "line": line, "reason": "only <system> headers may be included"})
    lines = [l for l in code.splitlines() if l.strip()]
    chars = len(re.sub(r"\s", "", code))
    if target_insns and (len(lines) > MAX_LINES_PER_INSN * target_insns or chars > MAX_CHARS_PER_INSN * target_insns):
        violations.append({"rule": "L007", "line": 0, "reason": f"{len(lines)} lines, {chars} characters for {target_insns} instructions (padding)"})
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
    assert lint("#include <stdint.h>\nint f(void){return 1;}", 2)["ok"]
    for bypass in ('%:include "/work/.env"', '#\\\ninclude "/work/.env"', '#inc\\\nlude "/work/.env"',
                   'char *a = "/*";\n#include "/work/.env"\nchar *b = "*/";', '#/**/include "/work/.env"',
                   '#if __has_include("/work/.env")\n#endif', '%:embed </work/.env>', '#include <a/../../work/.env>',
                   '#define H "/work/.env"\n#include H', '%:pragma GCC optimize(0)', 'void f(void){ as\\\nm("nop"); }'):
        assert not lint(bypass + "\nint f(void){return 1;}", 50)["ok"], bypass
    print("lint self-test ok")
