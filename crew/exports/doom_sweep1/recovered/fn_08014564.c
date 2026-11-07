/* fn_08014564: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct S1 { unsigned char pad[24]; unsigned short *arr; unsigned char pad2[12]; };
struct S2 { unsigned char pad[22]; unsigned short val; unsigned char pad2[8]; };
struct G { unsigned char pad[0xDF0]; struct S1 *p1; unsigned char pad2[12]; struct S2 *p2; };
extern struct G *data_030064C4;
int fn_08014564(int a, int b)
{
    unsigned short h = data_030064C4->p1[a].arr[b];
    return data_030064C4->p2[h].val != 0xFFFF;
}
