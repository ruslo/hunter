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
    entityx
    VERSION
    1.3.0-p1
    URL
    "https://github.com/hunter-packages/entityx/archive/v1.3.0-p1.tar.gz"
    SHA1
    8df57150ba8a850ed7250fbd7fd4396a0fa05c22
)

hunter_cmake_args(
    entityx
    CMAKE_ARGS
        ENTITYX_BUILD_TESTING=0
        ENTITYX_RUN_BENCHMARKS=0
        ENTITYX_BUILD_SHARED=0
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(entityx)
hunter_download(PACKAGE_NAME entityx)
