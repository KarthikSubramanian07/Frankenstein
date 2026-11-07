/* fn_08006214: recovered by the Frankenstein crew, run doom_par0.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int fn_0801D480(char *);
extern int fn_0801D568(int);
extern void fn_03005A90(int, int, int);
void fn_08006214(int x, int y)
{
    int y2 = y + 7;
    int a = fn_0801D568(fn_0801D480("AAAAAAAAAAA"));
    int b = fn_0801D568(fn_0801D480("BBBBBBBBBBB"));
    int c = fn_0801D568(fn_0801D480("CCCCCCCCCCC"));
    int e = x;
    fn_03005A90(x - 8, y2, a);
    e += 0x60;
    do {
        fn_03005A90(x, y2, b);
        x += 8;
    } while (x != e);
    fn_03005A90(e, y2, c);
}
