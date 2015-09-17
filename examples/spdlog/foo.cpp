#include <spdlog/spdlog.h>

int main(int argc, char* argv[]) {
  auto console = spdlog::stdout_logger_mt("console");
  console->info("Hello from INFO");
}
