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
    xcursor
    VERSION
    "1.1.13"
    URL
    "https://www.x.org/releases/X11R7.7/src/lib/libXcursor-1.1.13.tar.bz2"
    SHA1
    4e461d9e4324689ca8a84706926a8c0fe9470e47
)

hunter_configuration_types(xcursor CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xcursor_dependencies
    xorg-macros
    xrender
    xfixes
    x11
    fixesproto
)
hunter_cmake_args(
    xcursor
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xcursor_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xcursor
)
hunter_cacheable(xcursor)
hunter_download(
    PACKAGE_NAME xcursor
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXcursor.la"
    "lib/pkgconfig/xcursor.pc"
)
