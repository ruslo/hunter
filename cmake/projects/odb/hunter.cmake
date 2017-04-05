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
    odb
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-2.4.0.tar.bz2"
    SHA1
    42bd2a8023e338e004711e755eb30bd122b844a6
)

hunter_configuration_types(odb CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(odb)
hunter_download(
    PACKAGE_NAME odb
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libodb.la"
    "lib/pkgconfig/libodb.pc"
)
