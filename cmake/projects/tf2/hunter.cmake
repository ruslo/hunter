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
    tf2
    VERSION
    0.6.5-p0
    URL
    "https://github.com/hunter-packages/tf2/archive/v0.6.5-p0.tar.gz"
    SHA1
    ac8e28968074c6c386be8ecd2ac5ece29f5b0e06
)

hunter_cmake_args(
    tf2
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tf2)
hunter_download(PACKAGE_NAME tf2)
