# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_cpplint
    VERSION
    1.4.4
    URL
    "https://github.com/cpplint/cpplint/archive/1.4.4.tar.gz"
    SHA1
    9ca2b8fc3992130a62f4dc3708a67b10eb1baec7
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_cpplint)
hunter_download(PACKAGE_NAME pip_cpplint)
