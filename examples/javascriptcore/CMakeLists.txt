# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-javascriptcore)

find_package(javascriptcore REQUIRED)

add_executable(foo foo.mm)
target_link_libraries(foo PUBLIC javascriptcore::javascriptcore)
