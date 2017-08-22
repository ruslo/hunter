# Copyright (c) 2016, Alexandre Pretyman
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
    xrandr
    VERSION
    "1.3.2"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libXrandr-1.3.2.tar.bz2"
    SHA1
    0c844a4c5237f96794f0c18a5af16dc5ab7a36ec
)

hunter_configuration_types(xrandr CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xrandr_dependencies
    x11
    randrproto
    xext
    xextproto
    xrender
    renderproto
)
hunter_cmake_args(
    xrandr
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xrandr_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xrandr
)
hunter_cacheable(xrandr)
hunter_download(
    PACKAGE_NAME xrandr
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/xrandr.pc"
    "lib/libXrandr.la"
)
