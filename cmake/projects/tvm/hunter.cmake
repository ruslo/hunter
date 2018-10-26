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
    tvm
    VERSION
    0.4-0f053c8-p0
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.4-0f053c8-p0.tar.gz"
    SHA1
    1c28b3246e3f5ecb6f985899a5b078a1cb81f85b
)

hunter_cmake_args(
    tvm
    CMAKE_ARGS
    INSTALL_DEV=ON
    BUILD_NNVM_ONLY=ON
    BUILD_NNVM_REDUCED=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tvm)
hunter_download(PACKAGE_NAME tvm)
