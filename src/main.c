#include <stdio.h>
#include "probe.h"

int main() {
    unsigned char buf[SIZE];

    while(1) {
        ssize_t n = read(STDIN_FILENO, buf, SIZE);

        if (n==0) {
            write(STDOUT_FILENO, "fin de lecture\n", 15);
            break;
        }
        else if (n == -1) {
            perror("Erreur de lecture");
            return (1);
        }

        dump(buf, n);
    }

    return 0;
}
