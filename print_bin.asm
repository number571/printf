section '.print_bin' executable
; | input:
; rax = number
print_bin:
    push rax
    push rbx
    push rcx
    push rdx
    xor rcx, rcx
    push rax
    mov rax, '0'
    call print_char
    mov rax, 'b'
    call print_char
    pop rax
    .next_iter:
        mov rbx, 2
        xor rdx, rdx
        div rbx
        add rdx, '0'
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
