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
    mkldnn
    VERSION
    0.14-p0
    URL
    "https://github.com/hunter-packages/mkldnn/archive/v0.14-p0.tar.gz"
    SHA1
    374092d906d8163491d96907095727429fed776e
)

hunter_add_version(
    PACKAGE_NAME
    mkldnn
    VERSION
    0.17.4-p0
    URL
    "https://github.com/hunter-packages/mkldnn/archive/v0.17.4-p0.tar.gz"
    SHA1
    73a88f93c27e372c901608a399be54c7f21c4daa
)

hunter_add_version(
    PACKAGE_NAME
    mkldnn
    VERSION
    0.17.4-p1
    URL
    "https://github.com/hunter-packages/mkldnn/archive/v0.17.4-p1.tar.gz"
    SHA1
    ee1cdb9a1a3359af85e4a0c6274292b2a0873a8f
)

hunter_add_version(
    PACKAGE_NAME
    mkldnn
    VERSION
    0.19-p0
    URL
    "https://github.com/hunter-packages/mkldnn/archive/v0.19-p0.tar.gz"
    SHA1
    50b706789a891f0af17b0e8732a7c1954683403e
)

hunter_cmake_args(
    mkldnn
    CMAKE_ARGS
        FAIL_WITHOUT_MKL=ON
        WITH_EXAMPLE=OFF
        WITH_TEST=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mkldnn)
hunter_download(PACKAGE_NAME mkldnn)
