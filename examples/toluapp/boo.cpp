#include <tolua++.h>

int main() {
  lua_State* state(0);
  void* user_type(0);
  const char* name = "";

  tolua_pushusertype(state, user_type, name);
}
