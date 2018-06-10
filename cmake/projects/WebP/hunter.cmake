# Copyright (c) 2018, Ruslan Baratov
# Copyright (c) 2018, Mathieu-Andre Chiasson
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    WebP
    VERSION
    "0.6.1-p2"
    URL
    "https://github.com/hunter-packages/libwebp/archive/v0.6.1-p2.tar.gz"
    SHA1
    533f0f09be3134dd8c3d76be267bef56d1a1f4a2
)

hunter_add_version(
    PACKAGE_NAME
    WebP
    VERSION
    "0.6.1-p3"
    URL
    "https://github.com/hunter-packages/libwebp/archive/v0.6.1-p3.tar.gz"
    SHA1
    bcce817366c9ba5f42d36130d973dc2f072e2862
)

hunter_add_version(
    PACKAGE_NAME
    WebP
    VERSION
    "0.6.1-p4"
    URL
    "https://github.com/hunter-packages/libwebp/archive/v0.6.1-p4.tar.gz"
    SHA1
    982223088b7594608861d25d716cdfa5f72c26c7
)

if(ANDROID OR IOS)
    hunter_cmake_args(
        WebP
        CMAKE_ARGS
        WEBP_ENABLE_SIMD=ON
        WEBP_BUILD_CWEBP=OFF
        WEBP_BUILD_DWEBP=OFF
        WEBP_BUILD_GIF2WEBP=OFF
        WEBP_BUILD_IMG2WEBP=OFF
        WEBP_BUILD_WEBPINFO=OFF
        WEBP_BUILD_WEBP_JS=OFF
        WEBP_ENABLE_NEAR_LOSSLESS=ON
        WEBP_EXPERIMENTAL_FEATURES=OFF
        WEBP_ENABLE_SWAP_16BIT_CSP=OFF
    )
else()
    hunter_cmake_args(
        WebP
        CMAKE_ARGS
        WEBP_ENABLE_SIMD=ON
        WEBP_BUILD_CWEBP=ON
        WEBP_BUILD_DWEBP=ON
        WEBP_BUILD_GIF2WEBP=ON
        WEBP_BUILD_IMG2WEBP=ON
        WEBP_BUILD_WEBPINFO=ON
        WEBP_BUILD_WEBP_JS=OFF
        WEBP_ENABLE_NEAR_LOSSLESS=ON
        WEBP_EXPERIMENTAL_FEATURES=OFF
        WEBP_ENABLE_SWAP_16BIT_CSP=OFF
    )
endif()

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(WebP)
hunter_download(PACKAGE_NAME WebP)
