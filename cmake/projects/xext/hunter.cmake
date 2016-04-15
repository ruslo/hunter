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
    xext
    VERSION
    "1.3.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libXext-1.3.1.tar.bz2"
    SHA1
    764ac472ae19a0faade193717a9e0938d3430aaa
)

hunter_pick_scheme(DEFAULT xext)
hunter_cacheable(xext)
hunter_download(
    PACKAGE_NAME xext
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXext.la"
    "lib/pkgconfig/xext.pc"
)
