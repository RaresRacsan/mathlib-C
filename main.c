#include <stdio.h>
#include "math.h"

#define PI 3.14159265

int main() {
    int a = 5, b = -1;
    double x = 60.0;

    int sum = add_numbers(a, b);
    int diff = sub_numbers(a, b);
    int mult = mul_numbers(a, b);
    Division div = div_numbers(a, b);
    double cosX = cos_function(x * PI / 180);
    double sinX = sin_function(x * PI / 180);
    double tanX = tan_function(x * PI / 180);

    printf("Sum: %d\n", sum);
    printf("Difference: %d\n", diff);
    printf("Multiplication : %d\n", mult);
    printf("Quotient: %d\n", div.quotient);
    printf("Remainder: %d\n", div.remainder);
    printf("cos(%f) = %f\n", x, cosX);
    printf("sin(%f) = %f\n", x, sinX);
    printf("tan(%f) = %f\n", x, tanX);

    return 0;
}
