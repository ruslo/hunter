# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    sqlite3
    VERSION
    3.21.0-p0
    URL
    "https://github.com/hunter-packages/sqlite3/archive/v3.21.0-p0.tar.gz"
    SHA1
    461094c550decced8b2a61410e41bff4b10dfe49
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(sqlite3)
hunter_download(PACKAGE_NAME sqlite3)
