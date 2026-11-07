/* fn_08010D78: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void fn_080114B8(void);
extern void fn_03001618(void);
struct Obj { int u0; int u1; void (*cb)(void); int f[16]; int flags; };
void fn_08010D78(struct Obj *p)
{
    if (p->flags & 0x100000) {
        if (p->cb == 0)
            goto store;
    }
    if (p->cb != fn_080114B8)
        return;
store:
    p->cb = fn_03001618;
}
