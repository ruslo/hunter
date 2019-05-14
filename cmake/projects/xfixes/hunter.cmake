# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

# https://www.x.org/releases/individual/lib/
hunter_add_version(
    PACKAGE_NAME
    xfixes
    VERSION
    "5.0.1"
    URL
    "http://www.x.org/releases/individual/lib/libXfixes-5.0.1.tar.bz2"
    SHA1
    e14fa072bd70b30eef47391cac637bdb4de9e8a3
)

hunter_add_version(
    PACKAGE_NAME
    xfixes
    VERSION
    "5.0.3"
    URL
    "https://www.x.org/releases/individual/lib/libXfixes-5.0.3.tar.bz2"
    SHA1
    ca86342d129c02435a9ee46e38fdf1a04d6b4b91
)

hunter_configuration_types(xfixes CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
set(xfixes_dependencies
    xproto
    fixesproto
    xextproto
    x11
)
hunter_cmake_args(
    xfixes
    CMAKE_ARGS         # do not use double quotes on CMAKE_ARGS
      DEPENDS_ON_PACKAGES=${xfixes_dependencies}
      PKGCONFIG_EXPORT_TARGETS=xfixes
)

hunter_cacheable(xfixes)
hunter_download(
    PACKAGE_NAME xfixes
    PACKAGE_INTERNAL_DEPS_ID "4"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libXfixes.la"
    "lib/pkgconfig/xfixes.pc"
)
