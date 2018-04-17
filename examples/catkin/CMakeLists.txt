# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.0)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download_catkin)

# DOCUMENTATION_START {
hunter_add_package(catkin)
find_package(catkin CONFIG REQUIRED)

catkin_package()
# DOCUMENTATION_END }
