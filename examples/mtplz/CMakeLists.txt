# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mtplz)

# download boost.compute
hunter_add_package(mtplz)

# now boost.compute can be used
find_package(mtplz CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo mtplz::mtplz_decode)
