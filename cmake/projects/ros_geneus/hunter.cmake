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
    ros_geneus
    VERSION
    2.2.6-p0
    URL
    "https://github.com/hunter-packages/ros_geneus/archive/v2.2.6-p0.tar.gz"
    SHA1
    "938a53b42aefca1a1d80384bc5f43ba83e4eed88"
)

hunter_cmake_args(
    ros_geneus
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_geneus)
hunter_download(PACKAGE_NAME ros_geneus)
