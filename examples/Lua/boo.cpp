#include <lua.hpp>

int main() {
  lua_State* state(0);

  char data[100];
  unsigned size(0);
  const char* name = "name";

  luaL_loadbuffer(state, data, size, name);
}
