# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    FP16
    VERSION
    0.0.0-febbb1c-p0
    URL
    "https://github.com/hunter-packages/FP16/archive/v0.0.0-febbb1c-p0.tar.gz"
    SHA1
    86a7e35a2193e60440ea152628ade89eff4cd0cd
)

hunter_cmake_args(FP16 CMAKE_ARGS FP16_BUILD_BENCHMARKS=OFF FP16_BUILD_TESTS=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(FP16)
hunter_download(PACKAGE_NAME FP16)
