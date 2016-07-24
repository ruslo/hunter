# Copyright (c) 2016, Ruslan Baratov, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    dest
    VERSION
    "0.8.0-p3"
    URL
    "https://github.com/hunter-packages/dest/archive/v0.8.0-p3.tar.gz"
    SHA1
    8ba961af7c59548cee4dad8ebef042d9eb5bf581
    )

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dest)
hunter_download(PACKAGE_NAME dest)
