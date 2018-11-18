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
    lehrfempp
    VERSION
    0.7.0
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.1.tar.gz"
    SHA1
    4460d8a14f529226e68ceee1fd3bebab04aa6b9d
)

hunter_cmake_args(
    lehrfempp
    CMAKE_ARGS
        LF_ENABLE_TESTING=OFF
        LF_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lehrfempp)
hunter_download(PACKAGE_NAME lehrfempp)
