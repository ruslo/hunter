# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/individual/lib/
hunter_add_version(
    PACKAGE_NAME
    pciaccess
    VERSION
    "0.13.4"
    URL
    "http://www.x.org/releases/individual/lib/libpciaccess-0.13.4.tar.bz2"
    SHA1
    99e791fe20924b9da29bf7c7ed9438739c4f2930
)

hunter_configuration_types(pciaccess CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(pciaccess)
hunter_download(
    PACKAGE_NAME pciaccess
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libpciaccess.la"
    "lib/pkgconfig/pciaccess.pc"
)
