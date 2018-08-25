# Copyright (c) 2014-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    intsizeof
    VERSION
    "1.0.0"
    URL
    "https://github.com/ruslo/intsizeof/archive/v1.0.0.tar.gz"
    SHA1
    9959e0e29c88fe414ba082fb28a722e411682bb3
)

hunter_add_version(
    PACKAGE_NAME
    intsizeof
    VERSION
    "2.0.0"
    URL
    "https://github.com/ruslo/intsizeof/archive/v2.0.0.tar.gz"
    SHA1
    35b954c7180bce95f491951a87a49098bb074595
)

hunter_add_version(
    PACKAGE_NAME
    intsizeof
    VERSION
    "2.0.1"
    URL
    "https://github.com/ruslo/intsizeof/archive/v2.0.1.tar.gz"
    SHA1
    e897f9c32cbd87130ac6b0e88106d06a8b0ada42
)

hunter_add_version(
    PACKAGE_NAME
    intsizeof
    VERSION
    "2.0.2"
    URL
    "https://github.com/ruslo/intsizeof/archive/v2.0.2.tar.gz"
    SHA1
    729d72510beea3fb23f74fc08899b8c1c4f726d2
)

hunter_cacheable(intsizeof)
hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_download(PACKAGE_NAME intsizeof)
