# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tinydir)

# download tinydir
hunter_add_package(tinydir)

# now tinydir can be used
find_package(tinydir CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo tinydir::tinydir)
