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
    actionlib
    VERSION
    1.11.13-p0
    URL
    "https://github.com/hunter-packages/actionlib/archive/v1.11.13-p0.tar.gz"
    SHA1
    f8efaa72ea2d28727832b99b1900f1c1bd21c438
)

hunter_cmake_args(
    actionlib
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(actionlib)
hunter_download(PACKAGE_NAME actionlib)
