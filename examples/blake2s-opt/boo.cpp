#include <libblake2s/blake2s.h>

int main() {
  unsigned char hash[32];
  unsigned char *in = (unsigned char*)"hello";
  blake2s_startup();
  blake2s(hash, in, 5);
}
