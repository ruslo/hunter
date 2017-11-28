# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9b-p3"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9b-p3.tar.gz"
    SHA1
    41f208215d59be34868c1f23b1fd0ee3f9934b9b
)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9b-p1"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9b-p1.tar.gz"
    SHA1
    81f4b7a189a12b7b5354232f133760e6840262b9
)

hunter_add_version(
    PACKAGE_NAME
    Jpeg
    VERSION
    "9b-p0"
    URL
    "https://github.com/hunter-packages/jpeg/archive/v9b-p0.tar.gz"
    SHA1
    70769f349fdf346851f2e7fc4c5f603cd8960ae4
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Jpeg)
hunter_download(PACKAGE_NAME Jpeg)
