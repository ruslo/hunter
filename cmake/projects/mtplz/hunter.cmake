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
    mtplz
    VERSION
    0.1-p1
    URL
    "https://github.com/hunter-packages/mtplz/archive/v0.1-p1.tar.gz"
    SHA1
    3323b6a97afefa0cc008785caa37b43681c9589e
)

hunter_cmake_args(mtplz CMAKE_ARGS BUILD_TESTING=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mtplz)
hunter_download(PACKAGE_NAME mtplz)
