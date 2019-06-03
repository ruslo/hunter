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
    ros_gencpp
    VERSION
    0.6.0-p0
    URL
    "https://github.com/hunter-packages/ros_gencpp/archive/v0.6.0-p0.tar.gz"
    SHA1
    "90c7728fae3f69c8072a9611b9ec1f92b3254bd1"
)

hunter_add_version(
    PACKAGE_NAME
    ros_gencpp
    VERSION
    0.6.2-p0
    URL
    "https://github.com/hunter-packages/ros_gencpp/archive/v0.6.2-p0.tar.gz"
    SHA1
    "be49ad6ad32cd8879fdd418fe2cc0c10db9a7d45"
)

hunter_cmake_args(
    ros_gencpp
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_gencpp)
hunter_download(PACKAGE_NAME ros_gencpp)
