# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    GPUImage
    VERSION
    "0.1.6-p5"
    URL
    "https://github.com/hunter-packages/GPUImage/archive/v0.1.6-p5.tar.gz"
    SHA1
    69a287016c57ca02012faf973e2eabda4ec87123
)

hunter_add_version(
    PACKAGE_NAME
    GPUImage
    VERSION
    "0.1.6-p6"
    URL
    "https://github.com/headupinclouds/GPUImage/archive/v0.1.6-p6.tar.gz"
    SHA1
    230f9f9ba0fe1cce96827ea0cfc944b6df05ec34
)

hunter_add_version(
    PACKAGE_NAME
    GPUImage
    VERSION
    "0.1.6-p9"
    URL
    "https://github.com/hunter-packages/GPUImage/archive/v0.1.6-p9.tar.gz"
    SHA1
    ab3b4785d5767031d545e65ebe12a0910b5ef6b2
)

hunter_cmake_args(
    GPUImage
    CMAKE_ARGS GPUIMAGE_BUILD_EXAMPLES=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(GPUImage)
hunter_download(PACKAGE_NAME GPUImage)
