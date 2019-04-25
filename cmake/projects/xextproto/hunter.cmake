# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/X11R7.7/src/proto/
hunter_add_version(
    PACKAGE_NAME
    xextproto
    VERSION
    "7.2.1"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/xextproto-7.2.1.tar.bz2"
    SHA1
    f969e02009adf2d51fd1ba4583a859984728a461
)

# https://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    xextproto
    VERSION
    "7.3.0"
    URL
    "https://www.x.org/releases/individual/proto/xextproto-7.3.0.tar.bz2"
    SHA1
    b8d736342dcb73b71584d99a1cb9806d93c25ff8
)

hunter_configuration_types(xextproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    xextproto
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=xextproto
)
hunter_cacheable(xextproto)
hunter_download(
    PACKAGE_NAME xextproto
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/xextproto.pc"
)
