# Copyright (c) 2016-2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ARM_NEON_2_x86_SSE
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/ARM_NEON_2_x86_SSE/archive/v1.0.0.tar.gz"
    SHA1
    8067ea1b7aa9ec991db5989d7eda6ed7293d0fda
)

hunter_add_version(
    PACKAGE_NAME
    ARM_NEON_2_x86_SSE
    VERSION
    1.0.0-p0
    URL
    "https://github.com/hunter-packages/ARM_NEON_2_x86_SSE/archive/v1.0.0-p0.tar.gz"
    SHA1
    bf97b9ae78060b4dc9aa2afd3a2a1d577b405b2c
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ARM_NEON_2_x86_SSE)
hunter_download(PACKAGE_NAME ARM_NEON_2_x86_SSE)
