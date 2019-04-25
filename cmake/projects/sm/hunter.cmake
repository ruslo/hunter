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
    sm
    VERSION
    "1.2.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/lib/libSM-1.2.1.tar.bz2"
    SHA1
    8d354a165e330022ffd3606aba562b8c8154213d
)

hunter_add_version(
    PACKAGE_NAME
    sm
    VERSION
    "1.2.3"
    URL
    "https://www.x.org/releases/individual/lib/libSM-1.2.3.tar.bz2"
    SHA1
    437d7b13fa2eba325df3a106f177df46ccec6546
)

hunter_configuration_types(sm CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(sm_dependencies
    xproto
    xtrans
    ice
)
hunter_cmake_args(
    sm
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${sm_dependencies}
)
hunter_cacheable(sm)
hunter_download(
    PACKAGE_NAME sm
    PACKAGE_INTERNAL_DEPS_ID "4"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libSM.la"
    "lib/pkgconfig/sm.pc"
)
