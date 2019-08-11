# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_ros_comm)

# DOCUMENTATION_START {

hunter_add_package(ros_comm)
find_package(catkin CONFIG REQUIRED COMPONENTS roscpp
    rosbag rosbag_storage topic_tools message_filters roslz4 xmlrpcpp)

catkin_package()

add_executable(main main.cpp)
target_link_libraries(main ${catkin_LIBRARIES})
# DOCUMENTATION_END }
