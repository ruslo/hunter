# Copyright (c) 2013-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cacheable)

hunter_cacheable(frugally-deep)

hunter_add_version(
    PACKAGE_NAME frugally-deep
    VERSION 0.2.2-p0
    URL "https://github.com/Dobiasd/frugally-deep/archive/v0.2.2-p0.tar.gz"
    SHA1 330fd9d2177c4b2ac5ebb9ef17bf358a8dfbd62b
)

hunter_add_version(
    PACKAGE_NAME frugally-deep
    VERSION 0.2.1-p0
    URL "https://github.com/Dobiasd/frugally-deep/archive/v0.2.1-p0.tar.gz"
    SHA1 9a9287e059cc25c1ffc938c1815b9d4c323683be
)

hunter_cmake_args(
    frugally-deep
    CMAKE_ARGS
      FDEEP_USE_TOOLCHAIN=ON
      FDEEP_BUILD_UNITTEST=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(frugally-deep)
hunter_download(PACKAGE_NAME frugally-deep)
