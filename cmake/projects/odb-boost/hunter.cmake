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
    odb-boost
    VERSION
    "2.4.0"
    URL
    "http://www.codesynthesis.com/download/odb/2.4/libodb-boost-2.4.0.tar.bz2"
    SHA1
    f813702b2856732e199ae34e3393b8cecff878ef
)

hunter_configuration_types(odb-boost CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_odb-boost_autotools)
hunter_cacheable(odb-boost)
hunter_download(PACKAGE_NAME odb-boost
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libodb-boost.la"
    "lib/pkgconfig/libodb-boost.pc"
    PACKAGE_INTERNAL_DEPS_ID "12"
)
