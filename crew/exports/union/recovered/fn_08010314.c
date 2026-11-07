/* fn_08010314: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08005488(void *a);
void fn_0800549C(void *a, int b, int c);
extern void *data_030064C4;

struct S {
    unsigned char _0[24];
    unsigned short *arr;
    short _28;
    short cnt;
};

struct E {
    unsigned short a;
    unsigned short b;
    unsigned short c;
    unsigned short d;
    unsigned char _8[24];
};

void fn_08010314(struct S *p, void *q)
{
    int i;
    fn_08005488(q);
    for (i = 0; i < p->cnt; i++) {
        unsigned short idx = p->arr[i];
        struct E *base = *(struct E **)((char *)data_030064C4 + 0xE00);
        struct E *e = base + idx;
        fn_0800549C(q, e->a << 16, e->b << 16);
        fn_0800549C(q, e->c << 16, e->d << 16);
    }
}
