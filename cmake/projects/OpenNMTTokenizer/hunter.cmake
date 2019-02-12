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

hunter_add_version(
    PACKAGE_NAME
    OpenNMTTokenizer
    VERSION
    1.11.0-p0
    URL
    "https://github.com/hunter-packages/OpenNMT-Tokenizer/archive/v1.11.0-p0.tar.gz"
    SHA1
    1dc732b6c4d3a2e9e7c9b75e753fbc02680e8b17
)

hunter_add_version(
    PACKAGE_NAME
    OpenNMTTokenizer
    VERSION
    1.11.0-p1
    URL
    "https://github.com/hunter-packages/OpenNMT-Tokenizer/archive/v1.11.0-p1.tar.gz"
    SHA1
    0d557399a8e31ffa2208ad41c2a6c2bd38b3e9d4
)

hunter_cmake_args(OpenNMTTokenizer CMAKE_ARGS LIB_ONLY=YES WITH_ICU=YES)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenNMTTokenizer)
hunter_download(PACKAGE_NAME OpenNMTTokenizer)
