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
    aglet
    VERSION
    1.0
    URL
    "https://github.com/elucideye/aglet/archive/v1.0.tar.gz"
    SHA1
    fbc018f8d7fdb757b23daa972ac6f83aea87c30c
)

hunter_add_version(
    PACKAGE_NAME
    aglet
    VERSION
    1.1.0
    URL
    "https://github.com/elucideye/aglet/archive/v1.1.0.tar.gz"
    SHA1
    1857a8d99c0224688d7131a09f295f48723209aa
)

hunter_add_version(
    PACKAGE_NAME
    aglet
    VERSION
    1.2.0
    URL
    "https://github.com/elucideye/aglet/archive/v1.2.0.tar.gz"
    SHA1
    65d910c63e0c030a20ca4da9473753ce284c49de
    )

hunter_add_version(
    PACKAGE_NAME
    aglet
    VERSION
    1.2.1
    URL
    "https://github.com/elucideye/aglet/archive/v1.2.1.tar.gz"
    SHA1
    bbd0c7ec9e5b559aba05aabdeffefb843f76edb8
)

hunter_add_version(
    PACKAGE_NAME
    aglet
    VERSION
    1.2.2
    URL
    "https://github.com/elucideye/aglet/archive/v1.2.2.tar.gz"
    SHA1
    cf82d02ec34583f8a878be8f331279445b5b53e2
)  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(aglet)
hunter_download(PACKAGE_NAME aglet)
