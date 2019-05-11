# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
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

# https://www.x.org/releases/individual/lib/
hunter_add_version(
    PACKAGE_NAME
    ice
    VERSION
    "1.0.9"
    URL
    "https://www.x.org/releases/individual/lib/libICE-1.0.9.tar.bz2"
    SHA1
    3c3a857a117ce48a1947a16860056e77cd494fdf
)

hunter_configuration_types(ice CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    ice
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=xproto;xtrans
)
hunter_cacheable(ice)
hunter_download(
    PACKAGE_NAME ice
    PACKAGE_INTERNAL_DEPS_ID "4"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libICE.la"
    "lib/pkgconfig/ice.pc"
)
