# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ArrayFire
    VERSION
    3.3.1-p0
    URL
    "https://github.com/hunter-packages/arrayfire/archive/v3.3.1-p0.tar.gz"
    SHA1
    f219af6a83eec2743d21f7cfc74b9d9a63c9058e
)

hunter_add_version(
    PACKAGE_NAME
    ArrayFire
    VERSION
    3.3.alpha-p0
    URL
    "https://github.com/hunter-packages/arrayfire/archive/v3.3.alpha-p0.tar.gz"
    SHA1
    70fdc7d4517129fe0f91255c1c4f8841840ed501
)

hunter_cmake_args(
    ArrayFire
    CMAKE_ARGS BUILD_TEST=OFF BUILD_EXAMPLES=OFF BUILD_GRAPHICS=OFF
    # segmentation fault for static libraries
    # * https://github.com/headupinclouds/gatherer/issues/85#issuecomment-186376763
    BUILD_SHARED_LIBS=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ArrayFire)
hunter_download(PACKAGE_NAME ArrayFire)
