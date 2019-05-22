# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    irrXML
    VERSION
    "1.2-p0"
    URL
    "https://github.com/hunter-packages/irrXML/archive/v1.2-p0.tar.gz"
    SHA1
    c766ac44744f8387b7d745b00233b80713c5b689
)

hunter_add_version(
    PACKAGE_NAME
    irrXML
    VERSION
    "1.2"
    URL
    "https://github.com/hunter-packages/irrXML/archive/1.2.tar.gz"
    SHA1
    726c1461d51fda1908b4050603682de680925b44
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(irrXML)
hunter_download(PACKAGE_NAME irrXML)
