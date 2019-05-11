# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
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

# https://www.x.org/releases/individual/xcb/
hunter_add_version(
    PACKAGE_NAME
    pthread-stubs
    VERSION
    "0.4"
    URL
    "https://www.x.org/releases/individual/xcb/libpthread-stubs-0.4.tar.bz2"
    SHA1
    c42503a2ae0067b2238b2f3fefc86656baa4dd8e
)

hunter_configuration_types(pthread-stubs CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(pthread-stubs)
hunter_cmake_args(
    pthread-stubs
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=pthread-stubs
)
hunter_download(
    PACKAGE_NAME pthread-stubs
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/pthread-stubs.pc"
)
