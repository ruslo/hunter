#include <Box2D/Box2D.h>

int main() {
  b2Mat33* M1(0);
  b2Mat33* M2(0);
  M1->GetSymInverse33(M2);
}
