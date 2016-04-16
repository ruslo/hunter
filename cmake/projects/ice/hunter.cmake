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
    ice
    VERSION
    "1.0.8"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libICE-1.0.8.tar.bz2"
    SHA1
    ddb14df8bbc43df7322978f5f9f802936e2a7324
)

hunter_pick_scheme(DEFAULT ice)
hunter_cacheable(ice)
hunter_download(
    PACKAGE_NAME ice
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libICE.la"
    "lib/pkgconfig/ice.pc"
)
