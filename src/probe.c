#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include "probe.h"

void dump(const unsigned char *buf, ssize_t n) {
    char out[4 * SIZE + 32];
    size_t pos = 0;
    int ret;

    ret = snprintf(out, sizeof(out), "lu %zd octet(s) :", n);
    if (ret < 0 || (size_t) ret >= sizeof(out))
        return;

    pos = (size_t) ret;

    for (ssize_t i = 0; i < n; i++) {
        ret = snprintf(out + pos, sizeof(out) - pos, " %u", (unsigned int) buf[i]);
            
        if (ret < 0 || (size_t)ret >= sizeof(out) - pos)
        return;
            
        pos += (size_t) ret;
    }

    ret = snprintf(out + pos, sizeof(out) - pos, "\n");
    if (ret < 0 || (size_t)ret >= sizeof(out) - pos)
        return;

    pos += (size_t) ret;

    write(STDOUT_FILENO, out, pos);
}
