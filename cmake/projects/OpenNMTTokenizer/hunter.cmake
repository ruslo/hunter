# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenNMTTokenizer
    VERSION
    0.2.0-p0
    URL
    "https://github.com/hunter-packages/OpenNMT-Tokenizer/archive/v0.2.0-p0.tar.gz"
    SHA1
    8d6025d92014586c5ff5a831c13b9238e6c07da8
)

hunter_add_version(
    PACKAGE_NAME
    OpenNMTTokenizer
    VERSION
    0.2.0-p1
    URL
    "https://github.com/hunter-packages/OpenNMT-Tokenizer/archive/v0.2.0-p1.tar.gz"
    SHA1
    33c75c6d22a79a0410b28a518b57a5b257762f1f
)

hunter_cmake_args(OpenNMTTokenizer CMAKE_ARGS LIB_ONLY=YES)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenNMTTokenizer)
hunter_download(PACKAGE_NAME OpenNMTTokenizer)
