# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ncnn
    VERSION
    20180314-p2
    URL
    "https://github.com/hunter-packages/ncnn/archive/20180314-p2.tar.gz"
    SHA1
    7ae8c7e168206885d18eee3068dee96705841bf7
)

hunter_cmake_args(
    ncnn
    CMAKE_ARGS
        NCNN_LOCAL_TOOLCHAIN=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ncnn)
hunter_download(PACKAGE_NAME ncnn)
