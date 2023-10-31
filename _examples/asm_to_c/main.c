typedef long long int int64_t;

extern void c_exit(int ret);
extern int64_t c_printf(char *fmt, ...);

int _start(void) {
    char *string = "hello";
    int64_t decimal = 571;
    char symbol = '!';

    int64_t ret = c_printf(
        "{ %s, %d%c }\n",
        string, decimal, symbol
    );
    c_printf("%d\n", ret); // 3

    c_exit(0);
}
