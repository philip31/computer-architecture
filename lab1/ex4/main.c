#include <stdio.h>

struct point {
    int x;
    int y;
};

struct rectangle{
    struct point pt1;
    struct point pt2;
};

int main ()
{
    printf("%d", sizeof(struct rectangle));
    return 0;
}