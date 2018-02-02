# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-drishti)

# DOCUMENTATION_START {
hunter_add_package(drishti)
find_package(drishti CONFIG REQUIRED)

add_executable(drishti foo.cpp)
target_link_libraries(drishti PUBLIC drishti::drishti)
# DOCUMENTATION_END }
