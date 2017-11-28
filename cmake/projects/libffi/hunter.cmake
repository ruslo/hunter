# Copyright (c) 2016-2017 Ruslan Baratov
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
    libffi
    VERSION
    "3.2.1"
    URL
    "https://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz"
    SHA1
    280c265b789e041c02e5c97815793dfc283fb1e6
)

hunter_configuration_types(libffi CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)

hunter_cmake_args(
    libffi
    CMAKE_ARGS
    PKGCONFIG_EXPORT_TARGETS=libffi
)

hunter_cacheable(libffi)
hunter_download(
    PACKAGE_NAME libffi
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/libffi.la"
    "lib/pkgconfig/libffi.pc"
)
