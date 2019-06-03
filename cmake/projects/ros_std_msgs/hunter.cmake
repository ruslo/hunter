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
    ros_std_msgs
    VERSION
    0.5.11-p1
    URL
    "https://github.com/hunter-packages/ros_std_msgs/archive/v0.5.11-p1.tar.gz"
    SHA1
    "04ad9f0e155b27870c7ad2293ace496523f2e960"
)

hunter_add_version(
    PACKAGE_NAME
    ros_std_msgs
    VERSION
    0.5.12-p0
    URL
    "https://github.com/hunter-packages/ros_std_msgs/archive/v0.5.12-p0.tar.gz"
    SHA1
    "68f90e7d9611da0d18f3aab520d76b03e685e5a0"
)

hunter_cmake_args(
    ros_std_msgs
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_std_msgs)
hunter_download(PACKAGE_NAME ros_std_msgs)
