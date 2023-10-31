section '.print_char' executable
; | input
; rax = char
print_char:
    push rax
    push rdx
    push rsi
    push rdi

    push rax
    
    mov rsi, rsp
    mov rdi, 1
    mov rdx, 1
    mov rax, 1
    ; include in printf.asm
    call do_syscall

    add rsp, 8

    pop rdi
    pop rsi
    pop rdx
    pop rax
    ret
