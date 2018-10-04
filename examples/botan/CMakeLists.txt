# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(botan-example)

# DOCUMENTATION_START {
hunter_add_package(botan)
find_package(botan-2 CONFIG REQUIRED)

add_executable(bte boo.cpp)
target_link_libraries(bte PUBLIC PkgConfig::botan-2)
# DOCUMENTATION_END }
