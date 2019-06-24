# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(pgtl-example)

# DOCUMENTATION_START {
hunter_add_package(pegtl)
find_package(pegtl CONFIG REQUIRED)

add_executable(pex boo.cpp)
target_link_libraries(pex PUBLIC taocpp::pegtl)
# DOCUMENTATION_END }
