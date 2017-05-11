# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cpp_redis)

# download cpp_redis
hunter_add_package(cpp_redis)

# now cpp_redis can be used
find_package(cpp_redis CONFIG REQUIRED)

add_executable(foo foo.cpp)
set_property(TARGET foo PROPERTY CXX_STANDARD 11)
target_link_libraries(foo cpp_redis::cpp_redis)
