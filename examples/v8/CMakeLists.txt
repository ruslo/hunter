# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-v8)

# DOCUMENTATION_START {
hunter_add_package(v8)
find_package(v8 CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(
    boo
    PUBLIC
    v8::v8_libplatform
    v8::v8_libbase
    v8::v8_base
    v8::v8_nosnapshot
    v8::v8_init
    v8::v8_initializers
    v8::v8_libsampler
)
# DOCUMENTATION_END }
