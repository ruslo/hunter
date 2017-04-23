# Copyright (c) 2017, Aaditya Kalsi
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-libuv)

# download libuv
hunter_add_package(libuv)

if(NOT EXISTS "${libuv_LICENSES}")
  message(FATAL_ERROR "File not found: ${libuv_LICENSES}")
endif()

message("License: ${libuv_LICENSES}")
message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")

find_package(libuv CONFIG REQUIRED)
add_executable(example example.c)

target_link_libraries(example libuv::uv)

enable_testing()

add_test(example example)
