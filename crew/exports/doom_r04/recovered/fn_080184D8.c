/* fn_080184D8: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_0801D5E8(void *);

struct S {
    void *f0;
    void *f1;
    char pad1[68];
    int f19;
    char pad2[10];
    unsigned char fb90;
};

void fn_080184D8(struct S *p)
{
    void *a = p->f0;
    void *b = p->f1;
    ((struct S *)b)->f0 = a;
    ((struct S *)a)->f1 = b;
    if ((p->f19 << 3) >= 0)
        fn_0801D5E8(p);
    else
        p->fb90 = 137;
}
