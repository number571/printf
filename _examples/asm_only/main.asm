format ELF64
public _start

extrn printf

section '.data' writeable
    input db "list = [%s, %d, %x, %d, %%];", 0xA, 0
    hello db "hello", 0
    world dq 123

section '.text' executable
_start:
    mov rax, input
    push -15
    push 10
    push [world]
    push hello
    call printf
exit:
    mov rax, 60
    xor rdi, rdi 
    syscall 
