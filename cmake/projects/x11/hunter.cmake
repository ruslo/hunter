# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/lib
hunter_add_version(
    PACKAGE_NAME
    x11
    VERSION
    "1.5.0"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libX11-1.5.0.tar.bz2"
    SHA1
    8177535c9c59d8c3ab98d55ce53520b5737ccd1a
)

hunter_pick_scheme(DEFAULT x11)
hunter_cacheable(x11)
hunter_download(
    PACKAGE_NAME x11
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libX11-xcb.la"
    "lib/libX11.la"
    "lib/pkgconfig/x11-xcb.pc"
    "lib/pkgconfig/x11.pc"
)
