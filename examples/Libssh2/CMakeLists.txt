# Copyright (c) 2014, Ruslan Baratov
# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-libssh2)

hunter_add_package(Libssh2)

find_package(Libssh2 CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo Libssh2::libssh2)
