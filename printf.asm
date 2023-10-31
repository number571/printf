format ELF64

include "do_syscall.asm"

include "print_hex.asm"
include "print_oct.asm"
include "print_bin.asm"
include "print_decimal.asm"
include "print_string.asm"
include "print_char.asm"
include "print_line.asm"
include "count_specials.asm"

public printf

section '.printf' executable
; | input:
; rax = format
; stack = values
printf:
    push rax
    push rbx
    push rcx

    push rax 
    call count_specials
    mov rcx, rax
    pop rax 

    ; call/ret    = 8byte
    ; rax+rbx+rcx = 24byte
    ; stack       = n*8byte
    mov rbx, 32
    imul rcx, 8
    add rbx, rcx 

    .next_iter:
        cmp [rax], byte 0
        je .close
        cmp [rax], byte '%'
        je .special_char
        cmp [rax], byte '\'
        je .special_null_char
        jmp .default_char
        .special_char:
            inc rax
            cmp [rax], byte 's'
            je .print_string
            cmp [rax], byte 'd'
            je .print_decimal
            cmp [rax], byte 'b'
            je .print_bin
            cmp [rax], byte 'o'
            je .print_oct
            cmp [rax], byte 'x'
            je .print_hex
            cmp [rax], byte 'c'
            je .print_char
            cmp [rax], byte '%'
            je .default_char
            jmp .next_step
        .special_null_char:
            inc rax
            cmp [rax], byte 'n'
            je .print_line
            cmp [rax], byte '\'
            je .default_char
            jmp .next_step
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
        .print_bin:
            push rax
            mov rax, [rsp+rbx]
            call print_bin
            pop rax
            jmp .shift_stack
        .print_oct:
            push rax
            mov rax, [rsp+rbx]
            call print_oct
            pop rax
            jmp .shift_stack
        .print_hex:
            push rax
            mov rax, [rsp+rbx]
            call print_hex
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
        .print_line:
            call print_line
            jmp .next_step
        .shift_stack:
            sub rbx, 8
        .next_step:
            inc rax
            jmp .next_iter
    .close:
        pop rcx
        pop rbx
        pop rax
        ret
