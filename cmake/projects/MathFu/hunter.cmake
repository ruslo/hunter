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
    MathFu
    VERSION
    1.1.0-p0
    URL
    "https://github.com/hunter-packages/mathfu/archive/v1.1.0-p0.tar.gz"
    SHA1
    8ab4c19240e65e406ec2fcb8c6886d9030ca9d83
)

hunter_cmake_args(
    MathFu
    CMAKE_ARGS
        mathfu_build_benchmarks=OFF
        mathfu_build_tests=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(MathFu)
hunter_download(PACKAGE_NAME MathFu)
