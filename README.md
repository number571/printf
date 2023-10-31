# printf

Implementation of the printf function in the FASM assembly language.

## Example

```asm
; main.asm

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
```

### Compile & Run

```
$ fasm main.asm
$ fasm printf.asm
$ ld main.o printf.o -o main 
$ ./main
> list = [hello, 123, 0xA, -15, %, \n];
>
```

## Also example with C code

```c
// main.c
extern int c_printf(char *fmt, ...);

int main(void) {
    c_printf("hello, %d!\n", 571);
    return 0;
}
```

```asm
; c_printf.asm
format ELF64

extrn printf

public c_printf

section '.c_printf' executable
c_printf:
    mov rax, rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    call printf
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    ret 
```

### Compile & Run

```
$ fasm c_printf.asm
$ fasm printf.asm
$ gcc -no-pie -o main printf.o c_printf.o main.c 
$ ./main
> hello, 571!
>
```
