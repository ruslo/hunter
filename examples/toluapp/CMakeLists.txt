# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

set(TESTING_CONFIG_OPT FILEPATH "${CMAKE_CURRENT_LIST_DIR}/config.cmake")

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-toluapp)

# DOCUMENTATION_START {
hunter_add_package(toluapp)
find_package(toluapp CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC toluapp::toluapp)
# DOCUMENTATION_END }
