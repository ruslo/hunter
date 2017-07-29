# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/xcb/
hunter_add_version(
    PACKAGE_NAME
    pthread-stubs
    VERSION
    "0.3"
    URL
    "http://www.x.org/releases/X11R7.7/src/xcb/libpthread-stubs-0.3.tar.bz2"
    SHA1
    7fc486ad0ec54938f8b781cc374218f50eac8b99
)

hunter_configuration_types(pthread-stubs CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(pthread-stubs)
hunter_download(
    PACKAGE_NAME pthread-stubs
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/pthread-stubs.pc"
)
