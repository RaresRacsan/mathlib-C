#include <stdio.h>
#include <assert.h>
#include "math.h"
#include <math.h>

void test_abs() {
    assert(_abs(-5) == 5);
    assert(_abs(0) == 0);
    assert(_abs(5) == 5);
}

void test_cos_function() {
    assert(fabs(cos_function(0) - 1.0) < 1e-9);
    assert(fabs(cos_function(M_PI) + 1.0) < 1e-9);
}

void test_sin_function() {
    assert(fabs(sin_function(0) - 0.0) < 1e-9);
    assert(fabs(sin_function(M_PI / 2) - 1.0) < 1e-9);
}

void test_tan_function() {
    assert(fabs(tan_function(0) - 0.0) < 1e-9);
}

void test_is_greater() {
    assert(is_greater(3, 2) == 1);
    assert(is_greater(2, 3) == 0);
    assert(is_greater(2, 2) == 0);
}

void test_is_greaterequal() {
    assert(is_greaterequal(3, 2) == 1);
    assert(is_greaterequal(2, 3) == 0);
    assert(is_greaterequal(2, 2) == 1);
}

void test_is_less() {
    assert(is_less(2, 3) == 1);
    assert(is_less(3, 2) == 0);
    assert(is_less(2, 2) == 0);
}

void test_is_lessequal() {
    assert(is_lessequal(2, 3) == 1);
    assert(is_lessequal(3, 2) == 0);
    assert(is_lessequal(2, 2) == 1);
}

void test_is_lessgreater() {
    assert(is_lessgreater(2, 3) == -1);
    assert(is_lessgreater(3, 2) == 1);
    assert(is_lessgreater(2, 2) == 0);
}

void test_fdim() {
    assert(fabs(fdim(3.0, 2.0) - 1.0) < 1e-9);
    assert(fabs(fdim(2.0, 3.0) - 0.0) < 1e-9);
}

void test_fmax() {
    assert(fabs(fmax(3.0, 2.0) - 3.0) < 1e-9);
    assert(fabs(fmax(2.0, 3.0) - 3.0) < 1e-9);
}

void test_fmin() {
    assert(fabs(fmin(3.0, 2.0) - 2.0) < 1e-9);
    assert(fabs(fmin(2.0, 3.0) - 2.0) < 1e-9);
}

void test_fabs() {
    assert(fabs(fabs(-3.0) - 3.0) < 1e-9);
    assert(fabs(fabs(3.0) - 3.0) < 1e-9);
}

void test_fma() {
    assert(fabs(fma(2.0, 3.0, 4.0) - 10.0) < 1e-9);
}

void test_pow() {
    assert(_pow(2, 3) == 8);
    assert(_pow(5, 0) == 1);
    assert(_pow(7, 1) == 7);
}

void test_sqrt() {
    assert(_sqrt(4) == 2);
    assert(_sqrt(9) == 3);
}

void test_cbrt() {
    assert(_cbrt(8) == 2);
    assert(_cbrt(27) == 3);
}

void test_exp() {
    assert(fabs(_exp(1.0) - exp(1.0)) < 1e-9);
}

void test_exp2() {
    assert(_exp2(3) == 8);
    assert(_exp2(0) == 1);
}

void test_expm1() {
    assert(fabs(_expm1(1.0) - expm1(1.0)) < 1e-9);
}

void test_log() {
    assert(fabs(_log(exp(1.0)) - 1.0) < 1e-9);
}

void test_log10() {
    assert(fabs(_log10(10.0) - 1.0) < 1e-9);
}

void test_log2() {
    assert(fabs(_log2(8.0) - 3.0) < 1e-9);
}

int main() {
    test_abs();
    test_cos_function();
    test_sin_function();
    test_tan_function();
    test_is_greater();
    test_is_greaterequal();
    test_is_less();
    test_is_lessequal();
    test_is_lessgreater();
    test_fdim();
    test_fmax();
    test_fmin();
    test_fabs();
    test_fma();
    test_pow();
    test_sqrt();
    test_cbrt();
    test_exp();
    test_exp2();
    test_expm1();
    test_log();
    test_log10();
    test_log2();

    printf("%s", "All tests passed!\n");

    return 0;
}
