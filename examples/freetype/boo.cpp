#include <iostream> // std::cout

#include <ft2build.h>
#include FT_FREETYPE_H

int main() {
  FT_Library library;
  FT_Error error;

  error = FT_Init_FreeType(&library);
  if (error) {
    std::cerr << "Library initialization failed" << std::endl;
    return EXIT_FAILURE;
  }

  std::cout << "Success" << std::endl;
  return EXIT_SUCCESS;
}
