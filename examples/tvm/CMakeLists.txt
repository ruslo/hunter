# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

set(TESTING_CONFIG_OPT FILEPATH ${CMAKE_CURRENT_LIST_DIR}/config.cmake)

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

if(IOS OR ANDROID OR WIN32)
  # tvm::tvm_runtime only
else()
  if(NOT TARGET tvm::tvm_topi)
    message(FATAL_ERROR "tvm::tvm_topi target is missing")
  endif()
endif()
