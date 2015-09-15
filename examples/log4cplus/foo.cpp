#include <log4cplus/logger.h>
#include <log4cplus/loggingmacros.h>
#include <log4cplus/configurator.h>
#include <iomanip>

using namespace log4cplus;

int main() {
  initialize();
  BasicConfigurator config;
  config.configure();

  Logger logger = Logger::getInstance(LOG4CPLUS_TEXT("main"));
  LOG4CPLUS_WARN(logger, LOG4CPLUS_TEXT("Hello, World!"));
}
