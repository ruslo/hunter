# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cppcodec
    VERSION
    0.2-p0
    URL
    "https://github.com/hunter-packages/cppcodec/archive/v0.2-p0.tar.gz"
    SHA1
    9c52a769670a0fec4fc524fc036fa792fbb3e22e
)

hunter_cmake_args(
    cppcodec
    CMAKE_ARGS
        BUILD_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cppcodec)
hunter_download(PACKAGE_NAME cppcodec)
