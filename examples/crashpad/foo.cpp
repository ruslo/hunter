#include <client/crashpad_client.h>

int main() {
  crashpad::CrashpadClient* client = new crashpad::CrashpadClient();
  delete client;
}
