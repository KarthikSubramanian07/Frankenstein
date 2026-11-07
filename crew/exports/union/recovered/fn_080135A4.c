/* fn_080135A4: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct P { unsigned int a; unsigned char _04[79]; unsigned char idx; };
struct Entry { int v; char pad[20]; };
struct Outer { char pad[0x754]; struct Entry *entries; };
extern struct Outer *data_030064C4;
void fn_0801A2C8(unsigned int, unsigned int);
int fn_08006B00(void);
void fn_080128D4(struct P *, int);
void fn_08012118(unsigned int, unsigned int);
struct Q { char pad[124]; int cnt; };

void fn_080135A4(struct P *p)
{
    fn_0801A2C8(p->a, 8);
    struct Q *q = (struct Q *)((unsigned char *)p + data_030064C4->entries[p->idx].v * 4);
    q->cnt--;
    int r = fn_08006B00();
    fn_080128D4(p, r & 1);
    fn_08012118(p->a, 0x22);
}
