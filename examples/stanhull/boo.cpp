#include <stanhull/stanhull.h>

int main() {
  StanHull::HullLibrary library;

  StanHull::HullResult x;
  StanHull::HullError hull_error = library.ReleaseResult(x);

  if (hull_error == StanHull::QE_OK) {
    return 0;
  }
  else {
    return 1;
  }
}
