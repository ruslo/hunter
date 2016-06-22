# Copyright (c) 2013-2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

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

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(RapidJSON)
hunter_download(PACKAGE_NAME RapidJSON)
