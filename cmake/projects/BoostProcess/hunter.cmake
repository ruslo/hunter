# Copyright (c) 2016, Alexander Lamaison
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    BoostProcess
    VERSION
    0.5
    URL
    "https://github.com/alamaison/boost-process/archive/0.5-cmake-1.tar.gz"
    SHA1
    4142d7fc128f51ce0035dc1aad5d3ea2209b6b6e
)

hunter_cmake_args(
    BoostProcess
    CMAKE_ARGS
        BUILD_TESTING=OFF
        BOOST_PROCESS_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(BoostProcess)
hunter_download(PACKAGE_NAME BoostProcess)
