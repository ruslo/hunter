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
    ros_genpy
    VERSION
    0.6.7-p0
    URL
    "https://github.com/hunter-packages/ros_genpy/archive/v0.6.7-p0.tar.gz"
    SHA1
    "338e73155207774e6775cb6ed233cdced1606c16"
)

hunter_add_version(
    PACKAGE_NAME
    ros_genpy
    VERSION
    0.6.8-p0
    URL
    "https://github.com/hunter-packages/ros_genpy/archive/v0.6.8-p0.tar.gz"
    SHA1
    "a3bdd772aea7e621ff72ad0d1e4400eb46e03f39"
)

hunter_cmake_args(
    ros_genpy
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_genpy)
hunter_download(PACKAGE_NAME ros_genpy)
