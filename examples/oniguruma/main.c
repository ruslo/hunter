#include <oniguruma.h>

int main()
{
    const char* version;
    version = onig_version();
    (void) version;
    return 0;
}
