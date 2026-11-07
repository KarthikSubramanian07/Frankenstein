/* fn_08000454: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08000454(struct_0785FF *p)
{
    p->f_00 += p->f_08;
    p->f_04 += p->f_0C;
    p->f_08 -= p->f_08 >> 3;
    p->f_0C += 0x4000;
    if (p->f_0C > 0x60000)
        p->f_0C = 0x60000;
}
