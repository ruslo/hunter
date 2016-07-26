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
    PostgreSQL
    VERSION
    "9.5.0"
    URL
    "https://github.com/hunter-packages/PostgreSQL/archive/PostgreSQL-9.5.0.tar.gz"
    SHA1
    b82ddcee4644ef42f3a69ee93916afa448d178c4
)

hunter_configuration_types(PostgreSQL CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(PostgreSQL)
hunter_download(PACKAGE_NAME PostgreSQL
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/libecpg.pc"
    "lib/pkgconfig/libecpg_compat.pc"
    "lib/pkgconfig/libpgtypes.pc"
    "lib/pkgconfig/libpq.pc"
    "lib/postgresql/pgxs/src/Makefile.global"
)

