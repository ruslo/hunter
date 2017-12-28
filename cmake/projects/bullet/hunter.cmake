# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    bullet
    VERSION
    2.87-p0
    URL
    "https://github.com/hunter-packages/bullet3/archive/2.87-p0.tar.gz"
    SHA1
    7cd3e8b27b081d4c7f7503c3270009d7dc052a0f
)

hunter_cmake_args(
    bullet
    CMAKE_ARGS
    BUILD_BULLET2_DEMOS=OFF
    BUILD_BULLET3=OFF
    BUILD_EXTRAS=OFF
    BUILD_OPENGL3_DEMOS=OFF
    BUILD_UNIT_TESTS=OFF
    INSTALL_LIBS=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(bullet)
hunter_download(PACKAGE_NAME bullet)
