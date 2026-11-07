/* fn_08000264: recovered by the Frankenstein crew, run bench_r01.
   Observed: compiles to identical bytes (referee MATCH, Checker accepted).
   Inferred: nothing in this file is a claim about original names. */

int fn_08000264(int a)
{
    switch (a) {
    case 0:
        if (data_8D700FE5 == 0)
            return 0;
        data_8D700FE5--;
        return 0;
    case 1:
        if (data_8D700FE5 > 3)
            return 0;
        data_8D700FE5++;
        return 0;
    case 2:
        return data_8D700FE5 + 1;
    case 3:
        data_0AA61C24 ^= 1;
        return 7;
    case 4:
    case 5:
        return 0;
    case 6:
        return -1;
    default:
        return 0;
    }
}
