#include <half/half.hpp>

int main() {
  using half_float::half;
  half a(3.4), b(5);
  half c = a * b;
  c += 3;
  std::cout << std::boolalpha;
  std::cout << c << " > " << a << " ? " << (c > a) << std::endl;
}
