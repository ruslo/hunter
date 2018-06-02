# Copyright (c) 2017, Lukas Solanka
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ros_comm_msgs
    VERSION
    1.11.2-p0
    URL
    "https://github.com/hunter-packages/ros_comm_msgs/archive/v1.11.2-p0.tar.gz"
    SHA1
    "e2fdd9878eb68b16672b57e46f4fc1103f84844a"
)

hunter_cmake_args(
    ros_comm_msgs
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_comm_msgs)
hunter_download(PACKAGE_NAME ros_comm_msgs)
