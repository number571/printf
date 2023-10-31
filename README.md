# printf

Implementation of the printf function in the FASM assembly language.

### Example

```asm
; main.asm

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
```

#### Compile & Run

```
$ fasm main.asm
$ fasm printf.asm
$ ld main.o printf.o -o main 
> { hello, 571! }
>
```

### Also example with C code

```c
// main.c
typedef long long int int64_t;

extern int64_t c_printf(char *fmt, ...);

int main(void) {
    char *string = "hello";
    int64_t decimal = 571;
    char symbol = '!';

    int64_t ret = c_printf(
        "{ %s, %d%c }\n",
        string, decimal, symbol
    );
    c_printf("%d\n", ret); // 3

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

#### Compile & Run

```
$ fasm c_printf.asm
$ fasm printf.asm
$ gcc -no-pie -o main printf.o c_printf.o main.c 
$ ./main
> { hello, 571! }
> 3
> 
```
