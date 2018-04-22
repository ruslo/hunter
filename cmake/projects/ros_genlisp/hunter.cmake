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
    ros_genlisp
    VERSION
    0.4.16-p0
    URL
    "https://github.com/hunter-packages/ros_genlisp/archive/v0.4.16-p0.tar.gz"
    SHA1
    "5077d8b5cf48f4224fc13659eccd5d7b89062609"
)

hunter_cmake_args(
    ros_genlisp
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_genlisp)
hunter_download(PACKAGE_NAME ros_genlisp)
