# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

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
hunter_download(PACKAGE_NAME RapidJSON)
