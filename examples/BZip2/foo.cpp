#include <bzlib.h>
#include <cstdlib>
#include <iostream>

int main() {
  enum {
    nBuf = 100
  };
  char buf[nBuf];
  for (int i = 0; i < nBuf; ++i) {
    buf[i] = static_cast<char>(i);
  }

  int bzerror(0);
  int abandon(0);
  unsigned int nbytes_in(0);
  unsigned int nbytes_out(0);

  FILE* f = fopen("myfile.bz2", "w");
  if (!f) {
    std::cerr << "fopen failed" << std::endl;
    return EXIT_FAILURE;
  }

  BZFILE* b = BZ2_bzWriteOpen(&bzerror, f, 9, 0, 0);
  if (bzerror != BZ_OK) {
    BZ2_bzWriteClose(&bzerror, b, abandon, &nbytes_in, &nbytes_out);
    std::cerr << "BZ2_bzWriteOpen failed" << std::endl;
    return EXIT_FAILURE;
  }

  BZ2_bzWrite(&bzerror, b, buf, nBuf);
  if (bzerror == BZ_IO_ERROR) {
    BZ2_bzWriteClose(&bzerror, b, abandon, &nbytes_in, &nbytes_out);
    std::cerr << "BZ_IO_ERROR (write)" << std::endl;
    return EXIT_FAILURE;
  }

  BZ2_bzWriteClose(&bzerror, b, abandon, &nbytes_in, &nbytes_out);
  if (bzerror == BZ_IO_ERROR) {
    std::cerr << "BZ_IO_ERROR (close)" << std::endl;
    return EXIT_FAILURE;
  }
}
