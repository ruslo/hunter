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
    ros_message_runtime
    VERSION
    0.4.12-p0
    URL
    "https://github.com/hunter-packages/ros_message_runtime/archive/v0.4.12-p0.tar.gz"
    SHA1
    "54be9c1294b298388fc975fae73d5d155ca7e290"
)

hunter_cmake_args(
    ros_message_runtime
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_message_runtime)
hunter_download(PACKAGE_NAME ros_message_runtime)
