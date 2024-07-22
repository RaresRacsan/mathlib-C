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

#endif // MATH_H
