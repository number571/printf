include "length_string.asm"

section '.print_string' executable
; | input
; rax = string
print_string:
    push rax
    push rdx
    push rsi
    push rdi

    mov rsi, rax
    call length_string

    mov rdx, rax
    mov rdi, 1
    mov rax, 1
    ; include in printf.asm
    call do_syscall

    pop rdi
    pop rsi
    pop rdx
    pop rax
    ret
