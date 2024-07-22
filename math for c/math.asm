section .text
    global add_numbers, sub_numbers, mul_numbers, div_numbers

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