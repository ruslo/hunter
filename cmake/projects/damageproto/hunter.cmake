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
    damageproto
    VERSION
    "1.2.1"
    URL
    "http://www.x.org/releases/individual/proto/damageproto-1.2.1.tar.bz2"
    SHA1
    bd0f0f4dc8f37eaabd9279d10fe2889710507358
)

hunter_configuration_types(damageproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(damageproto)
hunter_download(
    PACKAGE_NAME damageproto
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/damageproto.pc"
)
