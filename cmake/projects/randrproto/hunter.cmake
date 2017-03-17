# Copyright (c) 2016, Alexandre Pretyman
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
    randrproto
    VERSION
    "1.3.2"
    URL
    "https://www.x.org/releases/X11R7.7/src/proto/randrproto-1.3.2.tar.bz2"
    SHA1
    55d4b1a09fc8e645d9674a452ae151988caabad1
)

hunter_configuration_types(randrproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(randrproto_dependencies
    xorg-macros
)
hunter_cmake_args(
    randrproto
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${randrproto_dependencies}
)
hunter_cacheable(randrproto)
hunter_download(
    PACKAGE_NAME randrproto
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/randrproto.pc"
)
