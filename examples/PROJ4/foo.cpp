#include <proj_api.h>
#include <iostream>

int main() {
  projPJ pj_merc, pj_latlong;
  double x, y;
  if (!(pj_merc = pj_init_plus("+proj=merc +ellps=clrk66 +lat_ts=33")) )
    exit(1);
  if (!(pj_latlong = pj_init_plus("+proj=latlong +ellps=clrk66")) )
    exit(1);

  x = 1;
  y = 1;
  int p = pj_transform(pj_latlong, pj_merc, 1, 1, &x, &y, NULL );
  std::cout << "x: " << x << std::endl;;
  std::cout << "y: " << y << std::endl;;
  return 0;
}
