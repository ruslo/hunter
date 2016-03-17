# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Libcxxabi
    VERSION
    "3.6.0"
    URL
    "http://llvm.org/releases/3.6.0/libcxxabi-3.6.0.src.tar.xz"
    SHA1
    b4bee624f82da67281f96596bc8523a8592ad1f0
)

hunter_add_version(
    PACKAGE_NAME
    Libcxxabi
    VERSION
    "3.5.0"
    URL
    "http://llvm.org/releases/3.5.0/libcxxabi-3.5.0.src.tar.xz"
    SHA1
    31ffde04899449ae754a39c3b4e331a73a51a831
)

# http://libcxxabi.llvm.org/
hunter_cmake_args(
    Libcxxabi
    CMAKE_ARGS
        LIBCXXABI_ENABLE_ASSERTIONS=OFF
        LIBCXXABI_ENABLE_SHARED=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Libcxxabi)
