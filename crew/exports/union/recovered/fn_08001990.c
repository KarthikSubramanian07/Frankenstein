/* fn_08001990: recovered by the Frankenstein crew, run doom_relay1.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int *data_030064C4;
extern int fn_03006418(void);
extern void fn_08005010(void);
void fn_08001990(void)
{
    int cur = fn_03006418();
    int old = data_030064C4[27];
    data_030064C4[27] = cur;
    int diff = cur - old;
    if (diff != 0) {
        do {
            fn_08005010();
            if (data_030064C4[26] - data_030064C4[119] > 3)
                break;
            data_030064C4[26]++;
        } while (--diff != 0);
    }
}
