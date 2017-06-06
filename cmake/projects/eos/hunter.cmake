# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    eos
    VERSION
    0.12.1
    URL
    "https://github.com/hunter-packages/eos/archive/v0.12.1.tar.gz"
    SHA1
    cbc8143c270fe4ade45be47adae83f34db280659
)

hunter_add_version(
    PACKAGE_NAME
    eos
    VERSION
    0.6.1-p1
    URL
    "https://github.com/hunter-packages/eos/archive/v0.6.1-p1.tar.gz"
    SHA1
    663e02aa35275f9dc447e8d4004e091f107eb686    
)

hunter_add_version(
    PACKAGE_NAME
    eos
    VERSION
    0.6.1-p0
    URL
    "https://github.com/hunter-packages/eos/archive/v0.6.1-p0.tar.gz"
    SHA1
    3ce7b579fb2795a0c464b2dea12ca9345cf86e91
)

hunter_cmake_args(
    eos
    CMAKE_ARGS
    EOS_BUILD_EXAMPLES=OFF
    EOS_BUILD_DOCUMENTATION=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(eos)
hunter_download(PACKAGE_NAME eos)
