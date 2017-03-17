# Copyright (c) 2015, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    odb-pgsql
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-pgsql-2.4.0.tar.bz2"
    SHA1
    4628d5e296da01dbaf8658fd402b4f709f30ea2d
)

hunter_configuration_types(odb-pgsql CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_odb-pgsql_autotools)
hunter_cacheable(odb-pgsql)
hunter_download(PACKAGE_NAME odb-pgsql
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libodb-pgsql.la"
    "lib/pkgconfig/libodb-pgsql.pc"
)

