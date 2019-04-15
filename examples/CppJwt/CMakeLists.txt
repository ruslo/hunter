# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.12)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-CppJwt)

# DOCUMENTATION_START {
hunter_add_package(CppJwt)
find_package(CppJwt CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC CppJwt::jwt)
# DOCUMENTATION_END }
