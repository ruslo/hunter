#include <rabit/rabit.h>

int main(int argc, char *argv[])
{
    if (argc < 3)
    {
        printf("Usage: <ndata>\n");
        return 0;
    }
    rabit::Init(argc, argv);
}
