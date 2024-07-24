# Assembly Math Functions for x64 Windows
This repository contains assembly code implementations of basic Math functions for x64 Windows. The functions are written in NASM (Netwide Assembler) and are designed to be used as part of a larger application or linked into other projects.

## Functions

### Aritmetic Functions

1. **add_numbers**
```assembly
int add_numbers(int a, int b)
```
Adds two integers and returns the result.

2. **sub_number**
```assembly
int sub_numbers(int a, int b)
```
Subtracts the second integer from the first and returns the result.

3. **mul_numbers**
```assembly
int mul_numbers(int a, int b)
```
Multiplies two integers and returns the result.

4. **div_numbers**
```assembly
int div_numbers(int a, int b)
```
Divides the first integer by the second and returns the quotient.

5. **abs**
```assembly
int abs(int a)
```
Returns the absolute value of the parameter.

### Trigonometric functions
1. **cos_function**
```assembly
double cos_function(double a)
```
Computes the cosine of a double-precision floating-point number.

2. **sin_function**
```assembly
double sin_function(double a)
```
Computes the sine of a double-precision floating-point number.

3. **tan_function**
```assembly
double sin_function(double a)
```
Computes the sine of a double-precision floating-point number.

### Comparison functions
1. **is_greater**
```assembly
int is_greater(int a, int b)
```
Returns 1 if the first integer is greater than the second, otherwise returns 0.

2. **is_greaterequal**
```assembly
int is_greaterequal(int a, int b)
```
Returns 1 if the first integer is greater than or equal to the second, otherwise returns 0.

3. **is_less**
```assembly
int is_less(int a, int b)
```
Returns 1 if the first integer is less than the second, otherwise returns 0.

4. **is_lessequal**
```assembly
int is_lessequal(int a, int b)
```
Returns 1 if the first integer is less than or equal to the second, otherwise returns 0.

5. **is_lessgreater**
```assembly
int is_lessgreater(int a, int b)
```
Returns -1 if the first integer is less than the second, 0 if they are equal, and 1 if the first integer is greater than the second.

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
