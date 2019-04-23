# Copyright (c) 2015, Damien Buhl
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libdaemon
    VERSION
    "0.14"
    URL
    "http://0pointer.de/lennart/projects/libdaemon/libdaemon-0.14.tar.gz"
    SHA1
    78a4db58cf3a7a8906c35592434e37680ca83b8f
)

hunter_configuration_types(libdaemon CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(
    PACKAGE_NAME libdaemon
    PACKAGE_INTERNAL_DEPS_ID "2"
)
