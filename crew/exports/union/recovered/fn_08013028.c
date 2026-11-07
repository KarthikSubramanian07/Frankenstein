/* fn_08013028: recovered by the Frankenstein crew, run doom_r03b.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern int data_030064C4;
void fn_08012820(void *a, int b);
void fn_08013028(void *a)
{
    int *b;
    int c;
    b = *(int **)&data_030064C4;
    c = ((unsigned char *)a)[0x53];
    b = *(int **)((char *)b + 0x754);
    c = *(unsigned short *)((char *)b + c * 24 + 8);
    fn_08012820(a, c);
}
