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
