section '.do_syscall' executable
do_syscall:
    ; syscall rewrite (rcx, r11)
    push rcx
    push r11 

    syscall

    pop r11 
    pop rcx 
    ret 
