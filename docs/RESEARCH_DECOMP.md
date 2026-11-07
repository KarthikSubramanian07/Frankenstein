# Research: what open matching-decomp tools do, and what fits FRANKENSTEIN

Checked 2026-11-07 by reading the repositories' code and READMEs. Line references are against each default branch
on that date. Our setting: Muse Spark writes C for GBADoom Thumb functions (devkitARM GCC 16.1, -O3), the
referee accepts byte-identical code only (~0.2 s per check), and the measured failure is the last mile: the
structure is 60 to 100% right but register allocation or instruction order differs, so the model stalls at 75 to 90%.

## The tools

**decomp-permuter** ([simonlindholm/decomp-permuter](https://github.com/simonlindholm/decomp-permuter), MIT). The
standard last-mile tool. It parses C with a vendored pycparser, applies random rewrites, compiles, scores, keeps
what scores better.
- Passes ([src/randomizer.py#L2624](https://github.com/simonlindholm/decomp-permuter/blob/main/src/randomizer.py#L2624),
  weights in [default_weights.toml](https://github.com/simonlindholm/decomp-permuter/blob/main/default_weights.toml)):
  `perm_temp_for_expr` (weight 100, by far the heaviest), `perm_expand_expr` (20), `perm_reorder_stmts`,
  `perm_reorder_decls`, `perm_randomize_internal_type` (signedness and width), `perm_cast_simple`,
  `perm_split_assignment`, `perm_compound_assignment`, `perm_chain_assignment`, `perm_commutative`, `perm_add_sub`,
  `perm_inequalities`, `perm_struct_ref`, `perm_condition`, `perm_ins_block`, and no-op nudges (`perm_add_mask`,
  `perm_xor_zero`, `perm_refer_to_var` and others). Its `[gcc]` profile cuts the no-op nudges to 0.5 as
  "written with IDO in mind and not beneficial for GCC".
- Score ([src/scorer.py#L11](https://github.com/simonlindholm/decomp-permuter/blob/main/src/scorer.py#L11)): align
  mnemonics with difflib; 5 per differing operand (register allocation), 60 per reordered line, 100 per inserted
  or deleted line. Its own README admits a moved line with a different register costs 200.
- Search ([src/permuter.py#L165](https://github.com/simonlindholm/decomp-permuter/blob/main/src/permuter.py#L165)):
  a random walk, stacking mutations on the last candidate with probability 0.6, otherwise from the base;
  equal scores accepted; sources deduplicated by hash; `-j` processes.
- Fakematches: none are prevented. The README says it "finds lots of nonsensical changes that improve regalloc
  by accident; it's up to you to pick out the ones that look sensible", and that it is "generally best towards
  the end, when mostly regalloc changes remain". ARM32 support exists; the only ARM example uses mwcc.
- The ARM fork used by GBA decomps, [mparisi20/decomp-permuter-arm](https://github.com/mparisi20/decomp-permuter-arm),
  keeps the same design and adds ARM/Thumb objdump handling for agbcc.

**asm-differ** ([simonlindholm/asm-differ](https://github.com/simonlindholm/asm-differ), Unlicense) and
**decomp.me** ([decompme/decomp.me](https://github.com/decompme/decomp.me), MIT, which calls asm-differ in
`cromper/cromper/wrappers/diff_wrapper.py`): the same 1 / 5 / 60 / 100 penalties
([diff.py#L515](https://github.com/simonlindholm/asm-differ/blob/main/diff.py#L515)), Levenshtein alignment by
default, registers blanked only for alignment. Max score is 100 per target line.

**objdiff** ([encounter/objdiff](https://github.com/encounter/objdiff), Apache-2.0): patience diff on opcodes,
1 per differing immediate, 5 per differing register, 60 per replace, 100 per insert or delete; match % is
`1 - score / (100 * target lines)` ([objdiff-core/src/diff/code.rs#L56](https://github.com/encounter/objdiff/blob/main/objdiff-core/src/diff/code.rs#L56)).
No reorder credit.

**m2c** ([matt-kempster/m2c](https://github.com/matt-kempster/m2c), **GPL-3.0**): asm to C for MIPS, ARM, PowerPC
and SuperH, with a `gba` target and 243 agbcc end-to-end tests. It reads GNU as, not objdump. It is how human
projects start a big function.

**LLM agents.**
- [macabeus/mizuchi](https://github.com/macabeus/mizuchi) (MIT): m2c draft, then the permuter, then a Claude
  loop with objdiff feedback; the permuter runs on Claude's attempts and is used only on a perfect match.
  Sonnet 4.6 matched 74% of a 60-function benchmark (Sonic Advance 3 on agbcc, Animal Forest on IDO), about half
  on the first attempt; a function unmatched after attempt 3 rarely matched later. The agent often claimed matches
  it did not have and resubmitted identical code 49 times
  ([write-up](https://gambiconf.substack.com/p/can-llms-really-do-matching-decompilation)).
- [macabeus/transmuter](https://github.com/macabeus/transmuter) (no license, so not reused): an agent-steerable
  permuter with 49 tree-sitter rules (`temp-for-expr` 100, `expand-expr` 80, `randomize-type` 50,
  `reorder-stmts` 30) and post-match cleanup. Its author says it "sometimes helps find a match, though most of the
  time it doesn't", and that the agent cheated with register pins and a forked compiler
  ([post](https://gambiconf.substack.com/p/starting-a-decompilation-project)).
- Snowboard Kids 2 ([cdlewis/snowboardkids2-decomp](https://github.com/cdlewis/snowboardkids2-decomp),
  [blog](https://blog.chrislewis.au/the-long-tail-of-llm-assisted-decompilation/)): the permuter was allowed only
  above 95% and then removed, because Claude copied its artifacts (odd variable reuse, `do {} while (0)`) and
  looped. Ordering work by similarity to solved functions helped.
- We found no public project matching against modern GCC.

**Modern GCC on Thumb-1.** The first scheduling pass is off for Thumb-1
([gcc/config/arm/arm.cc#L3165](https://github.com/gcc-mirror/gcc/blob/master/gcc/config/arm/arm.cc#L3165)), so
order differences come from GIMPLE order, combine and the post-allocation scheduler. The register allocator
breaks ties by frequency and then by allocno number, which follows expression and statement order during expansion
([ira-color.cc#L2652](https://github.com/gcc-mirror/gcc/blob/master/gcc/ira-color.cc#L2652)): that is why
temporaries, statement order and signedness move registers. Declaration order alone mostly does not (SSA
renames). This is an inference from reading source, not an experiment.

## Ranked for us today

| Rank | Technique | Fit | Status |
|---|---|---|---|
| 1 | Source permuter on near-misses (≥ 90%), accepted only on a perfect MATCH through the Checker | Strong: our residuals are register and order, at 0.2 s a check | **Built**: `crew/permuter.py`, `crew/permute_queue.py`, Digger hook |
| 2 | Graded score (5 / 60 / 100 penalties) with register-blind reorder credit | Prerequisite for 1 | **Built** into the permuter |
| 3 | m2c draft for big functions in the first prompt | Strong for > 150 bytes, where we score near 0 | **Built**: `crew/draft.py` (91% of Thumb functions ≥ 150 bytes draft) |
| 4 | Do not show permuter artifacts to the model as hints; only natural rewrites | Avoids the Snowboard Kids loops | By construction: every pass produces ordinary C |
| 5 | Model proposes alternatives, permuter enumerates (`PERM_GENERAL`-style) | Strong, cheaper than full turns | Not built |
| 6 | Order the queue by similarity to solved functions | Helps | Partly there (case memory) |
| — | No-op nudges (`add_mask`, `xor_zero`), register pins, asm barriers, destructive passes | Poor: GCC ignores the nudges; pins and barriers are fakes; destructive passes waste checks | Deliberately not built |

## What we took, and the licenses

`crew/permuter.py` is fresh code. It follows decomp-permuter's design (MIT): its pass families, its random walk
with neutral drift and hash dedupe, and its penalty scale. No code was copied from decomp-permuter,
decomp-permuter-arm, Transmuter or m2c. Unlike decomp-permuter, every pass is restricted to rewrites that are exact
in C (anything the analysis cannot prove is skipped), so a permuted match is code a person could have written.
m2c is GPL-3.0 and runs as an external program from a pinned checkout (`runs/_tools/m2c`); it is never vendored
or imported.
