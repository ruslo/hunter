# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.0.0-p0
    URL
    "https://github.com/hunter-packages/cxxopts/archive/v1.0.0-p0.tar.gz"
    SHA1
    90040ef52faf71686febb0f93a3189cd9ea36ede
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cxxopts)
hunter_cmake_args(
    cxxopts
    CMAKE_ARGS
    CXXOPTS_BUILD_EXAMPLES=OFF
    CXXOPTS_BUILD_TESTS=OFF
    CXXOPTS_USE_UNICODE_HELP=OFF
)
hunter_download(PACKAGE_NAME cxxopts)
