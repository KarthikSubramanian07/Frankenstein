/* fn_08013560: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_08012118(unsigned int a, unsigned int b);
struct T1 { int v; char pad[20]; };
struct T2 { char pad[48]; int v; };
struct Obj { int f0; char p1[79]; unsigned char id; char p2[40]; int arr[1]; };
void fn_08013560(struct Obj *a)
{
    unsigned char *p = data_030064C4;
    unsigned int i = a->id;
    struct T1 *b1 = *(struct T1 **)(p + 0x754);
    int t = b1[i].v;
    struct T2 *b2 = *(struct T2 **)(p + 0x758);
    int v = b2->v;
    a->arr[t] -= v;
    fn_08012118(a->f0, 35);
}
