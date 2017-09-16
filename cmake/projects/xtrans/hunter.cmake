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
    xtrans
    VERSION
    "1.2.7"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/xtrans-1.2.7.tar.bz2"
    SHA1
    b6ed421edf577816f6e641e1846dc0bff337676c
)

hunter_configuration_types(xtrans CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(xtrans)
hunter_cmake_args(
    xtrans
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=xtrans
)
hunter_download(
    PACKAGE_NAME xtrans
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "share/pkgconfig/xtrans.pc"
)
