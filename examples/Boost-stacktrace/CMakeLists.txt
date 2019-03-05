# Copyright (c) 2013-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost)

hunter_add_package(Boost COMPONENTS stacktrace)
find_package(Boost CONFIG REQUIRED stacktrace_backtrace)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::stacktrace_backtrace)
