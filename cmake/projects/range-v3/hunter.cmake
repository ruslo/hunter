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

hunter_add_version(
    PACKAGE_NAME
    range-v3
    VERSION
    0.4.0-01ccd0e5-p0
    URL
    "https://github.com/hunter-packages/range-v3/archive/0.4.0-01ccd0e5-p0.tar.gz"
    SHA1
    7ae50752d40beb489935b73d521c14b4c147cfd5
)

hunter_add_version(
    PACKAGE_NAME
    range-v3
    VERSION
    0.5.0
    URL
    "https://github.com/ericniebler/range-v3/archive/0.5.0.tar.gz"
    SHA1
    5c0eac44a710f85cae6dc11aa7577ec90f30c5a8
)

hunter_cmake_args(
    range-v3
    CMAKE_ARGS
    BUILD_DOCS=FALSE
    BUILD_TESTS=FALSE
    BUILD_TESTING=FALSE
    RANGE_V3_EXAMPLES=FALSE
    RANGE_V3_PERF=FALSE
    RANGE_V3_DOCS=FALSE
    RANGE_V3_TESTS=FALSE
    RANGE_V3_HEADER_CHECKS=FALSE
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(range-v3)
hunter_download(PACKAGE_NAME range-v3)

