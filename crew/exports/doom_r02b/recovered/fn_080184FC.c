/* fn_080184FC: recovered by the Frankenstein crew, run doom_r02b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern char *data_030064C4;
void fn_080184FC(void)
{
    char *p = data_030064C4;
    char *q = p + 0x10F0;
    *(char **)(p + 0x10F4) = q;
    *(char **)(p + 0x10F0) = q;
}
