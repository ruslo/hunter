# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/lib/
hunter_add_version(
    PACKAGE_NAME
    xext
    VERSION
    "1.3.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libXext-1.3.1.tar.bz2"
    SHA1
    764ac472ae19a0faade193717a9e0938d3430aaa
)

hunter_configuration_types(xext CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xext_dependencies
    xproto
    xextproto
    x11
)
hunter_cmake_args(
    xext
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xext_dependencies}
)
hunter_cacheable(xext)
hunter_download(
    PACKAGE_NAME xext
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXext.la"
    "lib/pkgconfig/xext.pc"
)
