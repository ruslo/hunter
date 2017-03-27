# Copyright (c) 2017, David Hirvonen
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

# Load used modules
include(hunter_add_package)
include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    imshow
    VERSION
    "1.0.0"
    URL
    "https://github.com/hunter-packages/imshow/archive/v1.0.0.tar.gz"    
    SHA1
    3b01b2cdd59d8a90da0df45888e96175da009ef5
)

hunter_add_version(
    PACKAGE_NAME
    imshow
    VERSION
    "1.0.0-p0"
    URL
    "https://github.com/hunter-packages/imshow/archive/v1.0.0-p0.tar.gz"
    SHA1
    196be66bb2bf62747e638b87444b88824ca51a18
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(imshow)
hunter_download(PACKAGE_NAME imshow)
