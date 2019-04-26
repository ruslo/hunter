# Copyright (c) 2019, Pawel Bylica
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(use-intx)

# DOCUMENTATION_START {
hunter_add_package(intx)
find_package(intx CONFIG REQUIRED)

add_executable(use_intx main.cpp)
target_link_libraries(use_intx intx::intx)
# DOCUMENTATION_END }
