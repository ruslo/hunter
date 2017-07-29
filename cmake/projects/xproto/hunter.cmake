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
    xproto
    VERSION
    "7.0.23"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/xproto-7.0.23.tar.bz2"
    SHA1
    5d7f00d1dbe6cf8e725841ef663f0ee2491ba5b2
)

hunter_configuration_types(xproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    xproto
    CMAKE_ARGS
      DEPENDS_ON_PACKAGES=xorg-macros
)
hunter_cacheable(xproto)
hunter_download(
    PACKAGE_NAME xproto
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/xproto.pc"
)
