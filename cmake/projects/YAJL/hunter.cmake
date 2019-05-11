# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    YAJL
    VERSION
    2.1.0-p0
    URL
    "https://github.com/hunter-packages/yajl/archive/v2.1.0-p0.tar.gz"
    SHA1
    d2dc11da34efb5148e6b84f43ba08783f1aefef4
)

hunter_cmake_args(
    YAJL
    CMAKE_ARGS
        YAJL_BUILD_TOOLS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(YAJL)
hunter_download(PACKAGE_NAME YAJL)
