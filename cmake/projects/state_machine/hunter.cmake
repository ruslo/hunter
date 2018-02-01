# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    state_machine
    VERSION
    1.1
    URL
    "https://github.com/NukeBird/state_machine/archive/1.1.tar.gz"
    SHA1
    43F37F8D0EF067ED6F853D11F5875A4D83A06756
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(state_machine)
hunter_download(PACKAGE_NAME state_machine)
