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

hunter_add_version(
    PACKAGE_NAME
    acf
    VERSION
    0.1.3
    URL
    "https://github.com/elucideye/acf/archive/v0.1.3.tar.gz"
    SHA1
    7df65c31312e6f364895dae249bb4fc9f20a8d7c
)

hunter_add_version(
    PACKAGE_NAME
    acf
    VERSION
    0.1.13
    URL
    "https://github.com/elucideye/acf/archive/v0.1.13.tar.gz"
    SHA1
    ab74bd7a6eead7f2fc1ca5c4d95b2d970f10cc71
)

hunter_add_version(
    PACKAGE_NAME
    acf
    VERSION
    0.1.14
    URL
    "https://github.com/elucideye/acf/archive/v0.1.14.tar.gz"
    SHA1
    79f9ccba6c8078c2831d68bb25c7bb40a17740ef
)

hunter_cmake_args(acf CMAKE_ARGS
  ACF_BUILD_OGLES_GPGPU=ON # optional opengl shaders on
  ACF_USE_DRISHTI_CACHE=OFF # use hunter cache
  ACF_BUILD_EXAMPLES=OFF
  ACF_BUILD_TESTS=OFF
  )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(acf)
hunter_download(PACKAGE_NAME acf)
