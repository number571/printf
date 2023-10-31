section '.count_specials' executable
; | input:
; rax = format
; | output:
; rax = count
count_specials:
    push rcx 
    xor rcx, rcx 
    .next_iter:
        cmp [rax], byte 0
        je .close
        cmp [rax], byte '%'
        je .special_char
        jmp .next_step
        .special_char:
            inc rax
            cmp [rax], byte '%'
            je .next_step
            inc rcx 
        .next_step:
            inc rax
            jmp .next_iter
    .close:
        mov rax, rcx 
        pop rcx 
        ret
