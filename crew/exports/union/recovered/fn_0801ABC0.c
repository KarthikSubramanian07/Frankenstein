/* fn_0801ABC0: recovered by the Frankenstein crew, run doom_hud03.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern const unsigned char data_080257F5;
extern unsigned char *data_030064C4;
void fn_08004E30(int);
void fn_08004E4C(int);
void fn_0801ABC0(void)
{
    if (data_080257F5 != 0)
        return;
    if (*(int *)(data_030064C4 + 0x5638) == 0)
        return;
    if (*(data_030064C4 + 0x5640) != 0)
        fn_08004E30(0);
    fn_08004E4C(0);
    *(int *)(data_030064C4 + 0x5638) = 0;
}
