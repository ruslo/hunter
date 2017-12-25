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
# DOCUMENTATION_START {
list(APPEND CMAKE_MODULE_PATH "${AUTOUTILS_ROOT}/cmake")
include(AutoutilsCheckHeader)

# try some function
autoutils_check_header("stdio.h")
if(NOT HAVE_STDIO_H)
  message(FATAL_ERROR "Cannot find stdio.h")
endif()
# DOCUMENTATION_END }
