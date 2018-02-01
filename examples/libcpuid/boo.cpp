#include <libcpuid/libcpuid.h>

int main() {
  uint32_t eax = 0;
  uint32_t* regs = 0;
  cpu_exec_cpuid(eax, regs);
}
