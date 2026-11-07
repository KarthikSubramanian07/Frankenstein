/* fn_08000200: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

s32 fn_08000200(s32 a, s32 b, s32 c, s32 d)
{
    s32 x = fn_080002F8(a, c);
    s32 y = fn_080002F8(b, d);
    s32 mn, mx;
    if (x < y) {
        mn = x;
        mx = y;
    } else {
        mn = y;
        mx = x;
    }
    return mx + (mn >> 1) - (mn >> 3);
}
