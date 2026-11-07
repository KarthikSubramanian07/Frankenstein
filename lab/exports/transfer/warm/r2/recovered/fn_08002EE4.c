/* fn_08002EE4: recovered by the Frankenstein crew, run transfer_warm_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

typedef struct { unsigned short attr0, attr1, attr2, fill; } OBJ;
void fn_08002EE4(OBJ *oam, int idx, int tile, int x, unsigned int y, unsigned int flags)
{
    if (oam == 0)
        oam = (OBJ *)(224 << 19);
    oam += idx;
    oam->attr0 = (y & 0xFF) | (flags & 0xFF00);
    oam->attr1 = (x & 0x1FF) | ((flags >> 17) << 9);
    oam->attr2 = (tile & 0x3FF) | ((flags << 10) & 0xC00);
}
