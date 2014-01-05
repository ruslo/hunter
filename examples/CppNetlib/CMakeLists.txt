# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 2.8.12)
project(download-cppnetlib)

# Let hunter be more verbose
set(HUNTER_STATUS_DEBUG ON CACHE BOOL "")

# emulate ${HUNTER_ROOT}/Source/cmake/Hunter
include("../common.cmake")
include(hunter_add_package)

# download boost
hunter_add_package(CppNetlib)

# now cppnetlib can be used
find_package(CppNetlib REQUIRED)
message("cppnetlib include: ${CPPNETLIB_INCLUDE_DIR}")
message("cppnetlib libs: ${CPPNETLIB_LIBRARIES}")
