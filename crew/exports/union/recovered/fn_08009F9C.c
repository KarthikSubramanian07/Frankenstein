/* fn_08009F9C: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_030064C4;
void fn_0801A2C8(unsigned char *p, int v);
void fn_08009F9C(unsigned char *p)
{
    int *tbl = *(int **)((unsigned char *)data_030064C4 + 0x750);
    unsigned char idx = p[0x5A];
    int *e = (int *)((unsigned char *)tbl + idx * 92);
    int v = *(int *)((unsigned char *)e + 0x24);
    if (v)
        fn_0801A2C8(p, v);
}
