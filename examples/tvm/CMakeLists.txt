# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

option(HUNTER_BUILD_SHARED_LIBS "..." ON)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tvm)

# DOCUMENTATION_START {
hunter_add_package(tvm)
find_package(tvm CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC tvm::tvm_runtime)
# DOCUMENTATION_END }
