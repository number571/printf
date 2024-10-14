format ELF64
public _start

extrn printf

section '.data' writeable
    input   db "{ %s, %d%c }", 0xA, 0
    string  db "hello", 0
    decimal dq 571
    symbol  dq '!'

section '.text' executable
_start:
    mov rax, input
    push [symbol]
    push [decimal]
    push string
    call printf
exit:
    mov rax, 60
    xor rdi, rdi 
    syscall 
