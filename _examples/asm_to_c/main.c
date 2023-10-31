typedef long long int int64_t;

extern int64_t c_printf(char *fmt, ...);

int main(void) {
    char *str = "hello";
    int64_t x = 123;
    int64_t y = 10;
    int64_t z = -15;

    int64_t ret = c_printf(
        "list = [%s, %d, %x, %d, %%];\n",
        str,
        x, y, z
    );
    c_printf("%d\n", ret); // 4

    return 0;
}
