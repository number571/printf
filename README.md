# printf

Implementation of the printf function in the FASM assembly language.

## Example

```asm
; main.asm

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
> list = [hello, 123, 0xA, -15, %];
>
```

## Also example with C code

```c
// main.c
typedef long long int int64_t;

extern int64_t c_printf(char *fmt, ...);

int main(void) {
    char *str = "hello";
    int x = 123;
    int y = 10;
    int z = -15;

    int64_t ret = c_printf(
        "list = [%s, %d, %x, %d, %%];\n",
        str,
        x, y, z
    );
    c_printf("%d\n", ret); // 4

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
    push r9
    push r8
    push rcx
    push rdx
    push rsi

    mov rax, rdi
    call printf

    pop rsi
    pop rdx
    pop rcx
    pop r8
    pop r9
    ret 
```

### Compile & Run

```
$ fasm c_printf.asm
$ fasm printf.asm
$ gcc -no-pie -o main printf.o c_printf.o main.c 
$ ./main
> list = [hello, 123, 0xA, -15, %];
> 4
> 
```
