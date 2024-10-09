#include <stdio.h>

void    static_demo()
{
    static int count = 0;

    printf("%d\n", count);
    count++;
}

int main()
{
    static_demo();
    static_demo();
    static_demo();
    static_demo();
}