/* fn_080133B4: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801120C(int, int);
void fn_080128D4(int *, int);
void fn_080133B4(int *p)
{
    fn_0801120C(*p, 155);
    fn_080128D4(p, 0);
}
