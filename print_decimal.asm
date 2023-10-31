section '.print_decimal' executable
; | input:
; rax = number
print_decimal:
    push rax
    push rbx
    push rcx
    push rdx
    xor rcx, rcx
    cmp rax, 0
    jl .is_minus
    jmp .next_iter
    .is_minus:
        neg rax
        push rax
        mov rax, '-'
        call print_char
        pop rax
    .next_iter:
        mov rbx, 10
        xor rdx, rdx
        div rbx
        push rdx
        inc rcx
        cmp rax, 0
        je .print_iter
        jmp .next_iter
    .print_iter:
        cmp rcx, 0
        je .close
        pop rax
        add rax, '0'
        call print_char
        dec rcx
        jmp .print_iter
    .close:
        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret
