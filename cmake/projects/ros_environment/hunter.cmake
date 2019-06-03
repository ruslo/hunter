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
    ros_environment
    VERSION
    1.2.0-p0
    URL
    "https://github.com/hunter-packages/ros_environment/archive/v1.2.0-p0.tar.gz"
    SHA1
    "01068d113b6517496027a01ca91c85030ae8638f"
)

hunter_add_version(
    PACKAGE_NAME
    ros_environment
    VERSION
    1.2.1-p0
    URL
    "https://github.com/hunter-packages/ros_environment/archive/v1.2.1-p0.tar.gz"
    SHA1
    "bbc8d15550fce1478748fadb9170d3a3e5e49460"
)

hunter_cmake_args(
    ros_environment
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ros_environment)
hunter_download(PACKAGE_NAME ros_environment)
