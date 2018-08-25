# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, Yassine Maddouri
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME dynalo
    VERSION      1.0.3
    URL          "https://github.com/maddouri/dynalo/archive/1.0.3.tar.gz"
    SHA1         b79a1d10c166eea483d0911f849168ceecf8cdbc
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dynalo)
hunter_download(PACKAGE_NAME dynalo)
