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
    ros_message_generation
    VERSION
    0.4.0-p0
    URL
    "https://github.com/hunter-packages/ros_message_generation/archive/v0.4.0-p0.tar.gz"
    SHA1
    "39b034628b13dbf1c7b601a9b2f8d768f776bf65"
)

hunter_cmake_args(
    ros_message_generation
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_message_generation)
hunter_download(PACKAGE_NAME ros_message_generation)
