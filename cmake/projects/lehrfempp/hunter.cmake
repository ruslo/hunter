# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    lehrfempp
    VERSION
    0.7.3
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.3.tar.gz"
    SHA1
    228512a28abe9e49484d1794a20657a47fbf5a1d
)

hunter_add_version(
    PACKAGE_NAME
    lehrfempp
    VERSION
    0.7.6
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.6.tar.gz"
    SHA1
    c5ed5b1262a46dad28ac2d558781f08cffbd4993
)

hunter_add_version(
    PACKAGE_NAME
    lehrfempp
    VERSION
    0.7.8
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.8.tar.gz"
    SHA1
    ddb39d94039000686d5acd5e7e1cfa464c15dacb
)

hunter_add_version(
    PACKAGE_NAME
    lehrfempp
    VERSION
    0.7.9
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.9.tar.gz"
    SHA1
    9ed490443ce93612ee64435fe87c9af4735bbfed
)

hunter_add_version(
    PACKAGE_NAME
    lehrfempp
    VERSION
    0.7.10
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.10.tar.gz"
    SHA1
    1cc185cb5e148fb53d5fa3cd595e3e071cfd435f
)

hunter_add_version(
    PACKAGE_NAME
    lehrfempp
    VERSION
    0.7.11
    URL
    "https://github.com/craffael/lehrfempp/archive/release-0.7.11.tar.gz"
    SHA1
    b1352d52e4cd5518d6bc867ef8a9082c8f22569d
)

hunter_cmake_args(
    lehrfempp
    CMAKE_ARGS
        LF_ENABLE_TESTING=OFF
        LF_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(lehrfempp)
hunter_download(PACKAGE_NAME lehrfempp)
