/* fn_08002EE4: recovered by the Frankenstein crew, run transfer_cold_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08002EE4(unsigned short *oam, int idx, int tile, int x, int y, unsigned int flags)
{
    if (oam == 0)
        oam += 58720256;
    oam += idx * 4;
    oam[0] = (y & 0xFF) | (flags & 0xFF00);
    oam[1] = (x & 0x1FF) | ((flags >> 8) & 0xFE00);
    oam[2] = (tile & 0x3FF) | ((flags & 3) << 10);
}
