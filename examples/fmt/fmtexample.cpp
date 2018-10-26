#include <fmt/format.h>
#include <fmt/core.h>

int main() {
  fmt::print("Hello world\nThis is fmt(ex-cppformat)\n");
  std::string as_string = fmt::format("The answer is {}", 42);
  fmt::memory_buffer buf;
  format_to(buf, "{}\nThe previous line and this message were bufferred in memory", as_string);
  fmt::print(stderr, "{}\nAnd then were printed to stderr\n", buf.data());
  fmt::print("Fmt supports many nice features, see {url} for details\n", fmt::arg("url", "https://github.com/fmtlib/fmt"));
}
