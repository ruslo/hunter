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
    xinerama
    VERSION
    "1.1.2"
    URL
    "https://www.x.org/releases/X11R7.7/src/lib/libXinerama-1.1.2.tar.bz2"
    SHA1
    06a5b636305725ce09f6c3a4d5a15f2f188b5afd
)

hunter_configuration_types(xinerama CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xinerama_dependencies
    x11
    xext
    xextproto
    xineramaproto
)
hunter_cmake_args(
    xinerama
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xinerama_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xinerama
)
hunter_cacheable(xinerama)
hunter_download(
    PACKAGE_NAME xinerama
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXinerama.la"
    "lib/pkgconfig/xinerama.pc"
)
