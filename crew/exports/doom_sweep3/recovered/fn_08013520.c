/* fn_08013520: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_0801A2C8(int, int);
void fn_08012118(int, int);
struct Ent { int v; char pad[20]; };
struct S {
    int v0;
    unsigned char pad1[79];
    unsigned char b53;
    unsigned char pad2[40];
    int arr[1];
};
void fn_08013520(struct S *a)
{
    fn_0801A2C8(a->v0, 14);
    int idx = (*(struct Ent **)(data_030064C4 + 0x754))[a->b53].v;
    a->arr[idx]--;
    fn_08012118(a->v0, 0x21);
}
