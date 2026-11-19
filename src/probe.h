#include <unistd.h>
#include <sys/types.h>

#ifndef SIZE
# define SIZE 64
#endif

void dump(const unsigned char *buf, ssize_t n);