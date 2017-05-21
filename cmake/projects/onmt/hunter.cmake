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
    onmt
    VERSION
    0.4.1-p0
    URL
    "https://github.com/hunter-packages/onmt/archive/v0.4.1-p0.tar.gz"
    SHA1
    a691a53a695135cd38d85042bafacf734b3e6a5a
)

hunter_cmake_args(onmt CMAKE_ARGS LIB_ONLY=YES WITH_OPENMP=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(onmt)
hunter_download(PACKAGE_NAME onmt)
