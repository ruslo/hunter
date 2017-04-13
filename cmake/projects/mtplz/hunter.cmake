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

hunter_add_version(
    PACKAGE_NAME
    mtplz
    VERSION
    0.1-p3
    URL
    "https://github.com/hunter-packages/mtplz/archive/v0.1-p3.tar.gz"
    SHA1
    22a29dbe58a86e4e91e1abeb1ab4c67cf3ceca79
)

hunter_cmake_args(
    mtplz
    CMAKE_ARGS
    BUILD_TESTING=OFF
    MTPLZ_BUILD_EXE=OFF
    MTPLZ_BUILD_KENLM_INTERPOLATE=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mtplz)
hunter_download(PACKAGE_NAME mtplz)
