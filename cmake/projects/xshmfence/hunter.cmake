# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
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

hunter_configuration_types(xshmfence CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xshmfence_dependencies
    xproto
)
hunter_cmake_args(
    xshmfence
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xshmfence_dependencies}
)
hunter_cacheable(xshmfence)
hunter_download(
    PACKAGE_NAME xshmfence
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libxshmfence.la"
    "lib/pkgconfig/xshmfence.pc"
)
