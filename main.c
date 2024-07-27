#include <stdio.h>
#include "math.h"

// Testing the functions

#define PI 3.14159265

int main() {
    int a = 5, b = -1;
    double x = 60.0;
    double param, result;
    param = 1.0;
    result = _exp(param);

    int cbr = _cbrt(64);

    printf("cbrt() = %d\n", cbr);
    printf ("The exponential value of %f is %f.\n", param, result );

    return 0;
}
