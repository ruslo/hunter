cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-autoutils)

# download autoutils
hunter_add_package(autoutils)

if(NOT EXISTS "${autoutils_LICENSES}")
  message(FATAL_ERROR "File not found: '${autoutils_LICENSES}'")
endif()

message("License: '${autoutils_LICENSES}'")

# now autoutils can be used
list(APPEND CMAKE_MODULE_PATH "${AUTOUTILS_ROOT}/cmake")
include(CheckHeader)

# try some function
check_header("stdio.h")
if(NOT HAVE_STDIO_H)
  message(FATAL_ERROR "Cannot find stdio.h")
endif()
