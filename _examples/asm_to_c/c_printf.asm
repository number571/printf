format ELF64

extrn printf

public c_printf

section '.c_printf' executable
c_printf:
    mov rax, rdi
    push r9
    push r8
    push rcx
    push rdx
    push rsi
    call printf
    pop rsi
    pop rdx
    pop rcx
    pop r8
    pop r9
    ret 
