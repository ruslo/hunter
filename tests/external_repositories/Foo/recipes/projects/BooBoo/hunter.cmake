# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(BooBoo)

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    BooBoo
    VERSION
    "1.2"
    URL
    "http://bitbucket.org/eigen/eigen/get/3.2.8.tar.bz2"
    SHA1
    64f4aef8012a424c7e079eaf0be71793ab9bc6e0
)

hunter_cmake_args(BooBoo CMAKE_ARGS EIGEN_ENABLE_TESTING=OFF)

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME BooBoo)
