# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/proto/
hunter_add_version(
    PACKAGE_NAME
    xextproto
    VERSION
    "7.2.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/xextproto-7.2.1.tar.bz2"
    SHA1
    f969e02009adf2d51fd1ba4583a859984728a461
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(xextproto)
hunter_download(
    PACKAGE_NAME xextproto
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/xextproto.pc"
)
