# Copyright (c) 2017, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    drishti_assets
    VERSION
    1.6
    URL
    "https://github.com/elucideye/drishti-assets/archive/v1.6.tar.gz"
    SHA1
    7787ba57e30146c979780c79ae62e8299cfe3cfd
)

hunter_add_version(
    PACKAGE_NAME
    drishti_assets
    VERSION
    1.7
    URL
    "https://github.com/elucideye/drishti-assets/archive/v1.7.tar.gz"
    SHA1
    1c35ca176e4b30111eed44fd607d8a5ac0c71585
)  

hunter_add_version(
    PACKAGE_NAME
    drishti_assets
    VERSION
    1.8
    URL
    "https://github.com/elucideye/drishti-assets/archive/v1.8.tar.gz"
    SHA1
    1667a5209e83902a46251632dab25cf114d75c96
)  

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(drishti_assets)
hunter_download(PACKAGE_NAME drishti_assets)
