#include <cpuinfo.h>
#include <iostream>

int main(int argc, char** argv) {
  if (cpuinfo_initialize())
  {
    return 0;
  }
  return 1;
}
