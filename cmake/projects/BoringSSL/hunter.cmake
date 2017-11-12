# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    BoringSSL
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/boringssl/archive/v1.0.0.tar.gz"
    SHA1
    caa7cd122960c9427bda30db5020b9058cb1ed0a
    )

if(MSVC)
  hunter_cmake_args(BoringSSL CMAKE_ARGS OPENSSL_NO_ASM=YES)
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(BoringSSL)
hunter_download(PACKAGE_NAME BoringSSL)
