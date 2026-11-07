/* fn_080004E4: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct_0785FF *fn_080004E4(void)
{
    int i;
    struct_0785FF *p;
    for (i = 0; i < 16; i++) {
        if (!(data_E151E092[i].f_12 & 0x40))
            break;
    }
    if (i == 16)
        return 0;
    p = &data_E151E092[i];
    fn_080003F4(p, (fn_08000230() % 240) << 16, 0);
    return p;
}
