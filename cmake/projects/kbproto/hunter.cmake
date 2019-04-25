# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/proto/
hunter_add_version(
    PACKAGE_NAME
    kbproto
    VERSION
    "1.0.6"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/kbproto-1.0.6.tar.bz2"
    SHA1
    a2cc82357c22a1f4d6243017982c32703c95575c
)

# https://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    kbproto
    VERSION
    "1.0.7"
    URL
    "https://www.x.org/releases/individual/proto/kbproto-1.0.7.tar.bz2"
    SHA1
    bc9c0fa7d39edf4ac043e6eeaa771d3e245ac5b2
)

hunter_configuration_types(kbproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    kbproto
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=kbproto
)
hunter_cacheable(kbproto)
hunter_download(
    PACKAGE_NAME kbproto
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/kbproto.pc"
)
