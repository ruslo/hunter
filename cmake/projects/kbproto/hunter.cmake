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
    kbproto
    VERSION
    "1.0.6"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/kbproto-1.0.6.tar.bz2"
    SHA1
    a2cc82357c22a1f4d6243017982c32703c95575c
)

hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(kbproto)
hunter_download(
    PACKAGE_NAME kbproto
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/kbproto.pc"
)
