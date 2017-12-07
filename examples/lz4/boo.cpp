#include <lz4.h>
#include <lz4hc.h>

int main() {
  const char* source = "";
  char* dest = 0;
  int sourceSize = 0;
  int maxDestSize = 0;
  int acceleration = 0;

  const int result = LZ4_compress_fast (source, dest, sourceSize, maxDestSize, acceleration);
  return result;
}
