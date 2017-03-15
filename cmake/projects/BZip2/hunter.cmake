# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_report_broken_package)

hunter_add_version(
    PACKAGE_NAME
    BZip2
    VERSION
    "1.0.6-p1"
    URL
    "https://github.com/hunter-packages/bzip2/archive/v1.0.6-p1.tar.gz"
    SHA1
    5eae50a9a0ded0ee0ea5201001b2f4f726dbf8ed
)

hunter_add_version(
    PACKAGE_NAME
    BZip2
    VERSION
    "1.0.6-p2"
    URL
    "https://github.com/hunter-packages/bzip2/archive/v1.0.6-p2.tar.gz"
    SHA1
    76d5bdd269160a87948fec676c75c2bcc6888585
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(BZip2)
hunter_download(PACKAGE_NAME BZip2)
