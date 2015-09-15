# Copyright (c) 2015 Damien Buhl (alias daminetreg)
# All rights reserved.

# Try to find the dbus library.
# It can be used as :
#  
# find_package(dbus REQUIRED)
# target_link_libraries(program dbus::dbus )
#
# It also defines 
#   - ${dbus_INCLUDE_DIRS}
#   - ${dbus_LIBRARY}
#   - ${dbus_LIBRARIES}
#

set(dbus_FOUND OFF)

find_library(dbus_LIBRARY NAMES dbus-1)
set (dbus_LIBRARIES "${dbus_LIBRARY}")
find_path(dbus_INCLUDE_DIRS dbus/dbus.h)

if (dbus_LIBRARY AND dbus_INCLUDE_DIRS)
  set(dbus_FOUND ON)

  if (NOT TARGET "dbus::dbus")
    add_library("dbus::dbus" UNKNOWN IMPORTED)
    set_target_properties("dbus::dbus"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${dbus_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${dbus_LIBRARY}"
    )

  endif()

else()

  if (dbus_FIND_REQUIRED)
    message(SEND_ERROR "Unable to find the requested dbus library.\n")
  else()
    message(STATUS "Unable to find the requested but notrequired dbus library.")
  endif()

endif()
