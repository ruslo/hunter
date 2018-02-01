# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mojoshader)

hunter_add_package(mojoshader)
find_package(mojoshader CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC mojoshader::mojoshader)
