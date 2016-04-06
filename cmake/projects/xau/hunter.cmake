# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
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

hunter_pick_scheme(DEFAULT xau)
hunter_cacheable(xau)
hunter_download(
    PACKAGE_NAME xau
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/libXau.la;lib/pkgconfig/xau.pc"
)
