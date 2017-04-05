# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# https://xcb.freedesktop.org/dist/
hunter_add_version(
    PACKAGE_NAME
    xcb-proto
    VERSION
    "1.11"
    URL
    "https://xcb.freedesktop.org/dist/xcb-proto-1.11.tar.bz2"
    SHA1
    608bd60663e223464d38acec0183ddb827776401
)

# http://www.x.org/releases/X11R7.7/src/xcb/
hunter_add_version(
    PACKAGE_NAME
    xcb-proto
    VERSION
    "1.7.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/xcb/xcb-proto-1.7.1.tar.bz2"
    SHA1
    82a568559235fc6e26d0a38911c5ea18f8e8455c
)

hunter_configuration_types(xcb-proto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(xcb-proto)
hunter_download(
    PACKAGE_NAME xcb-proto
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/xcb-proto.pc"
)
