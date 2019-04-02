#include <cassert>
#include <iostream>
#include <string>
#include <vector>
#include <experimental/ranges/algorithm>
#include <experimental/ranges/iterator>

// Qualify everything with "std::experimental::ranges" if you like,
// I prefer to use a namespace alias:
namespace ranges = std::experimental::ranges;

template<class...> class show_type;

template<ranges::Readable T>
void foo(T&) {}

int main() {
  auto v = std::vector<std::string>{ "this", "is", "a", "test" };
  ranges::sort(v);
  auto out = ranges::ostream_iterator<std::string>{ std::cout, " " };
  ranges::copy(v, out);
  std::cout << '\n';
  auto result = ranges::reverse_copy(v, out);
  std::cout << '\n';
  return !(result.in == ranges::end(v));
}
