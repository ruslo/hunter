cmake_minimum_required(VERSION 3.0)

include("../common.cmake")

project(download-autoutils)

# DOCUMENTATION_START {
# download autoutils
hunter_add_package(autoutils)
find_package(autoutils CONFIG REQUIRED)

# include modules
include(AutoutilsCheckHeader)

autoutils_check_header("stdio.h")
if(NOT HAVE_STDIO_H)
  message(FATAL_ERROR "Cannot find stdio.h")
endif()
# DOCUMENTATION_END }
