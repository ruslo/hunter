# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    presentproto
    VERSION
    "1.0"
    URL
    "http://www.x.org/releases/individual/proto/presentproto-1.0.tar.bz2"
    SHA1
    432371cdc464881029c3f39f9bf81cc80a484e54
)

hunter_configuration_types(presentproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(presentproto)
hunter_download(
    PACKAGE_NAME presentproto
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/presentproto.pc"
)
