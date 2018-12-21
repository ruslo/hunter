# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-SimpleSignal)

# DOCUMENTATION_START {
hunter_add_package(SimpleSignal)
find_package(SimpleSignal CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC SimpleSignal::SimpleSignal)
# DOCUMENTATION_END }
