# Copyright (c) 2017, Pawel Bylica
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    cotire
    VERSION
    "1.7.10"
    URL
    "https://github.com/sakra/cotire/releases/download/cotire-1.7.10/cotire.cmake"
    SHA1
    bda78a4ee0fd5e7b17d5c25259a65d9770bdb9f5
)

hunter_pick_scheme(DEFAULT url_sha1_download)
hunter_download(PACKAGE_NAME cotire)
