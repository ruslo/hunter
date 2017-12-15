# Copyright (c) 2017, Pawel Bylica
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-boost-random)

hunter_add_package(Boost COMPONENTS random)
find_package(Boost CONFIG REQUIRED random)

add_executable(foo foo.cpp)
target_link_libraries(foo PUBLIC Boost::random)
