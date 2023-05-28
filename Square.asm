%include 'io64.inc'
extern printf
section .data
    fmt dq 'S: %fl', 0
    
    diam dq 13.0 ; диаметр окружности
    a dq 12.0 ; сторона квадрата
    pi dq 3.14159265359
    two dq 2.0
    zero dq 0.0
    sq2 dq 1.414213
    six dq 6.0
    radian dq 0.0174532
    one8 dq 180.0
section .bss
    diag resq 1
    r resq 1
    answ resq 1
section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    movsd xmm0, [diam]
    movsd xmm1, [two]
    divsd xmm0, xmm1
    movsd [r], xmm0 ; вычисляю значение радиуса окружности
    
    movsd xmm0, [a]
    mulsd xmm0, xmm0
    mulsd xmm0, [two]
    sqrtsd xmm0, xmm0
    movsd [diag], xmm0 ; вычисляю значение диагонали квадрата
    
    movsd xmm0, [diam]
    movsd xmm1, [a]
    subsd xmm0, xmm1
    movsd xmm1, [zero]
    movq rax, xmm0 ; костыль
    movq rbx, xmm1 ; костыль
    cmp rax, rbx ; делаю проверку, если 2R <= A (в таком случае окружность полностью вписана/касается квадрата)  
    jle circle
    
    movsd xmm0, [diag]
    movsd xmm2, [diam]
    subsd xmm2, xmm0
    movsd xmm0, [zero]
    movq rax, xmm2 ; костыль
    movq rbx, xmm0 ; костыль
    cmp rax, rbx ; делаю проверку, если 2R >= diag (в таком случае квадрат полностью вписан/касается окружности)  
    jge square
    ;Случай когда A < 2R < diag (окружность пересекает квадрат)
    ;Значит нужно воспользоваться формулой S(фигуры) = S(окружн) - 4(R^2 * sin(alph) / 2 - S(окружн) * alph/360)
    movsd xmm0, [r]
    mulsd xmm0, xmm0
    movsd xmm1, [pi]
    mulsd xmm0, xmm1 ; Площадь круга в xmm0
    
    movsd xmm1, [r]
    movsd xmm2, [diag]
    divsd xmm1, xmm2
    movsd xmm2, [sq2] ; Альфа = 2*Гамма - 180
    mulsd xmm1, xmm2 ; sin Гамма в xmm1
    
    movsd xmm2, xmm1
    movsd xmm3, xmm1 
    mulsd xmm2, xmm2
    mulsd xmm2, xmm3
    divsd xmm2, [six]
    addsd xmm2, xmm1 ; гамма в xmm2 
    
    mulsd xmm2, [two]
    movsd xmm3, [radian]
    mulsd xmm3, [one8]
    subsd xmm2, xmm3 ; альфа в xmm2 
    
    movsd xmm1, xmm2
    movsd xmm3, xmm2
    movsd xmm4, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm4
    divsd xmm3, [six]
    subsd xmm1, xmm3 ; sin Альфа в xmm1
    
    divsd xmm1, [two]
    mulsd xmm1, [r]
    mulsd xmm1, [r]
    
    movsd xmm3, xmm0
    mulsd xmm3, xmm2
    divsd xmm3, [radian]
    divsd xmm3, [one8]
    divsd xmm3, [two]
    
    subsd xmm1, xmm3
    mulsd xmm1, [two]
    mulsd xmm1, [two]
    
    subsd xmm0, xmm1
    movsd [answ], xmm0
    
    enter 0, 0
    mov rcx, fmt
    mov rdx, [answ]
    sub rsp, 32
    call printf
    add rsp, 32
    leave 
    ret
    
    
circle:
    movsd xmm0, [r]
    mulsd xmm0, xmm0
    movsd xmm1, [pi]
    mulsd xmm0, xmm1
    movsd [answ], xmm0
    
    enter 0, 0
    mov rcx, fmt
    mov rdx, [answ]
    sub rsp, 32
    call printf
    add rsp, 32
    leave 
    ret  
square:
    movsd xmm0, [a]
    mulsd xmm0, xmm0
    movsd [answ], xmm0
    
    enter 0, 0
    mov rcx, fmt
    mov rdx, [answ]
    sub rsp, 32
    call printf
    add rsp, 32
    leave                
    ret
