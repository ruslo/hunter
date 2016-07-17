# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/util/
hunter_add_version(
    PACKAGE_NAME
    xorg-macros
    VERSION
    "1.17"
    URL
    "http://www.x.org/releases/X11R7.7/src/util/util-macros-1.17.tar.bz2"
    SHA1
    c424a09fa6f628e24eff74496acebef13e8093b9
)

hunter_configuration_types(xorg-macros CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(xorg-macros)
hunter_download(
    PACKAGE_NAME xorg-macros
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "share/pkgconfig/xorg-macros.pc"
)
