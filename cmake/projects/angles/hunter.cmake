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
    angles
    VERSION
    1.9.11-p0
    URL
    "https://github.com/hunter-packages/angles/archive/v1.9.11-p0.tar.gz"
    SHA1
    455a91947b1f81dba5769a6b6b59e00b2208119f
)

hunter_cmake_args(
    angles
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(angles)
hunter_download(PACKAGE_NAME angles)
