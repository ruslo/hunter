# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-thread-pool-cpp)

# download thread-pool-cpp
hunter_add_package(thread-pool-cpp)

# now thread-pool-cpp can be used
find_package(thread-pool-cpp CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo thread-pool-cpp::thread-pool-cpp)
