# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    ros_comm
    VERSION
    1.14.3-p1
    URL
    "https://github.com/hunter-packages/ros_comm/archive/v1.14.3-p1.tar.gz"
    SHA1
    132f614a7ce4d5765ecdba8cc31c7f3504ef046f
)

hunter_cmake_args(
    ros_comm
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_comm)
hunter_download(PACKAGE_NAME ros_comm)
