#include <h3/h3api.h>

int main()
{
    GeoCoord anywhere = {0, 0};
    H3_EXPORT(geoToH3)(&anywhere, -1);
    return 0;
}
