"""Prompts and tool schemas. The system prompt and tool list are byte-stable across calls so the
API's prompt cache hits (lower latency and cost): put anything per-function in the user message only."""
from __future__ import annotations

DIGGER_SYSTEM = """You are a Digger on a matching-decompilation crew. You rewrite ONE compiled Game Boy Advance \
function (ARM7TDMI, Thumb mode) as C that, compiled with the project's exact GCC flags, produces IDENTICAL bytes.
A compiler referee decides. Nothing counts unless it says MATCH.

Rules (hard; violations are rejected by a linter and an independent Checker):
- Define exactly one function, named exactly as the given fn_ id, with the signature the asm implies.
- Refer to callees and globals ONLY by their fn_/data_ ids from the context header: declare them yourself
  (`extern <type> data_XXXXXXXX;`, prototypes for fn_ ids). Never use absolute addresses or integer-to-pointer
  casts like *(int*)0x03001234: the referee compares relocation targets by id, so raw addresses never match.
- No inline assembly, no raw bytes (.byte/.word/.inst), no #pragma, no __attribute__, no register-asm bindings.
- Write plausible C a 2000s GBA programmer would write. No pointless temporaries, nonsense casts or volatile tricks.

How to work:
- Read the asm carefully: argument registers r0-r3, return in r0, callee-saved r4-r7, literal pools, branch shapes.
- Submit a full candidate with referee_check(src). Read first_diff and the diff list, then adjust the C to steer GCC:
  statement order, signed vs unsigned, int vs short/char locals, loop form (for/while/do, count up/down),
  early returns vs nested ifs, temporaries that change register allocation, expression grouping.
- Small, targeted edits between attempts. Keep the best-scoring version in mind.
- If you are confident a candidate matches exactly, set claim=true on that referee_check: a correct claim finishes
  the function immediately (fewer round trips). Claims are public and false ones are counted, so claim only when sure.
- When a referee_check without a claim says MATCH, call submit_claim with one short sentence.
- If you are stuck after several attempts, try a structurally different approach rather than tiny variations."""

TOOLS = [
    {"type": "function", "function": {
        "name": "referee_check",
        "description": "Compile the candidate C with the project's exact compiler and flags and compare its bytes "
                       "to the target function. Returns status MATCH / PARTIAL / NO_COMPILE / LINT_FAIL, match_pct, "
                       "first_diff and a diff list of differing instructions.",
        "parameters": {"type": "object", "properties": {
            "src": {"type": "string", "description": "Complete C source defining the function (no ctx header)."},
            "claim": {"type": "boolean", "description": "Stake a public claim that THIS candidate matches exactly, "
                      "before you see the verdict. An independent Checker verifies it; correct claims finish the "
                      "function at once, false claims are counted against you."}},
            "required": ["src"]}}},
    {"type": "function", "function": {
        "name": "submit_claim",
        "description": "Claim that your latest referee_check MATCHED. An independent Checker re-verifies it.",
        "parameters": {"type": "object", "properties": {"text": {"type": "string"}}, "required": ["text"]}}},
    {"type": "function", "function": {
        "name": "search_idioms",
        "description": "Search the crew's library of generic compiler idioms learned from earlier matches.",
        "parameters": {"type": "object", "properties": {"query": {"type": "string"}}, "required": ["query"]}}},
    {"type": "function", "function": {
        "name": "get_neighbors",
        "description": "Callers and callees of this function, with their accepted C when already recovered.",
        "parameters": {"type": "object", "properties": {}}}},
]


def digger_user(fn: dict, asm: str, ctx: str, idioms: list[dict], neighbors: dict, types_slice: str = "",
                cases: list[dict] | None = None) -> str:
    parts = [f"Target: {fn['id']} at {fn['addr']}, {fn['size']} bytes, {fn['mode']} mode, "
             f"difficulty {fn['difficulty']:.2f}.",
             "## Disassembly (the only view of the original you get)\n```asm\n" + asm.strip() + "\n```",
             "## Context header (prepended automatically when compiling; do not repeat it)\n```c\n"
             + (ctx.strip() or "/* empty */") + "\n```"]
    if types_slice:
        parts.append("## Proposed shared types (whole-program pass; inferred, may be wrong)\n```c\n" + types_slice.strip() + "\n```")
    rec = [n for n in neighbors.get("callees", []) + neighbors.get("callers", []) if n.get("recovered_c")]
    if rec:
        parts.append("## Already recovered neighbours\n" + "\n".join(
            f"```c\n{n['recovered_c'].strip()}\n```" for n in rec[:3]))
    if cases:
        parts.append("## Solved before: verified C for DIFFERENT functions with similar code (from training runs)\n"
                     "Use them to learn how this compiler turns C into these instruction shapes. They are not this "
                     "function's answer.\n" + "\n".join(
                         f"### {c['fn']} (similarity {c['similarity']:.2f}, {c['size']} bytes)\n```c\n{c['src']}\n```"
                         for c in cases))
    if idioms:
        parts.append("## Idioms from the library (generic habits, not answers)\n" + "\n".join(
            f"- {i['title']}: when {i['applies_when']} -> {i['do']}" for i in idioms))
    parts.append("Write the C now and call referee_check.")
    return "\n\n".join(parts)


DISTILL_SYSTEM = """You study an accepted matching-decompilation result and extract what generalizes.
Return ONLY a JSON object: {"name": "<snake_case guess of what the function does>",
"idioms": [{"title": "...", "applies_when": "<asm pattern in words>", "do": "<C shape that produces it>",
"example": "<<=6 lines of GENERIC C with invented names, NOT copied from the source>"}]}.
0 to 2 idioms. Only habits of the compiler that would help on OTHER functions. No function-specific facts."""


def distill_user(fn_id: str, asm: str, src: str, journey: str) -> str:
    return (f"Function {fn_id}.\n\nTarget asm:\n```asm\n{asm.strip()}\n```\n\nAccepted C:\n```c\n{src.strip()}\n```\n\n"
            f"What changed between failed attempts and the match:\n{journey}\n")
