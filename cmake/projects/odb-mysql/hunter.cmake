# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    odb-mysql
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-mysql-2.4.0.tar.bz2"
    SHA1
    2021a67577354f1d6bed50c0b257c1920760eda7
)

hunter_configuration_types(odb-mysql CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_odb-mysql_autotools)
hunter_cacheable(odb-mysql)
hunter_download(PACKAGE_NAME odb-mysql
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libodb-mysql.la"
    "lib/pkgconfig/libodb-mysql.pc"
)

