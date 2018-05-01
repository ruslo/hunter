# Copyright (c) 2018, Ruslan Baratov
# Copyright (c) 2018, Mathieu-Andre Chiasson
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-webp)

# DOCUMENTATION_START {
hunter_add_package(WebP)
find_package(WebP CONFIG REQUIRED)
add_executable(main main.cpp)
target_link_libraries(main WebP::webp)
# DOCUMENTATION_END }

