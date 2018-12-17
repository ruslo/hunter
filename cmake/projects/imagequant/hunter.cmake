# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    imagequant
    VERSION
    2.12.2-p0
    URL
    "https://github.com/hunter-packages/libimagequant/archive/v2.12.2-p0.tar.gz"
    SHA1
    95960f65c1e103cc87a2b07e656ce247188ee082
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(imagequant)
hunter_download(PACKAGE_NAME imagequant)
