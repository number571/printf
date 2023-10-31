section '.length_string' executable
; | input
; rax = string
; | output
; rax = length
length_string:
    push rbx
    xor rbx, rbx
    .next_iter:
        cmp [rax+rbx], byte 0
        je .close
        inc rbx
        jmp .next_iter
    .close:
        mov rax, rbx
        pop rbx
        ret
