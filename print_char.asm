section '.bss' writeable 
    _bss_char db 0

section '.print_char' executable
; | input
; rax = char
print_char:
    push rax
    push rdx
    push rsi
    push rdi

    mov [_bss_char], al

    mov rsi, _bss_char
    mov rdi, 1
    mov rdx, 1
    mov rax, 1
    ; include in printf.asm
    call do_syscall

    pop rdi
    pop rsi
    pop rdx
    pop rax
    ret
