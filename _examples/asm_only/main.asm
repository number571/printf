format ELF64
public _start

extrn printf

section '.data' writeable
    input db "list = [%s, %d, %x, %d, %%, \\n];\n", 0
    hello db "hello", 0
    world dq 123

section '.text' executable
_start:
    mov rax, input
    push hello
    push [world]
    push 10
    push -15
    call printf
exit:
    mov rax, 1
    xor rbx, rbx 
    int 0x80
