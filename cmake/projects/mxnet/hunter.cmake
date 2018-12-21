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
    mxnet
    VERSION
    0.0.0-5b86701f2-p0
    URL
    "https://github.com/hunter-packages/mxnet/archive/0.0.0-5b86701f2-p0.tar.gz"
    SHA1
    8b7d898d2f474bef2ca436cca2c2ab15483535cd
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    0.0.0-5b86701f2-p1
    URL
    "https://github.com/hunter-packages/mxnet/archive/0.0.0-5b86701f2-p1.tar.gz"
    SHA1
    71c01aaa65448f4826e2ec4cadb44987370d664f
)

hunter_add_version(
    PACKAGE_NAME
    mxnet
    VERSION
    0.0.0-5b86701f2-p2
    URL
    "https://github.com/hunter-packages/mxnet/archive/0.0.0-5b86701f2-p2.tar.gz"
    SHA1
    60c4d0ef4b9ac35e6a23c5482a1702da7e377d5c
)


hunter_cmake_args(
    mxnet
    CMAKE_ARGS
    BUILD_CPP_EXAMPLES=OFF
    BUILD_TESTS=OFF
    USE_CPP_PACKAGE=ON
    USE_GPERFTOOLS=OFF
    USE_JEMALLOC=OFF
    USE_OPENMP=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mxnet)
hunter_download(PACKAGE_NAME mxnet)
