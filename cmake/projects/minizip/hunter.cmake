# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    minizip
    VERSION
    "1.0.1-p3"
    URL
    "https://github.com/hunter-packages/minizip/archive/v1.0.1-p3.tar.gz"
    SHA1
    9ad9dab6758d7fdbeae492515b7027ecd4903b16
)

hunter_add_version(
    PACKAGE_NAME
    minizip
    VERSION
    "1.0.1-p1"
    URL
    "https://github.com/hunter-packages/minizip/archive/v1.0.1-p1.tar.gz"
    SHA1
    fbbfe009a142535e4f902a45b33adb4d3af6ffd1
)

hunter_add_version(
    PACKAGE_NAME
    minizip
    VERSION
    "1.0.1-p0"
    URL
    "https://github.com/hunter-packages/minizip/archive/v1.0.1-p0.tar.gz"
    SHA1
    65728dbf7573d3f1826d04a3b686d80eb099d7b8
)

hunter_cmake_args(minizip CMAKE_ARGS USE_AES=FALSE)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(minizip)
hunter_download(PACKAGE_NAME minizip)
