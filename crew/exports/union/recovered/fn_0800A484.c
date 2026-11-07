/* fn_0800A484: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0800D9BC(void *a, int b, int c, int d);
struct S_0800A484 { char pad[84]; short v; };
void fn_0800A484(struct S_0800A484 *p)
{
    fn_0800D9BC(p, 0, 0, p->v);
}
