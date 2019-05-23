# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    libzip
    VERSION
    1.5.2-d68a667-p0
    URL
    "https://github.com/hunter-packages/libzip/archive/v1.5.2-d68a667-p0.tar.gz"
    SHA1
    c3fce63f125fe5a50103d9f20846ca2a269439b7
)

hunter_cmake_args(
    libzip
    CMAKE_ARGS
        ENABLE_COMMONCRYPTO=OFF
        ENABLE_GNUTLS=OFF
        ENABLE_MBEDTLS=OFF
        ENABLE_WINDOWS_CRYPTO=OFF
        BUILD_TOOLS=OFF
        BUILD_REGRESS=OFF
        BUILD_EXAMPLES=OFF
        BUILD_DOC=OFF
        BUILD_SHARED_LIBS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(libzip)
hunter_download(PACKAGE_NAME libzip)
