# Copyright (c) 2015, David Hirvonen
# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cereal)

hunter_add_package(cereal)
find_package(cereal CONFIG REQUIRED)

add_executable(cereal cereal.cpp)
target_link_libraries(cereal cereal::cereal)
