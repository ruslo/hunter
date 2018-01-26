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
    acf
    VERSION
    0.0.1
    URL
    "https://github.com/elucideye/acf/archive/v0.0.1.tar.gz"
    SHA1
    985bd3005b14120625e3684a8596d499bfc23a48
    )

hunter_add_version(
    PACKAGE_NAME
    acf
    VERSION
    0.0.2
    URL
    "https://github.com/elucideye/acf/archive/v0.0.2.tar.gz"
    SHA1
    0b2c6a2584539f1825eabc928e4b2abc7d16bbac
    )

hunter_cmake_args(acf CMAKE_ARGS 
  ACF_BUILD_OGLES_GPGPU=OFF # optional opengl shaders off
  ACF_USE_DRISHTI_CACHE=OFF # use hunter cache
  ACF_BUILD_EXAMPLES=OFF
  ACF_BUILD_TESTS=OFF
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(acf)
hunter_download(PACKAGE_NAME acf)
