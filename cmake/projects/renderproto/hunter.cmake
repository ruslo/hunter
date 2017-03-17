# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/proto/
hunter_add_version(
    PACKAGE_NAME
    renderproto
    VERSION
    "0.11.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/renderproto-0.11.1.tar.bz2"
    SHA1
    7ae9868a358859fe539482b02414aa15c2d8b1e4
)

hunter_configuration_types(renderproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(renderproto)
hunter_download(
    PACKAGE_NAME renderproto
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/renderproto.pc"
)
