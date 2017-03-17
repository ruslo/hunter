# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SQLite3
    VERSION
    "autoconf-3080803"
    URL
    "https://www.sqlite.org/2015/sqlite-autoconf-3080803.tar.gz"
    SHA1
    2fe3f6226a2a08a2e814b97cd53e36bb3c597112
)

hunter_configuration_types(SQLite3 CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_sqlite3_autotools)
hunter_cacheable(SQLite3)
hunter_download(
    PACKAGE_NAME SQLite3
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libsqlite3.la"
    "lib/pkgconfig/sqlite3.pc"
)
