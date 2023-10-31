section '.print_hex' executable
; | input:
; rax = number
print_hex:
    push rax
    push rbx
    push rcx
    push rdx
    xor rcx, rcx
    push rax
    mov rax, '0'
    call print_char
    mov rax, 'x'
    call print_char
    pop rax
    .next_iter:
        mov rbx, 16
        xor rdx, rdx
        div rbx
        cmp rdx, 10
        jl .is_number
        jmp .is_alpha
        .is_number:
            add rdx, '0'
            jmp .next_step
        .is_alpha:
            sub rdx, 10
            add rdx, 'A'
            jmp .next_step
        .next_step:
            push rdx
            inc rcx
            cmp rax, 0
            je .print_iter
            jmp .next_iter
    .print_iter:
        cmp rcx, 0
        je .close
        pop rax
        call print_char
        dec rcx
        jmp .print_iter
    .close:
        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret
