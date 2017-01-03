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
    "3.3.1"
    URL
    "http://bitbucket.org/eigen/eigen/get/3.3.1.tar.bz2"
    SHA1
    d1a9c2b64db3628956482b4a934cab3b508dc29e
)

hunter_add_version(
    PACKAGE_NAME
    Eigen
    VERSION
    "3.2.4-p0"
    URL
    "https://github.com/hunter-packages/eigen/archive/v3.2.4-p0.tar.gz"
    SHA1
    6fd638939dfd3a3be1cf0ea920160591ed60f76d
)

hunter_cmake_args(Eigen CMAKE_ARGS EIGEN_ENABLE_TESTING=OFF)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME Eigen)
