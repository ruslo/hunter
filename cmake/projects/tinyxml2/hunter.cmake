# Copyright (c) 2014-2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tinyxml2
    VERSION
    "6.2.0-p1"
    URL
    "https://github.com/hunter-packages/tinyxml2/archive/v6.2.0-p1.tar.gz"
    SHA1
    "a457140cf6d889d71280433127eaac89cf04c94a"
)

hunter_cmake_args(
    tinyxml2
    CMAKE_ARGS
    BUILD_TESTING:BOOL=false
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinyxml2)
hunter_download(PACKAGE_NAME tinyxml2)
