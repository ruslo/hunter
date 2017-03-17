# Copyright (c) 2014-2015, Ruslan Baratov
# Copyright (c) 2015, Alexander Lamaison
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    PNG
    VERSION
    "1.6.26-p1"
    URL
    "https://github.com/hunter-packages/libpng/archive/v1.6.26-p1.tar.gz"
    SHA1
    10557d64fc577e4013c80c6305d6af2872c60bdb
)

hunter_add_version(
    PACKAGE_NAME
    PNG
    VERSION
    "1.6.16-p4"
    URL
    "https://github.com/hunter-packages/libpng/archive/v1.6.16-p4.tar.gz"
    SHA1
    54356d278d0c4b003280d275f61b4de746ebbb52
)

hunter_add_version(
    PACKAGE_NAME
    PNG
    VERSION
    "1.6.16-p3"
    URL
    "https://github.com/hunter-packages/libpng/archive/v1.6.16-p3.tar.gz"
    SHA1
    3e083ca37efc461704d9af256cdf2231cae6ee9d
)

hunter_cmake_args(PNG CMAKE_ARGS PNG_TESTS=OFF)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(PNG)
hunter_download(PACKAGE_NAME PNG)
