# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-crashup)

# download crashup
hunter_add_package(crashup)

# now crashup can be used
find_package(crashup CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo crashup::crashup)
