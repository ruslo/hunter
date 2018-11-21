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
    Qwt
    VERSION
    6.1-p3
    URL
    https://github.com/hunter-packages/Qwt/archive/6.1-p3.tar.gz
    SHA1
    9db2e7c254c181b43de414b05cca38152e4b6f88
)

hunter_cmake_args(
    Qwt
    CMAKE_ARGS
        LIBQWT_ENABLE_PLOT=ON
        LIBQWT_ENABLE_WIDGETS=ON
        LIBQWT_ENABLE_MATHML=OFF
        LIBQWT_ENABLE_OPENGL=ON
        LIBQWT_ENABLE_SVG=ON
    
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Qwt)
hunter_download(PACKAGE_NAME Qwt)
