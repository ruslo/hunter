# Copyright (c) 2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.0.0-p0
    URL
    "https://github.com/hunter-packages/cxxopts/archive/v1.0.0-p0.tar.gz"
    SHA1
    90040ef52faf71686febb0f93a3189cd9ea36ede
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.3.0
    URL
    "https://github.com/jarro2783/cxxopts/archive/v1.3.0.tar.gz"
    SHA1
    860dac4282e02d02ec5dde49af8317cd0a959e04
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.4.0
    URL
    "https://github.com/jarro2783/cxxopts/archive/v1.4.0.tar.gz"
    SHA1
    c5efdf5ea875329e6376622c696378e3778111c3
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.4.1
    URL
    "https://github.com/jarro2783/cxxopts/archive/v1.4.1.tar.gz"
    SHA1
    330c8ab0d3eab18429a4d903b640ec26fe1bece1
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.4.2
    URL
    "https://github.com/jarro2783/cxxopts/archive/v1.4.2.tar.gz"
    SHA1
    3f2544aeb082a82409ba9bd93f93f37bbd8b0269
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.4.3
    URL
    "https://github.com/jarro2783/cxxopts/archive/v1.4.3.tar.gz"
    SHA1
    bc9a333a56c0a3d90bcab72ea8ecebed9d66da58
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    1.4.4
    URL
    "https://github.com/jarro2783/cxxopts/archive/v1.4.4.tar.gz"
    SHA1
    aa9b63a74a38d90c93cd16f9d091afa7361e2083
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    2.0.0
    URL
    "https://github.com/jarro2783/cxxopts/archive/v2.0.0.tar.gz"
    SHA1
    0466413a55646b7e7947bd0b8f602cb22f17dd23
)

hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    2.1.0
    URL
    "https://github.com/jarro2783/cxxopts/archive/v2.1.0.tar.gz"
    SHA1
    eb11b3f56444a70225237eb008d930ae758a0f24
)

# FIXME, waiting for release:
# * https://github.com/jarro2783/cxxopts/issues/110#issuecomment-394909564
hunter_add_version(
    PACKAGE_NAME
    cxxopts
    VERSION
    2.1.1-pre
    URL
    "https://github.com/jarro2783/cxxopts/archive/e725ea308468ab50751ba7f930842a4c061226e9.zip"
    SHA1
    cbeec5576599d031f6f992d987e1f3575b3afee3
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cxxopts)
hunter_cmake_args(
    cxxopts
    CMAKE_ARGS
    CXXOPTS_BUILD_EXAMPLES=OFF
    CXXOPTS_BUILD_TESTS=OFF
    CXXOPTS_USE_UNICODE_HELP=OFF
)
hunter_download(PACKAGE_NAME cxxopts)
