# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-tacopie)

# download tacopie
hunter_add_package(tacopie)

# now tacopie can be used
find_package(tacopie CONFIG REQUIRED)

add_executable(foo foo.cpp)
set_property(TARGET foo PROPERTY CXX_STANDARD 11)

target_link_libraries(foo tacopie::tacopie)
