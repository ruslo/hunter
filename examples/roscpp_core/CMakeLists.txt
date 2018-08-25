# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_roscpp_core)

# DOCUMENTATION_START {

hunter_add_package(roscpp_core)
find_package(catkin CONFIG REQUIRED COMPONENTS cpp_common rostime
    roscpp_serialization roscpp_traits)

catkin_package()

add_executable(main main.cpp)
target_link_libraries(main ${catkin_LIBRARIES})
# DOCUMENTATION_END }
