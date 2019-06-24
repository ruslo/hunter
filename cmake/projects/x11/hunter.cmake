# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/lib
hunter_add_version(
    PACKAGE_NAME
    x11
    VERSION
    "1.5.0"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libX11-1.5.0.tar.bz2"
    SHA1
    8177535c9c59d8c3ab98d55ce53520b5737ccd1a
)

# https://www.x.org/releases/individual/lib/
hunter_add_version(
    PACKAGE_NAME
    x11
    VERSION
    "1.6.7"
    URL
    "https://www.x.org/releases/individual/lib/libX11-1.6.7.tar.bz2"
    SHA1
    5076f7853713d7db958a05f6fd1c18f7e111a0ad
)

hunter_configuration_types(x11 CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(x11_dependencies
    xproto
    xextproto
    xtrans
    xcb
    kbproto
    inputproto
)
hunter_cmake_args(
    x11
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${x11_dependencies}
      PKGCONFIG_EXPORT_TARGETS=x11-xcb;x11
)
hunter_cacheable(x11)
hunter_download(
    PACKAGE_NAME x11
    PACKAGE_INTERNAL_DEPS_ID "7"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libX11-xcb.la"
    "lib/libX11.la"
    "lib/pkgconfig/x11-xcb.pc"
    "lib/pkgconfig/x11.pc"
)
