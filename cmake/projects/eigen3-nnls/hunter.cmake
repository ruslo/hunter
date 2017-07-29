# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    eigen3-nnls
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/eigen3-nnls/archive/v1.0.0.tar.gz"
    SHA1
    0bc34af72ace36e14dc8387e292e338ee30f620d
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(eigen3-nnls)
hunter_download(PACKAGE_NAME eigen3-nnls)
