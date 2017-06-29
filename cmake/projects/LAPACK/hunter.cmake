# Copyright (c) 2017, NeroBurner
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(LAPACK)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    LAPACK
    VERSION
    "3.7.1"
    URL
    https://github.com/hunter-packages/lapack/archive/v3.7.1-p0.tar.gz
    SHA1
    82616c0878fbe42f22ece5fadfb38e09456ba5b5
)

# pass cmake arguments
hunter_cmake_args(
    LAPACK
    CMAKE_ARGS
    HUNTER_INSTALL_LICENSE_FILES=LICENSE
)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME LAPACK)
