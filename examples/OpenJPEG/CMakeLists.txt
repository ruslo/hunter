# Copyright (c) 2013-2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-openjpeg)

# download gtest
hunter_add_package(OpenJPEG)

# now gtest can be used
find_package(OpenJPEG CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(foo OpenJPEG::OpenJPEG)
