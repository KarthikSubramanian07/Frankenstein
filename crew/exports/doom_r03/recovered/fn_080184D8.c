/* fn_080184D8: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_0801D5E8(void *a);
struct S { struct S *next; struct S *prev; char _08[68]; int flags; char _50[10]; unsigned char b; };
void fn_080184D8(struct S *p)
{
    struct S *next = p->next;
    struct S *prev = p->prev;
    prev->next = next;
    next->prev = prev;
    if (p->flags & 0x10000000)
        p->b = 0x89;
    else
        fn_0801D5E8(p);
}
