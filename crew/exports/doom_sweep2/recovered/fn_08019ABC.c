/* fn_08019ABC: recovered by the Frankenstein crew, run doom_sweep2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Entry { void *p; int a; int b; int c; };
struct Big { unsigned char pad[0x4D8]; struct Entry e[8]; };
extern struct Big *data_030064C4;
void fn_08019ABC(unsigned int idx, unsigned char *buf, int val)
{
    struct Big *b = data_030064C4;
    int v;
    int s;
    if (idx > 7)
        return;
    b->e[idx].p = 0;
    v = buf[4] | (buf[5] << 8) | (buf[6] << 16) | (buf[7] << 24);
    s = (buf[2] | (buf[3] << 8)) + (int)0xFFFFCBBD;
    if (s != 0)
        return;
    if (v == 0)
        return;
    b->e[idx].a = 0;
    b->e[idx].b = v;
    b->e[idx].c = val << 5;
    b->e[idx].p = buf + 8;
}
