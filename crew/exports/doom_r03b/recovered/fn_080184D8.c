/* fn_080184D8: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S {
    struct S *next;
    struct S *prev;
    char _08[68];
    int flags;
    char _50[10];
    unsigned char mode;
};
void fn_0801D5E8(struct S *p);
void fn_080184D8(struct S *p)
{
    struct S *a = p->next;
    struct S *b = p->prev;
    b->next = a;
    a->prev = b;
    if (p->flags & 0x10000000)
        p->mode = 0x89;
    else
        fn_0801D5E8(p);
}
