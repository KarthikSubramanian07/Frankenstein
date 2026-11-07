/* fn_08000304: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

u32 fn_08000304(void)
{
    u32 v = ++data_489E11BC;
    if ((v & 63) == 0)
        data_D3D51AE4 ^= 1;
    return v;
}
