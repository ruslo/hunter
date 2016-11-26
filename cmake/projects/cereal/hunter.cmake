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
    "1.2.1-p1"
    URL
    "https://github.com/headupinclouds/cereal/archive/v1.2.1.tar.gz"    
    SHA1
    3b1188758515ed645e9ca073f7077828bdffa41d
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
