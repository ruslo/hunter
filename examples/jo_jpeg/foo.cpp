#include <jo_jpeg/jo_jpeg.h>

int main() {
  const char *filename = "";
  const void *data = 0;
  int width = 0;
  int height = 0;
  int comp = 0;
  int quality = 0;

  bool x = jo_write_jpg(filename, data, width, height, comp, quality);
  return x;
}
