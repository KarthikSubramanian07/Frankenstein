/* fn_08013028: recovered by the Frankenstein crew, run doom_r03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *data_030064C4;
extern void fn_08012820(void *a, unsigned int b);
struct Entry { unsigned char unk[8]; unsigned short v; unsigned char unk2[14]; };
struct Holder { unsigned char unk[0x754]; struct Entry *p; };
void fn_08013028(void *a)
{
    unsigned int i = ((unsigned char *)a)[0x53];
    struct Entry *e = ((struct Holder *)data_030064C4)->p;
    fn_08012820(a, e[i].v);
}
