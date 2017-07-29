# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    thread-pool-cpp
    VERSION
    1.0.0-p3
    URL
    "https://github.com/hunter-packages/thread-pool-cpp/archive/v1.0.0-p3.tar.gz"
    SHA1
    475c0492013a46dc2a98ee6cb854dcfb2cda3807
)

hunter_add_version(
    PACKAGE_NAME
    thread-pool-cpp
    VERSION
    1.0.0-p2
    URL
    "https://github.com/hunter-packages/thread-pool-cpp/archive/v1.0.0-p2.tar.gz"
    SHA1
    c4a9cde5fbeaf9202d06e0563a9bfdbb8451b509
)

hunter_add_version(
    PACKAGE_NAME
    thread-pool-cpp
    VERSION
    1.0.0-p1
    URL
    "https://github.com/hunter-packages/thread-pool-cpp/archive/v1.0.0-p1.tar.gz"
    SHA1
    339289275b13787a745d4f9eb2dea285fdb1e2bc
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(thread-pool-cpp)
hunter_download(PACKAGE_NAME thread-pool-cpp)
