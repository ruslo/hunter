# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-zlib)

# download gtest
hunter_add_package(ZLIB)

# now gtest can be used
find_package(ZLIB CONFIG REQUIRED)

add_executable(foo main.c)
target_link_libraries(foo ZLIB::zlib)

# Compatibility mode
find_package(ZLIB REQUIRED)
string(COMPARE EQUAL "${ZLIB_INCLUDE_DIRS}" "" is_empty)
if(is_empty)
  message(FATAL_ERROR "Expected non-empty")
endif()

string(COMPARE EQUAL "${ZLIB_LIBRARIES}" "ZLIB::zlib" is_good)
if(NOT is_good)
  message(FATAL_ERROR "Expected ZLIB::zlib but not ${ZLIB_LIBRARIES}")
endif()

include_directories("${ZLIB_INCLUDE_DIRS}")
target_link_libraries(foo ${ZLIB_LIBRARIES})
