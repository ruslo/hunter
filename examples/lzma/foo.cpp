#include <lzma.h>
#include <iostream>

int main() {
  std::cout << "lzma version: '" << lzma_version_string() << "'" << std::endl;
}
