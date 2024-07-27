#include <stdio.h>
#include "math.h"

// Testing the functions

#define PI 3.14159265

int main() {
    double a = 1.0;
    double res = _expm1(a);
    printf("%f\n", res);
    return 0;
}
