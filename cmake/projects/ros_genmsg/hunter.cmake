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
    ros_genmsg
    VERSION
    0.5.10-p0
    URL
    "https://github.com/hunter-packages/ros_genmsg/archive/v0.5.10-p0.tar.gz"
    SHA1
    "3003f752c6b9d5a6c5771dd1448b61011cfcc63d"
)

hunter_add_version(
    PACKAGE_NAME
    ros_genmsg
    VERSION
    0.5.12-p0
    URL
    "https://github.com/hunter-packages/ros_genmsg/archive/v0.5.12-p0.tar.gz"
    SHA1
    "e4009ea247bfb3683700f0e3097fc1b9a884a378"
)

hunter_cmake_args(
    ros_genmsg
    CMAKE_ARGS
        CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_genmsg)
hunter_download(PACKAGE_NAME ros_genmsg)
