section .text
    global add_numbers, sub_numbers, mul_numbers, div_numbers, _abs
    global cos_function, sin_function, tan_function
    global is_greater, is_greaterequal, is_less, is_lessequal, is_lessgreater
    global fdim, fmax, fmin, fabs, fma
    global _pow, _sqrt

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

; returns the absolute value of a
; int abs(int a)
_abs:
    mov eax, ecx
    test eax, eax       ; test eax - eax
    jns end_abs
    ; if negative, negate it
    neg eax
    end_abs:
        ret             ; return the abs value

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

; Function to compute tan
; double tan_function(double a)
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

; Function to check if a > b
; int is_greater(int a, int b)
is_greater:
    cmp ecx, edx        ; comparing a with b
    jg greaterthan      ; jump if greater to greaterthan
    xor eax, eax        ; making eax 0 if a <= b
    ret                 ; returning 0
    greaterthan:
        mov eax, 1          ; if a is greater than b
        ret                 ; returning 1

; Function to check if a >= b
; int is_greaterequal(int a, int b)
is_greaterequal:
    cmp ecx, edx        ; comparing a with b
    jge goe             ; jump if greater or equal to goe
    xor eax, eax        ; if a < b then eax = 0
    ret                 ; ret 0
    goe:
        mov eax, 1      ; if a >= b make eax 1
        ret             ; return 1

; Function to check if a < b
; int is_less(int a, int b)
is_less:
    cmp ecx, edx        ; comparing a with b
    jl less             ; if a < b jump to less
    xor eax, eax        ; else make eax 0
    ret                 ; return 0
    less:
        mov eax, 1      ; make eax 1
        ret             ; return 1

; Function to check if a <= b
; int is_lessequal(int a, int b)
is_lessequal:
    ; the functions above are commented, no need to comment this one
    cmp ecx, edx
    jle lessequal
    xor eax, eax
    ret
    lessequal:
        mov eax, 1
        ret

; is less or greater
; int is_lessgreater(int a, int b)
is_lessgreater:
    cmp ecx, edx
    jl itisless
    jg itisgreater
    xor eax, eax            ; we are here only in the case in which a == b (eax == 0)
    ret                     ; and return 0
    itisless:
        mov eax, -1         ; if a < b, make eax -1
        ret                 ; return -1
    itisgreater:
        mov eax, 1          ; if a > b, make eax 1
        ret                 ; return 1

; possitive difference between a and b
; double fdim(double a, double b)
fdim:
    ; xmm0 - parameter a
    ; xmm1 - parameter b
    comisd xmm0, xmm1   ; compare a and b
    jbe return_zero

    subsd xmm0, xmm1    ; in case x > y perform x - y
    ret                 ; returned x - y

    return_zero:
        pxor xmm0, xmm0 ; making xmm0 equal to 0
        ret             ; returning 0

; returns the max of a and b
; double fmax(double a, double b)
fmax:
    ; xmm0 - a
    ; xmm1 - b
    comisd xmm0, xmm1
    jbe return_b
    
    ret         ; returning a
    return_b:
        movaps xmm0, xmm1
        ret     ; returning b

; returns the min of a and b
; double fmin(double a, double b)
fmin:
    comisd xmm0, xmm1
    jae returning_b
    ret                     ; returning a
    returning_b:
        movaps xmm0, xmm1
        ret                 ; returning b

; returns the absolute value of a
; double fabs(double a)
fabs:
    movapd xmm1, xmm0          ; Copy the value of xmm0 to xmm1
    psrlq xmm1, 63             ; Shift right by 63 bits to move the sign bit to LSB
    psllq xmm1, 63             ; Shift left by 63 bits to clear the sign bit and retain the rest
    xorps xmm0, xmm1           ; XOR the original number with xmm1 to clear the sign bit
    ret                        ; abs value of a returned

; returns (a * b) + c
; double fma(double a, double b, double c)
fma:
    vfmadd213sd xmm0, xmm1, xmm2        ; xmm0 = (xmm0 * xmm1) + xmm2
    ret

; Function to compute the power of an integer raised to a positive integer
; int pow(int base, int exponent)
_pow:
    ; rcx - base (int)
    ; rdx - exponent (int)

    ; Handle negative exponents
    cmp edx, 0
    jl .return_zero         ; if exponent < 0, return 0

    ; Handle special cases
    cmp rdx, 0
    je .return_one          ; if exponent == 0, return 1

    mov r8, rcx             ; r8 = base (copy of the base)
    mov rax, rdx            ; rax = exponent

    .positive_exp:
        ; Initialize result to 1
        mov r9, 1               ; r9 = 1 (result)

    .pow_loop:
        test rax, rax
        jz .done                ; if rax == 0, done

        ; Multiply result by base
        imul r9, r8             ; r9 *= base
        sub rax, 1              ; decrement exponent

        jmp .pow_loop           ; repeat the loop

    .done:
        ; Return the result in rax
        mov rax, r9
        ret

    .return_one:
        ; Return 1
        mov rax, 1
        ret

    .return_zero:
        ; Return 0
        xor rax, rax            ; rax = 0
        ret

; Function to compute the sqrt of an integer
; int _sqrt(int a)
_sqrt:
    ; Load argument into eax
    mov eax, ecx

    ; Special case for 0
    test eax, eax
    jz .done

    ; Initialize low, high, and mid
    mov ecx, eax         ; ecx = x (high)
    shr ecx, 1           ; ecx = x / 2 (initial high guess)
    mov edx, 1           ; edx = 1 (initial low guess)

    .loop:
        ; Calculate mid = (low + high) / 2
        mov ebx, ecx         ; ebx = high
        add ebx, edx         ; ebx = low + high
        shr ebx, 1           ; ebx = (low + high) / 2
        mov esi, ebx         ; esi = mid

        ; Calculate mid*mid
        imul esi, esi        ; esi = mid * mid
        cmp esi, eax         ; Compare mid*mid with x
        je .found            ; If mid*mid == x, we've found the result
        jl .adjust_low       ; If mid*mid < x, adjust low
        jg .adjust_high      ; If mid*mid > x, adjust high

    .adjust_low:
        mov edx, ebx         ; low = mid
        jmp .check_terminate

    .adjust_high:
        mov ecx, ebx         ; high = mid
        jmp .check_terminate

    .check_terminate:
        ; Check if low and high are too close to refine further
        mov esi, ecx
        sub esi, edx
        cmp esi, 1
        jle .done            ; If high - low <= 1, terminate loop
        jmp .loop

    .found:
        mov eax, ebx         ; eax = mid (result)
        ret

    .done:
        ; If we didn't find an exact match, return the lower bound
        cmp esi, 1
        jg .found
        mov eax, edx
        ret

