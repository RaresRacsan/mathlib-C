#include <stdio.h>
#include "math.h"

int main() {
    int a = 10, b = 5;

    int sum = add_numbers(a, b);
    int diff = sub_numbers(a, b);

    printf("Sum: %d\n", sum);
    printf("Difference: %d\n", diff);

    return 0;
}
