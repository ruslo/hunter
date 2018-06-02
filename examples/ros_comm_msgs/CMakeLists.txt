# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_ros_comm_msgs)

# DOCUMENTATION_START {

hunter_add_package(ros_comm_msgs)
find_package(catkin CONFIG REQUIRED COMPONENTS rosgraph_msgs std_srvs)

catkin_package()

add_executable(main main.cpp)
target_link_libraries(main ${catkin_LIBRARIES})
target_include_directories(main PRIVATE ${catkin_INCLUDE_DIRS})

# DOCUMENTATION_END }
