# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gauze)

hunter_add_package(gauze)
find_package(gauze CONFIG REQUIRED)

add_executable(foo foo.cpp)

gauze_add_test(NAME foo COMMAND foo)
