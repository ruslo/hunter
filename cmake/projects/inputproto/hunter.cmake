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
    inputproto
    VERSION
    "2.2"
    URL
    "http://www.x.org/releases/X11R7.7/src/proto/inputproto-2.2.tar.bz2"
    SHA1
    500e0a6dac3523887c0b82753fe5e9d4bb982137
)

hunter_configuration_types(inputproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(inputproto)
hunter_cmake_args(
    inputproto
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=inputproto
)
hunter_download(
    PACKAGE_NAME inputproto
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/inputproto.pc"
)
