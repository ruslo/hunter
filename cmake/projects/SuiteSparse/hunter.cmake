# Copyright (c) 2017, NeroBurner
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(SuiteSparse)

# List of versions here...
## suitesparse-metis-for-windows version is 1.3.1
## suitesparse library version is 4.5.1
hunter_add_version(
    PACKAGE_NAME
    SuiteSparse
    VERSION
    "4.5.1-p0"
    URL
    "https://github.com/hunter-packages/suitesparse-metis-for-windows/archive/v1.3.1-p0.tar.gz"
    SHA1
    1350eab5d1a8d488e7b28d217fa751906d4767da
)


hunter_cmake_args(
    SuiteSparse
    CMAKE_ARGS
    BUILD_METIS=NO
    HUNTER_INSTALL_LICENSE_FILES=LICENSE.md
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME SuiteSparse)
