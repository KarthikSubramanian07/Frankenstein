/* fn_08009F9C: recovered by the Frankenstein crew, run doom_r02.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

extern void *data_030064C4;
void fn_0801A2C8(void *, int);
void fn_08009F9C(unsigned char *a){
 unsigned char b = a[0x5A];
 unsigned char *c = *(unsigned char **)((unsigned char *)data_030064C4 + 0x750);
 int v = *(int *)(c + b * 92 + 36);
 if (v != 0)
  fn_0801A2C8(a, v);
}
