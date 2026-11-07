/* fn_08014254: recovered by the Frankenstein crew, run doom_sweep3.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

void fn_08005424(const char *);
void fn_08016E00(void);
void fn_0801440C(void);
void fn_08019970(void *);
extern char data_08025CD0;
void fn_08014254(void)
{
    fn_08005424("test1");
    fn_08016E00();
    fn_08005424("test2test2test2!!");
    fn_0801440C();
    fn_08005424("test3test3test3!");
    fn_08019970(&data_08025CD0);
}
