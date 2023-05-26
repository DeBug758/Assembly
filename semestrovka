%include 'io.inc'
section .data
    msg1 db 'abcd', 0
    msg2 db 'abdc', 0
section .bss
    dif resb 1
    
section .text
    global main

main:
    mov ebp, esp; for correct debugging
    push ebp
    call str_cmp
    leave
    PRINT_UDEC 4, dif
    
    ret

str_cmp:
    mov ebp, esp
    push esp

    ; Получаем аргументы
    mov esi, msg1 ; адрес первой строки
    mov edi, msg2 ; адрес второй строки

compare_loop:
    ; Загружаем символы из строк
    mov al, [esi]
    mov ah, [edi]

    ; Сравниваем символы
    cmp al, ah
    jne not_equal

    ; Если оба символа равны 0, строки равны
    test al, al
    jz equal

    ; Переходим к следующим символам
    inc esi
    inc edi
    jmp compare_loop

not_equal:
    ; Возвращаем разницу между символами
    sub al, ah
    mov [dif], eax

    leave
    ret

equal:
    ; Возвращаем 0
    xor eax, eax
    mov [dif], eax

    leave
    ret
