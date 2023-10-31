format ELF64

public c_exit

section '.c_exit' executable
c_exit:
    mov rax, 60
    syscall 
