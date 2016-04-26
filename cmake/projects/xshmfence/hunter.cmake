# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/individual/lib/
hunter_add_version(
    PACKAGE_NAME
    xshmfence
    VERSION
    "1.2"
    URL
    "http://www.x.org/releases/individual/lib/libxshmfence-1.2.tar.bz2"
    SHA1
    a2ebe90e5595afca4db93a4359732af43b2b8c69
)

hunter_pick_scheme(DEFAULT xshmfence)
hunter_cacheable(xshmfence)
hunter_download(
    PACKAGE_NAME xshmfence
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libxshmfence.la"
    "lib/pkgconfig/xshmfence.pc"
)
