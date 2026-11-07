/* fn_0800A43C: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08007D00(void);
typedef struct { unsigned char _00[92]; unsigned char unk5C; } S;
void fn_0800A43C(S *p)
{
    if (--p->unk5C != 0)
        return;
    fn_08007D00();
}
