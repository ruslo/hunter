# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pcre2
    VERSION
    10.13-p0
    URL
    "https://github.com/hunter-packages/pcre2/archive/v10.33-p0.tar.gz"
    SHA1
    7fa03a8b27230770f6d8fa09885825dd95483405
)

hunter_cmake_args(
    pcre2
    CMAKE_ARGS
    PCRE2_BUILD_TESTS=OFF
    PCRE2_BUILD_PCRE2_16=ON
    PCRE2_BUILD_PCRE2_32=ON
    PCRE2_SUPPORT_JIT=ON
    PCRE2_BUILD_PCRE2GREP=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(pcre2)
hunter_download(PACKAGE_NAME pcre2)
