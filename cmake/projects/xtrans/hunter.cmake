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
    xtrans
    VERSION
    "1.2.7"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/xtrans-1.2.7.tar.bz2"
    SHA1
    b6ed421edf577816f6e641e1846dc0bff337676c
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(xtrans)
hunter_download(
    PACKAGE_NAME xtrans
    PACKAGE_UNRELOCATABLE_TEXT_FILES "share/pkgconfig/xtrans.pc"
)
