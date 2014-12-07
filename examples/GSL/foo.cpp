#include <iostream> // std::cout
#include <gsl/gsl_sf_bessel.h> // gsl_sf_bessel_J0

int main () {
  const double x = 5.0;
  const double y = gsl_sf_bessel_J0(x);
  std::cout << "J0(" << x << ") = " << y << std::endl;
  return EXIT_SUCCESS;
}
