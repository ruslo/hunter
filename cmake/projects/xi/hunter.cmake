# Copyright (c) 2016, Alexandre Pretyman
# Copyright (c) 2017, Ruslan Baratov
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
    xi
    VERSION
    "1.6.1"
    URL
    "https://www.x.org/releases/X11R7.7/src/lib/libXi-1.6.1.tar.bz2"
    SHA1
    4b53b41fdaa3acc86606c696c68d5eed11454612
)

hunter_configuration_types(xi CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

set(
    _dependencies
    xproto
    x11
    xextproto
    xext
    inputproto
)

hunter_cmake_args(
    xi
    CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xi
)

hunter_cacheable(xi)
hunter_download(
    PACKAGE_NAME xi
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXi.la"
    "lib/pkgconfig/xi.pc"
)
