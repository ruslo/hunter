# Copyright (c) 2013-2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.0.2-p1"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p1.tar.gz"
    SHA1
    0e2263566d45dcd4fc0419692a48010e27ffaee8
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "1.0.2-p0"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v1.0.2-p0.tar.gz"
    SHA1
    587ef53d1b82b246f27967fa67eefc1f4c3d1719
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "0.11-p1"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v0.11-p1.tar.gz"
    SHA1
    1d027e4d1e9cf03b4dcdeaf8459e2e10607d5913
)

hunter_add_version(
    PACKAGE_NAME
    RapidJSON
    VERSION
    "0.11-hunter"
    URL
    "https://github.com/hunter-packages/rapidjson/archive/v0.11-hunter.tar.gz"
    SHA1
    3cae7f5043e2bfbeb83c033b90a1a9fb69fd2371
)

hunter_cmake_args(
    RapidJSON
    CMAKE_ARGS
    RAPIDJSON_BUILD_DOC=OFF
    RAPIDJSON_BUILD_EXAMPLES=OFF
    RAPIDJSON_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(RapidJSON)
hunter_download(PACKAGE_NAME RapidJSON)
