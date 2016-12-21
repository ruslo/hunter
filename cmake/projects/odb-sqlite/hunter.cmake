# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_package(odb)
hunter_add_package(SQLite3)

hunter_add_version(
    PACKAGE_NAME
    odb-sqlite
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-sqlite-2.4.0.tar.bz2"
    SHA1
    3be07e7702abf8adcbe7736f372ef9980cec1003
)

hunter_configuration_types(odb-sqlite CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_odb-sqlite_autotools)
hunter_cacheable(odb-sqlite)
hunter_download(
    PACKAGE_NAME odb-sqlite
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libodb-sqlite.la"
    "lib/pkgconfig/libodb-sqlite.pc"
)
