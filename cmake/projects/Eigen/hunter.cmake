# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(Eigen)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.3.1-p2"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.3.1-p2.tar.gz"
    SHA1
    0a15d912c3002bfb42e739235cfd650ab74bb5a6
)

# disable Eigen tests. Testcreation tries to find package 'Boost'
hunter_cmake_args(Eigen CMAKE_ARGS BUILD_TESTING=OFF)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME Eigen)
