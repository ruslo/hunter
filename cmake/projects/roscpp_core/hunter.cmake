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
    roscpp_core
    VERSION
    0.6.9-p0
    URL
    "https://github.com/hunter-packages/roscpp_core/archive/v0.6.9-p0.tar.gz"
    SHA1
    "22a95f07bc397c188eba1b578ddbbe5ae114c82c"
)

hunter_cmake_args(
    roscpp_core
    CMAKE_ARGS
        CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(roscpp_core)
hunter_download(PACKAGE_NAME roscpp_core)
