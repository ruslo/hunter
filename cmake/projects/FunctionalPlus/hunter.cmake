# Copyright (c) 2013-2018, Ruslan Baratov
# Copyright (c) 2018, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME FunctionalPlus
    VERSION 0.2-p0
    URL "https://github.com/Dobiasd/FunctionalPlus/archive/0.2.tar.gz"
    SHA1 d637860643bb0199a8b558f3d55460de2c88fb50
    )

hunter_cmake_args(
    FunctionalPlus
    CMAKE_ARGS
      FPLUS_USE_TOOLCHAIN=ON
      FPLUS_BUILD_EXAMPLES=OFF
      FPLUS_BUILD_UNITTEST=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(FunctionalPlus)
hunter_download(PACKAGE_NAME FunctionalPlus)
