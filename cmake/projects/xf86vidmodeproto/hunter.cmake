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
    xf86vidmodeproto
    VERSION
    "2.3.1"
    URL
    "https://www.x.org/releases/X11R7.7/src/proto/xf86vidmodeproto-2.3.1.tar.bz2"
    SHA1
    11d54c3210887631ea71e8f8030a77692e964fc4
)

hunter_configuration_types(xf86vidmodeproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xf86vidmodeproto_dependencies
    xorg-macros
)
hunter_cmake_args(
    xf86vidmodeproto
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${xf86vidmodeproto_dependencies}
    PKGCONFIG_EXPORT_TARGETS=xf86vidmodeproto
)
hunter_cacheable(xf86vidmodeproto)
hunter_download(
    PACKAGE_NAME xf86vidmodeproto
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/xf86vidmodeproto.pc"
)
