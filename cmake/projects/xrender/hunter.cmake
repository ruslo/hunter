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
    xrender
    VERSION
    "0.9.7"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libXrender-0.9.7.tar.bz2"
    SHA1
    6e4d75d8316d5217324258f555eba3a5d383feb2
)

hunter_configuration_types(xrender CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xrender_dependencies
    x11
    renderproto
)
hunter_cmake_args(
    xrender
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xrender_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xrender
)
hunter_cacheable(xrender)
hunter_download(
    PACKAGE_NAME xrender
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXrender.la"
    "lib/pkgconfig/xrender.pc"
)
