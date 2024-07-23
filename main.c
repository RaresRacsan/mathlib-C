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
    int greater = is_greater(a, b);
    int gorequal = is_greaterequal(b, a);
    int l = is_less(a, b);
    int le = is_lessequal(b, a);
    int lg = is_lessgreater(b, a);

    printf("Sum: %d\n", sum);
    printf("Difference: %d\n", diff);
    printf("Multiplication : %d\n", mult);
    printf("Quotient: %d\n", div.quotient);
    printf("Remainder: %d\n", div.remainder);
    printf("cos(%f) = %f\n", x, cosX);
    printf("sin(%f) = %f\n", x, sinX);
    printf("tan(%f) = %f\n", x, tanX);
    printf("A is greater than A: %d\n", greater);
    printf("B is greater or equal to A: %d\n", gorequal);
    printf("A is less than B: %d\n", l);
    printf("B is less() or equal to A: %d\n", le);
    printf("B is less (-1), equal (0) or greater (1) than A: %d\n", lg);

    return 0;
}
