# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-EnTT)

# DOCUMENTATION_START {
hunter_add_package(EnTT)
find_package(EnTT CONFIG REQUIRED)

add_executable(foo foo.cpp)

target_link_libraries(foo EnTT)
# DOCUMENTATION_END }

