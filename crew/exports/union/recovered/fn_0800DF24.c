/* fn_0800DF24: recovered by the Frankenstein crew, run doom_r13.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *fn_0801D67C(int a, int b, int c);
extern void fn_08020990(void *a, int b, int c);
extern void fn_0801851C(void *a);
extern int fn_08015120(void *a, int b);
extern int fn_08006B00(void);
extern void fn_0800DD94(void);
struct A { int unk0; int unk4; void (*cb)(void); void *arg0; int r; int diff; int val; void *arg1; int type; };
struct B { unsigned char pad[32]; unsigned short f; unsigned char pad2[6]; };
void fn_0800DF24(struct B *a, void *b, int c)
{
    struct A *p = fn_0801D67C(36, 3, 0);
    fn_08020990(p, 0, 36);
    fn_0801851C(p);
    p->type = 5;
    p->cb = fn_0800DD94;
    p->arg0 = a;
    p->arg1 = b;
    p->val = ((unsigned char *)a)[38];
    p->diff = fn_08015120(a, p->val);
    if (p->diff == p->val)
        p->diff = 0;
    a->f &= ~31;
    if (c == 0)
        p->r = (fn_08006B00() & 7) + 1;
    else
        p->r = 1;
}
