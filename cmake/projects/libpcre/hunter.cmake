# Copyright (c) 2016 Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libpcre
    VERSION
    "8.41"
    URL
    "https://ftp.pcre.org/pub/pcre/pcre-8.41.tar.bz2"
    SHA1
    7d1f4aae4191512744a718cc2b81bcf995ec1437
)

hunter_configuration_types(libpcre CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

hunter_cmake_args(
    libpcre
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=libpcre;libpcrecpp;libpcreposix
    EXTRA_FLAGS=--enable-unicode-properties
)

hunter_cacheable(libpcre)
hunter_download(
    PACKAGE_NAME libpcre
    PACKAGE_INTERNAL_DEPS_ID "2"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libpcre.la"
    "lib/libpcrecpp.la"
    "lib/libpcreposix.la"
    "lib/pkgconfig/libpcre.pc"
    "lib/pkgconfig/libpcrecpp.pc"
    "lib/pkgconfig/libpcreposix.pc"
    "bin/pcre-config"
)
