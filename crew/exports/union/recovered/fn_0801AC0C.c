/* fn_0801AC0C: recovered by the Frankenstein crew, run doom_hud01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Item { int a; int b; int c; };
struct Container { unsigned char pad[0x55d0]; struct Item items[]; };
extern struct Container *data_030064C4;
extern unsigned char data_080257F6;
void fn_0801AC0C(int idx)
{
    unsigned char v = data_080257F6;
    if (v != 0)
        return;
    {
        struct Container *p = data_030064C4;
        if (p->items[idx].a != 0)
            p->items[idx].a = v;
    }
}
