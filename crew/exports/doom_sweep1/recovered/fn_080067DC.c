/* fn_080067DC: recovered by the Frankenstein crew, run doom_sweep1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080067DC(void) {
    data_030064C4[0x792] = 0;
    *(unsigned short *)&data_030064C4[0x78C] = 0;
}
