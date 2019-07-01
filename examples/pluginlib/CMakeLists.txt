# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-pluginlib)

# DOCUMENTATION_START {
hunter_add_package(pluginlib)
find_package(catkin CONFIG REQUIRED COMPONENTS pluginlib)

catkin_package()

add_executable(main main.cpp)
target_link_libraries(main ${catkin_LIBRARIES})
# DOCUMENTATION_END }
