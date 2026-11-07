/* fn_08014504: recovered by the Frankenstein crew, run doom_align_off.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct {
    char pad0[0xDF0];
    unsigned char *tblA;
    char pad1[0xC];
    unsigned char *tblB;
    char pad2[0x8];
    unsigned char *tblSmall;
    unsigned int limit;
    unsigned char *tblBig;
} Tables;
extern Tables *data_030064C4;
typedef struct {
    char pad[24];
    unsigned short *pat;
    char pad2[12];
} Entry40;
typedef struct {
    char pad[20];
    unsigned short arr[6];
} Page32;
unsigned char *fn_08014504(int a, int b, int c)
{
    Tables *base = data_030064C4;
    Entry40 *entries = (Entry40 *)base->tblA;
    unsigned short v = entries[a].pat[b];
    Page32 *pages = (Page32 *)base->tblB;
    unsigned short idx = pages[v].arr[c];
    if (idx >= base->limit)
        return base->tblSmall + idx * 12;
    return base->tblBig + idx * 12;
}
