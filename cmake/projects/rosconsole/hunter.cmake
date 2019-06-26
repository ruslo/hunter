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
    rosconsole
    VERSION
    1.13.10-p0
    URL
    "https://github.com/hunter-packages/rosconsole/archive/v1.13.10-p0.tar.gz"
    SHA1
    293826e85d2f22677ea3a738c0d1d28ca18334ca
)

hunter_cmake_args(
    rosconsole
    CMAKE_ARGS
    CATKIN_ENABLE_TESTING:BOOL=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(rosconsole)
hunter_download(PACKAGE_NAME rosconsole)
