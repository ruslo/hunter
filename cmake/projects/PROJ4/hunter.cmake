# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    PROJ4
    VERSION
    5.0.0
    URL
    "https://github.com/OSGeo/proj.4/releases/download/5.0.1/proj-5.0.1.tar.gz"
    SHA1
    4ADD83369C6F29637D806D51CDCA7378181E53FF
)

hunter_cmake_args(
    PROJ4
    CMAKE_ARGS
        BUILD_TESTING=OFF
        PROJ4_TESTS=OFF
        BUILD_CCT=OFF
        BUILD_CS2CS=OFF
        BUILD_GEOD=OFF
        BUILD_GIE=OFF
        BUILD_NAD2BIN=OFF
        BUILD_PROJ=OFF

        INCLUDEDIR=include
        LIBDIR=lib
        CMAKECONFIGDIR=lib/cmake/PROJ4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(PROJ4)
hunter_download(PACKAGE_NAME PROJ4)
