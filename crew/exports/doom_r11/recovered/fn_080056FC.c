/* fn_080056FC: recovered by the Frankenstein crew, run doom_r11.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef unsigned int u32;
typedef unsigned char u8;
struct S2 { u8 pad[872]; u32 a; u32 b; };
struct S1 { u8 pad0[388]; u32 v1; u8 pad1[16]; u32 v2; u8 pad2[1472]; struct S2 *ptr; };
extern struct S1 *data_030064C4;
void fn_080056FC(void) {
    struct S1 *p = data_030064C4;
    u32 t = p->v1 ^ 1;
    p->v1 = t;
    struct S2 *q = p->ptr;
    if (t & 1)
        q = (struct S2 *)((u32)q + q->a);
    else
        q = (struct S2 *)((u32)q + q->b);
    p->v2 = (u32)q;
}
