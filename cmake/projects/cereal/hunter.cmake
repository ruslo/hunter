# Copyright (c) 2015, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(cereal)

hunter_add_version(
    PACKAGE_NAME
    cereal
    VERSION
    "1.2.2-p0"
    URL
    "https://github.com/hunter-packages/cereal/archive/v1.2.2-p0.tar.gz"
    SHA1
    7325d29644654c16f066a8c887665c2cf78226c2
    )

hunter_add_version(
    PACKAGE_NAME
    cereal
    VERSION
    "1.2.1-p1"
    URL
    "https://github.com/headupinclouds/cereal/archive/v1.2.1-p1.tar.gz"
    SHA1
    8d8179d71a12bafae3d90b6a5a7fc09cb2e69474
    )

# List of versions here...
hunter_add_version(
    PACKAGE_NAME
    cereal
    VERSION
    "1.1.2-p5"
    URL
    "https://github.com/headupinclouds/cereal/archive/v1.1.2-p5.tar.gz"
    SHA1
    4b761dacf480b2dafab02f7f50060bc6c9e78dc7
    )

  hunter_cmake_args(
    cereal
    CMAKE_ARGS
    JUST_INSTALL_CEREAL=ON
    )

# Pick a download scheme
hunter_pick_scheme(DEFAULT url_sha1_cmake)

# Download package.
# Two versions of library will be build:
#     * libexample_A.a
#     * libexample_Ad.a
hunter_download(PACKAGE_NAME cereal)
