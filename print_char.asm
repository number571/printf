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
    call do_syscall

    pop rax

    pop rdi
    pop rsi
    pop rdx
    pop rax
    ret

section '.do_syscall' executable
do_syscall:
    ; syscall rewrite (rcx, r11)
    push rcx
    push r11 

    syscall

    pop r11 
    pop rcx 
    ret 
