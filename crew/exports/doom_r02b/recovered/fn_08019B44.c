/* fn_08019B44: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Sub { int v0; int v1; int v2; int v3; };
struct Big { int unk[310]; struct Sub s[8]; };
extern struct Big *data_030064C4;
int fn_08019B44(unsigned int a)
{
    if (a > 7)
        return 0;
    return data_030064C4->s[a].v0 != 0;
}
