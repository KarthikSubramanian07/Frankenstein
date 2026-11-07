/* fn_08019230: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S { short a; short b; };
struct S *fn_0801D568(void);
int fn_08019230(void)
{
    return fn_0801D568()->b;
}
