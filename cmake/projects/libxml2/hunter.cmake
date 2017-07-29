# Copyright (c) 2016, Ruslan Baratov, Alexandre Pretyman
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    libxml2
    VERSION
    "2.9.4"
    URL
    "http://xmlsoft.org/sources/libxml2-2.9.4.tar.gz"
    SHA1
    958ae70baf186263a4bd801a81dd5d682aedd1db
)

# Drop dependencies
hunter_cmake_args(
	libxml2
        CMAKE_ARGS
            EXTRA_FLAGS=--without-python --without-lzma --without-zlib
)

hunter_configuration_types(libxml2 CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cacheable(libxml2)
hunter_download(
    PACKAGE_NAME libxml2
    PACKAGE_INTERNAL_DEPS_ID "1"
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/pkgconfig/libxml-2.0.pc"
)
