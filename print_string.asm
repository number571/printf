section '.print_string' executable
; | input
; rax = string
print_string:
    push rbx
    xor rbx, rbx
    .next_iter:
        cmp [rax+rbx], byte 0
        je .close
        push rax 
        mov rax, [rax+rbx]
        call print_char
        pop rax 
        inc rbx
        jmp .next_iter
    .close:
        mov rax, rbx
        pop rbx
        ret
