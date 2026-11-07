/* fn_08013028: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

struct Entry { unsigned char pad1[8]; unsigned short val; unsigned char pad2[14]; };
struct Main { unsigned char unk[0x754]; struct Entry *ptr; };
extern struct Main *data_030064C4;
struct Arg { unsigned char unk[0x53]; unsigned char idx; };
void fn_08012820(struct Arg *a, unsigned short b);
void fn_08013028(struct Arg *a) {
    unsigned int idx = a->idx;
    struct Entry *base = data_030064C4->ptr;
    fn_08012820(a, base[idx].val);
}
