/* fn_08004A7C: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern unsigned char *data_030064C4;
void fn_080046C8(unsigned char *);
void fn_0800478C(unsigned char *);
void fn_080048BC(unsigned char *);
void fn_080048F4(unsigned char *);
void fn_08004A7C(void)
{
    if (*data_030064C4 & 1)
        fn_080046C8(data_030064C4 + 0x360);
    fn_080048F4(data_030064C4 + 0x39C);
    fn_0800478C(data_030064C4 + 0x360);
    fn_080048BC(data_030064C4 + 0x39C);
}
