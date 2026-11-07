/* fn_080184D8: recovered by the Frankenstein crew, run doom_r04b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_0801D5E8(void);
struct Node { void *a; void *b; };
struct Obj { struct Node *p0; struct Node *p1; char _08[68]; int _4c; char _50[10]; unsigned char _5a; };
void fn_080184D8(struct Obj *p)
{
    struct Node *a = p->p0;
    struct Node *b = p->p1;
    b->a = a;
    a->b = b;
    if ((p->_4c << 3) < 0) {
        p->_5a = 0x89;
    } else {
        fn_0801D5E8();
    }
}
