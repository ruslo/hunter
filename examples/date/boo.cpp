#include <iostream>
#include <date/date.h>

int main() {
  using namespace date;
  using namespace std::chrono;

  auto today = floor<days>(system_clock::now());
  std::cout << today << '\n';
}
