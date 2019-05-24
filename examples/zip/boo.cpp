#include <zip/zip.h>

int main() {
  struct zip_t *zip = zip_open("dummy", ZIP_DEFAULT_COMPRESSION_LEVEL, 'w');

  zip_close(zip);

  return 0;
}
