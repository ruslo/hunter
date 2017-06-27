#include <f2c.h>
#include <cmath>

extern "C" {
    doublereal dgamln_ (doublereal * z, integer * ierr);
}

int main(int argc, char const **argv) {
  doublereal z(1);
  integer ierr;
  auto const result = dgamln_(&z, &ierr);

  if(ierr != 0 || std::abs(result) > 1e-12)
    return 1;

  return 0;
}
