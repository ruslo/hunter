# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    QtQmlManager
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/QtQmlManager/archive/v1.0.0.tar.gz"
    SHA1
    87372a0c6fa7dedc4830b87ab49ea46f890415f2
)

hunter_pick_scheme(DEFAULT url_sha1_unpack)
hunter_download(PACKAGE_NAME QtQmlManager)
