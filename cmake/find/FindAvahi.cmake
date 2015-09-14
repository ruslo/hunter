# Copyright (c) 2015 Damien Buhl (alias daminetreg)
# All rights reserved.

# Try to find Avahi client and libdns_sd_compat library.
# It can be used as :
#  
# find_package(Avahi REQUIRED)
# target_link_libraries(program Avahi::client Avahi::compat_libdns_sd)
#

set(Avahi_FOUND OFF)
set(Avahi_COMMON_FOUND OFF)
set(Avahi_CLIENT_FOUND OFF)
set(Avahi_COMPAT_LIBDNS_SD_FOUND OFF)

# avahi-common & avahi-client
find_library(Avahi_COMMON_LIBRARY NAMES avahi-common)
find_library(Avahi_CLIENT_LIBRARY NAMES avahi-client)
find_path(Avahi_CLIENT_INCLUDE_DIRS avahi-client/publish.h)

if (Avahi_COMMON_LIBRARY AND Avahi_CLIENT_LIBRARY AND Avahi_CLIENT_INCLUDE_DIRS)
  set(Avahi_FOUND ON)
  set(Avahi_COMMON_FOUND ON)
  set(Avahi_CLIENT_FOUND ON)

  if (NOT TARGET "Avahi::common")
    add_library("Avahi::common" UNKNOWN IMPORTED)
    set_target_properties("Avahi::common"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${Avahi_CLIENT_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${Avahi_COMMON_LIBRARY}"
    )

  endif()

  if(NOT TARGET "Avahi::client")
    add_library("Avahi::client" UNKNOWN IMPORTED)
    set_target_properties("Avahi::client"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${Avahi_CLIENT_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${Avahi_CLIENT_LIBRARY}"
      INTERFACE_LINK_LIBRARIES "Avahi::common"
    )
    get_filename_component(AVAHI_LIB_DIR "${Avahi_COMMON_LIBRARY}" DIRECTORY CACHE)

  endif()

endif()

# avahi-compat-libdns_sd
find_library(Avahi_COMPAT_LIBDNS_SD_LIBRARY NAMES dns_sd)
find_path(Avahi_COMPAT_LIBDNS_SD_INCLUDE_DIRS avahi-compat-libdns_sd/dns_sd.h) 

if (Avahi_COMPAT_LIBDNS_SD_LIBRARY)
  set(Avahi_COMPAT_LIBDNS_SD_FOUND ON)

  if(NOT TARGET "Avahi::compat_libdns_sd")
    add_library("Avahi::compat_libdns_sd" UNKNOWN IMPORTED)
    set_target_properties("Avahi::compat_libdns_sd"
      PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${Avahi_COMPAT_LIBDNS_SD_INCLUDE_DIRS}"
      IMPORTED_LOCATION "${Avahi_COMPAT_LIBDNS_SD_LIBRARY}"
      INTERFACE_LINK_LIBRARIES "Avahi::client"
      INTERFACE_LINK_LIBRARIES "Avahi::common"
    )

  endif()

endif()

set(_Avahi_MISSING_COMPONENTS "")
foreach(COMPONENT ${Avahi_FIND_COMPONENTS})
  string(TOUPPER ${COMPONENT} COMPONENT)

  if(NOT Avahi_${COMPONENT}_FOUND)
    string(TOLOWER ${COMPONENT} COMPONENT)
    list(APPEND _Avahi_MISSING_COMPONENTS ${COMPONENT})
  endif()
endforeach()

if (_Avahi_MISSING_COMPONENTS)
  set(Avahi_FOUND OFF)

  set(Avahi_ERROR_REASON
      "${Avahi_ERROR_REASON}\nCould not find the following")
  set(Avahi_ERROR_REASON
    "${Avahi_ERROR_REASON} Avahi libraries:\n")
  foreach(COMPONENT ${_Avahi_MISSING_COMPONENTS})
    set(Avahi_ERROR_REASON
      "${Avahi_ERROR_REASON}        ${COMPONENT}\n")
  endforeach()

  if (Avahi_FIND_REQUIRED)
    message(SEND_ERROR "Unable to find the requested Avahi libraries.\n${Avahi_ERROR_REASON}")
  else()
    message(STATUS "Unable to find the requested but not required Avahi libraries.\n${Avahi_ERROR_REASON}")
  endif()

endif()


if(Avahi_FOUND)
  set(Avahi_LIBRARIES ${Avahi_COMMON_LIBRARY} ${Avahi_CLIENT_LIBRARY} ${Avahi_COMPAT_LIBDNS_SD_LIBRARY})
  set(Avahi_INCLUDE_DIRS ${Avahi_CLIENT_INCLUDE_DIRS} ${Avahi_COMPAT_LIBDNS_SD_INCLUDE_DIRS})
endif()
