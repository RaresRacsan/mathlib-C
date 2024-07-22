section .text
    global add_numbers, sub_numbers, mul_numbers, div_numbers, cos_function, sin_function, tan_function

; In 64-bit Windows (x64), the first four integer or pointer parameters are passed in the following registers:
; --> the first parameter into rcx (64 bits - long long) / ecx (32 bits - int)
; --> the second parameter into rdx / edx
; --> the third parameter into r8 / r8d
; --> the fourth parameter into r9 / r9d
; --> the rest are on the stack

; Function implementation from here:

; Function to add two integers
; int add_numbers(int a, int b)
add_numbers:
    mov eax, ecx  ; Move the first parameter from ecx to eax (a)
    add eax, edx  ; Add the second parameter from edx to eax (b)
    ret           ; return a + b

; Function to subtract two integers
; int sub_numbers(int a, int b)
sub_numbers:
    mov eax, ecx  ; Move the first parameter from ecx to eax (a)
    sub eax, edx  ; Substract the second parameter
    ret           ; return a - b

; Function to multiply two integers
; int mul_numbers(int a, int b)
mul_numbers:
    mov eax, ecx  ; Move the first parameter from ecx to eax (a)
    imul edx      ; perform eax * edx (in edx is the second parameter b)
    ret           ; return a * b

; Function to divide two integers
; int div_numbers(int a, int b)
div_numbers:
    mov eax, ecx  ; Move the first parameter from ecx to eax (a)
    mov ebx, edx  ; Move the second parameter from edx to ebx (b)
    
    cdq ; convert double to quad word in order to sign extend eax
    ; now we have the first variable (a) in EDX:EAX (as a quadword)

    idiv ebx      ; dividing EDX:EAX by ebx
    ; the result of the division will be in eax, remainder in edx

   ret            ; returning the quotient and the remainder

; Function to compute cos
; double cos_function(double a)
cos_function:
    ; xmm0 is used to return values from functions, and as the first function argument
    ; input: xmm0 = a (floating-point argument)
    ; output: xmm0 = cos(a)

    sub rsp, 8              ; allocate memory on the stack

    movsd qword [rsp], xmm0 ; store xmm0 on the stack
    fld qword [rsp]         ; load the value into st(0)

    fcos                    ; compute cos

    fstp qword [rsp]        ; store the result from st(0) into memory
    movsd xmm0, qword [rsp] ; load the result into xmm0

    add rsp, 8              ; deallocate space on stack

    ret                     ; return cos(a)

; Function to compute sin
; double sin_function(double a)
sin_function:
    sub rsp, 8              ; allocate memory on the stack

    movsd qword [rsp], xmm0 ; store xmm0 on the stack
    fld qword [rsp]         ; load the value into st(0)

    fsin                    ; compute sin

    fstp qword [rsp]        ; store the result from st(0) into memory
    movsd xmm0, qword [rsp] ; load the result into xmm0

    add rsp, 8              ; deallocate space on stack

    ret                     ; return sin(a)

tan_function:
    ; xmm0 is used to return values from functions, and as the first function argument
    ; input: xmm0 = a (floating-point argument)
    ; output: xmm0 = tan(a) = sin(a) / cos(a)

    sub rsp, 8              ; allocate memory on the stack

    movsd qword [rsp], xmm0 ; store xmm0 on the stack
    fld qword [rsp]         ; load the value into st(0)

    fsin                    ; compute sin(a), result in st(0)
    fld qword [rsp]         ; load the original value into st(0) again
    fcos                    ; compute cos(a), result in st(0)

    fdivp                   ; divide st(1) (sin(a)) by st(0) (cos(a)), result in st(1)

    fstp qword [rsp]        ; store the result (tan(a)) into memory
    movsd xmm0, qword [rsp] ; load the result into xmm0

    add rsp, 8              ; deallocate space on stack

    ret                     ; return tan(a)