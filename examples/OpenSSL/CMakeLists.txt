# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-openssl)

# download gtest
hunter_add_package(OpenSSL)

if(NOT EXISTS "${OpenSSL_LICENSES}")
  message(FATAL_ERROR "File not found: ${OpenSSL_LICENSES}")
endif()

message("License: ${OpenSSL_LICENSES}")

# now gtest can be used
find_package(OpenSSL REQUIRED)
include_directories("${OPENSSL_INCLUDE_DIR}")

add_executable(foo foo.cpp)
target_link_libraries(foo ${OPENSSL_LIBRARIES})
