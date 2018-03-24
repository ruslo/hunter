# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    mng
    VERSION
    2.0.3-p0
    URL
    https://github.com/hunter-packages/mng/archive/v2.0.3-p0.tar.gz
    SHA1
    d0f3f21b816785841f27f704a69436cc261364bc
)

hunter_add_version(
    PACKAGE_NAME
    mng
    VERSION
    2.0.3-p1
    URL
    https://github.com/hunter-packages/mng/archive/v2.0.3-p1.tar.gz
    SHA1
    7093e4ea2701834ff858aa3441294edbbf83c4b1
)

hunter_add_version(
    PACKAGE_NAME
    mng
    VERSION
    2.0.3-p2
    URL
    https://github.com/hunter-packages/mng/archive/v2.0.3-p2.tar.gz
    SHA1
    54d8034ced87b6411df40d0f3cfd5724257e9b00
)

hunter_cmake_args(mng CMAKE_ARGS MNG_INSTALL_LIB_DIR=lib)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(mng)
hunter_download(PACKAGE_NAME mng)
