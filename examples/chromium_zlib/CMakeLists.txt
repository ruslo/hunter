# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-chromium_zlib)

# DOCUMENTATION_START {
hunter_add_package(chromium_zlib)
find_package(ZLIB CONFIG REQUIRED)

add_executable(boo main.c)
target_link_libraries(boo PUBLIC ZLIB::ZLIB)
# DOCUMENTATION_END }
