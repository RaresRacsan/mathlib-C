# Assembly Math Functions for x64 Windows
This repository contains assembly code implementations of basic Math functions for x64 Windows. The functions are written in NASM (Netwide Assembler) and are designed to be used as part of a larger application or linked into other projects.

## Functions

### Exponential and logaritmic functions

1. **exp**
    ```assembly
    double _exp(double a);
    ```
    Returns the base-e exponential function of x, which is e raised to the power x: e^x.

2. **exp2**
    ```assembly
    int _exp2(int a);
    ```
    Returns the base-2 exponential function of x, which is 2 raised to the power x: 2x.

3. **expm1**
    ```assembly
    double _expm1(double a);
    ```
    Returns e raised to the power x minus one: e^x-1.

4. **log**
    ```assembly
    double _log(double a);
    ```
    Returns the natural logarithm of x.
   
5. **log10**
    ```assembly
    double _log10(double a);
    ```
    Returns the common (base-10) logarithm of x.

6. **log2**
    ```assembly
    double _log2(double a);
    ```
    Returns the binary (base-2) logarithm of x.

### Power functions

1. **pow**
    ```assembly
    int _pow(int a, int b);
    ```
    Returns base raised to the power exponent.

2. **sqrt**
    ```assembly
    int _sqrt(int a);
    ```
    Returns the square root of x.

3. **cbrt**
    ```assembly
    int _cbrt(int a);
    ```
    Returns the cubic root of x.

### Trigonometric functions
1. **cos_function**
    ```assembly
    double cos_function(double a);
    ```
    Computes the cosine of a double-precision floating-point number.

2. **sin_function**
    ```assembly
    double sin_function(double a);
    ```
    Computes the sine of a double-precision floating-point number.

3. **tan_function**
    ```assembly
    double sin_function(double a);
    ```
    Computes the sine of a double-precision floating-point number.

### Comparison functions
1. **is_greater**
    ```assembly
    int is_greater(int a, int b);
    ```
    Returns 1 if the first integer is greater than the second, otherwise returns 0.

2. **is_greaterequal**
    ```assembly
    int is_greaterequal(int a, int b);
    ```
    Returns 1 if the first integer is greater than or equal to the second, otherwise returns 0.

3. **is_less**
    ```assembly
    int is_less(int a, int b);
    ```
    Returns 1 if the first integer is less than the second, otherwise returns 0.

4. **is_lessequal**
    ```assembly
    int is_lessequal(int a, int b);
    ```
    Returns 1 if the first integer is less than or equal to the second, otherwise returns 0.

5. **is_lessgreater**
    ```assembly
    int is_lessgreater(int a, int b);
    ```
    Returns -1 if the first integer is less than the second, 0 if they are equal, and 1 if the first integer is greater than the second.

### Minimum, maximum, difference functions

1. **fmax**
    ```assembly
    double fmax(double a, double b);
    ```
    Returns the maximum of a and b.

2. **fmin**
    ```assembly
    double fmin(double a, double b);
    ```
    Returns the minimum of a and b.

3. **fdim**
    ```assembly
    double fdim(double a, double b);
    ```
    Returns the positive difference between x and y.

### Other functions

1. **fabs**
    ```assembly
    double fabs(double a);
    ```
    Returns the absolute value of x: |x|.

2. **abs**
    ```assembly
    int _abs(int a);
    ```
    Returns the absolute value of x: |x|.

3. **fma**
    ```assembly
    double fma(double a, double b, double c);
    ```
    Returns x*y+z.

## Detailed compilation steps
1. Assemble the NASM code:
```sh
nasm -f win64 math.asm -o math.o
```
2. Compile the C code:
```sh
gcc -c main.c -o main.o
```
3. Link the object files and create the executable:
```sh
gcc main.o math.o -o main.exe
```
4. Run the executable:
```sh
./main.exe
```
