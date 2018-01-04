# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    range-v3
    VERSION
    vcpkg5-p
    URL
    "https://github.com/hunter-packages/range-v3/archive/vcpkg5-p.tar.gz"
    SHA1
    d8b723b955d7c92d3734fead371538d11cf73452
)

hunter_add_version(
    PACKAGE_NAME
    range-v3
    VERSION
    0.3.0-p
    URL
    "https://github.com/hunter-packages/range-v3/archive/0.3.0-p.tar.gz"
    SHA1
    d2b3c31c66c4c7d0b11798e370af4e1e372a307b
)

hunter_cmake_args(
    range-v3
    CMAKE_ARGS
    BUILD_DOCS=FALSE
	BUILD_TESTS=FALSE
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(range-v3)
hunter_download(PACKAGE_NAME range-v3)

