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
extern int _abs(int a);

extern double cos_function(double a);
extern double sin_function(double a);
extern double tan_function(double a);

extern int is_greater(int a, int b);
extern int is_greaterequal(int a, int b);
extern int is_less(int a, int b);
extern int is_lessequal(int a, int b);
extern int is_lessgreater(int a, int b);

extern double fdim(double a, double b);
extern double fmax(double a, double b);
extern double fmin(double a, double b);
extern double fabs(double a);
extern double fma(double a, double b, double c);

extern int _pow(int a, int b);

#endif // MATH_H
