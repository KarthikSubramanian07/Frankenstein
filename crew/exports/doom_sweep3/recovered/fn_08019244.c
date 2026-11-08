/* fn_08019244: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_030064C4;
void fn_08020990(int, int, int);
struct T { char f[0x11A4]; int x; int y; };
void fn_08019244(void)
{
    struct T *p = (struct T *)data_030064C4;
    fn_08020990((int)p + 0x1124, 0, 0x80);
    p->x = 0;
    p->y = (int)&p->x;
}
