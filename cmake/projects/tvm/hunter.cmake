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

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.4-0f053c8-p3
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.4-0f053c8-p3.tar.gz"
    SHA1
    7c721091b437ccbe20c706f194b68dbff3acd712
)

hunter_add_version(
    PACKAGE_NAME
    tvm
    VERSION
    0.4-0f053c8-p4
    URL
    "https://github.com/hunter-packages/tvm/archive/v0.4-0f053c8-p4.tar.gz"
    SHA1
    3cdbec21b8766f7f51abc78d957fe398c70470a5
)

hunter_cmake_args(
    tvm
    CMAKE_ARGS
    INSTALL_DEV=ON
    INSTALL_NNVM_SOURCES=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tvm)
hunter_download(PACKAGE_NAME tvm)
