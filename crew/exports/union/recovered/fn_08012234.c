/* fn_08012234: recovered by the Frankenstein crew, run doom_par1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_030064C4;
typedef int (*fnptr_t)(int);
int call_via(fnptr_t f, int x)
{
    return f(x);
}
int *fn_08012234(int a)
{
    int *p = data_030064C4;
    int v = *(int *)((char *)p + 224);
    int *r = 0;
    if (v == a)
        r = (int *)((char *)p + 224);
    return r;
}
