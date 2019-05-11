#include <spdlog/spdlog.h>
#include <spdlog/sinks/stdout_sinks.h>

int main(int argc, char* argv[]) {
  auto console = spdlog::stdout_logger_mt("console");
  console->info("Hello from INFO");
  return 0;
}
