# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-sentencepiece)

# DOCUMENTATION_START {
hunter_add_package(sentencepiece)
find_package(sentencepiece CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC sentencepiece::sentencepiece)
# DOCUMENTATION_END }
