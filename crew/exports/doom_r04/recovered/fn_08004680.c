/* fn_08004680: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S08004680 { int v0; int v4; int v8; int v12; int v16; unsigned char v20; unsigned char _pad[31]; int v34; int v38; };
void fn_08004680(struct S08004680 *p, int a1, int a2, int a3, int a4)
{
    p->v8 = a3;
    p->v12 = a4;
    p->v34 = 0;
    p->v16 = 0;
    p->v20 = 0;
    p->v0 = a1;
    p->v4 = a2;
    p->v38 = 1;
}
