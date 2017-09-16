#include <aes.h>

int main() {
  uint8_t* input = 0;
  uint8_t* key = 0;
  uint8_t *output = 0;
  uint32_t length = 0;

  AES_ECB_encrypt(input, key, output, length);
}
