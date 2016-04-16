# Copyright (c) 2016, Alexander Lamaison
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Expat
    VERSION
    "2.1.0"
    URL
    "https://github.com/alamaison/expat/archive/R_2_1_0-hunter.tar.gz"
    SHA1
    87227472715212f636c624b656a86614519edcd5
)

hunter_add_version(
    PACKAGE_NAME
    Expat
    VERSION
    "2.1.1"
    URL
    "https://github.com/alamaison/expat/archive/R_2_1_1-hunter.tar.gz"
    SHA1
    6b7669be7bc36814c0a7a62cf17342d0a708a51a
)

hunter_cmake_args(
  Expat
  CMAKE_ARGS
    BUILD_tools=OFF
    BUILD_examples=OFF
    BUILD_tests=OFF
    BUILD_shared=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Expat)
hunter_download(PACKAGE_NAME Expat)
