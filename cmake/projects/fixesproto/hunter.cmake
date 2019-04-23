# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# http://www.x.org/releases/individual/proto/
hunter_add_version(
    PACKAGE_NAME
    fixesproto
    VERSION
    "5.0"
    URL
    "http://www.x.org/releases/individual/proto/fixesproto-5.0.tar.bz2"
    SHA1
    ab605af5da8c98c0c2f8b2c578fed7c864ee996a
)

hunter_configuration_types(fixesproto CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    fixesproto
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=fixesproto
)
hunter_cacheable(fixesproto)
hunter_download(
    PACKAGE_NAME fixesproto
    PACKAGE_INTERNAL_DEPS_ID "3"
    PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/fixesproto.pc"
)
