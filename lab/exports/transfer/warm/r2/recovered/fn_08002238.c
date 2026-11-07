/* fn_08002238: recovered by the Frankenstein crew, run transfer_warm_2.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08002238(unsigned int x)
{
    unsigned int count = 0;
    if (x == 0)
        return 0;
    do {
        count += x & 1;
        x >>= 1;
    } while (x);
    return count == 1;
}
