/* fn_08009F9C: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct {
    unsigned char pad0[36];
    unsigned int unk24;
    unsigned char pad1[52];
} Entry92;

typedef struct {
    unsigned char pad0[1872];
    Entry92 *table;
} Global750;

extern Global750 *data_030064C4;
void fn_0801A2C8(unsigned char *a, unsigned int b);

void fn_08009F9C(unsigned char *a)
{
    unsigned int v = data_030064C4->table[a[90]].unk24;
    if (v != 0)
        fn_0801A2C8(a, v);
}
