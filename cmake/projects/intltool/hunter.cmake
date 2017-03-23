# Copyright (c) 2015, Damien Buhl
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    intltool
    VERSION
    "0.51.0"
    URL
    "https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz"
    SHA1
    a0c3bcb99d1bcfc5db70f8d848232a47c47da090
)

hunter_configuration_types(intltool CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_download(
    PACKAGE_NAME intltool
    PACKAGE_INTERNAL_DEPS_ID "1"
)
