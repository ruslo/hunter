#include <stdio.h>
#include <mathfu/vector.h>

int main(int argc, char *argv[]) {
  mathfu::Vector<float, 3> v1(1.0f, 2.0f, 3.0f), v2(3.0f, 2.5f, 0.5f), v3;
  v3 = v1 + v2;
  printf("%.1f %.1f %.1f\n", v3.x, v3.y, v3.z);
  return 0;
}
