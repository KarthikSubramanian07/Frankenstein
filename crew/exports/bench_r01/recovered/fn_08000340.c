/* fn_08000340: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08000340(struct_0785FF *p, int v)
{
    if (p->f_12 & 0x80)
        return 0;
    p->f_10 = p->f_10 - v;
    if (p->f_10 > 0) {
        p->f_12 |= 0x80;
        return 0;
    } else {
        p->f_10 = 0;
        p->f_12 |= 1;
        p->f_13 = 3;
        return 1;
    }
}
