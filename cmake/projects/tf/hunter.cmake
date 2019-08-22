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
    tf
    VERSION
    1.12.0-p0
    URL
    "https://github.com/hunter-packages/tf/archive/v1.12.0-p0.tar.gz"
    SHA1
    349b34bc9fe31e2f372d52e8b0b03002e229cc2c
)

hunter_cmake_args(
    tf
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tf)
hunter_download(PACKAGE_NAME tf)
