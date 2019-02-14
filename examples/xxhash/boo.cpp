#include <xxhash/xxhash.h>

int main() {
  XXH64_state_t* state = XXH64_createState();
  XXH64_update(state, "hello", 5);
  XXH64_digest(state);
  return 0;
}
