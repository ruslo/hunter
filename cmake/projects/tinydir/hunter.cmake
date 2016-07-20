# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    tinydir
    VERSION
    1.2-p0
    URL
    "https://github.com/hunter-packages/tinydir/archive/v1.2-p0.tar.gz"
    SHA1
    365d9bed871bdd44194907b247a15b7da227f203
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(tinydir)
hunter_download(PACKAGE_NAME tinydir)
