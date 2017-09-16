#include <intsizeof.h> // INTSIZEOF_PTRDIFF
#include <cstddef> // ptrdiff_t

int main() {
  static_assert(INTSIZEOF_PTRDIFF == sizeof(ptrdiff_t), "");
}
