# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    foo
    VERSION
    1.0.0
    URL
    "https://github.com/hunter-packages/foo/archive/v1.0.0.tar.gz"
    SHA1
    1111111111111111111111111111111111111111
)

hunter_add_version(
    PACKAGE_NAME
    foo
    VERSION
    2.0.0
    URL
    "https://github.com/hunter-packages/foo/archive/v2.0.0.tar.gz"
    SHA1
    2222222222222222222222222222222222222222
)

hunter_add_version(
    PACKAGE_NAME
    foo
    VERSION
    3.0.0
    URL
    "https://github.com/hunter-packages/foo/archive/v3.0.0.tar.gz"
    SHA1
    3333333333333333333333333333333333333333
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(foo)
hunter_download(PACKAGE_NAME foo)
