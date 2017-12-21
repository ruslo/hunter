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
    "2.9.7"
    URL
    "http://xmlsoft.org/sources/libxml2-2.9.7.tar.gz"
    SHA1
    ab3325e6cdda50ab2382fdfe0bdb6f7d1b9224a6
)

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

set(_libxml_unrelocatable_text_files PACKAGE_UNRELOCATABLE_TEXT_FILES "lib/pkgconfig/libxml-2.0.pc")
hunter_configuration_types(libxml2 CONFIGURATION_TYPES Release)
if (MSVC)
    hunter_pick_scheme(DEFAULT url_sha1_libxml2_msvc)
    # pkgconfig file not applicable
    set(_libxml_unrelocatable_text_files "")
else()
    hunter_pick_scheme(DEFAULT url_sha1_autotools)
    # Drop dependencies
    hunter_cmake_args(
    	libxml2
            CMAKE_ARGS
                EXTRA_FLAGS=--without-python --without-lzma --without-zlib
    )
endif()
hunter_cacheable(libxml2)
hunter_download(
    PACKAGE_NAME libxml2
    PACKAGE_INTERNAL_DEPS_ID "2"
    ${_libxml_unrelocatable_text_files}
)

