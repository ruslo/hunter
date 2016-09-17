# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-eos)

# workaround {
hunter_add_package(Jpeg)
find_package(JPEG CONFIG REQUIRED)
# }

hunter_add_package(eos)
find_package(eos CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo eos::eos)
