# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.2
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.2.tar.gz"
    SHA1
    a007c80de2d92147d6172ed52820e0c1268ed429
)

hunter_add_version(
    PACKAGE_NAME
    ogles_gpgpu
    VERSION
    0.1.1
    URL
    "https://github.com/hunter-packages/ogles_gpgpu/archive/v0.1.1.tar.gz"
    SHA1
    3b9b76a5af9e8eb206cfaa4503b954ec87cb5c7c
)

hunter_cmake_args(ogles_gpgpu CMAKE_ARGS OGLES_GPGPU_INSTALL=ON)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ogles_gpgpu)
hunter_download(PACKAGE_NAME ogles_gpgpu)
