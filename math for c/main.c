#include <stdio.h>
#include "math.h"

int main() {
    int a = 5, b = -1;

    int sum = add_numbers(a, b);
    int diff = sub_numbers(a, b);
    int mult = mul_numbers(a, b);

    printf("Sum: %d\n", sum);
    printf("Difference: %d\n", diff);
    printf("Multiplication : %d\n", mult);

    return 0;
}
