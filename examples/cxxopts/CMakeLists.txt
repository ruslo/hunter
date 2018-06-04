# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-cxxopts)
hunter_add_package(cxxopts)
find_package(cxxopts CONFIG REQUIRED)
string(REPLACE "." ";" VERSION_LIST ${HUNTER_cxxopts_VERSION})
add_executable(foo ./v${HUNTER_cxxopts_VERSION}/example.cpp)
target_link_libraries(foo PUBLIC cxxopts::cxxopts)
