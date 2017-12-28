#include <stdio.h>
#include <sds/sds.h>

int main()
{
    sds my_string = sdsnew("Hello World!");
    printf("%s\n", my_string);
    sdsfree(my_string);
    return 0;
}
