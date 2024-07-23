#ifndef MATH_H
#define MATH_H

typedef struct{
    int quotient;
    int remainder;
} Division;

// Declaration of the functions
extern int add_numbers(int a, int b);
extern int sub_numbers(int a, int b);
extern int mul_numbers(int a, int b);
extern Division div_numbers(int a, int b);

extern double cos_function(double a);
extern double sin_function(double a);
extern double tan_function(double a);

extern int is_greater(int a, int b);
extern int is_greaterequal(int a, int b);
extern int is_less(int a, int b);
extern int is_lessequal(int a, int b);
extern int is_lessgreater(int a, int b);

#endif // MATH_H
