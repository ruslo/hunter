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
    ros_gennodejs
    VERSION
    2.0.1-p0
    URL
    "https://github.com/hunter-packages/ros_gennodejs/archive/v2.0.1-p0.tar.gz"
    SHA1
    "b8e6744d0aabd8422d4e367044093d8a3c122c50"
)

hunter_cmake_args(
    ros_gennodejs
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_gennodejs)
hunter_download(PACKAGE_NAME ros_gennodejs)
