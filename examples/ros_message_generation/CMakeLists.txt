# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_ros_message_generation)

# DOCUMENTATION_START {
hunter_add_package(ros_message_generation)
find_package(catkin CONFIG REQUIRED COMPONENTS message_generation)

add_message_files(FILES dummy.msg)
generate_messages()

catkin_package()
# DOCUMENTATION_END }
