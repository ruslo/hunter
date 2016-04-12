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
    sm
    VERSION
    "1.2.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libSM-1.2.1.tar.bz2"
    SHA1
    8d354a165e330022ffd3606aba562b8c8154213d
)

hunter_pick_scheme(DEFAULT sm)
hunter_cacheable(sm)
hunter_download(
    PACKAGE_NAME sm
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libSM.la"
    "lib/pkgconfig/sm.pc"
)
