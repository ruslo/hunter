# Copyright (c) 2015, Oliver Daniell
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-hdf5)

hunter_add_package(hdf5)

find_package(ZLIB CONFIG REQUIRED)
find_package(szip CONFIG REQUIRED)
find_package(hdf5 CONFIG REQUIRED)

add_executable(foo h5_write.c)
target_link_libraries(foo hdf5)
