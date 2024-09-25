#include <stdio.h>

char shift_char(char c, int n) {
    // Char between 'a' & 'z'
    if (c >= 'a' && c <= 'z') {
        // Shift n times, use modulo to loop it
        char shifted_char = ((c - 'a' + n) % 26) + 'a';
        return shifted_char;
    }
}

int main() {
    char c = 'a';
    int n = 1;

    char new_char = shift_char(c, n);
    printf("The char after shifting '%c' by %d times is: %c\n", c, n, new_char);

    return 0;
}