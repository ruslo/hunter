#include <iostream>
#include <console_bridge/console.h>

int main() {
    console_bridge::setLogLevel(console_bridge::CONSOLE_BRIDGE_LOG_INFO);
    int level = console_bridge::getLogLevel();
    std::cout << level;
}
