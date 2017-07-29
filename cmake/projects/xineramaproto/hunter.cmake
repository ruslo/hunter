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
    xineramaproto
    VERSION
    "1.1.2"
    URL
    "https://www.x.org/releases/X11R7.7/src/proto/xineramaproto-1.2.1.tar.bz2"
    SHA1
    818bffc16139d6e3de4344c83f00c495d3536753
)

hunter_configuration_types(xineramaproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xineramaproto_dependencies
	xorg-macros
)
hunter_cmake_args(
    xineramaproto
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xineramaproto_dependencies}
)
hunter_cacheable(xineramaproto)
hunter_download(
    PACKAGE_NAME xineramaproto
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/xineramaproto.pc"
)
