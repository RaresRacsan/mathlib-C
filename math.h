#ifndef MATH_H
#define MATH_H

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
extern int _abs(int a);
extern double fma(double a, double b, double c);

extern int _pow(int a, int b);
extern int _sqrt(int a);
extern int _cbrt(int a);

extern double _exp(double a);
extern int _exp2(int a);
extern double _expm1(double a);
extern double _log(double a);
extern double _log10(double a);
extern double _log2(double a);

#endif // MATH_H
