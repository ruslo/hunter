# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-crashpad)

# download crashpad
hunter_add_package(crashpad)

# now crashpad can be used
find_package(crashpad CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo crashpad::crashpad_client)
