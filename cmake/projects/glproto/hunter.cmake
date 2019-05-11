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
    glproto
    VERSION
    "1.4.17"
    URL
    "http://www.x.org/releases/individual/proto/glproto-1.4.17.tar.bz2"
    SHA1
    20e061c463bed415051f0f89e968e331a2078551
)

hunter_configuration_types(glproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(glproto)
hunter_download(
    PACKAGE_NAME glproto
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/glproto.pc"
)
