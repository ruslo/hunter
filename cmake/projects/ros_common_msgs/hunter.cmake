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
    ros_common_msgs
    VERSION
    1.12.6-p0
    URL
    "https://github.com/hunter-packages/ros_common_msgs/archive/v1.12.6-p0.tar.gz"
    SHA1
    "9ebf01d2b3e146121c42314acb9629e2322737ae"
)

hunter_add_version(
    PACKAGE_NAME
    ros_common_msgs
    VERSION
    1.12.7-p0
    URL
    "https://github.com/hunter-packages/ros_common_msgs/archive/v1.12.7-p0.tar.gz"
    SHA1
    "353c4058cf50d4359a068109dc91a91076b29053"
)

hunter_cmake_args(
    ros_common_msgs
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_common_msgs)
hunter_download(PACKAGE_NAME ros_common_msgs)
