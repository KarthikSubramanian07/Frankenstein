/* fn_08013028: recovered by the Frankenstein crew, run doom_r04.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08012820(void *, unsigned short);
typedef struct { unsigned char pad[8]; unsigned short v; unsigned char pad2[14]; } Entry;
typedef struct { unsigned char filler[0x754]; Entry *p; } Holder;
extern Holder *data_030064C4;
typedef struct { unsigned char filler[0x53]; unsigned char idx; } Arg;
void fn_08013028(Arg *a)
{
    Entry *e = data_030064C4->p;
    unsigned char idx = a->filler[0x53];
    fn_08012820(a, e[idx].v);
}
