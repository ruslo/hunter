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
    RedisClient
    VERSION
    0.6.1-p1
    URL
    "https://github.com/hunter-packages/redisclient/archive/v0.6.1-p1.tar.gz"
    SHA1
    0f105334715b512a6c08118b232f6b2f05ce8274
)

hunter_cmake_args(
    RedisClient
    CMAKE_ARGS
    BUILD_TEST=OFF
    BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(RedisClient)
hunter_download(PACKAGE_NAME RedisClient)
