#include <librtmp/rtmp.h>

int main(int argc, char **argv)
{
    RTMP *rtmp=RTMP_Alloc();

    if(!rtmp)
        return 1;

    RTMP_Init(rtmp);
    RTMP_Free(rtmp);

    return 0;
}
