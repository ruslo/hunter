#include <cctz/time_zone.h>

int main()
{
    cctz::time_zone syd;
    cctz::load_time_zone("Australia/Sydney", &syd);
    return 0;
}
