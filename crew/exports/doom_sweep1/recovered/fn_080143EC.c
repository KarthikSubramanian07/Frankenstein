/* fn_080143EC: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
struct Entry { unsigned short v; unsigned char pad[10]; };
struct Arg { int unk0; int unk4; int unk8; int idx; };
void fn_080143EC(struct Arg *a)
{
    int idx = a->idx;
    struct Entry *arr = *(struct Entry **)(data_030064C4 + 0xE14);
    arr[idx].v++;
}
