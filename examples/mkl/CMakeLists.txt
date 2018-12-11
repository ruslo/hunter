# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-mkl)

# DOCUMENTATION_START {
hunter_add_package(mkl)

include_directories("${MKL_ROOT}/include")

add_executable(boo boo.cpp)
# DOCUMENTATION_END }
