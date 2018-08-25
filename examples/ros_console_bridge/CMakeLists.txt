# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-ros_console_bridge)

# DOCUMENTATION_START {
hunter_add_package(ros_console_bridge)
find_package(console_bridge CONFIG REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC ros::console_bridge)
# DOCUMENTATION_END }
