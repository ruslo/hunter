# Copyright (c) 2018, Pawel Bylica

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    ethash
    VERSION
    0.1.0
    URL
    https://github.com/chfast/ethash/archive/v0.1.0.tar.gz
    SHA1
    bc97f901164e04a53c67b536cc9b58fae6ed9bb5
)

hunter_add_version(
    PACKAGE_NAME
    ethash
    VERSION
    0.2.0
    URL
    https://github.com/chfast/ethash/archive/v0.2.0.tar.gz
    SHA1
    262f0926ccd2f1dc09541c013f257248da976e14
)

hunter_add_version(
    PACKAGE_NAME
    ethash
    VERSION
    0.3.0
    URL
    https://github.com/chfast/ethash/archive/v0.3.0.tar.gz
    SHA1
    42597f359c25018e058289652caed8475b6fc1e5
)

hunter_cmake_args(
    ethash
    CMAKE_ARGS
    ETHASH_BUILD_TESTS=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(ethash)
hunter_download(PACKAGE_NAME ethash)
