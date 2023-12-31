format ELF64

include "print_decimal.asm"
include "print_string.asm"
include "print_char.asm"

public printf

section '.printf' executable
; | input:
; rax = format
; stack = values
; | output:
; rax = count
printf:
    push rbx
    push rcx

    ; call/ret    = 8byte
    ; rax+rbx+rcx = 24byte
    mov rbx, 32

    ; count of format elements
    xor rcx, rcx 
    .next_iter:
        cmp [rax], byte 0
        je .close
        cmp [rax], byte '%'
        je .special_char
        jmp .default_char
        .special_char:
            inc rax
            cmp [rax], byte 's'
            je .print_string
            cmp [rax], byte 'd'
            je .print_decimal
            cmp [rax], byte 'c'
            je .print_char
            cmp [rax], byte '%'
            je .default_char
            jmp .is_error
        .print_string:
            push rax
            mov rax, [rsp+rbx]
            call print_string
            pop rax
            jmp .shift_stack
        .print_decimal:
            push rax
            mov rax, [rsp+rbx]
            call print_decimal
            pop rax
            jmp .shift_stack
        .print_char:
            push rax
            mov rax, [rsp+rbx]
            call print_char
            pop rax
            jmp .shift_stack
        .default_char:
            push rax
            mov rax, [rax]
            call print_char
            pop rax
            jmp .next_step
        .shift_stack:
            inc rcx
            add rbx, 8
        .next_step:
            inc rax
            jmp .next_iter
    .is_error:
        mov rcx, -1
    .close:
        mov rax, rcx
        pop rcx
        pop rbx
        ret
