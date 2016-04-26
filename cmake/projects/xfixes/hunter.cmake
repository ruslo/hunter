# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    xfixes
    VERSION
    "5.0.1"
    URL
    "http://www.x.org/releases/individual/lib/libXfixes-5.0.1.tar.bz2"
    SHA1
    e14fa072bd70b30eef47391cac637bdb4de9e8a3
)

hunter_pick_scheme(DEFAULT xfixes)
hunter_cacheable(xfixes)
hunter_download(
    PACKAGE_NAME xfixes
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXfixes.la"
    "lib/pkgconfig/xfixes.pc"
)
