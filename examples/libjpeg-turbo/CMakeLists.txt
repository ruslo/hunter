# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-libjpeg-turbo)

# DOCUMENTATION_START {
hunter_add_package(libjpeg-turbo)
find_package(libjpeg-turbo CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC libjpeg-turbo::jpeg-static)
# DOCUMENTATION_END }
