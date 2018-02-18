# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2018, Yassine Maddouri
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME dynalo
    VERSION      1.0.1
    URL          "https://github.com/maddouri/dynalo/archive/1.0.1.tar.gz"
    SHA1         07acc4ad67e9ca598dc72a4914490dd275e09132
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(dynalo)
hunter_download(PACKAGE_NAME dynalo)
