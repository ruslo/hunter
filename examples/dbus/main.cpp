#include <dbus/dbus.h>
#include <iostream>

int main(int argc, char** argv) {
  
  DBusError err;
  dbus_error_init(&err);

  // connect to the bus
  DBusConnection* conn = dbus_bus_get(DBUS_BUS_SESSION, &err);
  if (dbus_error_is_set(&err)) { 
    std::cerr << "Connection Error : " << err.message << std::endl;
    dbus_error_free(&err); 
  }

  if (NULL == conn) { 
    return 1;
  }
}
