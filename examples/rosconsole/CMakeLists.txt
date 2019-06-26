# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-rosconsole)

# DOCUMENTATION_START {
hunter_add_package(rosconsole)
find_package(catkin CONFIG REQUIRED COMPONENTS rosconsole)

catkin_package()

add_executable(main main.cpp)
target_link_libraries(main ${catkin_LIBRARIES})
# DOCUMENTATION_END }
