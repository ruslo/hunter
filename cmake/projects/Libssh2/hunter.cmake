# Copyright (c) 2014, Alexander Lamaison
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Libssh2
    VERSION
    "1.4.4-patch-2"
    URL
    "https://github.com/hunter-packages/libssh2/archive/v1.4.4-patch-2.tar.gz"
    SHA1
    3334d745eb6ed5e3fb860a5a74e9cfc2e4576c81
)

hunter_add_version(
    PACKAGE_NAME
    Libssh2
    VERSION
    "1.4.4_DEV-cmake"
    URL
    "https://github.com/hunter-packages/libssh2/archive/v1.4.4-patch-1.tar.gz"
    SHA1
    4a5bb23ff19218f92af6e15e46ca5d997c3d7680
)

hunter_cmake_args(
    Libssh2
    CMAKE_ARGS
      BUILD_TESTING=OFF
      BUILD_EXAMPLES=OFF
      HUNTER_ENABLED=ON
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME Libssh2)
