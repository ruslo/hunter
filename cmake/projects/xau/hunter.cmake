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
    xau
    VERSION
    "1.0.7"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libXau-1.0.7.tar.bz2"
    SHA1
    29c47207fd246425b906f525b2220235ce4cd0f6
)

# https://www.x.org/releases/individual/lib/
hunter_add_version(
    PACKAGE_NAME
    xau
    VERSION
    "1.0.9"
    URL
    "https://www.x.org/releases/individual/lib/libXau-1.0.9.tar.bz2"
    SHA1
    ef9b1ad00f958c8b6e30a1bbc11fdfac311c9733
)

hunter_configuration_types(xau CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xau_dependencies
    xorg-macros
    xproto
)
hunter_cmake_args(
    xau
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xau_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xau
)
hunter_cacheable(xau)
hunter_download(
    PACKAGE_NAME xau
    PACKAGE_INTERNAL_DEPS_ID "8"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/libXau.la;lib/pkgconfig/xau.pc"
)
