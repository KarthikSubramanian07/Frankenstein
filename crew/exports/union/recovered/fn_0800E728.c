/* fn_0800E728: recovered by the Frankenstein crew, run doom_align_off.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern struct G *data_030064C4;
int fn_0800FE1C(int a, int b, void *c);
void fn_08010030(void *a);
void fn_080170D0(void *a, void *b, int c);
void fn_0801A2C8(void *a, int b);
struct B { unsigned char p0[24]; unsigned short f24; short f26; unsigned char p1[2]; unsigned short f30; };
struct D { int u0; int u1; int u2; int v12; int v16; };
struct G { unsigned char pad[0x920]; struct D *d; unsigned char pad2[0x934-0x924]; int v934; unsigned char pad3[0xE04-0x938]; unsigned char *arr; };
struct A { unsigned char u0[8]; struct B *b; };
int fn_0800E728(struct A *a)
{
    struct B *b = a->b;
    unsigned int f = data_030064C4->arr[b->f30 * 4 + 3];
    if ((f & 0x40) || (b->f26 == (int)((f >> 7) << 8))) {
        fn_08010030(b);
        if (data_030064C4->v934 > 0)
            return 1;
        fn_0801A2C8(data_030064C4->d, 0x51);
        return 0;
    } else {
        int r = fn_0800FE1C(data_030064C4->d->v12, data_030064C4->d->v16, b);
        fn_080170D0(data_030064C4->d, a->b, r == 1);
        return (a->b->f24 >> 9) & 1;
    }
}
