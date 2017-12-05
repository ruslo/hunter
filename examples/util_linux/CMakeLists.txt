# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-util_linux)

hunter_add_package(util_linux)

find_package(blkid CONFIG REQUIRED)
find_package(fdisk CONFIG REQUIRED)
find_package(mount CONFIG REQUIRED)
find_package(smartcols CONFIG REQUIRED)
find_package(uuid CONFIG REQUIRED)

add_executable(foo foo.cpp)
target_link_libraries(
    foo
    PUBLIC
    PkgConfig::blkid
    PkgConfig::fdisk
    PkgConfig::mount
    PkgConfig::smartcols
    PkgConfig::uuid
)
