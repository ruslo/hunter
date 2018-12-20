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
    1.3.0-p0
    URL
    "C:/Code/hunter/archives/entityx-1.3.0-p0.tar.gz"
    SHA1
    3cedeff793590bdc83f4ee07ad63aff8c3e72da3
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
